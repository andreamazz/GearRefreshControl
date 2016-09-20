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
open class GearRefreshControl: UIRefreshControl {

    /**
    Tells if the control is currently animating
    */
    open fileprivate(set) var isRefreshControlAnimating = false

    /**
    Tint color for the control. Set the color of the main gear, the other ones are computed automatically
    */
    dynamic open var gearTintColor: UIColor? {
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

    fileprivate var refreshContainerView: UIView!
    fileprivate var overlayView: UIView!
    fileprivate var shadowView: ShadowView = {
        let view = ShadowView()
        view.shadowPercentage = 0.2
        return view
        }()
    fileprivate var centerGear: MainGear = {
        let view = MainGear()
        view.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
        view.backgroundColor = .clear
        return view
        }()
    fileprivate var topGear: BigGear = { // cue Jessica from the Allman brothers
        let view = BigGear()
        view.frame = CGRect(x: 0, y: 0, width: 92, height: 92)
        view.backgroundColor = .clear
        return view
        }()
    fileprivate var rightGear: BigGear = {
        let view = BigGear()
        view.frame = CGRect(x: 0, y: 0, width: 92, height: 92)
        view.backgroundColor = .clear
        return view
        }()
    fileprivate var bottomGear: BigGear = {
        let view = BigGear()
        view.frame = CGRect(x: 0, y: 0, width: 88, height: 88)
        view.backgroundColor = .clear
        return view
        }()
    fileprivate var leftGear: BigGear = {
        let view = BigGear()
        view.frame = CGRect(x: 0, y: 0, width: 92, height: 92)
        view.backgroundColor = .clear
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
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var refreshBounds = self.bounds;

        // Distance the table has been pulled
        let pullDistance = max(0.0, -self.frame.origin.y);
        let pullRatio = min(max(pullDistance, 0.0), 140.0) / 140.0;

        overlayView.alpha = 1 - pullRatio
        shadowView.frame = self.bounds

        centerGear.center = CGPoint(x: self.refreshContainerView.frame.midX, y: pullDistance / 2)
        topGear.center = CGPoint(x: self.refreshContainerView.frame.midX + 48, y: pullDistance / 2 - 49)
        rightGear.center = CGPoint(x: self.refreshContainerView.frame.midX + 120, y: pullDistance / 2)
        bottomGear.center = CGPoint(x: self.refreshContainerView.frame.midX - 47, y: pullDistance / 2 + 46)
        leftGear.center = CGPoint(x: self.refreshContainerView.frame.midX - 105, y: pullDistance / 2 - 17)

        refreshBounds.size.height = pullDistance;

        _ = [self.refreshContainerView, self.overlayView].map({$0.frame = refreshBounds});

        // Don't rotate the gears if the refresh animation is playing
        if (!isRefreshing && !isRefreshControlAnimating) {
            centerGear.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2) * pullRatio)
            topGear.transform = CGAffineTransform(rotationAngle: 0.025 - 0.9 * pullRatio)
            rightGear.transform = CGAffineTransform(rotationAngle: -0.03 + 0.9 * pullRatio)
            bottomGear.transform = CGAffineTransform(rotationAngle: 0.025 - 0.9 * pullRatio)
            leftGear.transform = CGAffineTransform(rotationAngle: 0.025 + 0.9 * pullRatio)
        }

        // If we're refreshing and the animation is not playing, then play the animation
        if (isRefreshing && !isRefreshControlAnimating) {
            animateRefreshView()
        }
    }

}

private extension GearRefreshControl {
    func setupRefreshControl() {

        refreshContainerView = UIView(frame: self.bounds)

        overlayView = UIView(frame: self.bounds)
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.3)

        shadowView.frame = self.bounds

        gearTintColor = UIColor(red:0.36, green:0.52, blue:0.92, alpha:1)

        centerGear.center = CGPoint(x: self.refreshContainerView.frame.midX, y: self.refreshContainerView.frame.midY)
        topGear.center = CGPoint(x: self.refreshContainerView.frame.midX + 48, y: self.refreshContainerView.frame.midY - 49)
        rightGear.center = CGPoint(x: self.refreshContainerView.frame.midX + 120, y: self.refreshContainerView.frame.midY)
        bottomGear.center = CGPoint(x: self.refreshContainerView.frame.midX - 48, y: self.refreshContainerView.frame.midY + 42)
        leftGear.center = CGPoint(x: self.refreshContainerView.frame.midX - 110, y: self.refreshContainerView.frame.midY - 18)

        _ = [topGear, rightGear, bottomGear, leftGear, centerGear, shadowView, overlayView].map { self.refreshContainerView.addSubview($0) }

        refreshContainerView.clipsToBounds = true
        tintColor = UIColor.clear

        addSubview(self.refreshContainerView)
    }

    func animateRefreshView() {
        isRefreshControlAnimating = true

        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.centerGear.transform = self.centerGear.transform.rotated(by: CGFloat(M_PI_2))
            self.topGear.transform = self.topGear.transform.rotated(by: -CGFloat(M_PI_2))
            self.rightGear.transform = self.rightGear.transform.rotated(by: CGFloat(M_PI_2))
            self.bottomGear.transform = self.bottomGear.transform.rotated(by: -CGFloat(M_PI_2))
            self.leftGear.transform = self.leftGear.transform.rotated(by: CGFloat(M_PI_2))
            }, completion: { finished in
                // If still refreshing, keep spinning
                if (self.isRefreshing) {
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
                UIColor.black.withAlphaComponent(0.6).cgColor,
                UIColor.black.withAlphaComponent(0.15).cgColor,
                UIColor.clear.cgColor]
            self.layer.insertSublayer(self.gradient, at:0)
        } else {
            gradient.frame = frame
        }
    }
}

private extension UIColor {
    func darkerColor(_ delta: CGFloat) -> UIColor {
        var h = CGFloat(0)
        var s = CGFloat(0)
        var b = CGFloat(0)
        var a = CGFloat(0)
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s, brightness: b * delta, alpha: a)
    }
}
