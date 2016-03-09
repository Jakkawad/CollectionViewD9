//
//  CustomTableViewCell.swift
//  CollectionViewD9
//
//  Created by admin on 3/9/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var mainCollectionView: CustomCollectionViewCell!
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let col1 = collectionView.dequeueReusableCellWithReuseIdentifier("collectView1", forIndexPath: indexPath) as? CustomCollectionViewCell
        
        return col1!
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
