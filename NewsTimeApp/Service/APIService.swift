//
//  APIService.swift
//  NewsTimeApp
//
//  Created by saif on 16/08/2023.
//

import Foundation

// MARK: - this call is to retrieve the  data

public final class APIService {

    private let apiKey = "fb52d3d0c501459eabbb1418a7f3c4bb"
    private var sourcesURL: URL {
        var components = URLComponents(string: Constants.URL)!
        components.queryItems = [
            URLQueryItem(name: "q", value: "tesla"),
            URLQueryItem(name: "sortBy", value: "publishedAt"),
            URLQueryItem(name: "apiKey", value: apiKey)
        ]
        return components.url!
    }

    func apiToGetNewsData(completion: @escaping (Result<NewsModel, NewsModelError>) -> ()) {
        URLSession.shared.dataTask(with: sourcesURL) { data, response, error in
            if let data = data {
                do {
                    let empData = try JSONDecoder().decode(NewsModel.self, from: data)
                    completion(.success(empData))
                } catch {
                    do {
                        let errorModel = try JSONDecoder().decode(NewsModelError.self, from: data)
                        completion(.failure(errorModel))
                    } catch {
                        print("Error decoding JSON: \(error)")
                        completion(.failure(NewsModelError(status: nil, message: nil, error: "DecodingError", data: nil)))
                    }
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
                completion(.failure(NewsModelError(status: nil, message: nil, error: "NetworkError", data: nil)))
            }
        }.resume()
    }
}
