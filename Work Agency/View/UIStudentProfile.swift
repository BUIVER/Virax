//
//  ViewController.swift
//  Work Agency
//
//  Created by Ivan Ermak on 9/28/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit
import TagListView
class UIStudentProfile: UIView {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var firstNameLabel: UITextField!
    @IBOutlet var lastNameLabel: UITextField!
    @IBOutlet var ageLabel: UITextField!
    @IBOutlet var locationLabel: UITextField!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var personalInfoTextView: UITextView!
    @IBOutlet var skillsView: TagListView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
