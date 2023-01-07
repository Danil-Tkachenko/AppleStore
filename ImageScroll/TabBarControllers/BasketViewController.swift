//
//  BasketViewController.swift
//  ImageScroll
//
//  Created by Леонид Шелудько on 05.01.2023.
//

import UIKit

class BasketViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "basket"), tag: 3)
        self.tabBarItem = tabBarItem
    }
    


}
