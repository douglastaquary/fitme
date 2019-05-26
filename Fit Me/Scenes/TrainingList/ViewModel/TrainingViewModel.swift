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
    
    public var identifier: String {
        return training.identifier
    }
    
    
    public var title: String {
        return training.title
    }
    
    public var exercisesGroup: [ExercisesGroup] {
        return training.groups
    }
    
    public var allExercices: [Exercise] {
        return training.allExercises
    }
    
    public var exercisesViewModel: [ExerciseListViewModel] {
        return training.allExercises.map(ExerciseListViewModel.init)
    }
    
    public var groupNames: [String] {
        return training.groupNames
    }
    
    public var exerciseTitle: String {
        return "Bíceps Máquina"
    }
    
    public var image: UIImage? {
        return UIImage(named: "ic_app")
    }
    
    public var imageSuccessfull: UIImage? {
        return UIImage(named: "ic_check")
    }
    
    public var closeImage: UIImage? {
        return UIImage(named: "close")
    }
    
    public var buttonTitle: String {
        return NSLocalizedString("Adicionar", comment: "Title of button add ")
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
        return NSAttributedString(string: defaultTitle, attributes: TrainingViewModel.defaultTitleAttributes)
    }

    public var attributedButtonTitle: NSAttributedString {
        return NSAttributedString(string: buttonTitle, attributes: TrainingViewModel.buttonTitleAttributes)
    }
    
    public var attributedsubtitle: NSAttributedString {
        return NSAttributedString(string: buttonTitle, attributes: TrainingViewModel.subtitleAttributes)
    }
    
    public var attributedDelaySeries: NSAttributedString {
        return NSAttributedString(string: buttonTitle, attributes: TrainingViewModel.subtitleAttributes)
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
    
    
    private static let defaultTitleAttributes: [NSAttributedString.Key: Any] = {
        return [
            .foregroundColor: UIColor.actionColor,
            .font: UIFont.systemFont(ofSize: Metrics.buttonTitleFontSize, weight: Metrics.buttonTitleFontWeight)
        ]
    }()

    
}

