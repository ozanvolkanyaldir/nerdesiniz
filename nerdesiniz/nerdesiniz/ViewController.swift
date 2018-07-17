//
//  ViewController.swift
//  nerdesiniz
//
//  Created by Ozan Yaldır on 17.07.2018.
//  Copyright © 2018 ozanyaldir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var roomNumberTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBAction func didSelectColor(_ sender: UIButton) {
        let buttonColor = sender.backgroundColor
        self.view.backgroundColor = buttonColor
        self.loginButton.backgroundColor = buttonColor
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showMapView", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.navigationController?.isNavigationBarHidden != true{
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMapView", let destination = segue.destination as? MapViewController{
            destination.currentColor = self.view.backgroundColor ?? .white
            destination.name = self.nameTextField.text ?? ""
            destination.roomNumber = self.roomNumberTextField.text ?? ""
        }
    }


}

