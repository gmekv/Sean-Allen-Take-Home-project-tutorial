//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Giorgi Mekvabishvili on 11.04.26.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confgireItems()
    }
   
    private func confgireItems() {
        itemInfoViewone.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No Followers", message: "This user has no followers", buttonTitle: "So Sad")
            return
        }
        delegate.didTapGetFollowers(for: user)
    }
}
