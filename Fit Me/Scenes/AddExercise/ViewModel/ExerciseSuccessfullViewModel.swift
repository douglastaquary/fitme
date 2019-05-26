//
//  ExerciseSuccessfullViewModel.swift
//  Fit Me
//
//  Created by resource on 26/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//

import UIKit
import FitmeKit

public struct ExerciseSuccessfullViewModel {
    
    public init() {}
    
    public var title: String {
        return NSLocalizedString("Exercício Adicionado", comment: "Title of exercise add ok")
    }
    
    public var continueButtonTitle: String {
        return NSLocalizedString("Continue", comment: "Title of exercise add ok")
    }

    public var imageSuccessfull: UIImage? {
        return UIImage(named: "ic_check")
    }
    
    public var closeImage: UIImage? {
        return UIImage(named: "close")
    }

    public var defaultTitle: String {
        return NSLocalizedString("Lista de treinos", comment: "Title of button training list ")
    }
    
    private static let descriptionAttributes: [NSAttributedString.Key: Any] = {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = Metrics.trainingDescriptionLineHeight
        
        return [
            .foregroundColor: UIColor.secondaryText,
            .paragraphStyle: style,
            .font: UIFont.systemFont(ofSize: Metrics.addTrainingSectionTitleFontSize)
        ]
    }()
    
    public var attributedButtonDefaultTitle: NSAttributedString {
        return NSAttributedString(string: defaultTitle, attributes: ExerciseSuccessfullViewModel.defaultTitleAttributes)
    }
    
    public var attributedButtonContinueTitle: NSAttributedString {
        return NSAttributedString(string: continueButtonTitle, attributes: ExerciseSuccessfullViewModel.buttonContinueTitleAttributes)
    }
    
    private static let defaultTitleAttributes: [NSAttributedString.Key: Any] = {
        return [
            .foregroundColor: UIColor.actionColor,
            .font: UIFont.systemFont(ofSize: Metrics.buttonTitleFontSize, weight: Metrics.buttonTitleFontWeight)
        ]
    }()
    
    private static let buttonContinueTitleAttributes: [NSAttributedString.Key: Any] = {
        return [
            .foregroundColor: UIColor.background,
            .font: UIFont.systemFont(ofSize: Metrics.buttonTitleFontSize, weight: Metrics.buttonTitleFontWeight)
        ]
    }()
    
    
}


