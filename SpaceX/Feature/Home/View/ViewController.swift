//
//  ViewController.swift
//  SpaceX
//
//  Created by Ivo Silva on 18/09/2020.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class ViewController: TableViewController {

    // MARK: - HOME PROPERTIES -
    let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.showsScopeBar = true
        searchController.searchBar.placeholder = Constant.Home.searchBarPlaceHolder
        searchController.searchBar.scopeButtonTitles = [
            Constant.Home.ScopeButtons.asc.name,
            Constant.Home.ScopeButtons.desc.name
        ]
        searchController.searchBar.searchTextField.accessibilityLabel = "homeSearchBarLabel"
        return searchController
    }()

    var homeSections: [Section] = []

    private var launchSection: HomeLaunchSection? {
        return homeSections.compactMap({
            guard let launch = $0 as? HomeLaunchSection else { return nil }
            return launch
        }).first
    }

    // MARK: - LIFE CYCLE -
    override func viewWillLayoutSubviews() {
        title = Constant.Home.homeTitle
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    override func viewWillAppear(_ animated: Bool) {
        homeSections.forEach({ sections.append($0) })
        tableView.reloadData()
    }
}

// MARK: - SEARCHING UPDATING -
extension ViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
      launchSection?.updateSearchResults(for: searchController)
  }
}

// MARK: - SEARCHBAR DELEGATE
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        launchSection?.searchBar(searchBar: searchBar, selectedScopeButtonIndexDidChange: selectedScope)
    }
}

// MARK: - COMPANY SECTION OUTPUT -
extension ViewController: HomeCompanySectionOutput {}

// MARK: - LAUNCH SECTION OUTPUT -
extension ViewController: HomeLaunchSectionOutput {
    func openBrowserWith(articleLink: URL) {
        UIApplication.shared.open(articleLink, options: [:], completionHandler: nil)
    }
}


