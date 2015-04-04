//
//  GearRefreshControl.swift
//  GearAnimation
//
//  Created by Andrea Mazzini on 04/04/15.
//  Copyright (c) 2015 Fancy Pixel. All rights reserved.
//

import UIKit

class GearRefreshControl: UIRefreshControl {
    
    var refreshContainerView: UIView!
    var overlayView: UIView!
    var isRefreshControlAnimating = false
    var shadowView: ShadowView!
    var centerGear: MainGear!
    var topGear: BigGear! // cue Jessica from the Allman brothers
    var rightGear: BigGear!
    var bottomGear: BigGear!
    var leftGear: BigGear!
    
    required override init() {
        fatalError("use init(frame:) instead")
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("use init(frame:) instead")
    }
    
    required override init(frame: CGRect) {
        super.init()
        self.bounds.size.width = frame.size.width
        setupRefreshControl()
    }
    
    func setupRefreshControl() {
        
        self.refreshContainerView = UIView(frame: self.bounds)
        self.refreshContainerView.backgroundColor = UIColor(red:0.13, green:0.29, blue:0.55, alpha:1)
        
        self.overlayView = UIView(frame: self.bounds)
        self.overlayView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        
        self.shadowView = ShadowView(frame: self.bounds)
        self.shadowView.shadowPercentage = 0.2
        
        self.centerGear = MainGear(frame: CGRectMake(0, 0, 48, 48))
        self.centerGear.backgroundColor = UIColor.clearColor()
        self.centerGear.tintColor = UIColor(red:0.36, green:0.52, blue:0.92, alpha:1)
        self.centerGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame), y: CGRectGetMidY(self.refreshContainerView.frame))
        
        self.topGear = BigGear(frame: CGRectMake(0, 0, 92, 92))
        self.topGear.backgroundColor = UIColor.clearColor()
        self.topGear.tintColor = UIColor(red:0.31, green:0.47, blue:0.84, alpha:1)
        self.topGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) + 48, y: CGRectGetMidY(self.refreshContainerView.frame) - 49)
        
        self.rightGear = BigGear(frame: CGRectMake(0, 0, 92, 92))
        self.rightGear.backgroundColor = UIColor.clearColor()
        self.rightGear.tintColor = UIColor(red:0.23, green:0.41, blue:0.76, alpha:1)
        self.rightGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) + 120, y: CGRectGetMidY(self.refreshContainerView.frame))
        
        self.bottomGear = BigGear(frame: CGRectMake(0, 0, 88, 88))
        self.bottomGear.backgroundColor = UIColor.clearColor()
        self.bottomGear.tintColor = UIColor(red:0.31, green:0.47, blue:0.84, alpha:1)
        self.bottomGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) - 48, y: CGRectGetMidY(self.refreshContainerView.frame) + 42)
        
        self.leftGear = BigGear(frame: CGRectMake(0, 0, 92, 92))
        self.leftGear.backgroundColor = UIColor.clearColor()
        self.leftGear.tintColor = UIColor(red:0.23, green:0.41, blue:0.76, alpha:1)
        self.leftGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) - 110, y: CGRectGetMidY(self.refreshContainerView.frame) - 18)
        
        self.refreshContainerView.addSubview(self.topGear)
        self.refreshContainerView.addSubview(self.rightGear)
        self.refreshContainerView.addSubview(self.bottomGear)
        self.refreshContainerView.addSubview(self.leftGear)
        self.refreshContainerView.addSubview(self.centerGear)
        self.refreshContainerView.addSubview(self.shadowView)
        self.refreshContainerView.addSubview(self.overlayView)
        
        self.refreshContainerView.clipsToBounds = true
        self.tintColor = UIColor.clearColor()
        
        self.addSubview(self.refreshContainerView)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var refreshBounds = self.bounds;
        
        // Distance the table has been pulled
        var pullDistance = max(0.0, -self.frame.origin.y);
        var pullRatio = min(max(pullDistance, 0.0), 140.0) / 140.0;
        
        self.overlayView.alpha = 1 - pullRatio
        
        self.centerGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame), y: pullDistance / 2)
        self.topGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) + 48, y: pullDistance / 2 - 49)
        self.rightGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) + 120, y: pullDistance / 2)
        self.bottomGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) - 47, y: pullDistance / 2 + 46)
        self.leftGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) - 105, y: pullDistance / 2 - 17)
        
        refreshBounds.size.height = pullDistance;
        
        [self.refreshContainerView, self.overlayView].map({$0.frame = refreshBounds});
        
        // Don't rotate the gears if the refresh animation is playing
        if (!self.refreshing && !self.isRefreshControlAnimating) {
            self.centerGear.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2) * pullRatio)
            self.topGear.transform = CGAffineTransformMakeRotation(0.025 - 0.9 * pullRatio)
            self.rightGear.transform = CGAffineTransformMakeRotation(-0.03 + 0.9 * pullRatio)
            self.bottomGear.transform = CGAffineTransformMakeRotation(0.025 - 0.9 * pullRatio)
            self.leftGear.transform = CGAffineTransformMakeRotation(0.025 + 0.9 * pullRatio)
        }
        
        // If we're refreshing and the animation is not playing, then play the animation
        if (self.refreshing && !self.isRefreshControlAnimating) {
            self.animateRefreshView()
        }
    }
    
    func animateRefreshView() {
        self.isRefreshControlAnimating = true
        
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveLinear, animations: {
            self.centerGear.transform = CGAffineTransformRotate(self.centerGear.transform, CGFloat(M_PI_2))
            self.topGear.transform = CGAffineTransformRotate(self.topGear.transform, -CGFloat(M_PI_2))
            self.rightGear.transform = CGAffineTransformRotate(self.rightGear.transform, CGFloat(M_PI_2))
            self.bottomGear.transform = CGAffineTransformRotate(self.bottomGear.transform, -CGFloat(M_PI_2))
            self.leftGear.transform = CGAffineTransformRotate(self.leftGear.transform, CGFloat(M_PI_2))
            }, completion: { finished in
                // If still refreshing, keep spinning
                if (self.refreshing) {
                    self.animateRefreshView()
                } else {
                    self.isRefreshControlAnimating = false
                }
            }
        )
    }
}
