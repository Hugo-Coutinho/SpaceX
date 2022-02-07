//
//  HomeCompanySection.swift
//  SpaceX
//
//  Created by hugo.coutinho on 18/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import UIKit

// MARK: - COMPANY SECTION OUTPUT -
protocol HomeCompanySectionOutput: SectionOutput {
}

final class HomeCompanySection: Section {

    // MARK: - VARIABLES -
    weak var delegate: HomeCompanySectionOutput?
    var presenter: HomeCompanySectionPresenterInput!
    private var companyInfo: String!

    // MARK: - CONSTRUCTORS -
    override init() {
        super.init()
        self.items = [NSObject()]
        self.companyInfo = ""
    }

    // MARK: - INPUT METHODS -
    func startSection() {
        presenter.getInfo()
    }
}

// MARK: - TABLEVIEW SECTION INPUT -
extension HomeCompanySection: TableSectionCellInput {
    func didSelectCell(_ cell: UITableViewCell, at indexPath: IndexPath) {}

    func cell(for indexPath: IndexPath) -> UITableViewCell.Type {
        switch self.scene {
        default:
            return HomeCompanySectionSuccessTableViewCell.self
        }
    }

    func willDisplayCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        guard let cell = cell as? HomeCompanySectionSuccessTableViewCell else { return }
        cell.setupInfo(description: self.companyInfo)
    }

    func heightForRowInSection(indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

// MARK: - HEADER OUTPUT -
extension HomeCompanySection: TableSectionHeaderInput {
    func header() -> UITableViewHeaderFooterView.Type {
        return HomeSectionHeaderView.self
    }

    func heightForHeaderInSection() -> CGFloat {
        return 50
    }

    func willDisplayHeader(_ headerView: UIView) {
        guard let headerView = headerView as? HomeSectionHeaderView else { return }
        headerView.setupHeaderDescription(text: HeaderConstant.homeCompanySection)
    }

    func shouldDisplayHeader() -> Bool {
        return true
    }
}

// MARK: - PRESENTER OUTPUT -
extension HomeCompanySection : HomeCompanySectionPresenterOutput {
    func handleSuccess(domain: HomeCompanySectionDomain) {
        self.scene = .sceneSuccess
        self.companyInfo = domain.info
        self.output?.reloadSection(section: self, animation: .automatic)
    }

    func removeSection() {
        self.output?.removeItem(from: 0, in: self, animation: .fade, completion: nil)
    }
}



