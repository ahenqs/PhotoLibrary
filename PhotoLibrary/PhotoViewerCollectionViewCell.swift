//
//  PhotoViewerCollectionViewCell.swift
//  PhotoLibrary
//
//  Created by DA SILVA Andre Henrique on 16/12/2016.
//  Copyright © 2016 a h e n q s. All rights reserved.
//

import UIKit

class PhotoViewerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.white
        
        photoImageView.contentMode = .scaleAspectFit
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(closeViewer))
        swipeDown.direction = .down
        addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(closeViewer))
        swipeUp.direction = .up
        addGestureRecognizer(swipeUp)
    }
    
    func closeViewer() {
        
        if let controller = UIApplication.shared.keyWindow?.rootViewController {
            
            let total = controller.view.subviews.count
            
            if total > 2 {
        
                controller.view.subviews[total - 1].removeFromSuperview()
                
            }
            
        }
        
    }
}
