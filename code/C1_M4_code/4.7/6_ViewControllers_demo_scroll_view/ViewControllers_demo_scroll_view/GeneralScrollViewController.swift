//
//  GeneralScrollViewController.swift
//  ViewControllers_demo_scroll_view
//
//  Created by Andrew Solovey on 03.07.2018.
//  Copyright © 2018 Andrew Solovey. All rights reserved.
//

import UIKit

class GeneralScrollViewController: UIViewController {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    var imageViews = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self

        let imageNames = ["first", "second", "third"]
        for name in imageNames {
            let image = UIImage(named: name)
            let imageView = UIImageView(image: image)
            
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            
            scrollView.addSubview(imageView)
            
            imageViews.append(imageView)
        }
        
        pageControl.numberOfPages = imageNames.count
        pageControl.currentPage = 0
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.isPagingEnabled = true
        
        
        for (index, imageView) in imageViews.enumerated() {
            imageView.frame.size = scrollView.frame.size
            imageView.frame.origin.x = scrollView.frame.width * CGFloat(index)
            imageView.frame.origin.y = 0
        }
        
        let contentWidth = scrollView.frame.width * CGFloat(imageViews.count)
        scrollView.contentSize = CGSize(width: contentWidth,
                                        height: scrollView.frame.height)
    }
    
    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
        let offset = scrollView.frame.width * CGFloat(pageControl.currentPage)
        scrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
    }
}

extension GeneralScrollViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = (scrollView.contentOffset.x / scrollView.frame.width)
        let roundedPageIndex = Int(round(Double(pageIndex)))
        pageControl.currentPage = roundedPageIndex
    }
}
