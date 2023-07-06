//
//  TransferVC.swift
//  Banking
//
//  Created by Alisher on 23/06/23.
//

import UIKit

class TransferVC: UIViewController {

    static let id = "TransferVC"
    static func nib()-> UINib {
        return UINib(nibName: "TransferVC", bundle: nil)
    }
  

    @IBOutlet weak var stackView: UIStackView!{
        didSet{
            stackView.spacing = UIScreen.main.bounds.width*60/390
        }
    }
        
    @IBOutlet weak var tableVIew: UITableView!
  
    
    var transfers:[TransferDM] = [   TransferDM(name: "Evelyn Smith ", bankName: "AW BANK UNI 234-46589-000"),
                                     TransferDM(name: "Oliver Wilson ", bankName: "AW BANK UNI 234-46589-000"),
                                     TransferDM(name: "Sophie Baker", bankName: "AW BANK UNI 234-46589-000"),
                                     TransferDM(name: "Evelyn Smith ", bankName: "AW BANK UNI 234-46589-000"),
                                     TransferDM(name: "Charlie William", bankName: "AW BANK UNI 234-46589-000")
                                   ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.separatorStyle = .none
        tableVIew.register(HorizontalTableViewCell.nib(), forCellReuseIdentifier:HorizontalTableViewCell.id)
        tableVIew.register(VerticalTableViewCell.nib(), forCellReuseIdentifier:VerticalTableViewCell.id)

    }

}


//MARK: - UITableViewDelegate, UITableViewDataSource -

extension TransferVC: UITableViewDelegate {
    
}

extension TransferVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transfers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let horizontalCell = tableView.dequeueReusableCell(withIdentifier: HorizontalTableViewCell.id, for: indexPath) as? HorizontalTableViewCell else { return UITableViewCell ()}
        horizontalCell.contentView.backgroundColor = UIColor.clear
        horizontalCell.backgroundColor = .clear
        
        guard let verticalCell = tableView.dequeueReusableCell(withIdentifier: VerticalTableViewCell.id, for: indexPath) as? VerticalTableViewCell else { return UITableViewCell () }
        verticalCell.updateCell(transfer: transfers[indexPath.row])
        verticalCell.selectionStyle = .none
        verticalCell.contentView.backgroundColor = UIColor.clear
        verticalCell.backgroundColor = .clear
        
        if indexPath.row == 0 {
            return horizontalCell
        } else {
            return verticalCell
        }
        
    }
}
