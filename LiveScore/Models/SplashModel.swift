//
//  SplashModel.swift
//  LiveScore
//
//  Created by Arman Karimov on 11.06.2022.
//

import UIKit

struct SplashModel {
    let imageName: UIImage?
    let leagueName: String
    
    init(imageName: String, leagueName: String) {
        self.imageName = UIImage(named: imageName)
        self.leagueName = leagueName
    }
}
