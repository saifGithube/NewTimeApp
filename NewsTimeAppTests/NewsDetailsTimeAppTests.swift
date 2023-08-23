//
//  NewsDetailsTimeAppTests.swift
//  NewsTimeAppTests
//
//  Created by saif on 22/08/2023.
//

import Foundation
import XCTest
@testable import NewsTimeApp

class NewsDetailsViewControllerTests: XCTestCase {

    func test_cell_tap_and_details() {
        // Create an instance of your NewsListViewController
        let listViewController = NewsListViewController() // Replace with your actual view controller
        
        // Create a mock navigation controller to capture pushed view controllers
        let mockNavController = MockNavigationController(rootViewController: listViewController)
        
        UIApplication.shared.keyWindow?.rootViewController = mockNavController
        
        let indexPathToTap = IndexPath(row: 0, section: 0)
        
        listViewController.tableView(listViewController.newsTableView ?? UITableView(), didSelectRowAt: indexPathToTap)
                                     
        
        XCTAssertTrue(mockNavController.pushedViewController is NewsDetailsViewController)
        
        let detailsViewController = mockNavController.pushedViewController as! NewsDetailsViewController
        
        
        XCTAssertEqual(detailsViewController.article.title, mockNavController.title)
        XCTAssertEqual(detailsViewController.article.description, mockNavController.description)
    }
}


class MockNavigationController: UINavigationController {
    var pushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: animated)
    }
}
