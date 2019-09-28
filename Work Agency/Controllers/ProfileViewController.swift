//
//  ProfileViewController.swift
//  Work Agency
//
//  Created by Ivan Ermak on 9/28/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var studentUser: Student?
    let customView = UIStudentProfile()
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        // Do any additional setup after loading the view.
    }
    func fillData() {
        if studentUser != nil {
        customView.isUserInteractionEnabled = false
        self.view.addSubview(customView)
        self.view.isUserInteractionEnabled = false
        }
        else {
            //customView.isUserInteractionEnabled = true
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
