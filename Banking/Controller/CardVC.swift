//
//  CardVC.swift
//  Banking
//
//  Created by Alisher on 27/06/23.
//

import UIKit

class CardVC: UIViewController {

    static let id = "CardVC"
    static func nib()-> UINib {
        return UINib(nibName: "CardVC", bundle: nil)
    }
    
    
    let colors = [UIColor(named: "Color")!, UIColor(named: "Color1")!]
    let colors1 = [UIColor(named: "white")!, UIColor(named: "white1")!]

    @IBOutlet weak var containerView: UIView!{
           didSet {
               containerView.dropShadow()
           }
       }
    @IBOutlet weak var containerViewForGradient: UIView!
    @IBOutlet weak var userImageVIew: UIView!
    @IBOutlet weak var smallContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var dates:[TransactionDM] = [TransactionDM(name: "Shopping", data: "Tue 12.05.2021", cost: "$29.90"),
                                    TransactionDM(name: "Movie Ticket", data: "Mon 11.05.2021", cost: "$9.50"),
                                    TransactionDM(name: "Amazon", data: "Mon 11.05.2021", cost: "$19.30"),
                                    TransactionDM(name: "Udemy", data: "Sat 09.05.2021", cost: "$20.00"),
                                    TransactionDM(name: "Sophie Baker", data: "Sat 09.05.2021", cost: "$14.00"),
                                    TransactionDM(name: "AliExpress", data: "Thue 26.05.2021", cost: "$8.99"),
                                    TransactionDM(name: "Korzinka", data: "Sat 09.05.2021", cost: "$7.52"),
                                    TransactionDM(name: "Spotify", data: "Mon 11.03.2021", cost: "$100.3"),
                                    TransactionDM(name: "Books", data: "Fri 08.05.2021", cost: "$26.88"),
                                    TransactionDM(name: "Shopping", data: "Tue 12.05.2021", cost: "$29.90"),
                                    TransactionDM(name: "Movie Ticket", data: "Mon 11.05.2021", cost: "$9.50"),
                                    TransactionDM(name: "Amazon", data: "Mon 11.05.2021", cost: "$19.30"),
                                    TransactionDM(name: "Udemy", data: "Sat 09.05.2021", cost: "$20.00"),
                                    TransactionDM(name: "Sophie Baker", data: "Sat 09.05.2021", cost: "$14.00"),
                                    TransactionDM(name: "AliExpress", data: "Thue 26.05.2021", cost: "$8.99"),
                                    TransactionDM(name: "Korzinka", data: "Sat 09.05.2021", cost: "$7.52"),
                                    TransactionDM(name: "Spotify", data: "Mon 11.03.2021", cost: "$100.3"),
                                    TransactionDM(name: "Books", data: "Fri 08.05.2021", cost: "$26.88")
       ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

                setGradientBackground(view: smallContainerView, colors: colors)
                setGradientBackground(view: userImageVIew, colors: colors)
                setGradientBackground(view: containerViewForGradient, colors: colors1)
        
                tableView.delegate = self
                tableView.dataSource = self
                tableView.register(LastTransactionsTableViewCell.nib(), forCellReuseIdentifier: LastTransactionsTableViewCell.id)
                tableView.separatorStyle = .none
        
    }


  

}

//MARK: - UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate -
extension CardVC: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dates.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LastTransactionsTableViewCell.id, for: indexPath) as? LastTransactionsTableViewCell else { return UITableViewCell() }
        cell.updateCell(transAction: dates[indexPath.row])
        cell.selectionStyle = .none
        cell.contentView.backgroundColor = UIColor.clear
        cell.backgroundColor = .clear
        return cell
    }
}
