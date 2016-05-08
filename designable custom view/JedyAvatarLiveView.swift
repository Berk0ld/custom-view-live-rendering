//
//  JedyAvatarProxyView.swift
//  designable custom view
//
//  Created by Andrey Moskvin on 4/24/16.
//  Copyright © 2016 Berk0ld. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class JedyAvatarLiveView: UIView {
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    
        let bundle = NSBundle(forClass: self.dynamicType)
        let viewController = JedyEpisodeAvatarController()
        let loads = bundle.loadNibNamed("JedyEpisodeAvatarView",
                                        owner: viewController, options: nil)
        guard let avatarView = loads[0] as? JedyEpisodeAvatarView else { return }
        viewController.view = avatarView
        
        // update frame
        viewController.view.frame = frame
        
        // Create parent view controller for size class support
        let parentViewController = UIViewController(); do {
            parentViewController.view.frame = frame
            parentViewController.view.addSubview(viewController.view)
            parentViewController.addChildViewController(viewController)
        }
        
        // Set Size Class for jediesTableViewController
        parentViewController.setOverrideTraitCollection(
            UIKitHelper.preferredTraitCollection(forFrame: frame),
            forChildViewController: viewController)
        addSubview(parentViewController.view)
        
        // Force layout update
        layoutIfNeeded()
    }
}