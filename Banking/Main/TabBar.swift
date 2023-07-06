//
//  TabBar.swift
//  Banking
//
//  Created by Alisher on 23/06/23.
//

import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let cardVC = CardVC(nibName: CardVC.id, bundle: nil)
        let transferVC = TransferVC(nibName: TransferVC.id, bundle: nil)
        let chartVC = ChartVC(nibName: ChartVC.id, bundle: nil)
        let moreVC = MoreVC(nibName: MoreVC.id, bundle: nil)
        
    
        
         //  let cardNavVC = UINavigationController(rootViewController: cardVC)
        //let transferNavVC = UINavigationController(rootViewController: transferVC)
       // let chartNavVC = UINavigationController(rootViewController: chartVC)
      //  let moreNavVC = UINavigationController(rootViewController: moreVC)
        
        
        let firstTabBarItem = UITabBarItem(title: .none, image: UIImage(named: "card"), selectedImage: UIImage(named: "card1"))
        cardVC.tabBarItem = firstTabBarItem
        
        let secondTabBarItem = UITabBarItem(title: .none, image: UIImage(named: "transfer"), selectedImage: UIImage(named: "transfer1"))
        transferVC.tabBarItem = secondTabBarItem
       
        let thirdTabBarItem = UITabBarItem(title: .none, image: UIImage(named: "chart"), selectedImage: UIImage(named: "chart1"))
        chartVC.tabBarItem = thirdTabBarItem

        let fourthTabBarItem = UITabBarItem(title: .none, image: UIImage(named: "more"), selectedImage: nil)
        moreVC.tabBarItem = fourthTabBarItem
        

        viewControllers = [cardVC, transferVC, chartVC, moreVC]
    }
  

}
