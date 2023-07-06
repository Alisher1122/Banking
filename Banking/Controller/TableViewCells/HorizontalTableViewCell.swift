//
//  HorizontalTableViewCell.swift
//  Banking
//
//  Created by Alisher on 02/07/23.
//

import UIKit

class HorizontalTableViewCell: UITableViewCell {

    static let id = "HorizontalTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "HorizontalTableViewCell", bundle: nil)
    }
    
    
    @IBOutlet weak var collectionVIew: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionVIew.delegate = self
        collectionVIew.dataSource = self
        collectionVIew.contentInset = UIEdgeInsets(top: 25, left: 8, bottom: 0, right: 8)
        collectionVIew.register(TransferAppsCell.nib(), forCellWithReuseIdentifier: TransferAppsCell.id)
    }

}

//MARK: - UICollectionViewDataSource -
extension HorizontalTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TransferAppsCell.id, for: indexPath) as? TransferAppsCell else { return UICollectionViewCell()}
        return cell
    }
}
    
    


//MARK: - UICollectionViewDelegateFlowLayout -
extension HorizontalTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionVIew.frame.width-16)/4, height: (self.collectionVIew.frame.width-16)/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}
