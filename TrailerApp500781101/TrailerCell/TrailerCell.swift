//
//  TrailerCell.swift
//  TrailerApp500781101
//
//  Created by Jamal Aartsen on 4/22/19.
//  Copyright © 2019 HvA. All rights reserved.
//

import Foundation
import UIKit

class TrailerCell: UITableViewCell{
    
    @IBOutlet weak var imageTrailer: UIImageView!
    @IBOutlet weak var titleTrailer: UILabel!
    @IBOutlet weak var DescriptionTrailer: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
