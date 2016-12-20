//
//  PhotoViewerCollectionViewCell.swift
//  PhotoLibrary
//
//  Created by DA SILVA Andre Henrique on 16/12/2016.
//  Copyright © 2016 a h e n q s. All rights reserved.
//

import UIKit

class PhotoViewerCollectionViewCell: UICollectionViewCell, UIScrollViewDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.black
        
        photoImageView.contentMode = .scaleAspectFit
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(closeViewer(gestureRecognizer:)))
        swipeDown.direction = .down
        addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(closeViewer(gestureRecognizer:)))
        swipeUp.direction = .up
        addGestureRecognizer(swipeUp)
        
        photoImageView.isUserInteractionEnabled = true
    }
    
    func closeViewer(gestureRecognizer: UISwipeGestureRecognizer) {
        
        if let controller = UIApplication.shared.keyWindow?.rootViewController {
            
            let total = controller.view.subviews.count
            
            if total > 2 {
                
                let theView = controller.view.subviews[total - 1]
                
                var point = CGPoint(x: 0.0, y: -theView.frame.height)
                
                if gestureRecognizer.direction == UISwipeGestureRecognizerDirection.down {
                    point = CGPoint(x: 0.0, y: theView.frame.height)
                }
                
                UIView.animate(withDuration: 0.4, animations: {
                    
                    theView.frame = CGRect(origin: point, size: theView.frame.size)
                    
                    theView.alpha = 0.0
                    
                }, completion: { success in
                
                    theView.removeFromSuperview()
                    
                })
            
            }
            
        }
    }
    
    // MARK: ScrollViewDelegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImageView
    }
}
