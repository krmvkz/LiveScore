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
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let newTabBarHeight = defaultTabBarHeight + 16.0
        print("DefaultTabBar height: \(defaultTabBarHeight)")
        print("NewTabBar height: \(newTabBarHeight)")
        
        var newFrame = tabBar.frame
        newFrame.size.height = newTabBarHeight
        newFrame.origin.y = view.frame.size.height - newTabBarHeight
        
        tabBar.frame = newFrame
    }
}
