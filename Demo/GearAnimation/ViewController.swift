//
//  ViewController.swift
//  GearAnimation
//
//  Created by Andrea Mazzini on 18/03/15.
//  Copyright (c) 2015 Fancy Pixel. All rights reserved.
//

import UIKit
import GearRefreshControl

class ViewController: UITableViewController {

    var gearRefreshControl: GearRefreshControl!

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier("Cell")! as! UITableViewCell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        gearRefreshControl = GearRefreshControl(frame: self.view.bounds)
        gearRefreshControl.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = gearRefreshControl
    }

    func refresh(){
        var popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(3.0 * Double(NSEC_PER_SEC)));
        dispatch_after(popTime, dispatch_get_main_queue()) { () -> Void in
            self.gearRefreshControl.endRefreshing()
        }
    }

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        gearRefreshControl.scrollViewDidScroll(scrollView)
    }
}

