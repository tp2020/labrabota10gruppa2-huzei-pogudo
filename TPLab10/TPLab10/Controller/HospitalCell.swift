//
//  HospitalCell.swift
//  TPLab10
//
//  Created by Ilya Huzei on 03.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import UIKit

class HospitalCell: UICollectionViewCell {

    @IBOutlet var img: UIImageView!
    @IBOutlet var nameText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(name:String, img:UIImage){
        nameText.text = name
        self.img.image = img
        self.backgroundView = UIImageView(image: UIImage(named:"BackCell"))
        
    }
}
