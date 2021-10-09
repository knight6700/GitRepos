//
//  SearchViewController.swift
//  GitReposSearch
//
//  Created by Mahmoud on 8/10/2021.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    var search = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.black
        setupSearchbar()
    }
    
    private func setupSearchbar() {
        search.searchBar.delegate = self
        self.navigationItem.searchController = search
        search.searchBar.placeholder = "Search GitHub"
        let textFieldInsideSearchBar = search.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = UIColor.white
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else { return  }
        if #available(iOS 13.0, *) {
            guard let viewController = self.storyboard?.instantiateViewController(identifier: "RepositoriesViewController") as? RepositoriesViewController
            else { return  }
            let viewModel = RepositoriesViewModel(keyWord: keyword)
            viewController.viewModel = viewModel
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

