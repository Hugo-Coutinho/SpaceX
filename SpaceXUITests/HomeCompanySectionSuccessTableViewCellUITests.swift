//
//  HomeCompanySectionSuccessTableViewCellUITests.swift
//  SpaceXUITests
//
//  Created by hugo.coutinho on 18/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import XCTest

class HomeCompanySectionSuccessTableViewCellUITests: XCTestCase {

    // MARK: - DECLARATIONS -
    let app = XCUIApplication()

    // MARK: - OVERRIDE -
    override func setUp() {
        XCUIDevice.shared.orientation = .portrait
        app.launch()
    }

    override func tearDown() {
        app.terminate()
    }

    override func tearDownWithError() throws {
        continueAfterFailure = false
        takeScreenshot(named: self.name)
        app.terminate()
      }

    // MARK: - UI TESTS -

    func test_shouldAssert_elementsNotNil() {
        let myTable = app.tables.matching(identifier: "tableViewControllerID")
        let cell = myTable.cells.element(matching: .cell, identifier: "HomeCompanySuccessCellID").firstMatch
        let infoLabel = cell.staticTexts.element(matching: .any, identifier: "SpaceXInfoID").label

        XCTAssertNotNil(infoLabel)
    }

    func test_shouldAssert_elementsNotEmpty() {
        let myTable = app.tables.matching(identifier: "tableViewControllerID")
        let cell = myTable.cells.element(matching: .cell, identifier: "HomeCompanySuccessCellID").firstMatch
        let infoLabel = cell.staticTexts.element(matching: .any, identifier: "SpaceXInfoID").label

        XCTAssertNotEqual(infoLabel, "")
    }
}


