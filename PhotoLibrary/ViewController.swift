//
//  ViewController.swift
//  PhotoLibrary
//
//  Created by DA SILVA Andre Henrique on 16/12/2016.
//  Copyright © 2016 a h e n q s. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let photoViewController = PhotoLibraryCollectionViewController(collectionViewLayout: layout)
    
        if let photo = UIImage(named: "PhotoPlaceholder") {
            let photos = [photo, photo, photo, photo, photo, photo, photo]
        
            photoViewController.photos = photos
        }
        
        addChildViewController(photoViewController)
        photoViewController.collectionView?.frame = view.bounds
        view.addSubview(photoViewController.collectionView!)
        photoViewController.willMove(toParentViewController: self)        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

