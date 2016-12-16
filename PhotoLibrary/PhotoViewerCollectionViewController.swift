//
//  PhotoViewerCollectionViewController.swift
//  PhotoLibrary
//
//  Created by DA SILVA Andre Henrique on 16/12/2016.
//  Copyright © 2016 a h e n q s. All rights reserved.
//

import UIKit

private let photoViewerCellID = "PhotoViewerCellID"

class PhotoViewerCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var photos: [UIImage]? {
        didSet {
            self.collectionView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UINib.init(nibName: "PhotoViewerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: photoViewerCellID)

        collectionView?.backgroundColor = UIColor.black
        
        collectionView?.bounces = true
        collectionView?.alwaysBounceHorizontal = true
        
        collectionView?.isPagingEnabled = true
        
        collectionView?.showsHorizontalScrollIndicator = false
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoViewerCellID, for: indexPath) as! PhotoViewerCollectionViewCell
    
        if let image = photos?[indexPath.row] {
            cell.photoImageView.image = image
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
