//
//  UIKitHelper.swift
//  designable custom view
//
//  Created by Andrey Moskvin on 4/24/16.
//  Copyright © 2016 Berk0ld. All rights reserved.
//

import UIKit

enum UIKitHelper {
    static func sizeClass(forSize size: CGFloat) -> UIUserInterfaceSizeClass {
        precondition(size >= 0, "Size should be non negative")
        
        if size > 400 {
            return .Regular
        } else {
            return .Compact
        }
    }

    static func preferredTraitCollection(forFrame frame: CGRect) -> UITraitCollection {
        return UITraitCollection(traitsFromCollections: [
            UITraitCollection(verticalSizeClass:
                UIKitHelper.sizeClass(forSize: frame.width)),
            UITraitCollection(horizontalSizeClass:
                UIKitHelper.sizeClass(forSize: frame.height)) ])
    }
}
