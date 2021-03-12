//
//  HeroCollectionViewCell.swift
//  HeroesDota2
//
//  Created by Thipawan Penmoon on 11/3/2564 BE.
//

import UIKit

class HeroCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.cornerRadius = 6
    }

}

