//
//  ExerciseListViewModel.swift
//  Fit Me
//
//  Created by Santander on 20/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//

import UIKit
import FitmeKit

public struct ExerciseListViewModel {
    
    public let exercise: Exercise
    
    public init(exercise: Exercise) {
        self.exercise = exercise
    }
    
    public var name: String {
        return exercise.name
    }
    
    public var delay: Int {
        return exercise.delay
    }
    
    public var series: Int {
        return exercise.series
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
    
    
    public var attributedButtonTitle: NSAttributedString {
        return NSAttributedString(string: buttonTitle, attributes: ExerciseListViewModel.buttonTitleAttributes)
    }
    
    public var attributedsubtitle: NSAttributedString {
        return NSAttributedString(string: name, attributes: ExerciseListViewModel.subtitleAttributes)
    }
    
    public var attributedDelaySeries: NSAttributedString {
        return NSAttributedString(string: "\(delay) a \(series)", attributes: ExerciseListViewModel.delaySeriesAttributes)
    }
    
    private static let buttonTitleAttributes: [NSAttributedString.Key: Any] = {
        return [
            .foregroundColor: UIColor.background,
            .font: UIFont.systemFont(ofSize: Metrics.buttonTitleFontSize, weight: Metrics.buttonTitleFontWeight)
        ]
    }()
    
    private static let subtitleAttributes: [NSAttributedString.Key: Any] = {
        return [
            .foregroundColor: UIColor.actionColor,
            .font: UIFont.systemFont(ofSize: Metrics.exerciseListSubtitleFontSize, weight: Metrics.exerciseListSubtitleFontWeight)
        ]
    }()
    
    private static let delaySeriesAttributes: [NSAttributedString.Key: Any] = {
        return [
            .foregroundColor: UIColor.delaySeriesText,
            .font: UIFont.systemFont(ofSize: Metrics.seriesTimesTextFontSize, weight: Metrics.seriesTimesFontWeight)
        ]
    }()
    
    
    
}

