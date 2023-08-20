//
//  NewViewModel.swift
//  NewsTimeApp
//
//  Created by saif on 15/08/2023.
//

import Foundation

// MARK: - NewsViewModel  class for the newCall
class NewsViewModel {
    var news: NewsModel?
    private var apiService : APIService!
   // in case of error we perform this action
    var onError: ((NewsModelError) -> Void)?
    // bind the data to the ViewConrtroller
    var bindNewsViewModelToController : (() -> ()) = {}
    // bind and send the error data to the viewController
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
                
                }
            
        }
    }
}
