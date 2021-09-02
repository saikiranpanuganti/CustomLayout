//
//  InterestCollectionViewCell.swift
//  CustomFlowLayoutCollectionView
//
//  Created by SaiKiran Panuganti on 25/06/21.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var tickView: UIView!
    @IBOutlet weak var tickImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        topView.backgroundColor = UIColor.white
        topView.layer.cornerRadius = 15.0
        topView.layer.borderWidth = 2.0
        topView.layer.borderColor = UIColor.lightGray.cgColor
    }

    func configureUI(interest: Interest?) {
        if let interest = interest {
            interestLabel.text = interest.title ?? ""
            if interest.selected {
                
            }
            tickView.isHidden = interest.selected ? false : true
            topView.backgroundColor = interest.selected ? UIColor.systemBlue : UIColor.white
            interestLabel.textColor = interest.selected ? UIColor.white : UIColor.black
        }
    }
}
