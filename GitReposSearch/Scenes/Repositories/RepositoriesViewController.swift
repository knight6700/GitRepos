//
//  RepositoriesViewController.swift
//  GitReposSearch
//
//  Created by Mahmoud on 8/10/2021.
//

import UIKit
import RxSwift
import RxCocoa

class RepositoriesViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK:- Properties
    private let bag = DisposeBag()
    var viewModel: RepositoriesViewModel?
    
    //MARK:- Outlets
    @IBOutlet weak var tableview: UITableView!
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureBinding()
        bindViewModel()
        viewModel?.getRepositories()
    }
    
    private func setupTableView() {
        tableview.register(ReposiroryTableViewCell.nib, forCellReuseIdentifier: ReposiroryTableViewCell.reuseIdentifier)
        tableview.rowHeight = UITableView.automaticDimension
    }
    
    private func configureBinding() {
        tableview.rx
            .setDelegate(self)
            .disposed(by: bag)
        
        tableview.rx
            .willDisplayCell
            .subscribe(onNext: { [weak self] cell in
                guard let self = self else { return }
                self.viewModel?.isLoadNext.accept(self.hasNextRepos(index: cell.indexPath.row))
            }).disposed(by: bag)
    }
    
    private func bindViewModel() {
        viewModel?.repositoriesList
            .bind(to: tableview.rx.items(cellIdentifier: ReposiroryTableViewCell.reuseIdentifier,
                                         cellType: ReposiroryTableViewCell.self))
            {_, repository, cell in
                cell.setupUiWithData(repoDetail: repository)
            }.disposed(by: bag)
    }
    
    //MARK:- Utilities
    private func hasNextRepos(index: Int) -> Bool {
        return (self.viewModel?.currentCount ?? 1) <
            (self.viewModel?.totalRepos ?? 1)
            && index == (self.viewModel?.currentCount ?? 1) - 1
    }
}
