//
//  TabBar.swift
//  LiveScore
//
//  Created by Arman Karimov on 10.06.2022.
//

import UIKit

@IBDesignable
class TabBar: UITabBar {
    @IBInspectable var height: CGFloat = 0.0
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        if height > 0.0 {
            sizeThatFits.height = height
        }
        return sizeThatFits
    }
}
