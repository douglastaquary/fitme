//
//  TrainingViewModel+NSUserActivity.swift
//  Fit Me
//
//  Created by Douglas Taquary on 14/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//


import UIKit
import MobileCoreServices
import CoreSpotlight

public extension TrainingViewModel {
    
    struct Keys {
        static let identifier = "pid"
    }
    
    var activityUserInfo: [String: String] {
        return [Keys.identifier: training.identifier ?? "ERROR"]
    }
    
    var userActivity: NSUserActivity {
        let activity = NSUserActivity(activityType: Constants.userActivityType)
        
        activity.isEligibleForSearch = true
        
        if #available(iOSApplicationExtension 12.0, *) {
            activity.isEligibleForPrediction = true
        }
        
        activity.title = title
        activity.requiredUserInfoKeys = Set([Keys.identifier])
        activity.userInfo = activityUserInfo
        
        let attributes = CSSearchableItemAttributeSet(itemContentType: kUTTypeItem as String)
        attributes.thumbnailData = image?.pngData()
        attributes.contentDescription = attributedDescription.string
        
        activity.contentAttributeSet = attributes
        
        return activity
    }
    
}

