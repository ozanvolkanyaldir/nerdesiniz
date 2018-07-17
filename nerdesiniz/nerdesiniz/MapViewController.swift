//
//  MapViewController.swift
//  nerdesiniz
//
//  Created by Ozan Yaldır on 17.07.2018.
//  Copyright © 2018 ozanyaldir. All rights reserved.
//

import UIKit

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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
