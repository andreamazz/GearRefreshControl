//
//  GearRefreshControl.swift
//  GearRefreshControl
//
//  Created by Andrea Mazzini on 04/04/15.
//  Copyright (c) 2015 Fancy Pixel. All rights reserved.
//

import UIKit

/**
Defines a custom `UIRefreshControl` with spinning gears.
*/
public class GearRefreshControl: UIRefreshControl {

    /**
    Tells if the control is currently animating
    */
    public private(set) var isRefreshControlAnimating = false

    /**
    Tint color for the control. Set the color of the main gear, the other ones are computed automatically
    */
    dynamic public var gearTintColor: UIColor? {
        get { return self.centerGear.tintColor }
        set {
            centerGear.tintColor = newValue
            topGear.tintColor = newValue?.darkerColor(0.85)
            rightGear.tintColor = newValue?.darkerColor(0.75)
            bottomGear.tintColor = newValue?.darkerColor(0.85)
            leftGear.tintColor = newValue?.darkerColor(0.75)
            refreshContainerView.backgroundColor = newValue?.darkerColor(0.5)
        }
    }

    private var refreshContainerView: UIView!
    private var overlayView: UIView!
    private var shadowView: ShadowView = {
        let view = ShadowView()
        view.shadowPercentage = 0.2
        return view
        }()
    private var centerGear: MainGear = {
        let view = MainGear()
        view.frame = CGRectMake(0, 0, 48, 48)
        view.backgroundColor = .clearColor()
        return view
        }()
    private var topGear: BigGear = { // cue Jessica from the Allman brothers
        let view = BigGear()
        view.frame = CGRectMake(0, 0, 92, 92)
        view.backgroundColor = .clearColor()
        return view
        }()
    private var rightGear: BigGear = {
        let view = BigGear()
        view.frame = CGRectMake(0, 0, 92, 92)
        view.backgroundColor = .clearColor()
        return view
        }()
    private var bottomGear: BigGear = {
        let view = BigGear()
        view.frame = CGRectMake(0, 0, 88, 88)
        view.backgroundColor = .clearColor()
        return view
        }()
    private var leftGear: BigGear = {
        let view = BigGear()
        view.frame = CGRectMake(0, 0, 92, 92)
        view.backgroundColor = .clearColor()
        return view
        }()

    /**
    Use init(frame:) instead
    */
    required override public init() {
        fatalError("use init(frame:) instead")
    }

    /**
    Use init(frame:) instead
    */
    required public init(coder aDecoder: NSCoder) {
        fatalError("use init(frame:) instead")
    }

    /**
    Initialize the gear refresh control
    */
    required override public init(frame: CGRect) {
        super.init()
        bounds.size.width = frame.size.width
        setupRefreshControl()
    }

    /**
    Scroll update

    Updates the scroll status of the gears.

    - Parameter scrollView: The scrollview being observed
    */
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        var refreshBounds = self.bounds;

        // Distance the table has been pulled
        let pullDistance = max(0.0, -self.frame.origin.y);
        let pullRatio = min(max(pullDistance, 0.0), 140.0) / 140.0;

        overlayView.alpha = 1 - pullRatio
        shadowView.frame = self.bounds

        centerGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame), y: pullDistance / 2)
        topGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) + 48, y: pullDistance / 2 - 49)
        rightGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) + 120, y: pullDistance / 2)
        bottomGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) - 47, y: pullDistance / 2 + 46)
        leftGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) - 105, y: pullDistance / 2 - 17)

        refreshBounds.size.height = pullDistance;

        _ = [self.refreshContainerView, self.overlayView].map({$0.frame = refreshBounds});

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

}

private extension GearRefreshControl {
    func setupRefreshControl() {

        refreshContainerView = UIView(frame: self.bounds)

        overlayView = UIView(frame: self.bounds)
        overlayView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)

        shadowView.frame = self.bounds

        gearTintColor = UIColor(red:0.36, green:0.52, blue:0.92, alpha:1)

        centerGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame), y: CGRectGetMidY(self.refreshContainerView.frame))
        topGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) + 48, y: CGRectGetMidY(self.refreshContainerView.frame) - 49)
        rightGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) + 120, y: CGRectGetMidY(self.refreshContainerView.frame))
        bottomGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) - 48, y: CGRectGetMidY(self.refreshContainerView.frame) + 42)
        leftGear.center = CGPoint(x: CGRectGetMidX(self.refreshContainerView.frame) - 110, y: CGRectGetMidY(self.refreshContainerView.frame) - 18)

        _ = [topGear, rightGear, bottomGear, leftGear, centerGear, shadowView, overlayView].map { self.refreshContainerView.addSubview($0) }

        refreshContainerView.clipsToBounds = true
        tintColor = UIColor.clearColor()

        addSubview(self.refreshContainerView)
    }

    func animateRefreshView() {
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
        var frame = self.frame
        let offset = frame.size.height * CGFloat(shadowPercentage)
        frame.size.height = offset
        if (gradient == nil) {
            gradient = CAGradientLayer()
            gradient.frame = frame
            gradient.colors = [
                UIColor.blackColor().colorWithAlphaComponent(0.6).CGColor,
                UIColor.blackColor().colorWithAlphaComponent(0.15).CGColor,
                UIColor.clearColor().CGColor]
            self.layer.insertSublayer(self.gradient, atIndex:0)
        } else {
            gradient.frame = frame
        }
    }
}

private extension UIColor {
    func darkerColor(delta: CGFloat) -> UIColor {
        var h = CGFloat(0)
        var s = CGFloat(0)
        var b = CGFloat(0)
        var a = CGFloat(0)
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s, brightness: b * delta, alpha: a)
    }
}
