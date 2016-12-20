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
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 8.0, y: 32.0, width: 50.0, height: 30.0)
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13.0)
        button.backgroundColor = UIColor.black
        
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 5.0
        button.layer.masksToBounds = true
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 5.0
        
        button.addTarget(self, action: #selector(closePhotoViewer), for: .touchUpInside)
        
        return button
    }()
    
    var photos: [UIImage]? {
        didSet {
            self.collectionView?.reloadData()
        }
    }

    var selectedPhotoIndex: Int? {
        didSet {
            if let index = selectedPhotoIndex {
                collectionView?.scrollToItem(at: IndexPath(row: index, section: 0), at: UICollectionViewScrollPosition.right, animated: false)
                
            }
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
        
        view.addSubview(closeButton)
        view.bringSubview(toFront: closeButton)
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
    }
    
    func closePhotoViewer() {
        
        if let controller = UIApplication.shared.keyWindow?.rootViewController {
            
            let total = controller.view.subviews.count
            
            if total > 2 {
                
                let theView = controller.view.subviews[total - 1]
                
                let point = CGPoint(x: 0.0, y: theView.frame.height)
                
                UIView.animate(withDuration: 0.4, animations: {
                    
                    theView.frame = CGRect(origin: point, size: theView.frame.size)
                    
                    theView.alpha = 0.0
                    
                }, completion: { success in
                    
                    theView.removeFromSuperview()
                    
                })
                
            }
            
        }
        
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
        // -64.0 to avoid warning
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height - 64.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
}
