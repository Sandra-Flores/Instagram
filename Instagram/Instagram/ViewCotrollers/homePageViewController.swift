//
//  HomePageViewController.swift
//  Instagram
//
//  Created by Sandra Flores on 2/25/18.
//  Copyright © 2018 Sandra Flores. All rights reserved.
//

import UIKit
import Parse

class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    @IBOutlet weak var PostTableView: UITableView!
    var refreshControl : UIRefreshControl!
    var posts: [Post] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPosts()
        
        PostTableView.dataSource = self
        PostTableView.delegate = self
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(HomePageViewController.didPullToRefresh(_:)), for: .valueChanged)
        
        PostTableView.insertSubview(refreshControl, at: 0)
        fetchPosts()
        
    }

    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        fetchPosts()
    }
    
    func fetchPosts(){
        let query = Post.query()
        query?.limit = 20
        query?.order(byDescending: "_created_at")
        query?.findObjectsInBackground(block: { (posts, error) in
            if(posts != nil){
                
                self.posts = posts as! [Post]
                self.PostTableView.reloadData()
                self.refreshControl.endRefreshing()
            }
            else{
                print(error?.localizedDescription)
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if posts != nil{
            return posts.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PostTableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath as IndexPath) as! PostCell
        let Post = posts[indexPath.row]
        
        cell.postCaptionLabel.text = Post.caption
        cell.postImageView.file = Post.media
        cell.postImageView.loadInBackground()
        
        return cell
    }
    
    @IBAction func onLogOutPress(_ sender: Any) {
        //TODO: logout
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! PostCell
        
        //if let indexPath = PostTableView.indexPath(for: cell){
            
            //let postIndexPath = posts[indexPath.row]
            //let detailViewController = segue.destination as! PostDetailsViewController
            
            //detailViewController.postImageFile = postIndexPath.media
           // detailViewController.captionString = postIndexPath.caption
            
            //let df = DateFormatter()
//            df.dateStyle = .short
//            df.timeStyle = .short
//            df.locale = Locale.current
//            
            //detailViewController.timeStampString = df.string(from: self.posts[(indexPath.section)].createdAt!)
        //}
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
