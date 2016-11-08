//
//  ViewScroll.swift
//  test_UIscrollView
//
//  Created by Admin on 11/8/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewScroll: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var pageCotroller: UIPageControl!
    var pageImages: [String] = []
    var first = false
    var so = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageImages = ["shop1-0","shop1-1","shop1-2"]
        pageCotroller.currentPage = 0
        pageCotroller.numberOfPages = pageImages.count
        
        
    }
    override func viewDidLayoutSubviews() {
        if(!first){
            first = true
            let pagesScrollViewSize =  ScrollView.frame.size
            ScrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageImages.count), 0)
            
            for( var i = 0; i <  pageImages.count; i++){
                let imgView = UIImageView(image: UIImage(named: pageImages[i] + ".jpg"))
                
                imgView.frame = CGRectMake(CGFloat(i) * ScrollView.frame.size.width, 0, ScrollView.frame.size.width, ScrollView.frame.size.height)
                imgView.contentMode = .ScaleAspectFit
                //            ScrollView.backgroundColor = UIColor.redColor()
                self.ScrollView.addSubview(imgView)
            }
            

        }
        print(" do doi\(ScrollView.contentOffset.x)")
    }
   
   
    @IBAction func action_Page(sender: AnyObject) {
        print("page: \(pageCotroller.currentPage)")
        ScrollView.contentOffset = CGPointMake(CGFloat(pageCotroller.currentPage) * ScrollView.frame.size.width, 0)
        print(" do doi\(ScrollView.contentOffset.x)")
    }
     func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if(ScrollView.contentOffset.x == 0){
            pageCotroller.currentPage = 0
        }else if(ScrollView.contentOffset.x == 343){
           pageCotroller.currentPage = 1
        }else if(ScrollView.contentOffset.x == 686){
            pageCotroller.currentPage = 2
        }

    }
    
    
    


}
