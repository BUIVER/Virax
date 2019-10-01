//
//  SearchResultViewController.swift
//  Work Agency
//
//  Created by Ivan Ermak on 9/29/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit
import TagListView

class SearchResultViewController: UIViewController {
    @IBOutlet weak var vacancyNameLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var tagsView: TagListView!
    @IBOutlet weak var updateTime: UILabel!
    var data: Vacancy?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
        // Do any additional setup after loading the view.
    }
    
    func loadViews() {
        vacancyNameLabel.text = data?.name
        companyNameLabel.text = data?.company.name
        statusLabel.text = data?.status
        descriptionTextView.text = data?.description
        data?.skills.forEach({ skill in
            tagsView.addTag(skill.value(forKey: "name") as! String)
        })
        updateTime.text = data?.updatedAt
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
