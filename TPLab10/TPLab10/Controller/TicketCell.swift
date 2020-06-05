//
//  TicketCell.swift
//  TPLab10
//
//  Created by Ilya Huzei on 03.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import UIKit

class TicketCell: UICollectionViewCell {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var polyLabel: UILabel!
    @IBOutlet var img: UIImageView!
    @IBOutlet var docLabel: UILabel!
    override func awakeFromNib() {
      
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(date:String,polyclinic:String,doctor:String){
        dateLabel.text = date
        polyLabel.text = polyclinic
        docLabel.text = doctor
        img.image = UIImage(named:"Ticket")
    }

}
