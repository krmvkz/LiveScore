//
//  UIFont+Custom.swift
//  LiveScore
//
//  Created by Arman Karimov on 12.07.2022.
//

import UIKit

extension UIFont {
    static func customRegular(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SourceSansPro-Regular", size: size) else { return .systemFont(ofSize: size) }
        return font
    }
    static func customItalic(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SourceSansPro-Italic", size: size) else { return .systemFont(ofSize: size) }
        return font
    }
    static func customExtraLight(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SourceSansPro-ExtraLight", size: size) else { return .systemFont(ofSize: size) }
        return font
    }
    static func customExtraLightItalic(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SourceSansPro-ExtraLightItalic", size: size) else { return .systemFont(ofSize: size) }
        return font
    }
    static func customLight(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SourceSansPro-Light", size: size) else { return .systemFont(ofSize: size) }
        return font
    }
    static func customLightItalic(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SourceSansPro-LightItalic", size: size) else { return .systemFont(ofSize: size) }
        return font
    }
    static func customSemiBoldItalic(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SourceSansPro-SemiBoldItalic", size: size) else { return .systemFont(ofSize: size) }
        return font
    }
    static func customSemiBold(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SourceSansPro-SemiBold", size: size) else { return .systemFont(ofSize: size) }
        return font
    }
    static func customBold(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SourceSansPro-Bold", size: size) else { return .systemFont(ofSize: size) }
        return font
    }
    static func customBoldItalic(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SourceSansPro-BoldItalic", size: size) else { return .systemFont(ofSize: size) }
        return font
    }
    static func customBlack(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SourceSansPro-Black", size: size) else { return .systemFont(ofSize: size) }
        return font
    }
    static func customBlackItalic(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SourceSansPro-BlackItalic", size: size) else { return .systemFont(ofSize: size) }
        return font
    }
}
