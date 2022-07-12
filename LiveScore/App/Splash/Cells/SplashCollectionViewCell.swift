//
//  SplashCollectionViewCell.swift
//  LiveScore
//
//  Created by Arman Karimov on 10.06.2022.
//

import UIKit

#warning("Refactor to ProgrammaticUI")
final class SplashCollectionViewCell: UICollectionViewCell {
    // MARK: - @IBOutlets
    @IBOutlet private weak var cellView: UIView!
    @IBOutlet private weak var leagueImageView: UIImageView!
    @IBOutlet private weak var leagueTitleLabel: UILabel!

    // MARK: - Properties
    static let identifier = "SplashCollectionViewCell"
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                cellView.backgroundColor = .customAccent
            } else {
                cellView.backgroundColor = .customLightDark
            }
        }
    }
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.backgroundColor = .customLightDark
        cellView.layer.cornerRadius = 16
        cellView.layer.cornerCurve = .continuous
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

extension SplashCollectionViewCell {
    func configureCell(with model: SplashModel) {
        leagueImageView.image = model.imageName
        leagueTitleLabel.text = model.leagueName
    }
}
