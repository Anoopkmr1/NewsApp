//
//  ThemeManager.swift
//  GoodNews

//

import Foundation
import UIKit


public enum Colors {
  // Main app colors
  public static let main = #colorLiteral(red: 0.1529411765, green: 0.1529411765, blue: 0.2392156863, alpha: 1)
  public static let mainLight = #colorLiteral(red: 0.2, green: 0.1921568627, blue: 0.3137254902, alpha: 1)
  public static let red = #colorLiteral(red: 0.8078431373, green: 0.3176470588, blue: 0.2901960784, alpha: 1)
  public static let white = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
}

class ThemeManager {
    // theme setup for the controllers
    static func setup() {
        
//        UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
        UINavigationBar.appearance().barTintColor = Theme.Colors.main
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
         UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().backgroundColor = Colors.main
        UITableView.appearance().backgroundColor = Colors.main
    }
}
