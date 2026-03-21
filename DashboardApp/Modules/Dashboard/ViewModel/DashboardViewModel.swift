//
//  DashboardViewModel.swift
//  DashboardApp
//
//  Created by Pradeep Chowdary on 21/03/26.
//
import Foundation

final class DashboardViewModel {

    private let service = MockService()

    var onReload: (() -> Void)?

    private(set) var model: DashboardModel?

    func fetch() {
        service.fetchDashboard { [weak self] data in
            self?.model = data
            self?.onReload?()
        }
    }

    var user: User? { model?.user }
    var actions: [ActionItem] { model?.actions ?? [] }
    var infos: [InfoItem] { model?.infos ?? [] }
}
