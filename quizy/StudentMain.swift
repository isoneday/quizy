//
//  ViewController.swift
//  quizy
//
//  Created by Steven Tandianus on 27/05/20.
//  Copyright © 2020 group8mc2. All rights reserved.
//

import UIKit

class StudentMain: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    

    @IBOutlet weak var avatarImageSmall: UIImageView!
    @IBOutlet weak var avatarImageLarge: UIImageView!
    @IBOutlet weak var pinTxtField: UITextField!
    @IBOutlet weak var joinBtn: RoundButton!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var rankLbl: UILabel!
    
    var countQuizHistory:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAvatarImage()
        getName()
        getRank()
        // Do any additional setup after loading the view.
    }
    
    //Bikin Avatar Circular
    func circularImage() {
        avatarImageSmall.layer.cornerRadius = avatarImageSmall.frame.size.height / 2
        avatarImageSmall.layer.masksToBounds = true
        avatarImageSmall.layer.borderWidth = 0
        
        avatarImageLarge.layer.cornerRadius = avatarImageLarge.frame.size.height / 2
        avatarImageLarge.layer.masksToBounds = true
        avatarImageLarge.layer.borderWidth = 0
    }
    
    //Ambil avatar yang lagi di equip ama user / klo equip default UIImage(named: "blank-profile-picture-973460_1280")
    func getAvatarImage() {
        avatarImageSmall.image = UIImage(named: "blank-profile-picture-973460_1280")
        avatarImageLarge.image = UIImage(named: "blank-profile-picture-973460_1280")
        circularImage()
    }
    
    //Ambil nama dari database
    func getName() {
        profileBtn.setTitle("", for: .normal)
    }
    
    //Ambil rank yang lagi di equip ama user / klo default "Untitled People"
    func getRank() {
        rankLbl.text = "Untitled People"
    }
    
    @IBAction func quizPinTextField(_ sender: Any) {
        
    }
    
    @IBAction func joinQuizBtn(_ sender: Any) {
        
    }
    
    //Setting TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Return jumlah row sesuai quiz yang udh dikerjain
        return countQuizHistory
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
