//
//  Sruct.swift
//  Banking
//
//  Created by Alisher on 23/06/23.
//

import Foundation
import UIKit


struct TransactionDM {
    var name: String
    var data: String
    var cost: String
}

struct TransferDM {
    var name: String
    var bankName: String
}

struct BudgetDM{
    var outOrIn: Bool
    var whereIs: String
    var cost: String
}




//MARK: ----- Extensions and Functions for UIView  -----
extension UIView {

  // OUTPUT 1
  func dropShadow(scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.2
    layer.shadowOffset = CGSize(width: 0, height: 0)
    layer.shadowRadius = 3

  //  layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 2
  }

  // OUTPUT 2
  func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius

    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}


func setGradientBackground(view: UIView, colors: [UIColor]) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.layer.bounds
  
    let cgColors = colors.map { $0.cgColor }
    gradientLayer.colors = cgColors
    
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5) // top-left corner
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5) // bottom-right corner
    
    view.layer.insertSublayer(gradientLayer, at: 0)
}



