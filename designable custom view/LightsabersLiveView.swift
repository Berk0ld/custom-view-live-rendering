//
//  LightsabersLiveView.swift
//  designable custom view
//
//  Created by Andrey Moskvin on 4/17/16.
//  Copyright © 2016 Berk0ld. All rights reserved.
//

import UIKit

@IBDesignable
final class LightsabersLiveView: UIView {
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        let lightsabersViewController = LightsabersTableViewController()
        lightsabersViewController.view.frame = frame
        
        let parentViewController = UIViewController(); do {
            parentViewController.view.frame = frame
            parentViewController.view.addSubview(lightsabersViewController.view)
            parentViewController.addChildViewController(lightsabersViewController)
        }
        
        parentViewController.setOverrideTraitCollection(
            preferredTraitCollection, forChildViewController: lightsabersViewController)
        addSubview(parentViewController.view)
        layoutIfNeeded()
    }
    
    var preferredTraitCollection: UITraitCollection {
        func sizeClass(forSize size: CGFloat) -> UIUserInterfaceSizeClass {
            precondition(size >= 0, "Width should be non negative")
            
            if size > 400 {
                return .Regular
            } else {
                return .Compact
            }
        }
        
        return UITraitCollection(traitsFromCollections: [
            UITraitCollection(verticalSizeClass: sizeClass(forSize: frame.width)),
            UITraitCollection(horizontalSizeClass: sizeClass(forSize: frame.height)) ])
    }
}
