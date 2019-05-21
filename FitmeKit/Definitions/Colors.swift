//
//  Colors.swift
//  FitmeKit
//
//  Created by Douglas Taquary on 30/09/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

private enum Theme: Int {
    case light
    
    static var current: Theme {
        return .light
    }
}

private protocol ColorStore {
    static var background: UIColor { get }
    static var primaryText: UIColor { get }
    static var secondaryText: UIColor { get }
    static var delaySeriesText: UIColor { get }
    static var exerciseTitleText: UIColor { get }
    static var exerciseDescriptionText: UIColor { get }
    static var actionColor: UIColor { get }
    static var success: UIColor { get }
    static var defaultTag: UIColor { get }
}

private struct LightTheme: ColorStore {
    static let background: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let primaryText: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    static let secondaryText: UIColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    static let delaySeriesText: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    static let exerciseTitleText: UIColor = #colorLiteral(red:0.11, green:0.66, blue:0.54, alpha:1)
    static let exerciseDescriptionText: UIColor = #colorLiteral(red:0.96, green:0.37, blue:0.16, alpha:1)
    static let actionColor: UIColor =  #colorLiteral(red:0.96, green:0.37, blue:0.16, alpha:1)
    static let success: UIColor = #colorLiteral(red:0.11, green:0.66, blue:0.54, alpha:1)
    static var defaultTag: UIColor = #colorLiteral(red:0.11, green:0.66, blue:0.54, alpha:1)
}

extension UIColor: ColorStore {
    
    private static var colorStore: ColorStore.Type {
        switch Theme.current {
        case .light: return LightTheme.self
        }
    }
    
    public static var background: UIColor {
        return colorStore.background
    }
    
    public static var primaryText: UIColor {
        return colorStore.primaryText
    }
    
    public static var secondaryText: UIColor {
        return colorStore.secondaryText
    }
    
    public static var delaySeriesText: UIColor {
        return colorStore.delaySeriesText
    }
    
    public static var exerciseTitleText: UIColor {
        return colorStore.exerciseTitleText
    }
    
    public static var exerciseDescriptionText: UIColor {
        return colorStore.exerciseDescriptionText
    }
    
    public static var actionColor: UIColor {
        return colorStore.actionColor
    }
    
    public static var success: UIColor {
        return colorStore.success
    }
    
    public static var defaultTag: UIColor {
        return colorStore.defaultTag
    }
    
}
