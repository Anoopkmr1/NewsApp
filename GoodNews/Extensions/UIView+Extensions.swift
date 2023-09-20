//
//  UIView+Extensions.swift
//  GoodNews

//

import Foundation
import UIKit

extension UIView {
    
    
    // funciton used to create a ui for the table view header to show the Date
    static func viewForTableViewHeader(subtitle: String) -> UIView {
        
        let screenRect = UIScreen.main.bounds
        
        let subtitleView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: screenRect.size.width, height: 10)))
        
        let subtitleLabel = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: screenRect.width, height: 22)))
        subtitleLabel.text = subtitle
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = UIColor.gray
        
        subtitleView.addSubview(subtitleLabel)
        return subtitleView
    }
    // view used to show in every section header
    static func viewForSectionHeader(title: String) -> UIView {
        
        let screenRect = UIScreen.main.bounds
        let headerView = UIView(frame: CGRect(x: 15, y: 0, width: screenRect.width, height: 60))
        
        headerView.backgroundColor = UIColor.white
        
        let sectionHeaderLabel = UILabel(frame: headerView.frame)
        sectionHeaderLabel.text = title.uppercased()
        sectionHeaderLabel.textColor = UIColor.black
        sectionHeaderLabel.font = UIFont.fontForSectionHeaderTitle() 
        
        headerView.addSubview(sectionHeaderLabel)
        return headerView
        
    }
    
}
