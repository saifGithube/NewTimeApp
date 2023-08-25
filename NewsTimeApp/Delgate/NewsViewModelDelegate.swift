//
//  NewsViewModelDelegate.swift
//  NewsTimeApp
//
//  Created by saif on 25/08/2023.
//

import Foundation

protocol NewsViewModelDelegate {
    
    func apiToGetNewsData(completion : @escaping (Result<NewsModel, NewsModelError>) -> ())
}
