//
//  ViewController.swift
//  GearAnimation
//
//  Created by Andrea Mazzini on 18/03/15.
//  Copyright (c) 2015 Fancy Pixel. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var refreshContainerView: UIView!
    var overlayView: UIView!
    var isRefreshControlAnimating = false
    var shadowView: ShadowView!
    var centerGear: MainGear!
    var topGear: BigGear! // cue Jessica from the Allman brothers
    var rightGear: BigGear!
    var bottomGear: BigGear!
    var leftGear: BigGear!

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupRefreshControl()
    }

    func setupRefreshControl() {

        self.refreshControl = UIRefreshControl()

        self.refreshContainerView = UIView(frame: self.refreshControl!.bounds)
        self.refreshContainerView.backgroundColor = UIColor(red:0.13, green:0.29, blue:0.55, alpha:1)

        self.overlayView = UIView(frame: self.refreshControl!.bounds)
        self.overlayView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)

        self.shadowView = ShadowView(frame: self.refreshControl!.bounds)
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
        self.refreshControl!.tintColor = UIColor.clearColor()

        self.refreshControl!.addSubview(self.refreshContainerView)
        self.refreshControl?.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
    }

    func refresh(){
        var popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(3.0 * Double(NSEC_PER_SEC)));
        dispatch_after(popTime, dispatch_get_main_queue()) { () -> Void in
            self.refreshControl!.endRefreshing()
        }
    }

    override func scrollViewDidScroll(scrollView: UIScrollView) {

        var refreshBounds = self.refreshControl!.bounds;

        // Distance the table has been pulled
        var pullDistance = max(0.0, -self.refreshControl!.frame.origin.y);
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
        if (!self.refreshControl!.refreshing && !self.isRefreshControlAnimating) {
            self.centerGear.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2) * pullRatio)
            self.topGear.transform = CGAffineTransformMakeRotation(0.025 - 0.9 * pullRatio)
            self.rightGear.transform = CGAffineTransformMakeRotation(-0.03 + 0.9 * pullRatio)
            self.bottomGear.transform = CGAffineTransformMakeRotation(0.025 - 0.9 * pullRatio)
            self.leftGear.transform = CGAffineTransformMakeRotation(0.025 + 0.9 * pullRatio)
        }

        // If we're refreshing and the animation is not playing, then play the animation
        if (self.refreshControl!.refreshing && !self.isRefreshControlAnimating) {
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
                if (self.refreshControl!.refreshing) {
                    self.animateRefreshView()
                } else {
                    self.isRefreshControlAnimating = false
                }
            }
        )
    }
    
}

