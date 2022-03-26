//
//  SpaceXKifTests.swift
//  KIFSpaceXTests
//
//  Created by hugo.coutinho on 06/02/22.
//

import XCTest
import KIF
@testable import SpaceX

class SpaceXKifTests: XCTestCase {
    // MARK: - DECLARATIONS -
    var tester: KIFUITestActor!

    // MARK: - OVERRIDE -
    override func setUp() {
        tester = tester()
        let vc = HomeBuilderSpy().make()
        tester.wait(forTimeInterval: 10.0)
        setRootViewController(UINavigationController(rootViewController: vc))
    }

    override func tearDown() {
        tester = nil
        setRootViewController(UIViewController())
    }

    func test_searchingRocketByYear2007_shouldReturn1() {
        tester.enterText("2007", intoViewWithAccessibilityLabel: "homeSearchBarLabel")
        guard let tableView = tester.waitForView(withAccessibilityLabel: "tableViewControllerID") as? UITableView else { fatalError() }
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
    }
}

