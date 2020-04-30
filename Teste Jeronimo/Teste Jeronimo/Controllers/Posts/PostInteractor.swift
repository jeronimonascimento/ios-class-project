//
//  PostInteractor.swift
//  Teste Jeronimo
//
//  Created by Jeronimo Junior on 30/04/20.
//  Copyright © 2020 Jeronimo Junior. All rights reserved.
//

import Foundation

protocol PostInteractorInput: class {
    func getPosts()
}

protocol PostInteractorOutput: class {
    func resultPosts(posts: [Post])
    func errorPosts(message: String)
}

class PostInteractor: PostInteractorInput{
    
    lazy var provider: PostProvider = {
        return PostProvider()
    }()
    
    var interactorOutput: PostInteractorOutput?
    
    func getPosts() {
        self.provider.getPosts(completion: { (result) in
            switch result {
            case .success(let posts):
                self.interactorOutput?.resultPosts(posts: posts)
            case .failure(let error):
                self.interactorOutput?.errorPosts(message: error.localizedDescription)
            }
        })
    }
}



