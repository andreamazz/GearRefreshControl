//
//  GearRefreshControl.swift
//  GearRefreshControl
//
//  Created by Andrea Mazzini on 04/04/15.
//  Copyright (c) 2015 Fancy Pixel. All rights reserved.
//

import UIKit

public class GearRefreshControl: UIRefreshControl {
    
    var isRefreshControlAnimating = false

    private var refreshContainerView: UIView!
    private var overlayView: UIView!
    private var shadowView: ShadowView!
    private var centerGear: MainGear!
    private var topGear: BigGear! // cue Jessica from the Allman brothers
    private var rightGear: BigGear!
    private var bottomGear: BigGear!
    private var leftGear: BigGear!
    
    required override public init() {
        fatalError("use init(frame:) instead")
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("use init(frame:) instead")
    }
    
    required override public init(frame: CGRect) {
        super.init()
        bounds.size.width = frame.size.width
        setupRefreshControl()
    }
    
    public func setupRefreshControl() {
        
        refreshContainerView = UIView(frame: self.bounds)
        refreshContainerView.backgroundColor = UIColor(red:0.13, green:0.29, blue:0.55, alpha:1)
        
        overlayView = UIView(frame: self.bounds)
        overlayView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        
        shadowView = ShadowView(frame: self.bounds)
        shadowView.shadowPercentage = 0.2
        
        centerGear = MainGear(frame: CGRectMake(0, 0, 48, 48))
        centerGear.backgroundColor = UIColor.clearColor()
        centerGear.tintColor = UIColor(red:0.36, green:0.52, blue:0.92, alpha:1)
        centerGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame), y: CGRectGetMidY(self.refreshContainerView.frame))
        
        topGear = BigGear(frame: CGRectMake(0, 0, 92, 92))
        topGear.backgroundColor = UIColor.clearColor()
        topGear.tintColor = UIColor(red:0.31, green:0.47, blue:0.84, alpha:1)
        topGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) + 48, y: CGRectGetMidY(self.refreshContainerView.frame) - 49)
        
        rightGear = BigGear(frame: CGRectMake(0, 0, 92, 92))
        rightGear.backgroundColor = UIColor.clearColor()
        rightGear.tintColor = UIColor(red:0.23, green:0.41, blue:0.76, alpha:1)
        rightGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) + 120, y: CGRectGetMidY(self.refreshContainerView.frame))
        
        bottomGear = BigGear(frame: CGRectMake(0, 0, 88, 88))
        bottomGear.backgroundColor = UIColor.clearColor()
        bottomGear.tintColor = UIColor(red:0.31, green:0.47, blue:0.84, alpha:1)
        bottomGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) - 48, y: CGRectGetMidY(self.refreshContainerView.frame) + 42)
        
        leftGear = BigGear(frame: CGRectMake(0, 0, 92, 92))
        leftGear.backgroundColor = UIColor.clearColor()
        leftGear.tintColor = UIColor(red:0.23, green:0.41, blue:0.76, alpha:1)
        leftGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) - 110, y: CGRectGetMidY(self.refreshContainerView.frame) - 18)
        
        refreshContainerView.addSubview(self.topGear)
        refreshContainerView.addSubview(self.rightGear)
        refreshContainerView.addSubview(self.bottomGear)
        refreshContainerView.addSubview(self.leftGear)
        refreshContainerView.addSubview(self.centerGear)
        refreshContainerView.addSubview(self.shadowView)
        refreshContainerView.addSubview(self.overlayView)
        
        refreshContainerView.clipsToBounds = true
        tintColor = UIColor.clearColor()
        
        addSubview(self.refreshContainerView)
    }
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        var refreshBounds = self.bounds;
        
        // Distance the table has been pulled
        var pullDistance = max(0.0, -self.frame.origin.y);
        var pullRatio = min(max(pullDistance, 0.0), 140.0) / 140.0;
        
        overlayView.alpha = 1 - pullRatio
        
        centerGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame), y: pullDistance / 2)
        topGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) + 48, y: pullDistance / 2 - 49)
        rightGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) + 120, y: pullDistance / 2)
        bottomGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) - 47, y: pullDistance / 2 + 46)
        leftGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) - 105, y: pullDistance / 2 - 17)
        
        refreshBounds.size.height = pullDistance;
        
        [self.refreshContainerView, self.overlayView].map({$0.frame = refreshBounds});
        
        // Don't rotate the gears if the refresh animation is playing
        if (!refreshing && !isRefreshControlAnimating) {
            centerGear.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2) * pullRatio)
            topGear.transform = CGAffineTransformMakeRotation(0.025 - 0.9 * pullRatio)
            rightGear.transform = CGAffineTransformMakeRotation(-0.03 + 0.9 * pullRatio)
            bottomGear.transform = CGAffineTransformMakeRotation(0.025 - 0.9 * pullRatio)
            leftGear.transform = CGAffineTransformMakeRotation(0.025 + 0.9 * pullRatio)
        }
        
        // If we're refreshing and the animation is not playing, then play the animation
        if (refreshing && !isRefreshControlAnimating) {
            animateRefreshView()
        }
    }
    
    private func animateRefreshView() {
        isRefreshControlAnimating = true
        
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

private class ShadowView: UIView {
    var gradient: CAGradientLayer!
    var shadowPercentage = 0.0

    override func layoutSubviews() {
        clipsToBounds = true
        if (gradient == nil) {
            gradient = CAGradientLayer()
            var frame = self.frame
            let offset = frame.size.height * CGFloat(shadowPercentage)
            frame.size.height = offset
            gradient.frame = frame
            gradient.colors = [
                UIColor.blackColor().colorWithAlphaComponent(0.6).CGColor,
                UIColor.blackColor().colorWithAlphaComponent(0.15).CGColor,
                UIColor.clearColor().CGColor]
            self.layer.insertSublayer(self.gradient, atIndex:0)
        }
    }
}

private class BigGear: UIView {

    override func drawRect(rect: CGRect) {
        let color0 = self.tintColor

        let bigGear: CGRect = CGRectMake(rect.minX, rect.minY, rect.width - 0.03, rect.height)

        var rectangle14Path = UIBezierPath()
        rectangle14Path.moveToPoint(CGPointMake(bigGear.minX + 0.54057 * bigGear.width, bigGear.minY + 0.08763 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.52246 * bigGear.width, bigGear.minY + 0.00000 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.47754 * bigGear.width, bigGear.minY + 0.00000 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.45930 * bigGear.width, bigGear.minY + 0.08825 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.39658 * bigGear.width, bigGear.minY + 0.09964 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.43787 * bigGear.width, bigGear.minY + 0.09048 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.41692 * bigGear.width, bigGear.minY + 0.09431 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.34881 * bigGear.width, bigGear.minY + 0.02252 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.30660 * bigGear.width, bigGear.minY + 0.03778 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.32000 * bigGear.width, bigGear.minY + 0.12795 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.26573 * bigGear.width, bigGear.minY + 0.15957 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.30106 * bigGear.width, bigGear.minY + 0.13715 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.28293 * bigGear.width, bigGear.minY + 0.14774 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.19340 * bigGear.width, bigGear.minY + 0.10264 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.15899 * bigGear.width, bigGear.minY + 0.13132 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.20313 * bigGear.width, bigGear.minY + 0.21240 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.16334 * bigGear.width, bigGear.minY + 0.25988 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.18872 * bigGear.width, bigGear.minY + 0.22721 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.17541 * bigGear.width, bigGear.minY + 0.24308 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.07497 * bigGear.width, bigGear.minY + 0.23068 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.05251 * bigGear.width, bigGear.minY + 0.26932 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.12232 * bigGear.width, bigGear.minY + 0.33089 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.10132 * bigGear.width, bigGear.minY + 0.38861 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.11394 * bigGear.width, bigGear.minY + 0.34945 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.10690 * bigGear.width, bigGear.minY + 0.36873 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.00780 * bigGear.width, bigGear.minY + 0.39120 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.00000 * bigGear.width, bigGear.minY + 0.43515 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.08717 * bigGear.width, bigGear.minY + 0.46943 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.08605 * bigGear.width, bigGear.minY + 0.50000 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.08643 * bigGear.width, bigGear.minY + 0.47952 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.08605 * bigGear.width, bigGear.minY + 0.48972 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.08717 * bigGear.width, bigGear.minY + 0.53057 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.08605 * bigGear.width, bigGear.minY + 0.51028 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.08643 * bigGear.width, bigGear.minY + 0.52048 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.00000 * bigGear.width, bigGear.minY + 0.56485 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.00780 * bigGear.width, bigGear.minY + 0.60880 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.10132 * bigGear.width, bigGear.minY + 0.61139 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.12232 * bigGear.width, bigGear.minY + 0.66911 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.10690 * bigGear.width, bigGear.minY + 0.63127 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.11394 * bigGear.width, bigGear.minY + 0.65055 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.05251 * bigGear.width, bigGear.minY + 0.73068 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.07497 * bigGear.width, bigGear.minY + 0.76932 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.16334 * bigGear.width, bigGear.minY + 0.74012 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.20313 * bigGear.width, bigGear.minY + 0.78760 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.17541 * bigGear.width, bigGear.minY + 0.75692 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.18872 * bigGear.width, bigGear.minY + 0.77279 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.15899 * bigGear.width, bigGear.minY + 0.86868 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.19340 * bigGear.width, bigGear.minY + 0.89736 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.26573 * bigGear.width, bigGear.minY + 0.84043 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.32000 * bigGear.width, bigGear.minY + 0.87205 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.28293 * bigGear.width, bigGear.minY + 0.85226 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.30106 * bigGear.width, bigGear.minY + 0.86285 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.30660 * bigGear.width, bigGear.minY + 0.96222 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.34881 * bigGear.width, bigGear.minY + 0.97748 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.39658 * bigGear.width, bigGear.minY + 0.90036 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.45930 * bigGear.width, bigGear.minY + 0.91175 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.41692 * bigGear.width, bigGear.minY + 0.90569 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.43787 * bigGear.width, bigGear.minY + 0.90952 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.47754 * bigGear.width, bigGear.minY + 1.00000 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.52246 * bigGear.width, bigGear.minY + 1.00000 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.54057 * bigGear.width, bigGear.minY + 0.91237 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.60429 * bigGear.width, bigGear.minY + 0.90177 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.56234 * bigGear.width, bigGear.minY + 0.91046 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.58362 * bigGear.width, bigGear.minY + 0.90688 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.65119 * bigGear.width, bigGear.minY + 0.97748 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.69340 * bigGear.width, bigGear.minY + 0.96222 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.68042 * bigGear.width, bigGear.minY + 0.87491 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.73725 * bigGear.width, bigGear.minY + 0.84277 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.70027 * bigGear.width, bigGear.minY + 0.86565 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.71926 * bigGear.width, bigGear.minY + 0.85489 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.80660 * bigGear.width, bigGear.minY + 0.89736 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.84101 * bigGear.width, bigGear.minY + 0.86868 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.79916 * bigGear.width, bigGear.minY + 0.79179 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.84184 * bigGear.width, bigGear.minY + 0.74184 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.81466 * bigGear.width, bigGear.minY + 0.77630 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.82894 * bigGear.width, bigGear.minY + 0.75959 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.92503 * bigGear.width, bigGear.minY + 0.76932 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.94749 * bigGear.width, bigGear.minY + 0.73068 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.88225 * bigGear.width, bigGear.minY + 0.67314 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.90515 * bigGear.width, bigGear.minY + 0.61121 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.89147 * bigGear.width, bigGear.minY + 0.65330 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.89915 * bigGear.width, bigGear.minY + 0.63260 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.99220 * bigGear.width, bigGear.minY + 0.60880 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 1.00000 * bigGear.width, bigGear.minY + 0.56485 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.91906 * bigGear.width, bigGear.minY + 0.53302 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.92037 * bigGear.width, bigGear.minY + 0.50000 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.91993 * bigGear.width, bigGear.minY + 0.52213 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.92037 * bigGear.width, bigGear.minY + 0.51112 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.91906 * bigGear.width, bigGear.minY + 0.46698 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.92037 * bigGear.width, bigGear.minY + 0.48888 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.91993 * bigGear.width, bigGear.minY + 0.47787 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 1.00000 * bigGear.width, bigGear.minY + 0.43515 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.99220 * bigGear.width, bigGear.minY + 0.39120 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.90515 * bigGear.width, bigGear.minY + 0.38879 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.88225 * bigGear.width, bigGear.minY + 0.32686 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.89915 * bigGear.width, bigGear.minY + 0.36740 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.89147 * bigGear.width, bigGear.minY + 0.34670 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.94749 * bigGear.width, bigGear.minY + 0.26932 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.92503 * bigGear.width, bigGear.minY + 0.23068 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.84184 * bigGear.width, bigGear.minY + 0.25816 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.79916 * bigGear.width, bigGear.minY + 0.20821 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.82894 * bigGear.width, bigGear.minY + 0.24041 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.81466 * bigGear.width, bigGear.minY + 0.22370 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.84101 * bigGear.width, bigGear.minY + 0.13132 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.80660 * bigGear.width, bigGear.minY + 0.10264 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.73725 * bigGear.width, bigGear.minY + 0.15723 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.68042 * bigGear.width, bigGear.minY + 0.12509 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.71926 * bigGear.width, bigGear.minY + 0.14511 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.70027 * bigGear.width, bigGear.minY + 0.13435 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.69340 * bigGear.width, bigGear.minY + 0.03778 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.65119 * bigGear.width, bigGear.minY + 0.02252 * bigGear.height))
        rectangle14Path.addLineToPoint(CGPointMake(bigGear.minX + 0.60429 * bigGear.width, bigGear.minY + 0.09823 * bigGear.height))
        rectangle14Path.addCurveToPoint(CGPointMake(bigGear.minX + 0.54057 * bigGear.width, bigGear.minY + 0.08763 * bigGear.height), controlPoint1: CGPointMake(bigGear.minX + 0.58362 * bigGear.width, bigGear.minY + 0.09312 * bigGear.height), controlPoint2: CGPointMake(bigGear.minX + 0.56234 * bigGear.width, bigGear.minY + 0.08954 * bigGear.height))
        rectangle14Path.closePath()
        rectangle14Path.miterLimit = 4;

        rectangle14Path.usesEvenOddFillRule = true;

        color0.setFill()
        rectangle14Path.fill()
    }
}

private class MainGear : UIView {

    override func drawRect(rect: CGRect) {
        let color0 = self.tintColor

        let centerGear: CGRect = CGRectMake(rect.minX, rect.minY, rect.width + 0.42, rect.height)

        var rectangle1Path = UIBezierPath()
        rectangle1Path.moveToPoint(CGPointMake(centerGear.minX + 0.58954 * centerGear.width, centerGear.minY + 0.11232 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.56841 * centerGear.width, centerGear.minY + 0.00000 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.42589 * centerGear.width, centerGear.minY + 0.00000 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.40820 * centerGear.width, centerGear.minY + 0.11285 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.34380 * centerGear.width, centerGear.minY + 0.13390 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.38596 * centerGear.width, centerGear.minY + 0.11807 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.36444 * centerGear.width, centerGear.minY + 0.12514 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.26048 * centerGear.width, centerGear.minY + 0.05542 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.14518 * centerGear.width, centerGear.minY + 0.13891 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.19746 * centerGear.width, centerGear.minY + 0.24065 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.15778 * centerGear.width, centerGear.minY + 0.29533 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.18275 * centerGear.width, centerGear.minY + 0.25768 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.16946 * centerGear.width, centerGear.minY + 0.27597 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.04404 * centerGear.width, centerGear.minY + 0.28065 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.00000 * centerGear.width, centerGear.minY + 0.41574 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.10228 * centerGear.width, centerGear.minY + 0.46741 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.10096 * centerGear.width, centerGear.minY + 0.50000 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.10140 * centerGear.width, centerGear.minY + 0.47816 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.10096 * centerGear.width, centerGear.minY + 0.48903 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.10247 * centerGear.width, centerGear.minY + 0.53489 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.10096 * centerGear.width, centerGear.minY + 0.51176 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.10147 * centerGear.width, centerGear.minY + 0.52339 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.00176 * centerGear.width, centerGear.minY + 0.58966 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.04580 * centerGear.width, centerGear.minY + 0.72476 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.15898 * centerGear.width, centerGear.minY + 0.70665 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.19898 * centerGear.width, centerGear.minY + 0.76110 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.17077 * centerGear.width, centerGear.minY + 0.72594 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.18417 * centerGear.width, centerGear.minY + 0.74415 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.14979 * centerGear.width, centerGear.minY + 0.86443 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.26509 * centerGear.width, centerGear.minY + 0.94792 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.34594 * centerGear.width, centerGear.minY + 0.86700 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.41046 * centerGear.width, centerGear.minY + 0.88768 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.36662 * centerGear.width, centerGear.minY + 0.87564 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.38819 * centerGear.width, centerGear.minY + 0.88259 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.43159 * centerGear.width, centerGear.minY + 1.00000 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.57411 * centerGear.width, centerGear.minY + 1.00000 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.59180 * centerGear.width, centerGear.minY + 0.88715 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.65620 * centerGear.width, centerGear.minY + 0.86610 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.61404 * centerGear.width, centerGear.minY + 0.88193 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.63556 * centerGear.width, centerGear.minY + 0.87486 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.73952 * centerGear.width, centerGear.minY + 0.94458 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.85482 * centerGear.width, centerGear.minY + 0.86109 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.80254 * centerGear.width, centerGear.minY + 0.75935 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.84222 * centerGear.width, centerGear.minY + 0.70467 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.81725 * centerGear.width, centerGear.minY + 0.74232 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.83054 * centerGear.width, centerGear.minY + 0.72403 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.95596 * centerGear.width, centerGear.minY + 0.71935 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 1.00000 * centerGear.width, centerGear.minY + 0.58426 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.89772 * centerGear.width, centerGear.minY + 0.53259 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.89904 * centerGear.width, centerGear.minY + 0.50000 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.89860 * centerGear.width, centerGear.minY + 0.52184 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.89904 * centerGear.width, centerGear.minY + 0.51097 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.89753 * centerGear.width, centerGear.minY + 0.46511 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.89904 * centerGear.width, centerGear.minY + 0.48824 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.89853 * centerGear.width, centerGear.minY + 0.47661 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.99824 * centerGear.width, centerGear.minY + 0.41034 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.95420 * centerGear.width, centerGear.minY + 0.27524 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.84102 * centerGear.width, centerGear.minY + 0.29335 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.80102 * centerGear.width, centerGear.minY + 0.23890 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.82923 * centerGear.width, centerGear.minY + 0.27406 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.81583 * centerGear.width, centerGear.minY + 0.25585 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.85021 * centerGear.width, centerGear.minY + 0.13557 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.73491 * centerGear.width, centerGear.minY + 0.05208 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.65406 * centerGear.width, centerGear.minY + 0.13300 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.58954 * centerGear.width, centerGear.minY + 0.11232 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.63338 * centerGear.width, centerGear.minY + 0.12436 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.61181 * centerGear.width, centerGear.minY + 0.11741 * centerGear.height))
        rectangle1Path.addLineToPoint(CGPointMake(centerGear.minX + 0.58954 * centerGear.width, centerGear.minY + 0.11232 * centerGear.height))
        rectangle1Path.closePath()
        rectangle1Path.moveToPoint(CGPointMake(centerGear.minX + 0.50165 * centerGear.width, centerGear.minY + 0.63636 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.63847 * centerGear.width, centerGear.minY + 0.50000 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.57721 * centerGear.width, centerGear.minY + 0.63636 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.63847 * centerGear.width, centerGear.minY + 0.57531 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.50165 * centerGear.width, centerGear.minY + 0.36364 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.63847 * centerGear.width, centerGear.minY + 0.42469 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.57721 * centerGear.width, centerGear.minY + 0.36364 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.36484 * centerGear.width, centerGear.minY + 0.50000 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.42609 * centerGear.width, centerGear.minY + 0.36364 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.36484 * centerGear.width, centerGear.minY + 0.42469 * centerGear.height))
        rectangle1Path.addCurveToPoint(CGPointMake(centerGear.minX + 0.50165 * centerGear.width, centerGear.minY + 0.63636 * centerGear.height), controlPoint1: CGPointMake(centerGear.minX + 0.36484 * centerGear.width, centerGear.minY + 0.57531 * centerGear.height), controlPoint2: CGPointMake(centerGear.minX + 0.42609 * centerGear.width, centerGear.minY + 0.63636 * centerGear.height))
        rectangle1Path.closePath()
        rectangle1Path.miterLimit = 4;

        rectangle1Path.usesEvenOddFillRule = true;

        color0.setFill()
        rectangle1Path.fill()
    }
}
