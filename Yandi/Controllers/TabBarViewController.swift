//
//  ViewController.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 15.03.2025.
//

import UIKit

final class TabBarViewController: UITabBarController {

        override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.backgroundColor = .secondarySystemBackground
        setUpTabs()
    }
    
    private func setUpTabs() {
        let targetVC = TargetViewController()
        let notesVC = NotesViewController()
        let diaryVC = DiaryViewController()
        let friendsVC = FriendsViewController()
        let profileVC = ProfileViewController()
        
        targetVC.navigationItem.largeTitleDisplayMode = .automatic
        notesVC.navigationItem.largeTitleDisplayMode = .automatic
        diaryVC.navigationItem.largeTitleDisplayMode = .automatic
        friendsVC.navigationItem.largeTitleDisplayMode = .automatic
        profileVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: targetVC)
        let nav2 = UINavigationController(rootViewController: notesVC)
        let nav3 = UINavigationController(rootViewController: diaryVC)
        let nav4 = UINavigationController(rootViewController: friendsVC)
        let nav5 = UINavigationController(rootViewController: profileVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Цели",
                                       image: UIImage(systemName: "house"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Заметки",
                                       image: UIImage(systemName: "magnifyingglass"),
                                       tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Дневник",
                                       image: UIImage(systemName: "bookmark.fill"),
                                       tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Друзья",
                                       image: UIImage(systemName: "heart.fill"),
                                       tag: 4)
        nav5.tabBarItem = UITabBarItem(title: "Профиль",
                                       image: UIImage(systemName: "plus"),
                                       tag: 5)
        
//        for nav in [nav1, nav2, nav3, nav4, nav5] {
//            nav.navigationBar.scrollEdgeAppearance = nav.navigationBar.standardAppearance
//        }
        
        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: true)
    }
}

