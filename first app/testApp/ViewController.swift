//
//  ViewController.swift
//  testApp
//
//  Created by Алексей Теликанов on 09/04/2019.
//  Copyright © 2019 Алексей Теликанов. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var numberCell = 20
    let numberPictures = 100
    let imageIdentifierCell = "imageTableViewCell"
    let urlString = "http://placehold.it/375x150?text="
    
    var fectingMore = false
    var isShowAlert = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareTableView()
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(withURL url: URL, forCell cell: UITableViewCell) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async() {
                if let rawCell = cell as? ImageTableViewCell {
                    rawCell.numberImage = UIImage(data: data)
                    rawCell.layoutSubviews()
                }
            }
        }
    }
        
    // MARK: - UITableView
    
    func prepareTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: imageIdentifierCell)
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let layoutGuide = view.safeAreaLayoutGuide
        tableView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        
        tableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: imageIdentifierCell) as! ImageTableViewCell
        let urlNumberString = urlString + "\(indexPath.row)"
        print(urlNumberString)
        let url = URL(string: urlNumberString)!
        self.downloadImage(withURL: url, forCell: cell)
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if !Reachability.isConnectedToNetwork() && !isShowAlert{
            self.isShowAlert = true
            let alert = UIAlertController(title: "Ошибка Интернет соединения", message: "Проверьте интернет соединение", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
                self.isShowAlert = false
            }))
            self.present(alert, animated: true)
            return
        }
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if (offsetY > contentHeight - scrollView.frame.height) {
            if !fectingMore {
                self.beginBatchFetch()
            }
        }
    }
    
    func beginBatchFetch() {
        fectingMore = true
        if (self.numberCell < self.numberPictures) {
            self.numberCell += 20
            self.fectingMore = false
            self.tableView.reloadData()
        }
    }
}
