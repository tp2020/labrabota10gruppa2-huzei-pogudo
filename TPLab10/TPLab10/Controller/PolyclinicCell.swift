//
//  PolyclinicCell.swift
//  TPLab10
//
//  Created by Ilya Huzei on 03.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import UIKit

class PolyclinicCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet var imgPlyclinic: UIImageView!
    @IBOutlet var nameLAbel: UILabel!
    
    public func configure(name:String, img:UIImage, flag:Bool){
        nameLAbel.text = name
        imgPlyclinic.image = img
        if(flag){
            self.backgroundView = UIImageView(image: UIImage(named:"BackCell"))
        }
        else{
            self.backgroundView = UIImageView(image: UIImage(named:"BackCell2"))
            
        }
    }
    
}
