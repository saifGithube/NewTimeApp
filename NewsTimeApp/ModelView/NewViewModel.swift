//
//  NewViewModel.swift
//  NewsTimeApp
//
//  Created by saif on 15/08/2023.
//

import Foundation

class NewsViewModel {
    var news: NewsModel?
    private var apiService : APIService!

    var bindNewsViewModelToController : (() -> ()) = {}

    
        init() {
            self.apiService = APIService()
            getNews()
        }

    
    private(set) var newsData : NewsModel! {
           didSet {
               self.bindNewsViewModelToController()
           }
       }
    
    
    func getNews(){
        self.apiService.apiToGetNewsData {(result) in
            
            switch result {
                case .success(let newsModel):
                    // Handle the successful case with the newsModel
                    print("Received news:", result)
                self.newsData = newsModel
                case .failure(let errorModel):
                    print("Error:", errorModel)
                }
            
        }
    }
}
