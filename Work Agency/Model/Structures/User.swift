//
//  User.swift
//  Work Agency
//
//  Created by Ivan Ermak on 9/24/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import Foundation

struct User: Codable {
    var email: String?
    var password: String?
    var roleId: Int?
}
