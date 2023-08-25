//
//  NewsViewModelDelegate.swift
//  NewsTimeApp
//
//  Created by saif on 25/08/2023.
//

import Foundation

protocol NewsServiceModelDelegate {
    
    func apiToGetNewsData(completion : @escaping (Result<NewsModel, NewsModelError>) -> ())
}
