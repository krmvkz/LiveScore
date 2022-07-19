//
//  MatchesTableViewCell.swift
//  LiveScore
//
//  Created by Алишер Батыр on 19.07.2022.
//

import UIKit

class MatchesTableViewCell: UITableViewCell {
    
    // MARK: - Public variables
    static let identifier = "MatchesTableViewCell"
    
    // MARK: - Private variables
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .red
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupViews() {
        
    }
    private func setupConstraints() {
        
    }
    
}
