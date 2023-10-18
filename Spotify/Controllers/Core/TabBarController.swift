//
//  TabBarController.swift
//  Spotify
//
//  Created by Admin on 16.10.2023.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = HomeViewController()
        let vc2 = SearchViewController()
        let vc3 = LibraryViewController()
        
        vc1.title = "Browse"
        vc2.title = "Search"
        vc3.title = "Library"
        
        vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        vc3.navigationItem.largeTitleDisplayMode = .always
        
        let navVC1 = UINavigationController(rootViewController: vc1)
        let navVC2 = UINavigationController(rootViewController: vc2)
        let navVC3 = UINavigationController(rootViewController: vc3)
        
        navVC1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        navVC2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        navVC3.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "music.note.list"), tag: 1)
        
        navVC1.navigationBar.prefersLargeTitles = true
        navVC2.navigationBar.prefersLargeTitles = true
        navVC3.navigationBar.prefersLargeTitles = true
       
        
        setViewControllers([navVC1, navVC2, navVC3], animated: false)
    }
    
    
}
