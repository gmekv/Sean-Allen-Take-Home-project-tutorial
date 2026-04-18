//
//  GFTabBarController.swift
//  GHFollowers
//
//  Created by Giorgi Mekvabishvili on 18.04.26.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNavigationController(), createFacoritesNavigationController()]
        
        
    }
        func createTabbar() -> UITabBarController {
            let tabbar = UITabBarController()
            UITabBar.appearance().tintColor = .systemBlue
            tabbar.viewControllers = [createSearchNavigationController(), createFacoritesNavigationController()]
            return tabbar
        }
        
     
        
        func createSearchNavigationController() -> UINavigationController {
            let searchVC = SearchVC()
            searchVC.title = "Search"
            searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
            return UINavigationController(rootViewController: searchVC)
        }
        
        func createFacoritesNavigationController() -> UINavigationController {
            let favoritesListVC = FavoritesListVC()
            favoritesListVC.title = "Favorites"
            favoritesListVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), tag: 1)
            return UINavigationController(rootViewController: favoritesListVC)
    }
}
