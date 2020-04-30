//
//  PostsViewViewController.swift
//  Teste Jeronimo
//
//  Created by Jeronimo Junior on 30/04/20.
//  Copyright © 2020 Jeronimo Junior. All rights reserved.
//

import UIKit

class PostsViewViewController: UIViewController, PostPresenterOutput {
    @IBOutlet weak var tableView: UITableView!
    
    var inputPresenter: PostPresenterInput!
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "Post", bundle: nil), forCellReuseIdentifier: "postCell")
        PostWireframe.setUp(vc: self)
        self.showLoading()
        inputPresenter.getPosts()
        setNeedsStatusBarAppearanceUpdate()

        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let post = sender as? Post, let destination = segue.destination as? PostDetailViewController else { return }
        destination.post = post
    }
    
    func result(posts: [Post]) {
        self.hideLoading()
        self.posts = posts
        self.tableView.reloadData()
    }
    
    func failure(message: String) {
        self.hideLoading()
        self.alertMessage(title: "Falha", msg: message, btn: "OK")
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

extension PostsViewViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = self.posts[indexPath.row]
        self.performSegue(withIdentifier: "postDetailSegue", sender: post)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! PostTableViewCell
        let postObject = self.posts[indexPath.row]
        
        cell.bodyLabel.text = postObject.body
        cell.titleLabel.text = postObject.title
        return cell
    }
    
}
