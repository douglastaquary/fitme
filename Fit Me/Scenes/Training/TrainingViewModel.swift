//
//  AddViewModel.swift
//  Fit Me
//
//  Created by Douglas Taquary on 07/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit
import FitmeKit

public struct TrainingViewModel {
    
    public let training: Training
    
    public init(training: Training) {
        self.training = training
    }
    
    
    public var title: String {
        return training.title
    }
    
    public var exerciseTitle: String {
        return "Bíceps Máquina"
    }
    
    public var image: UIImage? {
        return UIImage(named: "ic_app")
    }
    
    public var closeImage: UIImage? {
        return UIImage(named: "close")
    }
    
    public var buttonTitle: String {
        return NSLocalizedString("Adicionar", comment: "Title of button add ")
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
    
//    public var attributedDescription: NSAttributedString {
//        return NSAttributedString(string: training.description, attributes: TrainingViewModel.descriptionAttributes)
//    }
//    
    public var attributedButtonTitle: NSAttributedString {
        return NSAttributedString(string: buttonTitle, attributes: TrainingViewModel.buttonTitleAttributes)
    }
    
    private static let buttonTitleAttributes: [NSAttributedString.Key: Any] = {
        return [
            .foregroundColor: UIColor.background,
            .font: UIFont.systemFont(ofSize: Metrics.buttonTitleFontSize, weight: Metrics.buttonTitleFontWeight)
        ]
    }()
    
}

