//
//  ColumsCarCell.swift
//  HomeScreen
//
//  Created by EltonR on 27.9.22.
//

import UIKit

class ColumsCarCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var horsepowerLabel: UILabel!
    @IBOutlet weak var accelerationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
