//
//  VerticalTableViewCell.swift
//  Banking
//
//  Created by Alisher on 02/07/23.
//

import UIKit

class VerticalTableViewCell: UITableViewCell {

    static let id = "VerticalTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "VerticalTableViewCell", bundle: nil)
    }
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var bankNameLbl: UILabel!
    @IBOutlet weak var nameFirstCharactersLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func updateCell(transfer: TransferDM) {
        let name = transfer.name
        nameLbl.text = name
        bankNameLbl.text = transfer.bankName
    }
}
