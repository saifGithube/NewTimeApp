//
//  NewsTimeAppUITests.swift
//  NewsTimeAppUITests
//
//  Created by saif on 15/08/2023.
//

import XCTest

final class NewsTimeAppUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        app = XCUIApplication()
              app.launch()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    
    func testTapCellToNavigate() throws {
           // Assuming you have a cell with an identifier "newsCell"
        let cell = app.tables.cells["NewsListTableViewCell"].firstMatch
        
           XCTAssertTrue(cell.waitForExistence(timeout: 5), "News cell not found")

           cell.tap()

           // Verify that the navigation bar of the details view exists
           XCTAssertTrue(app.navigationBars["NewsDetailsViewController"].waitForExistence(timeout: 5), "Navigation to details failed")
       }
}
