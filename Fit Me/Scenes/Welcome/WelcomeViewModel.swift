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
    
    /// WelcomeView
    
    public var welcomeTitle: String {
        return NSLocalizedString("Bem-vindo(a) ao FitMe!", comment: "Title for welcome screen")
    }
    
    public var welcomeDescription: String {
        return NSLocalizedString("Após cadastrados seus treinos do Fitme serão exíbidos aqui. Deseja começar?", comment: "description for welcome screen")
    }
    
    public var welcomeButtonTitle: String {
        return NSLocalizedString("Iniciar", comment: "Title of button welcome screen")
    }
    
    public var appIcon: UIImage? {
        return UIImage(named: "ic_app")
    }
    
    public var attributedWelcomeDescription: NSAttributedString {
        return NSAttributedString(string: welcomeDescription, attributes: WelcomeViewModel.welcomeDescriptionAttributes)
    }
    
    public var attributedWelcomeButtonTitle: NSAttributedString {
        return NSAttributedString(string: welcomeTitle, attributes: WelcomeViewModel.welcomeButtonTitleAttributes)
    }
    
    private static let messageParagraphStyle: NSMutableParagraphStyle = {
        let style = NSMutableParagraphStyle()

        style.lineSpacing = Metrics.welcomeDescriptionLineHeight
        style.alignment = .center

        return style
    }()

    private static let welcomeDescriptionAttributes: [NSAttributedString.Key: Any] = {
        return [
            .foregroundColor: UIColor.secondaryText,
            .font: UIFont.systemFont(ofSize: Metrics.welcomeDescriptionFontSize, weight: Metrics.welcomeDescriptionFontWeight)
        ]
    }()
    
    private static let welcomeButtonTitleAttributes: [NSAttributedString.Key: Any] = {
        return [
            .foregroundColor: UIColor.background,
            .font: UIFont.systemFont(ofSize: Metrics.buttonTitleFontSize, weight: Metrics.buttonTitleFontWeight),
            .paragraphStyle: messageParagraphStyle
        ]
    }()

     /// FinishView
    
    public var finishTitle: String {
        return NSLocalizedString("Treino Concluído!", comment: "Title for finish screen")
    }
    
    public var finishDescription: String {
        return NSLocalizedString("Parabéns você concluiu o seu treino! Acompanhe o seu desempenho mensal através do calendário.", comment: "Descript of finish descript")
    }
    
    public var finishButtonTitle: String {
        return NSLocalizedString("Ir para calendário", comment: "Title of button welcome screen")
    }
    
    public var trophyIcon: UIImage? {
        return UIImage(named: "trophy")
    }
    
    public var attributedFinishDescription: NSAttributedString {
        return NSAttributedString(string: finishDescription, attributes: WelcomeViewModel.finishDescriptionAttributes)
    }
    
    public var attributedFinishButtonTitle: NSAttributedString {
        return NSAttributedString(string: finishButtonTitle, attributes: WelcomeViewModel.finishButtonTitleAttributes)
    }
    
    private static let finishDescriptionAttributes: [NSAttributedString.Key: Any] = {
        return [
            .foregroundColor: UIColor.secondaryText,
            .font: UIFont.systemFont(ofSize: Metrics.welcomeDescriptionFontSize, weight: Metrics.welcomeDescriptionFontWeight)
        ]
    }()
    
    private static let finishButtonTitleAttributes: [NSAttributedString.Key: Any] = {
        return [
            .foregroundColor: UIColor.background,
            .font: UIFont.systemFont(ofSize: Metrics.buttonTitleFontSize, weight: Metrics.buttonTitleFontWeight),
            .paragraphStyle: messageParagraphStyle
        ]
    }()
    
}
