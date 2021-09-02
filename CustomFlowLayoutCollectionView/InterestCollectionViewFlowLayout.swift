//
//  InterestCollectionViewFlowLayout.swift
//  CustomFlowLayoutCollectionView
//
//  Created by SaiKiran Panuganti on 26/06/21.
//

import UIKit

class NBCollectionViewFlowLayout: UICollectionViewFlowLayout {
    var spacing = 8
    
    open override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let layouts = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        let count = layouts.count
        for i in 1..<count {
            let currentLayoutAttributes = layouts[i]
            let prevLayoutAttributes = layouts[i-1]
            let origin = prevLayoutAttributes.frame.maxX
            if (origin + CGFloat(spacing) + currentLayoutAttributes.frame.size.width) < self.collectionViewContentSize.width && currentLayoutAttributes.frame.origin.x > prevLayoutAttributes.frame.origin.x {
                var frame = currentLayoutAttributes.frame
                frame.origin.x = origin + CGFloat(spacing)
                currentLayoutAttributes.frame = frame
            }
        }
        return layouts
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
