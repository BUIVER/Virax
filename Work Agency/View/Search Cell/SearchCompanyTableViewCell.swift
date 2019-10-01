//
//  SearchCompanyTableViewCell.swift
//  Work Agency
//
//  Created by Ivan Ermak on 9/29/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit
import TagListView

class SearchCompanyTableViewCell: UITableViewCell {

    @IBOutlet weak var studentSkillsLabel: TagListView!
    @IBOutlet weak var studentRatingLabel: UILabel!
    @IBOutlet weak var studentNameLabel: UILabel!
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
