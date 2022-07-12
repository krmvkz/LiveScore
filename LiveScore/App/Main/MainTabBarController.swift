//
//  MainTabBarController.swift
//  LiveScore
//
//  Created by Arman Karimov on 10.06.2022.
//

import UIKit

final class MainTabBarController: UITabBarController {
    // MARK: - Properties
    private lazy var defaultTabBarHeight = {
        tabBar.frame.size.height
    }()
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.tabBar.tintColor = .customBlue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        changeTabBarHeight()
    }
}

extension MainTabBarController {
    func setupTabs() {
        let vc1 = HomeViewController()
        let vc2 = ExploreViewController()
        let vc3 = MatchesViewController()

        vc1.title = "LiveScore"
        vc2.title = "Explore"
        vc3.title = "Matches"

        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)

        nav1.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home-tab-icon"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "explore-tab-icon"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "matches-tab-icon"), tag: 3)
        
        /// TabBarItem selected state
        nav1.tabBarItem.selectedImage = UIImage(named: "home-tab-icon")
        nav2.tabBarItem.selectedImage = UIImage(named: "explore-tab-icon")
        nav3.tabBarItem.selectedImage = UIImage(named: "matches-tab-icon")

        setViewControllers([nav1, nav2, nav3], animated: false)
    }
    
    func changeTabBarHeight() {
        let newTabBarHeight = defaultTabBarHeight + 16.0
        
        var newFrame = tabBar.frame
        newFrame.size.height = newTabBarHeight
        newFrame.origin.y = view.frame.size.height - newTabBarHeight
        
        tabBar.frame = newFrame
    }
}
