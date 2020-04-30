//
//  PostWireframe.swift
//  Teste Jeronimo
//
//  Created by Jeronimo Junior on 30/04/20.
//  Copyright © 2020 Jeronimo Junior. All rights reserved.
//

import Foundation

class PostWireframe {
    
    var presenter: PostPresenter?
    
    static func setUp(vc: PostsViewViewController){
        let interactor = PostInteractor()
        let wireframe  = PostWireframe()
        let presenter  = PostPresenter(wireframe: wireframe, interactor: interactor)

        vc.inputPresenter = presenter
        interactor.interactorOutput = presenter
        presenter.presenterOutput = vc

    }
}
