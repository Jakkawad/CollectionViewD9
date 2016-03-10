//
//  CustomTableViewCell.swift
//  CollectionViewD9
//
//  Created by admin on 3/9/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import Alamofire
import MapleBacon

class CustomTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var mActivityIndicarot: UIActivityIndicatorView!
    @IBOutlet weak var lblName: UILabel!
   
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    //let refreshControl = UIRefreshControl()
    
    var mainDataArray = NSArray()
    //var numberOfItemPerSection = 9
    
    func feedData() {
        let params = ["api":"productall","productall":"38"]
        Alamofire.request(.POST, "https://www.all2sale.com/sendmail/testfunction/json/apitest.php", parameters: params, encoding: .URL, headers: nil).responseJSON { (request, response, result) -> Void in
            self.mainDataArray = result.value as! NSArray
            //print(self.mainDataArray.description)
            self.mainCollectionView.reloadData()
        }   //print(result.value!)
        
        
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 10
        return self.mainDataArray.count
        //return numberOfItemPerSection
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let col1 = collectionView.dequeueReusableCellWithReuseIdentifier("collectView1", forIndexPath: indexPath) as? CustomCollectionViewCell
        
        let item = self.mainDataArray[indexPath.row] as! NSDictionary
        let imageUrl = item.objectForKey("ProductShowImage") as? String
        var wwwURL = "https://www.all2sale.com/store/"
        wwwURL += imageUrl!
        let imageURL2 = NSURL(string: wwwURL)!

        col1?.imageViewProduct.setImageWithURL(imageURL2)
        col1?.lblTitle.text = item.objectForKey("ProductName") as? String
        col1?.lblPrice.text = item.objectForKey("StoreSid") as? String
        //col1?.activityIndicator.stopAnimating()
        
        return col1!
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        feedData()
        
        // Refresh
        //refreshControl.tintColor = Const.color.background
        //refreshControl.addTarget(self, action: "feedData", forControlEvents: .ValueChanged)
        //mainCollectionView.addSubview(refreshControl)
        //mainCollectionView.alwaysBounceVertical = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
