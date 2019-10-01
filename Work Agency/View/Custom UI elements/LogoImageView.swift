//
//  LogoImageView.swift
//  Work Agency
//
//  Created by Ivan Ermak on 9/29/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class LogoImageView: UIImageView {
    var url: URL?
    override func awakeFromNib() {
        super.awakeFromNib()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(performSocial))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(gesture)
    }
    @objc func performSocial() {
        guard let guardUrl = url else {
            return
        }
        UIApplication.shared.open(guardUrl, options: [UIApplication.OpenExternalURLOptionsKey.universalLinksOnly : (Any).self], completionHandler: nil)
        
    }
}
