//
//  FollowerListVCViewController.swift
//  GHFollowers
//
//  Created by Giorgi Mekvabishvili on 16.03.26.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) {  [weak self] (followers, errorMessage) in guard let followers = followers else {
            self?.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: errorMessage?.rawValue ?? "Error Ocurred", buttonTitle: "Ok")
            return
        }
        }

    }
}

