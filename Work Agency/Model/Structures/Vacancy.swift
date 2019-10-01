//
//  Vacancy.swift
//  Work Agency
//
//  Created by Ivan Ermak on 9/29/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import Foundation

struct Vacancy {
    var name: String
    var description: String
    var skills: [NSDictionary]
    var status: String
    var company: Company
    var updatedAt: String
}
