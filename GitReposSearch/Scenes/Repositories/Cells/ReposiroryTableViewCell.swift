//
//  ReposiroryTableViewCell.swift
//  GitReposSearch
//
//  Created by Mahmoud on 8/10/2021.
//

import UIKit
import Kingfisher

class ReposiroryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starCountLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageImg: UIImageView!
    
    static var reuseIdentifier: String {
        return String.init(describing: self)
    }
    
    static var nib: UINib {
        return UINib.init(nibName: String.init(describing: self), bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupUiWithData(repoDetail: RepoDetails) {
        if let stringUrl = repoDetail.owner?.avatarURL,
           let url = URL(string: stringUrl) {
            userImg.kf.setImage(with: url)
        }
        usernameLabel.text = repoDetail.owner?.login
        repoNameLabel.text = repoDetail.name
        descriptionLabel.text = repoDetail.description
        starCountLabel.text = String(repoDetail.stargazersCount ?? 0)
        let languageType = repoDetail.language
        languageLabel.text = languageType
        if (languageType == "Python") {
            languageImg.image = UIImage(named:"Python")
        }
        else {
            languageImg.image = UIImage(named:"Java")
        }
    }
    
}
