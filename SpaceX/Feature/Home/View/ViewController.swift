//
//  ViewController.swift
//  SpaceX
//
//  Created by Ivo Silva on 18/09/2020.
//  Copyright © 2020 Mindera. All rights reserved.
//

import UIKit

class ViewController: TableViewController {

    // MARK: - HOME PROPERTIES -
    var launchSection: HomeLaunchSection?
    let searchController = UISearchController(searchResultsController: nil)

    // MARK: - LIFE CYCLE -
    override func viewWillLayoutSubviews() {
        title = Constant.Home.homeTitle
        searchController.searchResultsUpdater = launchSection
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Constant.Home.searchBarPlaceHolder
        searchController.searchBar.scopeButtonTitles = [
            Constant.Home.ScopeButtons.asc.name,
            Constant.Home.ScopeButtons.desc.name
        ]
        searchController.searchBar.delegate = launchSection
        searchController.searchBar.showsScopeBar = true
        navigationItem.searchController = searchController

        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    override func viewWillAppear(_ animated: Bool) {
        launchSection = HomeLaunchSectionBuilder().make(output: self)
        guard let launchSection = launchSection else { return }
        sections = [
            HomeCompanySectionBuilder().make(output: self),
            launchSection
        ]
        tableView.reloadData()
    }
}

// MARK: - SEARCHBAR DELEGATE
extension ViewController: UISearchBarDelegate {
}

// MARK: - COMPANY SECTION OUTPUT -
extension ViewController: HomeCompanySectionOutput {}

// MARK: - LAUNCH SECTION OUTPUT -
extension ViewController: HomeLaunchSectionOutput {
    func openBrowserWith(articleLink: URL) {
        UIApplication.shared.open(articleLink, options: [:], completionHandler: nil)
    }
}


