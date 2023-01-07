//
//  BuyViewController.swift
//  ImageScroll
//
//  Created by Леонид Шелудько on 05.01.2023.
//

import UIKit

class BuyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Купить", image: UIImage(systemName: "ipad.and.iphone"), tag: 0)
        self.tabBarItem = tabBarItem
    }
    

}
