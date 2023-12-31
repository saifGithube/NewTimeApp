//
//  NewsTimeAppTests.swift
//  NewsTimeAppTests
//
//  Created by saif on 15/08/2023.
//

import XCTest
@testable import NewsTimeApp

final class NewsTimeAppTests: XCTestCase {

    var newsViewModel : NewsViewModel!
    var tableView: UITableView!
    var newsListViewController: NewsListViewController!
    var newsDetailsViewController: NewsDetailsViewController!
    var newsDetailViewModel : NewsDetailViewModel!
    var articles : [Article] = []
    
    
    override func setUp()  {
        super.setUp()
        newsViewModel = NewsViewModel()
    
    }
    
    
    
    override func setUpWithError() throws {
        // Set up your view controller and table view here
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.newsViewModel = NewsViewModel()
        newsViewModel.getNews()
        newsListViewController = storyboard.instantiateViewController(withIdentifier: "NewsListViewController") as? NewsListViewController
        tableView = newsListViewController.newsTableView
        newsViewModel = newsListViewController.newsViewModel
        newsListViewController.loadViewIfNeeded()

      //  newsDetailsViewController.loadViewIfNeeded()
    }
        
        override func tearDownWithError() throws {
            newsListViewController = nil
            newsDetailsViewController = nil
            tableView = nil
        }
        
    
    
    // fetch data from here
    func test_Fetch_news() {
        
        
        XCTAssertGreaterThan(newsViewModel.news?.articles.count ?? 0, 0, "News should be fetched and stored")
        }
    
        // Test the number of rows in the table view

    
        func test_number_of_rows_in_section() {
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
            let listViewController = storyboard.instantiateViewController(withIdentifier: "NewsListViewController") as! NewsListViewController
                
            let mockTableView = UITableView()

            let numberOfRows = newsListViewController.tableView(newsListViewController.newsTableView, numberOfRowsInSection: 0)
            
            listViewController.newsTableView = mockTableView

            
            XCTAssertEqual(numberOfRows,newsViewModel.numberOfItems() )
           
        }
        
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
        
    
    func test_the_list_has_been_shown() {
        let indexPath = IndexPath(row: 0, section: 0)
        
        let bundle = Bundle(for: NewsListTableViewCell.self)

        newsListViewController.newsTableView.register(UINib(nibName: "NewsListTableViewCell", bundle: bundle), forCellReuseIdentifier: "NewsListTableViewCell")
        
        

        let cell = newsListViewController.tableView(newsListViewController.newsTableView, cellForRowAt: indexPath) as? NewsListTableViewCell
        
        
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.titleLabel.text, newsListViewController.articles[indexPath.row].title)

                let expectation = XCTestExpectation(description: "Image loaded")
    
                DispatchQueue.global().async {
                    
                    let url = URL(string: self.newsListViewController.articles[indexPath.row].urlToImage ?? "")!
                    let data = try! Data(contentsOf: url)
                    let image = UIImage(data: data)
                    
                    DispatchQueue.main.async {
                        cell?.newsImageView.image = image
                        expectation.fulfill()
                    }
                }
                
                wait(for: [expectation], timeout: 5.0) // Adjust timeout if needed
                
                // After the image is loaded, you can test it
                XCTAssertNotNil(cell?.newsImageView.image,"images is null")
         
    }
    
    
    func test_tableView_has_correctNumberOfCells()  {
        let tableView = newsListViewController.newsTableView
            
        let cells = tableView?.visibleCells.count
        let expectedCellCount = newsViewModel.numberOfItems()
            
            XCTAssertEqual(cells, expectedCellCount, "Table view has incorrect number of cells")
        }
    
    func test_the_news_details_not_nil(){
        // Test the view controller's properties
        XCTAssertEqual(newsDetailsViewController.article.title, newsDetailsViewController.newDetailsViewModel.title)
        XCTAssertEqual(newsDetailsViewController.article.description, newsDetailsViewController.newDetailsViewModel.description)
        
    }
    
    func test_item_atIndex() {

           let article = newsViewModel.item(at: 0)
           XCTAssertNotNil(article)
        XCTAssertEqual(article?.title, self.newsViewModel.newsData.articles[0].title)
       }
    
  
    
}




