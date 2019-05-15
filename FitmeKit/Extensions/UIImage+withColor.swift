//
//  UIImage+withColor.swift
//  Fit Me
//
//  Created by Douglas Taquary on 05/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func image(with color: UIColor) -> UIImage
    {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        let renderer = UIGraphicsImageRenderer(bounds: rect)
        
        let image = renderer.image { _ in
            color.setFill()
            UIRectFill(rect)
        }
        
        return image
    }
}
