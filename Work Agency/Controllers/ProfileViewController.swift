//
//  ProfileViewController.swift
//  Work Agency
//
//  Created by Ivan Ermak on 9/28/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit
import Nuke
import TagListView
class ProfileViewController: UIViewController {
    
    @IBOutlet var studentProfileImage: UIImageView!
    @IBOutlet var firstNameLabel: UITextField!
    @IBOutlet var lastNameLabel: UITextField!
    @IBOutlet var ageLabel: UITextField!
    @IBOutlet var locationLabel: UITextField!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var personalInfoTextView: UITextView!
    @IBOutlet var skillsView: TagListView!
    
    
    @IBOutlet var companyProfileImage: UIImageView!
    @IBOutlet var companyNameLabel: UITextField!
    @IBOutlet var companyLocationLabel: UITextField!
    @IBOutlet var companyInfoTextView: UITextView!
    
    
    var studentUser: Student?
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    func fillData() {
        guard let url = URL(string: studentUser?.photoURL ?? "https://i07.fotocdn.net/s123/2950fc2e1fadccab/user_xl/2816616767.jpg") else {return}
        loadImage(with: url, into: studentProfileImage)
        firstNameLabel.text = studentUser?.firstName
        lastNameLabel.text = studentUser?.lastName
        studentUser?.birthday.removeLast(14)
        ageLabel.text = studentUser?.birthday
        locationLabel.text = studentUser?.livingInfo
        ratingLabel.text = studentUser?.rating.description
        personalInfoTextView.text = studentUser?.personalDetails
        studentUser?.skills.forEach({ skill in
            guard let tagName = skill.value(forKey: "name") as? String else {return}
            skillsView.addTag(tagName)
        })
        self.view.isUserInteractionEnabled = false
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
