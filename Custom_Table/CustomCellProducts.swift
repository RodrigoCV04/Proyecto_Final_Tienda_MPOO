//
//  CustomCellProducts.swift
//  Custom_Table
//
//  Created by Usuario on 13/11/23.
//  Copyright © 2023 Satyendra  Singh. All rights reserved.
//

import UIKit

class CustomCellProducts: UITableViewCell {

    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
