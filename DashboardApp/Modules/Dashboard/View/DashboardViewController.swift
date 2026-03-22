//
//  DashboardViewController.swift
//  DashboardApp
//
//  Created by Pradeep Chowdary on 21/03/26.
//
import UIKit

final class DashboardViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let viewModel = DashboardViewModel()
    
    private let topHeaderView = TopHeaderView()
    
    private var gradientLayer: CAGradientLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        view.backgroundColor = UIColor.systemGroupedBackground
        title = ""
        navigationController?.navigationBar.isHidden = true
        setupTableView()
        bind()
        viewModel.fetch()
        setupGradient()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer?.frame = view.bounds
    }

    private func setupTableView() {
        view.addSubview(tableView)
        
        topHeaderView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 80)
        
        tableView.backgroundView = nil
        tableView.tableHeaderView = topHeaderView
        tableView.frame = view.bounds
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
        tableView.backgroundColor = .clear
        tableView.isOpaque = false
        view.backgroundColor = .clear
        

        tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        tableView.register(UINib(nibName: "ActionCell", bundle: nil), forCellReuseIdentifier: "ActionCell")
        tableView.register(UINib(nibName: "QRCell", bundle: nil), forCellReuseIdentifier: "QRCell")
        tableView.register(UINib(nibName: "PersonalInfoCell", bundle: nil), forCellReuseIdentifier: "PersonalInfoCell")
        tableView.register(UINib(nibName: "CarouselCell", bundle: nil), forCellReuseIdentifier: "CarouselCell")

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupGradient() {
        
        let gradient = CAGradientLayer()
        
        gradient.colors = [
            UIColor.white.cgColor,
            UIColor(red: 0.85, green: 0.95, blue: 0.85, alpha: 1).cgColor
        ]
        
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)

        view.layer.insertSublayer(gradient, at: 0)
        
        self.gradientLayer = gradient
    }

    private func bind() {
        viewModel.onReload = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension DashboardViewController: UITableViewDelegate,UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {

        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            if let user = viewModel.user {
                cell.configure(user: user)
            }
            return cell

        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath) as! ActionCell
            cell.configure(actions: viewModel.actions)
            return cell

        case 2:
            return tableView.dequeueReusableCell(withIdentifier: "QRCell", for: indexPath)

        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalInfoCell", for: indexPath) as! PersonalInfoCell
                cell.configure(items: viewModel.infos)
                return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarouselCell", for: indexPath) as! CarouselCell
            cell.configure(items: viewModel.carouselItems)
            return cell

        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return (section == 0 || section == 1 || section == 3) ? .leastNormalMagnitude : 12
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        switch indexPath.section {
            
        case 0:
            return 200   // Header
            
        case 1:
            return 150   // Actions
            
        case 2:
            return 300   // QR
            
        case 3:
            return 540    // PersonalInfo
        
        case 4:
            return 200    // Carousel
            
        default:
            return UITableView.automaticDimension
        }
    }
}
