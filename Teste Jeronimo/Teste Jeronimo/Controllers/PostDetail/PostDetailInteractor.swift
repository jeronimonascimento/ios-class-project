//
//  PostDetailInteractor.swift
//  Teste Jeronimo
//
//  Created by Jeronimo Junior on 30/04/20.
//  Copyright © 2020 Jeronimo Junior. All rights reserved.
//

import Foundation

protocol PostDetailInteractorInput: class {
    func getPostDetail(postId: Int)
}

protocol PostDetailInteractorOutput: class {
    func resultComments(comments: [PostDetail])
    func errorComments(message: String)
}


class PostDetailInteractor: PostDetailInteractorInput {
    
    lazy var provider: PostProvider = {
        return PostProvider()
    }()
    
    var interactorOutput: PostDetailInteractorOutput?
    
    func getPostDetail(postId: Int) {
        self.provider.getPostDetail(postId: postId) { (result) in
            switch result {
            case .success(let comments):
                self.interactorOutput?.resultComments(comments: comments)
            case .failure(let error):
                self.interactorOutput?.errorComments(message: error.localizedDescription)
            }
        }
    }
}
