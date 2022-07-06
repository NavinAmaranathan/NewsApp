//
//  ViewModel.swift
//  NewsApp
//
//  Created by Navi on 05/07/22.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func didFetchArticles(articles: [Article]?)
    func didFail(with error: Error)
}

protocol ViewModelData {
    var delegate: ViewModelDelegate? { get set }
    func fetchArticles()
}

struct ViewModel: ViewModelData {
    
    // MARK: - Properties
    private let manager: APIManager
    weak var delegate: ViewModelDelegate?
    
    // MARK: - Initialiser

    init(manager: APIManager = APIManager.shared) {
        self.manager = manager
    }
    
    // MARK: - Methods

    func fetchArticles() {
        guard let url = URL(string: EndPoints.articles.rawValue) else {
            return
        }
        manager.getCall(url: url, resultType: Response.self) { result in
            switch result {
            case .success(let response):
                delegate?.didFetchArticles(articles: response.articles)
            case .failure(let error):
                delegate?.didFail(with: error)
            }
        }
    }
}
