//
//  PostDetailPresenter.swift
//  Teste Jeronimo
//
//  Created by Jeronimo Junior on 30/04/20.
//  Copyright © 2020 Jeronimo Junior. All rights reserved.
//

import Foundation

protocol PostDetailPresenterInput : class {
    func getPostDetail(postId: Int)
}

protocol PostDetailPresenterOutput : class{
    func result(comments: [PostDetail])
    func failure(message: String)
}

class PostDetailPresenter : PostDetailPresenterInput, PostDetailInteractorOutput{
    private var interactor : PostDetailInteractor!
    private var wireframe: PostDetailWireframe?
    
    weak var presenterOutput: PostDetailPresenterOutput?
    
    init(wireframe: PostDetailWireframe, interactor: PostDetailInteractor) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func getPostDetail(postId: Int) {
        self.interactor.getPostDetail(postId: postId)
    }
    
    func resultComments(comments: [PostDetail]) {
        self.presenterOutput?.result(comments: comments)
    }
    
    func errorComments(message: String) {
        self.presenterOutput?.failure(message: message)
    }
}
