//
//  TransferAppsCell.swift
//  Banking
//
//  Created by Alisher on 02/07/23.
//

import UIKit

class TransferAppsCell: UICollectionViewCell {

    static let id = "TransferAppsCell"
    static func nib() -> UINib {
        return UINib(nibName: "TransferAppsCell", bundle: nil)
    }
    
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.dropShadow()
    }
}
