//
//  SplashViewController.swift
//  LiveScore
//
//  Created by Arman Karimov on 07.06.2022.
//

import UIKit

final class SplashViewController: UIViewController {
    // MARK: - @IBOutlets
    @IBOutlet private weak var leaguesCollectionView: UICollectionView!
    
    // MARK: - ViewModels
    let splashVM = SplashViewModel()
    
    // MARK: - Properties
    let inset: CGFloat = 0
    let minimumLineSpacing: CGFloat = 10
    let minimumInteritemSpacing: CGFloat = 5
    let cellsPerRow = 3
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProtocolConformance()
        initialSetup()
    }
}

// MARK: - UICollectionViewDataSource
extension SplashViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return splashVM.leagueIcons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SplashCollectionViewCell.identifier,
            for: indexPath
        ) as? SplashCollectionViewCell else {
            fatalError("Can't cast cell as SplashCollectionViewCell")
        }
        let league = splashVM.leagueIcons[indexPath.row]
        cell.configureCell(with: league)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension SplashViewController: UICollectionViewDelegate {
    // TODO: - Add logic
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SplashViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = collectionView.bounds.width / 3
        let height = width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 10
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 5
    }
}

// MARK: - Private
private extension SplashViewController {
    @IBAction func skipButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    func setupProtocolConformance() {
        leaguesCollectionView.dataSource = self
        leaguesCollectionView.delegate = self
    }
    
    func initialSetup() {
        let nib = UINib(nibName: "SplashCollectionViewCell", bundle: nil)
        leaguesCollectionView.register(nib, forCellWithReuseIdentifier: SplashCollectionViewCell.identifier)
        leaguesCollectionView.allowsMultipleSelection = true
    }
}
