//
//  APIService.swift
//  NewsTimeApp
//
//  Created by saif on 16/08/2023.
//

import Foundation

// MARK: - this call is to retreave data

public final class APIService {
    
    lazy var apiKey: String = {
        // Perform any necessary setup to retrieve the API key
        return "fb52d3d0c501459eabbb1418a7f3c4bb"
    }()
    
    private let sourcesURL = URL(string: "https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&apiKey=fb52d3d0c501459eabbb1418a7f3c4bb")!

    // the date of today : &from=2023-07-16
    
    func apiToGetNewsData(completion : @escaping (NewsModel) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(NewsModel.self, from: data)
                    completion(empData)
            }
        }.resume()
    }
}
