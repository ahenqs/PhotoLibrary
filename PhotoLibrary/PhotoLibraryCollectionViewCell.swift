//
//  PhotoLibraryCollectionViewCell.swift
//  PhotoLibrary
//
//  Created by DA SILVA Andre Henrique on 16/12/2016.
//  Copyright © 2016 a h e n q s. All rights reserved.
//

import UIKit

class PhotoLibraryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!

    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.white
        
        photoImageView.contentMode = .scaleAspectFill
    }

}
