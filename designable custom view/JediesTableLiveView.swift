//
//  LightsabersLiveView.swift
//  designable custom view
//
//  Created by Andrey Moskvin on 4/17/16.
//  Copyright © 2016 Berk0ld. All rights reserved.
//

import UIKit

@IBDesignable final class JediesTableLiveView: UIView {
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    
        // Create view controller with famous Jedy's
        let jediesTableViewController = JediesTableViewController()
        
        // update frame
        jediesTableViewController.view.frame = frame

        // Create parent view controller for size class support
        let parentViewController = UIViewController(); do {
            parentViewController.view.frame = frame
            parentViewController.view.addSubview(jediesTableViewController.view)
            parentViewController.addChildViewController(jediesTableViewController)
        }
        
        // Set Size Class for jediesTableViewController
        parentViewController.setOverrideTraitCollection(
            UIKitHelper.preferredTraitCollection(forFrame: frame),
            forChildViewController: jediesTableViewController)
        addSubview(parentViewController.view)
        
        // Force layout update
        layoutIfNeeded()
    }
}
