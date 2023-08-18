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
//    init(news: NewsModel) {
//        self.apiService = APIService()
//        getNews()
//    }
    
//    var status: String {
//        return news?.status ?? ""
//    }
//
//    var totalResults: Int {
//        return news?.totalResults ?? 0
//    }
//
//    var articles : [Article]{
//        return news?.articles ?? []
//    }
    
    private(set) var newsData : NewsModel! {
           didSet {
               self.bindNewsViewModelToController()
           }
       }
    
    
    func getNews(){
        self.apiService.apiToGetNewsData {(newsData) in
            self.newsData = newsData
        }
    }
}
