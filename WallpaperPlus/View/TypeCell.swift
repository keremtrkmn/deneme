//
//  TypeCell.swift
//  WallpaperPlus
//
//  Created by Appendix on 26.04.2020.
//  Copyright © 2020 Appendix. All rights reserved.
//

import UIKit

class TypeCell: UITableViewCell {

    @IBOutlet weak var typeCellView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state

    }
    
}
