//
//  MatchesViewController.swift
//  LiveScore
//
//  Created by Arman Karimov on 12.07.2022.
//

import UIKit
import SnapKit

final class MatchesViewController: UIViewController {
    // MARK: - Public variables
    
    // MARK: - Private variables
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = UIColor(red: 0.133, green: 0.133, blue: 0.196, alpha: 1)
        searchBar.layer.cornerRadius = 14
        searchBar.layer.masksToBounds = true
        return searchBar
    }()
    private let segmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl()
        return segmentControl
    }()
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundView = .none
        tableView.backgroundColor = .blue
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
        tableView.register(MatchesTableViewCell.self, forCellReuseIdentifier: MatchesTableViewCell.identifier)
        return tableView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customDark
        setupViews()
        setupConstraints()
        setupTableView()
    }
    
    // MARK: - Methods
    private func setupViews() {
        view.addSubview(searchBar)
        view.addSubview(segmentControl)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(52)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
            $0.height.equalToSuperview().offset(54)
        }
    }
}

    // MARK: - Extension
private extension MatchesViewController {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
}

    // MARK: - TableViewDelegate & TableViewData

extension MatchesViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}

extension MatchesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MatchesTableViewCell.identifier, for: indexPath) as!
        MatchesTableViewCell
        return cell
    }
}
