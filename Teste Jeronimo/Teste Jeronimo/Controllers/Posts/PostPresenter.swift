//
//  PostPresenter.swift
//  Teste Jeronimo
//
//  Created by Jeronimo Junior on 30/04/20.
//  Copyright © 2020 Jeronimo Junior. All rights reserved.
//

import Foundation

protocol PostPresenterInput: class {
    func getPosts()
}

protocol PostPresenterOutput : class {
    func result(posts: [Post])
    func failure(message: String)
}

class PostPresenter: PostPresenterInput, PostInteractorOutput {
    
    private var interactor: PostInteractorInput?
    private var wireframe: PostWireframe?
    
    weak var presenterOutput: PostPresenterOutput?
    
    init(wireframe: PostWireframe, interactor: PostInteractorInput) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func getPosts() {
        self.interactor?.getPosts()
    }
    
    func resultPosts(posts: [Post]) {
        self.presenterOutput?.result(posts: posts)
    }
    
    func errorPosts(message: String) {
        self.presenterOutput?.failure(message: message)
    }
    
    
}
