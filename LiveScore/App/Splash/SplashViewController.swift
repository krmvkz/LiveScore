//
//  SplashViewController.swift
//  LiveScore
//
//  Created by Arman Karimov on 07.06.2022.
//

import UIKit
import SnapKit


final class SplashViewController: UIViewController {
    // MARK: - UI
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .customSemiBold(ofSize: 36)
        label.text = "What League do you interest?"
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .customRegular(ofSize: 17)
        label.text = "You can choose more than one"
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .customDark
        collectionView.allowsMultipleSelection = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "SplashCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: SplashCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    private lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.layer.cornerRadius = 16.0
        button.layer.cornerCurve = .continuous
        button.backgroundColor = .customBlue
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var skipButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - ViewModels
    let splashVM = SplashViewModel()
    
    // MARK: - Properties
    let inset: CGFloat = 0
    let cellsPerRow = 3
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view.backgroundColor = .customDark
        initialSetup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
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
    #warning("Add logic")
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SplashViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = collectionView.frame.size.width / 3 - 5
        let height = width * (4 / 3)
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
    @objc func skipButtonTapped() {
        let mainTabBarController = MainTabBarController()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    func initialSetup() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(collectionView)
        view.addSubview(continueButton)
        view.addSubview(skipButton)
    }
    
    func setupConstraints() {
        skipButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(30)
            make.top.equalTo(continueButton.snp.bottom).offset(28)
        }
        continueButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(28)
            make.top.equalTo(collectionView.snp.bottom).offset(28)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(28)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(28)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(48)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
}
