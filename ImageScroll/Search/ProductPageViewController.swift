//
//  ProductPageViewController.swift
//  ImageScroll
//
//  Created by Леонид Шелудько on 07.01.2023.
//

import UIKit

class ProductPageViewController: UIViewController {

    let nameLabel = UILabel()
    let priceLabel = UILabel()
    
    var updateName = ""
    var updatePrice = ""
    
    var tovarScrollView = UIScrollView()
    var tovarImageArray : [UIImage?] = [UIImage()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItems()
        
        nameAndPrice()
        
        scroll()
        
        addBasket()
    }
    
    //MARK: - Кнопки в нвигации
    fileprivate func navigationItems() {
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTarget))
        let heartButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .done, target: self, action: #selector(heartTarget))
        self.navigationItem.rightBarButtonItems = [heartButton, shareButton]
    }

    @objc func shareTarget(target: UIBarButtonItem) {
        
    }
    
    @objc func heartTarget(target: UIBarButtonItem) {
        if target.image == UIImage(systemName: "heart") {
            target.image = UIImage(systemName: "heart.fill")
        } else {
            target.image = UIImage(systemName: "heart")
        }
    }
    
    
    //MARK: - Нзвание + цена
    func nameAndPrice() {
        self.nameLabel.frame = CGRect(x: 0, y: 110, width: view.bounds.width, height: 20)
        self.nameLabel.textAlignment = .center
        self.nameLabel.textColor = .white
        self.nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.text = updateName
        view.addSubview(nameLabel)
        
        priceLabel.frame = CGRect(x: 0, y: 135, width: view.bounds.width, height: 20)
        priceLabel.textAlignment = .center
        priceLabel.textColor = .gray
        priceLabel.font = .systemFont(ofSize: 16)
        priceLabel.text = "\(updatePrice)$"
        view.addSubview(priceLabel)
    }
    
    //MARK: - Scroll
    func scroll() {
        //Распположение скрола
        let scrollViewRect = CGRect(x: 0, y: 170, width: self.view.bounds.width, height: 200)
        tovarScrollView = UIScrollView(frame: scrollViewRect)
        //Размер контента в скроле
        tovarScrollView.contentSize = CGSize(width: scrollViewRect.width * CGFloat(tovarImageArray.count), height: 190)
        tovarScrollView.isPagingEnabled = true
        tovarScrollView.indicatorStyle = .white
        self.view.addSubview(tovarScrollView)
        
        var imageViewX = 0
        for foto in tovarImageArray {
            let imageViewRect = CGRect(x: imageViewX, y: 0, width: Int(self.view.bounds.width), height: 190)
            let imageView = UIImageView()
            imageView.image = foto
            imageView.frame = imageViewRect
            imageView.contentMode = .scaleAspectFit
            imageViewX += Int(self.view.bounds.width)
            tovarScrollView.addSubview(imageView)
        }
    }
    
    //MARK: - Добавить в корзину
    func addBasket() {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Добвить в корзину", for: .normal)
        button.backgroundColor = .blue
        button.frame = CGRect(x: 100, y: 600, width: 200, height: 50)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        view.addSubview(button)
    }
}
