//
//  CustomTableViewCell.swift
//  CollectionViewD9
//
//  Created by admin on 3/9/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import Alamofire

class CustomTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var lblName: UILabel!
   
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    var mainDataArray = NSArray()
    
    func feedData() {
        let params = ["api":"productall","productall":"37"]
        Alamofire.request(.POST, "https://www.all2sale.com/sendmail/testfunction/json/apitest.php", parameters: params, encoding: .URL, headers: nil).responseJSON { (request, response, result) -> Void in
            self.mainDataArray = result.value as! NSArray
            //print(self.mainDataArray.description)
            self.mainCollectionView.reloadData()
        }   //print(result.value!)
        
        
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 10
        return self.mainDataArray.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let col1 = collectionView.dequeueReusableCellWithReuseIdentifier("collectView1", forIndexPath: indexPath) as? CustomCollectionViewCell
        let item = self.mainDataArray[indexPath.row] as! NSDictionary

        col1?.lblTitle.text = item.objectForKey("ProductName") as? String
        return col1!
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        feedData()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
