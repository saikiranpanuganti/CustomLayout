//
//  ViewController.swift
//  CustomFlowLayoutCollectionView
//
//  Created by SaiKiran Panuganti on 25/06/21.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    let italian = Interest(title: "Italian", subCategories: nil)
    let racingCars = Interest(title: "Racing Cars", subCategories: nil)
    let rally = Interest(title: "Rally", subCategories: nil)
    let indian = Interest(title: "Indian", subCategories: nil)
    
    let american = Interest(title: "American", subCategories: nil)
    let japanese = Interest(title: "Japanese", subCategories: nil)
    let german = Interest(title: "German", subCategories: nil)
    let french = Interest(title: "French", subCategories: nil)
    
    let british = Interest(title: "British", subCategories: nil)
    let photography = Interest(title: "Photography", subCategories: nil)
    let videos = Interest(title: "Videos", subCategories: nil)
    let offRoad = Interest(title: "Off Road", subCategories: nil)
    
    let street = Interest(title: "Street", subCategories: nil)
    let racing = Interest(title: "Racing", subCategories: nil)
    
    var interests: [Interest] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interests = [italian, racingCars, rally, indian, american, japanese, german, french, british, photography, videos, offRoad, street, racing]
        
        let layout = NBCollectionViewFlowLayout()
        categoriesCollectionView.collectionViewLayout = layout
        
        categoriesCollectionView.register(UINib(nibName: "InterestCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InterestCollectionViewCell")
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        categoriesCollectionView.reloadData()
    }

    func textWidth(text: String, height: CGFloat) -> CGFloat {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17)
        ]
        let attributedText = NSAttributedString(string: text, attributes: attributes)
        let constraintBox = CGSize(width: .greatestFiniteMagnitude, height: height)
        let textWidth = attributedText.boundingRect(with: constraintBox, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil).width.rounded(.up)

        return textWidth
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "InterestCollectionViewCell", for: indexPath) as! InterestCollectionViewCell
        cell.configureUI(interest: interests[indexPath.row])
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        interests[indexPath.row].selected = !interests[indexPath.row].selected
        categoriesCollectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var width : CGFloat = 100.0
        if interests[indexPath.row].selected {
            width = 40.0 + textWidth(text: interests[indexPath.row].title ?? "", height: 20)
        }else {
            width = 20.0 + textWidth(text: interests[indexPath.row].title ?? "", height: 20)
        }
        
        return CGSize(width: width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}


