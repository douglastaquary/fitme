//
//  TagViewModel.swift
//  Fit Me
//
//  Created by Douglas Taquary on 14/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

public protocol TagViewModelProtocol {
    var tags: [UIViewTextViewModelProtocol] { get }
    var didTapTagAction: () -> Void { get }
}

public struct TagViewModel: TagViewModelProtocol{
    
    public var tags: [UIViewTextViewModelProtocol]
    
    public let didTapTagAction: () -> Void
    
    public init() {
        
         self.init(didTapTagAction: { debugPrint("Ok") })
    }
    
    public init(didTapTagAction: @escaping () -> Void) {
        self.didTapTagAction = didTapTagAction
        
        tags = TagViewModel.buildTags()
    }
    
//    public static func buildTags() -> [TagColorView] {
//        struct NewTag {
//            let color: UIColor?
//        }
//
//        let tags = [(#colorLiteral(red:0.96, green:0.37, blue:0.16, alpha:1)),(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)),(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)),(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)),(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), (#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)), (#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)), (#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))]
//
//        let steps = tags.map { (color) -> TagColorView in
//            let tagColor = TagColorView(frame: CGRect(x: 0, y: 0, width: Metrics.tagCircleColorSize, height: Metrics.tagCircleColorSize))
//            tagColor.circleView.backgroundColor = color
//            return tagColor
//        }
//
//        return steps
//    }
    
    
    static func buildTags() -> [UIViewTextViewModelProtocol] {
        struct Tag: UIViewTextViewModelProtocol {
            let color: UIColor?
            let text: NSAttributedString?
        }
        
        let configs = [(#colorLiteral(red:0.96, green:0.37, blue:0.16, alpha:1)),(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)),(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)),(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)),(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), (#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)), (#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)), (#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))]
        
        let tags = configs.map { (color) -> Tag in
            return Tag(color: color,
                       text: NSAttributedString(string: "",
                                                font: UIFont.systemFont(ofSize: Metrics.addTrainingSectionTitleFontSize, weight: Metrics.addTrainingSectionTitleFontWeight),
                                                color: .primaryText))
        }
        
        return tags
    }
}
