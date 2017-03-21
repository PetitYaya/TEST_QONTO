//
//  UserCell.swift
//  QontoTest
//
//  Created by Yacine on 21/03/2017.
//  Copyright © 2017 Yacine YAZMAN. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    static let identifier = "UserCell"
    
    @IBOutlet fileprivate weak var labelName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Public methods
    func configure(with name: String) {
        labelName.text = name
    }
}
