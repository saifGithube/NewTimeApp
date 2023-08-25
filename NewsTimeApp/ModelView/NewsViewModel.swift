//
//  NewViewModel.swift
//  NewsTimeApp
//
//  Created by saif on 15/08/2023.
//

import Foundation

// MARK: - NewsViewModel  class for the newCall
class NewsViewModel : ObservableObject{
    
    @Published var news : NewsModel!
    private var apiService : APIService!
   // in case of error we perform this action
    var onError: ((NewsModelError) -> Void)?
    // bind the data to the ViewConrtroller
    var bindNewsViewModelToController : (() -> ()) = {}
    // bind and send the error data to the viewController
    var bindNewsErrorViewModelToController : (() -> ()) = {}

    
    
    
    init(apiService : NewsViewModelDelegate = APIService()) {
        self.apiService = apiService as? APIService
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
                self.newsData = newsModel
                self.news = newsModel
                case .failure(let errorModel):
                self.onError?(errorModel)
                self.newsErrorData = errorModel
                print("error Models :",errorModel)
                
                }
            
        }
    }
    
    func numberOfItems() -> Int? {
        
            return self.newsData.articles.count
      
        }
    
    func item(at index: Int) -> Article? {
        guard index >= 0 && index < numberOfItems() ?? 0 else {
               return nil
           }
           return self.newsData.articles[index]
       }
}
