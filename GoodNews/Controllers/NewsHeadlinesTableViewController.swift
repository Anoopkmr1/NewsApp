//
//  NewsHeadlinesTableViewController.swift
//  GoodNews
//


import Foundation
import UIKit

class NewsHeadlinesTableViewController: UITableViewController {
    private var categoryListVM: CategoryListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        populateHeadlinesAndArticles()
    }
    
    private func setupUI() {
        // setting up the header of the table view
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.tableHeaderView = UIView.viewForTableViewHeader(subtitle: Date.dateAsStringForTableViewHeader())
    }
    
    // funciton used for calling the category serivces
    private func populateHeadlinesAndArticles() {
            CategoryService().getAllHeadlinesForAllCategories { [weak self] categories in
            self?.categoryListVM = CategoryListViewModel(categories: categories)
            self?.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewsDetailsViewController" {
            prepareSegueForNewsDetails(segue)
        }
    }
    
    private func prepareSegueForNewsDetails(_ segue: UIStoryboardSegue) {
        guard let newsDetailsVC = segue.destination as? NewsDetailsViewController else {
           print("Failed to segue")
            return
        }
        
        guard let indexPath = tableView.indexPathForSelectedRow else {
            print("Unable to get the selected row")
            return
        }
        
        let articleVM = self.categoryListVM.categoryAtIndex(index: indexPath.section).articleAtIndex(indexPath.row)
        newsDetailsVC.article = articleVM.article
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.categoryListVM.heightForHeaderInSection(section)
    }
    
    // this delegate used to show the view in every section
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let name = self.categoryListVM.categoryAtIndex(index: section).name // getting the category name
        return UIView.viewForSectionHeader(title: name)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.categoryListVM == nil ? 0 : self.categoryListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsHeadlineTableViewCell", for: indexPath) as? NewsHeadlineTableViewCell else {
            fatalError("NewsHeadlineTableViewCell not found")
        }
        let articleVM = self.categoryListVM.categoryAtIndex(index: indexPath.section).articleAtIndex(indexPath.row)
        cell.configure(vm: articleVM)
        return cell
    }
    
    
    
}
