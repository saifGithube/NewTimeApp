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

    var onError: ((NewsModelError) -> Void)?

    var bindNewsViewModelToController : (() -> ()) = {}
    var bindNewsErrorViewModelToController : (() -> ()) = {}

    
        init() {
            self.apiService = APIService()
            getNews()
        }

    
    private(set) var newsData : NewsModel! {
           didSet {
               self.bindNewsViewModelToController()
           }
       }
    
    
    private(set) var newsErrorData : NewsModelError! {
           didSet {
               self.bindNewsErrorViewModelToController()
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
                self.onError?(errorModel)
                self.newsErrorData = errorModel
                print("error Models :",errorModel)
                    print("Error:", errorModel)
                
                }
            
        }
    }
}
