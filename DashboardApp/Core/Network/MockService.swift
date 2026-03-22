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
                    InfoItem(title: "Work", date: "12 Jul, 2025", status: "Live", icon: "work"),
                    InfoItem(title: "Home", date: "01 Feb, 2026", status: "Done", icon: "home"),
                    InfoItem(title: "Personal", date: "21 Mar, 2026", status: "Process", icon: "personal")
                ],
                carousel: [
                        CarouselItem(
                            title: "Information",
                            description: "Information is knowledge, facts, or details that we learn, share, or gather about the world",
                            icon: "Vector"
                        ),
                        CarouselItem(
                            title: "Offers",
                            description: "An offer is a special deal or incentive designed to encourage someone to buy a product, use a service",
                            icon: "Vector"
                        ),
                        CarouselItem(
                            title: "Rewards",
                            description: "A reward is something good you get for doing a task, behaving well, or working hard. It is a way to say thank you",
                            icon: "Vector"
                        )
                    ]
            )

            completion(data)
        }
    }
}
