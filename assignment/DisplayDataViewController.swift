//
//  DisplayDataViewController.swift
//  assignment
//
//  Created by Kittidech Vongsak on 7/8/16.
//  Copyright © 2016 Kittidech Vongsak. All rights reserved.
//

import UIKit

class DisplayDataViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    var myUsers:[User]!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Detail"
        if self.myUsers.count<3 {
            pageControl.numberOfPages = self.myUsers.count
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    let reuseIdentifier = "ID"
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.myUsers.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! DetailCollectionViewCell
        let myUser : User!
        myUser = self.myUsers[indexPath.item];
        cell.lblName.text = myUser.full_name
        cell.lblURL.text = myUser.html_url
        cell.lblDefaultBranch.text = myUser.default_branch
        
        ImageHelper.loadImageFromUrl((myUser.owner?.avatar_url)!, view: cell.imgUser)
        
        if self.myUsers.count<4 {
            pageControl.currentPage = indexPath.item
        }else
        {
            pageControl.currentPage = Int(floor(Double(indexPath.item/(self.myUsers.count/pageControl.numberOfPages))))
        }
        
        return cell
    }
}


