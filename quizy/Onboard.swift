//
//  ViewController.swift
//  quizy
//
//  Created by Iswandi Saputra on 18/05/20.
//  Copyright © 2020 group8mc2. All rights reserved.
//

import UIKit

class Onboard: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var startBtn: RoundButton!
    @IBOutlet weak var skipBtn: UIButton!
    
    var slides: [Slide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        // Do any additional setup after loading the view.
    }
    
    func showStartBtn(index: Int) {
        if index == 2 {
            startBtn.isHidden = false
        } else {
            startBtn.isHidden = true
        }
    }
    
    func hideSkipBtn(index: Int) {
        if index == 2 {
            skipBtn.isHidden = true
        } else {
            startBtn.isHidden = false
        }
    }
    
    @IBAction func getStarted(_ sender: UIButton) {

    }
    
    @IBAction func skipButton(_ sender: UIButton) {
        
    }
    
    func createSlides() -> [Slide] {

        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = UIImage(named: "900718")
        slide1.infoLabel.text = "Create quizes and share them with your students"
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(named: "yvxmD4")
        slide2.infoLabel.text = "Join The quiz and compete with your friends"
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageView.image = UIImage(named: "mountain_moon_nightscape_4k")
        slide3.infoLabel.text = "Use your reward and customize your profile"

        
        return [slide1, slide2, slide3]
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
            pageControl.currentPage = Int(pageIndex)
            
            let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
            let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
            
            // vertical
            let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
            let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
            
            let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
            let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
            
        
            let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
            
            if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
                
                slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
                slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
                
            } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
                slides[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
                slides[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
                
            }
        
        showStartBtn(index: Int(pageIndex))
        hideSkipBtn(index: Int(pageIndex))
    }
}

