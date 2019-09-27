//
//  ViewController.swift
//  Work Agency
//
//  Created by Ivan Ermak on 9/24/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var usernameInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameInput.borderStyle = .roundedRect
        usernameInput.layer.borderColor = UIColor.systemRed.cgColor
        usernameInput.layer.cornerRadius = 8
        usernameInput.layer.borderWidth = 1.2
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

}

