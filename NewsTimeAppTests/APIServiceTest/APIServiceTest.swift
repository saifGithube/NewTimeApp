//
//  APIServiceTest.swift
//  NewsTimeAppTests
//
//  Created by saif on 22/08/2023.
//

import Foundation
import XCTest

@testable import NewsTimeApp
class APIServiceTest : XCTest {
    
    var networkResult: Result<NewsModel, NewsModelError>!
    
    var newsModel : NewsModel!
    var newsErrorModel : NewsModelError!

    func test_entry_point_url(){
        
        
        XCTAssertEqual(Constants.URL, "https://newsapi.org/v2/everything")
        
        XCTAssertEqual(Constants.KEY,"fb52d3d0c501459eabbb1418a7f3c4bb")
        
    }
    
    
    
    func test_decode_object_succefully_not_Null(){
       
        let apiService = APIService()
        apiService.apiToGetNewsData{(result) in
            
            self.networkResult = result
            switch self.networkResult {
            case .success(let news) :
                self.newsModel = news
                break
            case .failure(let errorModel) :
                self.newsErrorModel = errorModel
            break
            default :
                break
                
            }
            
        }
    }
    
    func test_data_succefully(){
       
        XCTAssertNotEqual(newsModel.articles.count,0)
          
        }
    }


