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
        let notesVC = NotesViewController()
        let diaryVC = DiaryViewController()
        let calendarVC = CalendarViewController()
        let settingsVC = SettingsViewController()
        
        notesVC.navigationItem.largeTitleDisplayMode = .automatic
        diaryVC.navigationItem.largeTitleDisplayMode = .automatic
        calendarVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav2 = UINavigationController(rootViewController: notesVC)
        let nav3 = UINavigationController(rootViewController: diaryVC)
        let nav4 = UINavigationController(rootViewController: calendarVC)
        let nav5 = UINavigationController(rootViewController: settingsVC)
        
        nav2.tabBarItem = UITabBarItem(title: "Заметки",
                                       image: UIImage(systemName: "note.text"),
                                       tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Дневник",
                                       image: UIImage(systemName: "book"),
                                       tag: 2)
        nav4.tabBarItem = UITabBarItem(title: "Календарь",
                                       image: UIImage(systemName: "calendar"),
                                       tag: 3)
        nav5.tabBarItem = UITabBarItem(title: "Настройки",
                                       image: UIImage(systemName: "gearshape"),
                                       tag: 4)
        
        setViewControllers([nav2, nav3, nav4, nav5], animated: true)
    }
}

