//
//  HomeLaunchSection.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation
import UIKit

// MARK: - LAUNCH SECTION OUTPUT -
protocol HomeLaunchSectionOutput: SectionOutput {
    func openBrowserWith(articleLink: URL)
}

final class HomeLaunchSection: Section {

    // MARK: - DELCARATIONS -
    weak var delegate: HomeLaunchSectionOutput?
    var presenter: HomeLaunchSectionPresenterInput!
    private var launch: HomeLaunchSectionDomain!
    private lazy var isLastPage: Bool = false
    private var currentScopeButton = Constant.Home.ScopeButtons.asc

    // MARK: - CONSTRUCTORS -
    override init() {
        super.init()
        self.items = [NSObject()]
        self.launch = HomeLaunchSectionDomain()
    }

    // MARK: - INPUT METHODS -
    func startSection() {
        loadMoreItems()
    }

    func loadMoreItems() {
        presenter?.getLaunch(offSet: launch.launches.count)
    }

    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case Constant.Home.ScopeButtons.asc.rawValue:
            currentScopeButton = .asc
            self.output?.reloadSection(section: self, animation: .automatic)
        default:
            currentScopeButton = .desc
            self.output?.reloadSection(section: self, animation: .automatic)
        }
    }

    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let text = searchBar.text ?? ""
        let isTextNotEmpty = !text.isEmpty
        switch currentScopeButton {
        case .desc:
            if isTextNotEmpty {
                filterContentForSearchText(text)
            } else {
                items = sortingContentForScopeButton()
                self.output?.reloadSection(section: self, animation: .automatic)
            }
        case .asc:
            if isTextNotEmpty {
                filterContentForSearchText(text)
            } else {
                items = sortingContentForScopeButton()
                self.output?.reloadSection(section: self, animation: .automatic)
            }
        }
    }
}

// MARK: - ASSISTANT METHODS -
extension HomeLaunchSection {
    private func handleScroll(row: Int) {
        if row == items.count - 1 {
            if items.count == launch.launches.count && !isLastPage {
                loadMoreItems()
            }
        }
    }

    func filterContentForSearchText(_ searchText: String) {
        guard var domain = self.launch else { return }
        domain.launches = sortingContentForScopeButton()
        domain.getLaunchesFilteredBy(text: searchText)
        items = domain.launches
        self.output?.reloadSection(section: self, animation: .automatic)
    }

    func sortingContentForScopeButton() -> LaunchDomainItems {
        guard var domain = self.launch else { return launch.launches }
        switch currentScopeButton {
        case .asc:
            domain.getLaunchesAscendingOrder()
            return domain.launches

        case .desc:
            domain.getLaunchesDescendingOrder()
            return domain.launches
        }
    }

    func sortingNewItemsByScope() -> LaunchDomainItems {
        guard var domain = self.launch,
        let newItems = items as? LaunchDomainItems else { return launch.launches }
        domain.launches = newItems
        switch currentScopeButton {
        case .asc:
            domain.getLaunchesAscendingOrder()
            return domain.launches

        case .desc:
            domain.getLaunchesDescendingOrder()
            return domain.launches
        }
    }
}

// MARK: - TABLEVIEW SECTION INPUT -
extension HomeLaunchSection: TableSectionCellInput {
    func didSelectCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        guard let launch = items[indexPath.row] as? LaunchDomain else { return }
        delegate?.openBrowserWith(articleLink: launch.articleURL)
    }

    func cell(for indexPath: IndexPath) -> UITableViewCell.Type {
        switch self.scene {
        case .sceneloading:
            return LoadingTableViewCell.self
        default:
            return HomeLaunchSectionSuccessTableViewCell.self
        }
    }

    func willDisplayCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        guard let cell = cell as? HomeLaunchSectionSuccessTableViewCell else { return }
        handleScroll(row: indexPath.row)
        guard items.count > 0,
        indexPath.row < items.count,
        let launch = items[indexPath.row] as? LaunchDomain else { return }
        cell.setup(launch: launch)
    }

    func heightForRowInSection(indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

// MARK: - HEADER OUTPUT -
extension HomeLaunchSection: TableSectionHeaderInput {
    func header() -> UITableViewHeaderFooterView.Type {
        return HomeSectionHeaderView.self
    }

    func heightForHeaderInSection() -> CGFloat {
        return 50
    }

    func willDisplayHeader(_ headerView: UIView) {
        guard let headerView = headerView as? HomeSectionHeaderView else { return }
        headerView.setupHeaderDescription(text: HeaderConstant.homeLaunchSection)
    }

    func shouldDisplayHeader() -> Bool {
        return true
    }
}

// MARK: - PRESENTER OUTPUT -
extension HomeLaunchSection : HomeLaunchSectionPresenterOutput {
    func handleSuccess(domain: HomeLaunchSectionDomain) {
        if self.items.first as? LaunchDomain  == nil && !self.items.isEmpty { self.items.removeFirst() }
        guard !domain.launches.isEmpty else { isLastPage = true; return }
        scene = .sceneSuccess
        launch.launches.append(contentsOf: domain.launches)
        items.append(contentsOf: domain.launches)
        items = sortingNewItemsByScope()
        output?.reloadSection(section: self, animation: .automatic)
    }

    func removeSection() {
        self.output?.removeItem(from: 0, in: self, animation: .fade, completion: nil)
    }
}


