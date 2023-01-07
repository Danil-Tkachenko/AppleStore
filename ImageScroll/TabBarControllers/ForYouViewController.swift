//
//  ForYouViewController.swift
//  ImageScroll
//
//  Created by Леонид Шелудько on 05.01.2023.
//

import UIKit

class ForYouViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Для вас", image: UIImage(systemName: "person.circle"), tag: 1)
        self.tabBarItem = tabBarItem
    }
    

    

}
