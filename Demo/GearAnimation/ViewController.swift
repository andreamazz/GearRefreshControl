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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        gearRefreshControl = GearRefreshControl(frame: self.view.bounds)
//        gearRefreshControl.gearTintColor = UIColor(red:0.48, green:0.84, blue:0, alpha:1)

        gearRefreshControl.addTarget(self, action: #selector(ViewController.refresh), for: UIControlEvents.valueChanged)
        self.refreshControl = gearRefreshControl
    }

    func refresh(){
        let popTime = DispatchTime.now() + Double(Int64(3.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC);
        DispatchQueue.main.asyncAfter(deadline: popTime) { () -> Void in
            self.gearRefreshControl.endRefreshing()
        }
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        gearRefreshControl.scrollViewDidScroll(scrollView)
    }
}

