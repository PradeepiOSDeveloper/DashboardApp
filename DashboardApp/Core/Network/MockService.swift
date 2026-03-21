//
//  MockService.swift
//  DashboardApp
//
//  Created by Pradeep Chowdary on 21/03/26.
//
import Foundation

final class MockService {

    func fetchDashboard(completion: @escaping (DashboardModel) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

            let data = DashboardModel(
                user: User(name: "Pradeep Putta", mobile: "+91 9000209620", status: "Active"),
                actions: [
                    ActionItem(title: "Details", icon: "notes"),
                    ActionItem(title: "Scan", icon: "scan"),
                    ActionItem(title: "Signature", icon: "signature")
                ],
                infos: [
                    InfoItem(title: "Work", date: "12 Jul, 2025", status: "Status", icon: "work"),
                    InfoItem(title: "Home", date: "12 Jul, 2025", status: "Status", icon: "home"),
                    InfoItem(title: "Personal", date: "12 Jul, 2025", status: "Status", icon: "personal")
                ]
            )

            completion(data)
        }
    }
}
