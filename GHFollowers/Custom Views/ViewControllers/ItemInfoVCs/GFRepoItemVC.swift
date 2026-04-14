//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Giorgi Mekvabishvili on 11.04.26.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confgureItems()
    }
   
    private func confgureItems() {
        itemInfoViewone.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
   override func actionButtonTapped() {
        delegate.didTapGitHubPorfile(for: user)
    }
}
