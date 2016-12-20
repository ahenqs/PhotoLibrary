//
//  PhotoLibraryCollectionViewController.swift
//  PhotoLibrary
//
//  Created by DA SILVA Andre Henrique on 16/12/2016.
//  Copyright © 2016 a h e n q s. All rights reserved.
//

import UIKit

private let photoCellID = "PhotoCellID"
private let numberOfPhotosPerRow = 3

class PhotoLibraryCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var photos: [UIImage]? {
        didSet {
            self.collectionView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UINib.init(nibName: "PhotoLibraryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: photoCellID)
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.bounces = true
        collectionView?.alwaysBounceVertical = true
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCellID, for: indexPath) as! PhotoLibraryCollectionViewCell
        
        if let image = photos?[indexPath.row] {
            cell.photoImageView.image = image
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let photoViewerController = PhotoViewerCollectionViewController(collectionViewLayout: layout)
        photoViewerController.photos = photos
        photoViewerController.collectionView?.alpha = 0.0
        
        
        if let controller = UIApplication.shared.keyWindow?.rootViewController {
            
            controller.addChildViewController(photoViewerController)
            photoViewerController.collectionView?.frame = controller.view.bounds
            controller.view.addSubview(photoViewerController.view)
            photoViewerController.willMove(toParentViewController: controller)
            photoViewerController.selectedPhotoIndex = indexPath.row
            
            UIView.animate(withDuration: 0.2, animations: {
                
                photoViewerController.collectionView?.frame = controller.view.bounds
                
                photoViewerController.collectionView?.alpha = 1.0
                
            }, completion: nil)
        }
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthHeight = collectionView.frame.size.width / CGFloat(numberOfPhotosPerRow)
        
        return CGSize(width: widthHeight, height: widthHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
