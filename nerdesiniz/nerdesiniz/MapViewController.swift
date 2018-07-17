//
//  MapViewController.swift
//  nerdesiniz
//
//  Created by Ozan Yaldır on 17.07.2018.
//  Copyright © 2018 ozanyaldir. All rights reserved.
//

import UIKit
import CoreLocation

class MapViewController: UIViewController {
    
    var currentColor: UIColor!
    var name: String!
    var roomNumber: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Nerdesiniz"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.navigationController?.isNavigationBarHidden != false{
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
        self.navigationController?.navigationBar.barTintColor = self.currentColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
