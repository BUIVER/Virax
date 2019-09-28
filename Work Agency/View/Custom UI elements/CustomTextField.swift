//
//  CustomTextField.swift
//  Work Agency
//
//  Created by Ivan Ermak on 9/28/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    var cornerRadius: CGFloat = 6.0
    var borderWidth: CGFloat = 2.0
    var borderColor = UIColor.systemYellow.cgColor

    override init(frame: CGRect){
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    }}
