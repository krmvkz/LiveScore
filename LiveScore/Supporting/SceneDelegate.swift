//
//  SceneDelegate.swift
//  LiveScore
//
//  Created by Arman Karimov on 06.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        // if user selected leagues
        if UserDefaults.standard.bool(forKey: "leagueSelection") {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
            window.rootViewController = mainTabBarController
        } else {
            // if user not selected leagues
            let storyboard = UIStoryboard(name: "Splash", bundle: nil)
            let splashViewController = storyboard.instantiateViewController(identifier: "SplashViewController")
            window.rootViewController = splashViewController
        }
        window.makeKeyAndVisible()
        self.window = window
    }
}

// MARK: - RootViewController
extension SceneDelegate {
    func changeRootViewController(_ viewController: UIViewController, animated: Bool = true) {
        guard let window = self.window else {
            return
        }
        window.rootViewController = viewController
        UIView.transition(
            with: window,
            duration: 0.5,
            options: [.transitionCrossDissolve],
            animations: nil,
            completion: nil)
    }
}
