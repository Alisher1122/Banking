//
//  ReportsTableViewCell.swift
//  Banking
//
//  Created by Alisher on 04/07/23.
//

import UIKit

class ReportsTableViewCell: UITableViewCell {

    static let id = "ReportsTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ReportsTableViewCell", bundle: nil)
    }
    
    
    @IBOutlet weak var budgetLbl: UILabel!
    @IBOutlet weak var whereIsLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()


    }

    func updateCell(budget: BudgetDM) {
        
        if budget.outOrIn == true {
            budgetLbl.text = "In Budget"
        } else {
            budgetLbl.text = "Out of Budget"
        }
        
        whereIsLbl.text = budget.whereIs
        costLbl.text = budget.cost
    }
    
 
    
}
