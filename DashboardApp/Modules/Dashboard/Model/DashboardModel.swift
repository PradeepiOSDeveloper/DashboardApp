//
//  DashboardModel.swift
//  DashboardApp
//
//  Created by Pradeep Chowdary on 21/03/26.
//
import Foundation

struct DashboardModel {
    let user: User
    let actions: [ActionItem]
    let infos: [InfoItem]
    let carousel: [CarouselItem]
}

struct User {
    let name: String
    let mobile: String
    let status: String
}

struct ActionItem {
    let title: String
    let icon: String
}

struct InfoItem {
    let title: String
    let date: String
    let status: String
    let icon: String
}

struct CarouselItem {
    let title: String
    let description: String
    let icon: String
}
