//
//  NewsDetailsViewController.swift
//  GoodNews

//

import Foundation
import UIKit
import WebKit

// this view is used to show the webview for the selected cells

class NewsDetailsViewController: UIViewController {
    
    var article: Article!
    private var newsDetailsVM: NewsDetailsViewModel!
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.Colors.main
        setupUI()
    }
    
    private func setupUI() {
        self.newsDetailsVM = NewsDetailsViewModel(article)
        self.navigationItem.largeTitleDisplayMode = .never
        self.title = self.newsDetailsVM.sourceName
        
        guard let url = self.newsDetailsVM.url,
            let newsDetailURL = URL(string: url) else {
                return
        }
        DispatchQueue.main.async {
            let request = URLRequest(url: newsDetailURL)
            self.webview.load(request)
        }
    }
}
