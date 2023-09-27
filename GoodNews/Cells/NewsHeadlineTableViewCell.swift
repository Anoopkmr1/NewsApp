//
//  NewsHeadlineTableViewCell.swift
//  GoodNews
//


import Foundation
import UIKit

class NewsHeadlineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var headlineImageView: UIImageView!
    // custom cells

    func configure(vm: ArticleViewModel) {
        self.titleLabel.text = vm.title
        self.descriptionLabel.text = vm.description
        vm.image { self.headlineImageView.image = $0 }
    }
}
