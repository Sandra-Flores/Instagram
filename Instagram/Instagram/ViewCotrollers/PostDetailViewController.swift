//
//  PostDetailViewController.swift
//  Instagram
//
//  Created by Sandra Flores on 3/2/18.
//  Copyright © 2018 Sandra Flores. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostDetailViewController: UIViewController {

    @IBOutlet weak var profileImageView: PFImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postImageView: PFImageView!
    @IBOutlet weak var postCaptionLabel: UILabel!
    
    var imageFile: PFFile!
    var userName: String!
    var postDate: String!
    var profileImage: PFFile!
    var postCaption: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImageView.file = imageFile
        postImageView.loadInBackground()
        
        usernameLabel.text = userName
        postCaptionLabel.text = postCaption
        dateLabel.text = postDate
        profileImageView.image = #imageLiteral(resourceName: "profile_tab")
        
        print(postCaptionLabel.text)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
