//
//  NewsDetailsViewModel.swift
//  NewsTimeApp
//
//  Created by saif on 16/08/2023.
//

import Foundation

class NewsDetailViewModel {
    var article: Article
    
    init(article: Article) {
            self.article = article
        }
    
      var title: String {
        return article.title ?? ""
       }
       
       var description: String {
           return article.description ?? ""
       }
       
       var imageURL: String {
           return article.urlToImage ?? ""
       }
       
       var source: String {
           return article.url ?? ""
       }
    
    
        var author : String {
            return article.author ?? ""
       }
    
    var publishingDate : String {
        return article.publishedAt ?? ""
   }
   
}
