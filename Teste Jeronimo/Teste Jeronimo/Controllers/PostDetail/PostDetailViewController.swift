//
//  PostDetailViewController.swift
//  Teste Jeronimo
//
//  Created by Jeronimo Junior on 30/04/20.
//  Copyright © 2020 Jeronimo Junior. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController, PostDetailPresenterOutput {

    @IBOutlet weak var comentTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var inputPresenter: PostDetailPresenterInput!
    var comments: [PostDetail] = []
    var post: Post?
    
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "PostDetail", bundle: nil), forCellReuseIdentifier: "postDetailCell")
       
        
        self.comentTitle.text = self.post?.title
        PostDetailWireframe.setUp(vc: self)
        guard let post = self.post else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        self.showLoading()
        self.inputPresenter.getPostDetail(postId: post.id)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func result(comments: [PostDetail]) {
        self.hideLoading()
        self.comments = comments
        self.tableView.reloadData()
    }
    
    func failure(message: String) {
        self.hideLoading()
        self.alertMessage(title: "Falha", msg: message, btn: "Ok")
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

extension PostDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "postDetailCell") as! PostDetailTableViewCell
        let postDetail = self.comments[indexPath.row]
        cell.userName.text = postDetail.name
        cell.userEmail.text = postDetail.email
        cell.comment.text = postDetail.body
        return cell
    }
    
    
}
