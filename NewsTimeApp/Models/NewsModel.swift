//
//  NewsModel.swift
//  NewsTimeApp
//
//  Created by saif on 15/08/2023.
//

import Foundation





// MARK: - News Model
struct NewsModel: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author: String?
    let title, description: String?
    let url: String?
    var urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
