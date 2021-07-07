//
//  UserCell.swift
//  CeibaPostsDiego8a
//
//  Created by Diego on 6/07/21.
//

import Foundation
import UIKit

class UserCell: UITableViewCell {
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userPhoneLabel: UILabel!
    @IBOutlet var userEmailLabel: UILabel!

    func setCell(user: User) {
        userNameLabel.text = user.name
        userPhoneLabel.text = user.phone
        userEmailLabel.text = user.email
    }
}
