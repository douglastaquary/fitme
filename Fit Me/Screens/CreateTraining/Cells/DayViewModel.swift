//
//  DayViewModel.swift
//  Fit Me
//
//  Created by Douglas Taquary on 14/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit


public protocol DayViewModelProtocol {
    
    var days: [UIViewTextViewModelProtocol] { get }
    var didTapDayAction: () -> Void { get }
}


public struct DayViewModel: DayViewModelProtocol  {

    public let didTapDayAction: () -> Void

    public let days: [UIViewTextViewModelProtocol]
    
    public init() {
        
        self.init(didTapDayAction: { debugPrint("Ok") })
    }
    
    public init(didTapDayAction: @escaping () -> Void) {
        self.didTapDayAction = didTapDayAction
        
        days = DayViewModel.buildDays()
    }
    
    static func buildDays() -> [UIViewTextViewModelProtocol] {
        struct Day: UIViewTextViewModelProtocol {
            let color: UIColor?
            let text: NSAttributedString?
        }
        
        let configs = [(NSLocalizedString("D", comment: "domingo"), UIColor.background),
                       (NSLocalizedString("S", comment: "segunda"), UIColor.background),
                       (NSLocalizedString("T", comment: "terca"), UIColor.actionColor),
                       (NSLocalizedString("Q", comment: "quarta"), UIColor.background),
                       (NSLocalizedString("Q", comment: "quinta"), UIColor.background),
                       (NSLocalizedString("S", comment: "sexta"), UIColor.background),
                       (NSLocalizedString("S", comment: "sábado"), UIColor.background)]
        
        let days = configs.map { (text, color) -> Day in
            return Day(color: color,
                       text: NSAttributedString(string: text,
                                                font: UIFont.systemFont(ofSize: Metrics.addTrainingSectionTitleFontSize, weight: Metrics.addTrainingSectionTitleFontWeight),
                                                color: .primaryText))
        }
        
        return days
    }
}

