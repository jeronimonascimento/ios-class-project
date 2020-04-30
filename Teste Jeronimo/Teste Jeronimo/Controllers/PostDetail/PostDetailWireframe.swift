//
//  PostDetailWireframe.swift
//  Teste Jeronimo
//
//  Created by Jeronimo Junior on 30/04/20.
//  Copyright © 2020 Jeronimo Junior. All rights reserved.
//

import Foundation

class PostDetailWireframe {
    
    var presenter: PostDetailPresenter?
    
    static func setUp(vc: PostDetailViewController) {
        let interactor = PostDetailInteractor()
        let wireframe  = PostDetailWireframe()
        let presenter  = PostDetailPresenter(wireframe: wireframe, interactor: interactor)
        
        vc.inputPresenter = presenter
        interactor.interactorOutput = presenter
        presenter.presenterOutput = vc
    }
}
