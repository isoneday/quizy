//
//  StartGuest.swift
//  quizy
//
//  Created by Steven Tandianus on 25/05/20.
//  Copyright © 2020 group8mc2. All rights reserved.
//

import UIKit

class StartGuest: UIViewController {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var createQuizBtn: RoundButton!
    @IBOutlet weak var joinQuizBtn: RoundButton!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var navBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImage.image = UIImage(named: "blank-profile-picture-973460_1280")
        circularImage()
        // Do any additional setup after loading the view.
    }
    
    func circularImage() {
        avatarImage.layer.cornerRadius = avatarImage.frame.size.height / 2
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.borderWidth = 0
    }
    
    @IBAction func createQuiz(_ sender: Any) {
    }
    
    @IBAction func joinQuiz(_ sender: Any) {
    }
    
}
