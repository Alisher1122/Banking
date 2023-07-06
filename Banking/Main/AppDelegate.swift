//
//  AppDelegate.swift
//  Banking
//
//  Created by Alisher on 23/06/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = TabBar()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()

        return true
    }

   


}

