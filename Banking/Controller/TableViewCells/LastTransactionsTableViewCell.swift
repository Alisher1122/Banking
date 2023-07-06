//
//  LastTransactionsTableViewCell.swift
//  Banking
//
//  Created by Alisher on 23/06/23.
//

import UIKit

class LastTransactionsTableViewCell: UITableViewCell {

    
    static let id: String = "LastTransactionsTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "LastTransactionsTableViewCell", bundle: nil)
    }
    
    
    @IBOutlet weak var containerView: UIView!{
        didSet{
            containerView.dropShadow()
        }
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var dataLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()


    }

  
    func updateCell(transAction: TransactionDM) {
        self.name.text = transAction.name
        self.dataLbl.text = transAction.data
        self.costLbl.text = transAction.cost
    }
    
    
}
