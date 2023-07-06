//
//  ChartVC.swift
//  Banking
//
//  Created by Alisher on 23/06/23.
//

import UIKit
import ScrollableGraphView

class ChartVC: UIViewController {

    static let id = "ChartVC"
    static func nib()-> UINib {
        return UINib(nibName: "ChartVC", bundle: nil)
    }
    
    var linePlotData: [Double] = [380,490,260,310,550,310]
    var lineLabel: [String] = ["JAN","FEB","MAR","APR","MAY","JUN"]
    var budgetArr: [BudgetDM] = [BudgetDM(outOrIn: true, whereIs: "Shopping ", cost: "$50.00/ $100.00"),
                                 BudgetDM(outOrIn: false, whereIs: "Subscriptions", cost: "$50.00/ $100.00"),
                                 BudgetDM(outOrIn: true, whereIs: "Education", cost: "$70.00/ $100.00")]
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerVIewForShadov: UIView!
    @IBOutlet weak var moneyInView: UIView!
    @IBOutlet weak var moneyOutViwe: UIView!
    @IBOutlet weak var graphVIew: ScrollableGraphView!{
        didSet {
            self.graphVIew.dataSource = self
            let barPlot = BarPlot(identifier: "bar")
            barPlot.barWidth = 20
            barPlot.barLineWidth = 1
            barPlot.barLineColor = .clear
            barPlot.barColor = UIColor(named: "colorForBarPlot") ?? .white
            barPlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
            barPlot.animationDuration = 1.5
            
            let referenceLines = ReferenceLines()
            referenceLines.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8)
            referenceLines.referenceLineColor = (UIColor(named: "colorForLine")?.withAlphaComponent(0.2))!
            referenceLines.referenceLineLabelColor = UIColor.black.withAlphaComponent(0.5)
            referenceLines.dataPointLabelColor = UIColor.black.withAlphaComponent(0.5)
          
            graphVIew.backgroundFillColor = .clear
            graphVIew.shouldAnimateOnStartup = true
            graphVIew.rangeMax = 600
            graphVIew.rangeMin = 0
            graphVIew.addPlot(plot: barPlot)
            graphVIew.addReferenceLines(referenceLines: referenceLines)
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setGradientBackground(view: containerView, colors: [UIColor(named: "colorForGraph1")!,
                                                         UIColor(named: "colorForGraph2")!])
        containerVIewForShadov.dropShadow()
        moneyInView.dropShadow()
        moneyOutViwe.dropShadow()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ReportsTableViewCell.nib(), forCellReuseIdentifier:ReportsTableViewCell.id)

        
        
    }


  

}


//MARK: - ScrollableGraphViewDataSource -
extension ChartVC: ScrollableGraphViewDataSource {
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        // Return the data for each plot.
        switch(plot.identifier) {
        case "bar":
            return linePlotData[pointIndex]
        default:
            return 5
        }
    }
    func label(atIndex pointIndex: Int) -> String {
        return "FEB \(pointIndex)"
    }

    func numberOfPoints() -> Int {
        return linePlotData.count
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource -
extension ChartVC: UITableViewDelegate {
    
}

extension ChartVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return budgetArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReportsTableViewCell.id, for: indexPath) as? ReportsTableViewCell else { return UITableViewCell () }
        cell.updateCell(budget: budgetArr[indexPath.row])
        cell.selectionStyle = .none
        cell.contentView.backgroundColor = UIColor.clear
        cell.backgroundColor = .clear
        return cell
        
    }
}
