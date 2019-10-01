//
//  SearchTableViewCell.swift
//  Work Agency
//
//  Created by Ivan Ermak on 9/29/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class SearchStudentTableViewCell: UITableViewCell {
    @IBOutlet var vacancyName: UILabel!
    @IBOutlet var companyName: UILabel!
    @IBOutlet var updateTime: UILabel!
    var id = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
