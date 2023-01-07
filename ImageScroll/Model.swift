//
//  Model.swift
//  ImageScroll
//
//  Created by Леонид Шелудько on 06.01.2023.
//

import UIKit

let model = Model()

class Model: NSObject {
    let recentlyWatched: [(descriptionText: String, image: UIImage?, tag: Int)] = [
        ("iPhone 14", UIImage(named: "iPhone1"), 0),
        ("iPad mini", UIImage(named: "iPad3"), 1),
        ("macBook air 2019", UIImage(named: "macBook1"), 2),
        ("macBook Pro 2022 M2", UIImage(named: "macBook2"), 3)
    ]
    let price = [990, 520, 1190, 2000]
    let tovarModelImageArrrayy = [
        [UIImage(named: "iPhone1"), UIImage(named: "iPhone2"), UIImage(named: "iPhone3")],
        [UIImage(named: "iPad1"), UIImage(named: "iPad2"), UIImage(named: "iPad3")],
        [UIImage(named: "macBook1"), UIImage(named: "macBook2"), UIImage(named: "macBook3")],
        [UIImage(named: "macBook3"), UIImage(named: "macBook2"), UIImage(named: "macBook1")],
    ]
}
