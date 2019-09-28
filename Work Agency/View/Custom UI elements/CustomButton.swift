//
//  CustomButton.swift
//  Work Agency
//
//  Created by Ivan Ermak on 9/28/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    var cornerRadius: CGFloat = 6.0
        var borderWidth: CGFloat = 2.0
        var borderColor = UIColor.systemYellow.cgColor

        @IBInspectable var titleText: String? {
            didSet {
                self.setTitle(titleText, for: .normal)
                self.setTitleColor(UIColor.systemBlue, for: .normal)
            }
        }

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
            self.backgroundColor = UIColor(white: 23.0, alpha: 1.0)
            self.clipsToBounds = true
            self.layer.cornerRadius = cornerRadius
            self.layer.borderColor = borderColor
            self.layer.borderWidth = borderWidth
        }
}
