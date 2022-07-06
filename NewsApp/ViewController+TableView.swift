//
//  ViewController+TableView.swift
//  NewsApp
//
//  Created by Navi on 05/07/22.
//

import UIKit
import SafariServices

// MARK: - UITableViewDelegate methods

extension ViewController: UITableViewDelegate {}

// MARK: - UITableViewDataSource methods

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier) as? MyTableViewCell else {
            return UITableViewCell()
        }
        let article = articles[indexPath.row]
        let model = CellModel(title: article.title, subtitle: article.articleDescription ?? "", imageURL: article.urlToImage, date: article.publishedAt.formatToDate)
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showSafariController(for: articles[indexPath.row].url)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}

// MARK: - SFSafariViewControllerDelegate methods

extension ViewController: SFSafariViewControllerDelegate {
    
    func showSafariController(for url: String) {
        guard let url = URL(string: url) else { return }
        let safariVC = SFSafariViewController(url: url)
        safariVC.delegate = self
        present(safariVC, animated: true)
    }
}
