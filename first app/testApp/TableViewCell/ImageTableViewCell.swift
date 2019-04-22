//
//  ImageTableViewCell.swift
//  testApp
//
//  Created by Алексей Теликанов on 09/04/2019.
//  Copyright © 2019 Алексей Теликанов. All rights reserved.
//

import Foundation
import UIKit

class ImageTableViewCell: UITableViewCell {
    var numberImage: UIImage?
    
    var numberImageView: UIImageView = {
       var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(numberImageView)
        
        numberImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        numberImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        numberImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        numberImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let image = numberImage {
            numberImageView.image = image
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
