//
//  TabBarController.swift
//  MealPlan
//
//  Created by Christian Grinling on 29/10/2021.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        let mainWeekView = MainWeekView()
        let homeImage = UIImage(systemName: "timer.square")
        mainWeekView.tabBarItem = UITabBarItem(title: "Home", image: homeImage, tag: 0)
        
        let addMealPage = AddMealPage()
        let addMealImage = UIImage(systemName: "asterisk")
        addMealPage.tabBarItem = UITabBarItem(title: "Meals", image: addMealImage, tag: 1)
        
        let activityPage = ActivityPage()
        let profileImage = UIImage(systemName: "text.append")
        activityPage.tabBarItem = UITabBarItem(title: "Activity", image: profileImage, tag: 2)
        
        let profilePage = ProfilePage()
        let messagesImage = UIImage(systemName: "person")
        profilePage.tabBarItem = UITabBarItem(title: "Profile", image: messagesImage, tag: 3)
        

        
        let tabbarList = [mainWeekView, addMealPage, activityPage, profilePage]
        
        viewControllers = tabbarList.map {
            UINavigationController(rootViewController: $0)
        }
    }

   
    }
  

