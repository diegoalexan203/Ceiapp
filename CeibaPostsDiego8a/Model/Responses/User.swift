//
//  User.swift
//  CeibaPostsDiego8a
//
//  Created by Diego on 6/07/21.
//

import Foundation
class User: Codable, Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.username == rhs.username && lhs.email == rhs.email && lhs.phone == rhs.phone && lhs.website == rhs.website
    }
    
    var id: Int?
    var name, username, email: String?
    var phone, website: String?
    
    init() {
    }
    
    init(id: Int?, name: String?, username: String?, email: String?,phone: String?, website: String?) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.phone = phone
        self.website = website
    }
}
