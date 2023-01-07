//
//  ViewController.swift
//  ImageScroll
//
//  Created by Леонид Шелудько on 05.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var historyScrollView = UIScrollView()
    var scrollButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Поиск"
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        self.tabBarItem = tabBarItem
        
        crateHeader()
        
        createScrollView()
        
        variantsZap()
    }
    
    //MARK: - Header
    func crateHeader() {
        let searchLabel = UILabel()
        searchLabel.text = "Поиск"
        searchLabel.textColor = .white
        searchLabel.font = .boldSystemFont(ofSize: 32)
        searchLabel.frame = CGRect(x: 20, y: 70, width: 120, height: 30)
        self.view.addSubview(searchLabel)
        
        let searchTextField = UITextField()
        searchTextField.frame = CGRect(x: 20, y: 120, width: self.view.bounds.width - 40, height: 35)
        searchTextField.attributedPlaceholder = NSAttributedString(string: "\u{1F50D} Поиск по продуктам и магазинам", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        searchTextField.textColor = .white
        searchTextField.backgroundColor = #colorLiteral(red: 0.1088136211, green: 0.1088136211, blue: 0.1088136211, alpha: 1)
        searchTextField.borderStyle = .roundedRect
        view.addSubview(searchTextField)
    }
    
    //MARK: - КРУТИЛКА
    func createScrollView() {
        let recentlyLabel = UILabel()
        recentlyLabel.text = "Недавно просмотренные"
        recentlyLabel.textColor = .white
        recentlyLabel.font = .boldSystemFont(ofSize: 22)
        recentlyLabel.frame = CGRect(x: 20, y: 200, width: 180, height: 30)
        self.view.addSubview(recentlyLabel)
        recentlyLabel.sizeToFit()
        
        //Пошёл скрол
        var startXForView = 0
        //Размер одной картинки
        let recentlyViewFrames = CGRect(x: startXForView, y: 0, width: 130, height: 160)
        //Расположим скрол вью на всю ширину экрана
        self.historyScrollView.frame = CGRect(x: 0, y: 240, width: view.bounds.width, height: 175)
        //Размер контента в скрол вью
        self.historyScrollView.contentSize = CGSize(width: (recentlyViewFrames.width * CGFloat(model.recentlyWatched.count)) + CGFloat(model.recentlyWatched.count * 10),
                                                    height: recentlyViewFrames.height)
        
        for product in model.recentlyWatched {
            let viewForOneObject = UIView()
            let imageView = UIImageView()
            let label = UILabel()
            
            //Карточка товара
            viewForOneObject.backgroundColor = UIColor(red: 0.07, green: 0.09, blue: 0.1, alpha: 1)
            viewForOneObject.layer.cornerRadius = 10
            viewForOneObject.frame = CGRect(x: startXForView, y: 0, width: 130, height: 160) //размер одной картинки
            viewForOneObject.tag = product.2
            
            //Картинка на карточке
            imageView.frame = CGRect(x: 10, y: 10, width: 110, height: 100)
            imageView.contentMode = .scaleAspectFit //была полноразмерная
            imageView.image = product.1
            viewForOneObject.addSubview(imageView)
            
            //Текст на карточке
            label.frame = CGRect(x: 10, y: 110, width: 110, height: 45)
            label.text = product.0
            
            label.textColor = .white
            label.font = .systemFont(ofSize: 14)
            label.numberOfLines = 0
            label.textAlignment = .center
            viewForOneObject.addSubview(label)
            
            //Повесиим ссылку на фото
            let recognizer = UITapGestureRecognizer()
            recognizer.addTarget(self, action: #selector(targetTap))
            viewForOneObject.addGestureRecognizer(recognizer)
            
            //Добавили на скролл фото
            self.historyScrollView.addSubview(viewForOneObject)
            
            startXForView += Int(viewForOneObject.bounds.width) + 10
        }
        self.view.addSubview(self.historyScrollView)
    }
    
    @objc func targetTap(gestureRecognizer: UITapGestureRecognizer) {
        let productPageVC = ProductPageViewController()
        productPageVC.updateName = model.recentlyWatched[gestureRecognizer.view!.tag].0
        productPageVC.updatePrice = String(model.price[gestureRecognizer.view!.tag])
        productPageVC.tovarImageArray = model.tovarModelImageArrrayy[gestureRecognizer.view!.tag]
        self.navigationController?.pushViewController(productPageVC, animated: true)
    }

    
    //MARK: - Варианты зпросов
    func variantsZap() {
        let recentlyLabel = UILabel()
        recentlyLabel.text = "Варианты запросов"
        recentlyLabel.textColor = .white
        recentlyLabel.font = .boldSystemFont(ofSize: 22)
        recentlyLabel.frame = CGRect(x: 20, y: 440, width: 180, height: 30)
        self.view.addSubview(recentlyLabel)
        recentlyLabel.sizeToFit()
        
        var arrayY = 490
        let arrayText = ["AirPods", "AppleCar", "Beats", "Watch"]
        
        func arrayVar(tovar: String) {
            let label = UILabel()
            label.frame = CGRect(x: 20, y: arrayY, width: 200, height: 20)
            label.text = "\u{1F50D}  \(tovar)"
            label.font = .systemFont(ofSize: 22)
            label.textColor = .white
            self.view.addSubview(label)
            arrayY += 50
        }
        
        var lineY = 520
        for i in arrayText {
            arrayVar(tovar: i)

            let line = UILabel()
            line.layer.borderWidth = 1
            line.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
            line.frame = CGRect(x: 20, y: lineY, width: 350, height: 1)
            view.addSubview(line)
            lineY += 50
        }
    }
    
    
}

