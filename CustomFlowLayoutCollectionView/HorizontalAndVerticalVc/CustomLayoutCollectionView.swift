//
//  CustomLayoutCollectionView.swift
//  CustomFlowLayoutCollectionView
//
//  Created by SaiKiran Panuganti on 02/09/21.
//

import UIKit

class CustomLayoutCollectionView: UIViewController {

    let contentCellIdentifier = "ContentCellIdentifier"
    let tvGuideCellIdentifier = "TvGuideCollectionViewCell"

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: "ContentCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: contentCellIdentifier)
        collectionView.register(TvGuideCollectionViewCell.self, forCellWithReuseIdentifier: tvGuideCellIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor.white
    }

}

// MARK: - UICollectionViewDataSource
extension CustomLayoutCollectionView: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 200
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        

        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCellIdentifier, for: indexPath) as! ContentCollectionViewCell
            
            if indexPath.row == 0 {
                cell.backgroundColor = UIColor.clear
                cell.contentLabel.backgroundColor = UIColor.clear
                cell.contentLabel.text = ""
            } else {
                cell.contentLabel.text = "Section \(indexPath.row)"
            }
            
            return cell
        } else {
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCellIdentifier, for: indexPath) as! ContentCollectionViewCell
                cell.contentLabel.text = String(indexPath.section)
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tvGuideCellIdentifier, for: indexPath) as! TvGuideCollectionViewCell
                cell.configureUI(listing: nil, text: "Section \(indexPath.section), Row \(indexPath.row)")
                return cell
            }
        }
    }

}

// MARK: - UICollectionViewDelegate
extension CustomLayoutCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ContentCollectionViewCell {
            print(cell.contentLabel.text, indexPath)
        }else if let cell = collectionView.cellForItem(at: indexPath) as? TvGuideCollectionViewCell {
            print(indexPath)
        }
    }
}
