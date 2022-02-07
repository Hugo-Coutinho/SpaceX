//
//  HomeLaunchSectionSuccessTableViewCellUITests.swift
//  SpaceXUITests
//
//  Created by hugo.coutinho on 17/12/21.
//  Copyright © 2021 . All rights reserved.
//

import XCTest

class HomeLaunchSectionSuccessTableViewCellUITests: XCTestCase {

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
      }

    // MARK: - UI TESTS -

    func test_shouldAssert_elementsNotNil() {
        let myTable = app.tables.matching(identifier: "tableViewControllerID")
        let cell = myTable.cells.element(matching: .cell, identifier: "HomeLaunchSuccessCellID").firstMatch
        let imageCell = cell.staticTexts.element(matching: .image, identifier: "rocketImageViewID").firstMatch
        let missionDescLabel = cell.staticTexts.element(matching: .any, identifier: "missionDescID").label
        let dateTimeDescLabel = cell.staticTexts.element(matching: .any, identifier: "dateTimeDescID").label
        let rocketDescIDLabel = cell.staticTexts.element(matching: .any, identifier: "rocketDescID").label
        let daysDescIDLabel = cell.staticTexts.element(matching: .any, identifier: "daysDescID").label
        let missionLabel = cell.staticTexts.element(matching: .any, identifier: "missionID").label
        let dateInfoLabel = cell.staticTexts.element(matching: .any, identifier: "dateInfoID").label
        let rocketLabel = cell.staticTexts.element(matching: .any, identifier: "rocketID").label
        let daysLabel = cell.staticTexts.element(matching: .any, identifier: "daysID").label
        let checkImage = cell.staticTexts.element(matching: .image, identifier: "checkImageViewID").firstMatch

        XCTAssertNotNil(imageCell)
        XCTAssertNotNil(missionDescLabel)
        XCTAssertNotNil(dateTimeDescLabel)
        XCTAssertNotNil(rocketDescIDLabel)
        XCTAssertNotNil(daysDescIDLabel)
        XCTAssertNotNil(missionLabel)
        XCTAssertNotNil(dateInfoLabel)
        XCTAssertNotNil(rocketLabel)
        XCTAssertNotNil(daysLabel)
        XCTAssertNotNil(checkImage)
    }

    func test_shouldAssert_elementsNotEmpty() {
        let myTable = app.tables.matching(identifier: "tableViewControllerID")
        let cell = myTable.cells.element(matching: .cell, identifier: "HomeLaunchSuccessCellID").firstMatch
        let missionDescLabel = cell.staticTexts.element(matching: .any, identifier: "missionDescID").label
        let dateTimeDescLabel = cell.staticTexts.element(matching: .any, identifier: "dateTimeDescID").label
        let rocketDescIDLabel = cell.staticTexts.element(matching: .any, identifier: "rocketDescID").label
        let daysDescIDLabel = cell.staticTexts.element(matching: .any, identifier: "daysDescID").label
        let missionLabel = cell.staticTexts.element(matching: .any, identifier: "missionID").label
        let dateInfoLabel = cell.staticTexts.element(matching: .any, identifier: "dateInfoID").label
        let rocketLabel = cell.staticTexts.element(matching: .any, identifier: "rocketID").label
        let daysLabel = cell.staticTexts.element(matching: .any, identifier: "daysID").label

        XCTAssertNotEqual(missionDescLabel, "")
        XCTAssertNotEqual(dateTimeDescLabel, "")
        XCTAssertNotEqual(rocketDescIDLabel, "")
        XCTAssertNotEqual(daysDescIDLabel, "")
        XCTAssertNotEqual(missionLabel, "")
        XCTAssertNotEqual(dateInfoLabel, "")
        XCTAssertNotEqual(rocketLabel, "")
        XCTAssertNotEqual(daysLabel, "")
    }
}

extension XCTestCase {
    func takeScreenshot(named name: String) {
        let mainScreenScreenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: mainScreenScreenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}


