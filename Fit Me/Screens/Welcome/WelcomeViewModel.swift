//
//  WelcomeViewModel.swift
//  Fit Me
//
//  Created by Douglas Taquary on 06/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

public struct WelcomeViewModel {
    
    public init() {}
    
    public var title: String {
        return NSLocalizedString("Bem-vindo(a) ao FitMe!", comment: "Title for welcome screen")
    }
    
    public var description: String {
        return NSLocalizedString("Após cadastrados seus treinos do FitMe serão exíbidos aqui. Deseja começar?", comment: "description for welcome screen")
    }
    
    public var buttonTitle: String {
        return NSLocalizedString("Iniciar", comment: "Title of button welcome screen")
    }
    
    public var image: UIImage? {
        return UIImage(named: "ic_app")
    }
    
//    private static let messageParagraphStyle: NSMutableParagraphStyle = {
//        let style = NSMutableParagraphStyle()
//
//        style.lineSpacing = Metrics.successDescriptionLineHeight
//        style.alignment = .center
//
//        return style
//    }()
//
//    private static let desriptionAttributes: [NSAttributedString.Key: Any] = {
//        return [
//            .foregroundColor: UIColor.secondaryText,
//            .font: UIFont.systemFont(ofSize: Metrics.successDescriptionFontSize, weight: Metrics.successDescriptionFontWeight),
//            .paragraphStyle: messageParagraphStyle
//        ]
//    }()
//
//    private static let messageNotificationInfoAttributes: [NSAttributedString.Key: Any] = {
//        return [
//            .foregroundColor: UIColor.success,
//            .font: UIFont.systemFont(ofSize: Metrics.successDescriptionFontSize, weight: Metrics.successDescriptionFontWeight),
//            .paragraphStyle: messageParagraphStyle
//        ]
//    }()
    
}
