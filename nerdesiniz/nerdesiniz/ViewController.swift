//
//  ViewController.swift
//  nerdesiniz
//
//  Created by Ozan Yaldır on 17.07.2018.
//  Copyright © 2018 ozanyaldir. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var roomNumberTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet var colorButtons: [UIButton]!{
        didSet{
            for button in colorButtons{
                button.layer.cornerRadius = button.frame.height / 2
            }
        }
    }
    var ref: DatabaseReference!
    var childRef: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        childRef = Database.database().reference(withPath: "rooms/1234")
        
        childRef.observe(.value) { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            //            let username = value?["username"] as? String ?? ""
            //            let user = User(username: username)
            print("observe value \(value)")
        }
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
    
    @IBAction func didSelectColor(_ sender: UIButton) {
        let buttonColor = sender.backgroundColor
        self.view.backgroundColor = buttonColor
        self.loginButton.backgroundColor = buttonColor
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showMapView", sender: nil)
        childRef.setValue([self.randomString(length: 24): ["name":"\(self.nameTextField.text ?? "")", "color": "green", "location": ["lat": 36, "lng": 42]]] ) { (error, ref) in
            print("write error \(error?.localizedDescription)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMapView", let destination = segue.destination as? MapViewController{
            destination.currentColor = self.view.backgroundColor ?? .white
            destination.name = self.nameTextField.text ?? ""
            destination.roomNumber = self.roomNumberTextField.text ?? ""
        }
    }
    
    func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
}

