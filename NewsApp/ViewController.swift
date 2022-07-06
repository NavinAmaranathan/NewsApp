//
//  ViewController.swift
//  NewsApp
//
//  Created by Navi on 05/07/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet private var tableView: UITableView!
    var articles = [Article]()
    private var viewModel: ViewModelData = ViewModel()
    
    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        configureTable()
        fetchArticles()
    }
    
    // MARK: - Private methods
    
    /// Fetch the articles from viewmodel
    private func fetchArticles() {
        viewModel.delegate = self
        viewModel.fetchArticles()
    }
    
    /// Configures basic table view
    private func configureTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
    }
    
    /// Reloads the table view based on API fetch
    private func reloadTable() {
        guard articles.isEmpty else {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
            return
        }
    }
    
    /// Display error alerts
    /// - Parameter error: Type of error to be passed in for alert content
    private func displayAlert(for error: Error) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: "Oops", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(alert, animated: true)
        }
    }
}

// MARK: - ViewModel Delegate implementation methods

extension ViewController: ViewModelDelegate {
    
    func didFetchArticles(articles: [Article]?) {
        guard let articles = articles else {
            return
        }
        self.articles = articles
        reloadTable()
    }
    
    func didFail(with error: Error) {
        displayAlert(for: error)
    }
}
