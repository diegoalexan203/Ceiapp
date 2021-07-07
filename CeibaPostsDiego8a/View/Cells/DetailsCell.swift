//
//  DetailsCell.swift
//  CeibaPostsDiego8a
//
//  Created by Diego on 7/07/21.
//

import Foundation
import UIKit

class DetailsCell: UITableViewCell {
    
    @IBOutlet var tittleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    func setCell(post: Post) {
        bodyLabel.text = post.body
        tittleLabel.text = post.title
    }
}
