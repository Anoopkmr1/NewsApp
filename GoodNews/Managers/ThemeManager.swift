//
//  ThemeManager.swift
//  GoodNews

//

import Foundation
import UIKit

class ThemeManager {
    // theme setup for the controllers
    static func setup() {
        
//        UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
        UINavigationBar.appearance().barTintColor = Theme.Colors.main
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
         UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        
    }
    
}
