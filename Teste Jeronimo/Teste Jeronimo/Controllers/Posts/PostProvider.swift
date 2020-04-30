//
//  PostProvider.swift
//  Teste Jeronimo
//
//  Created by Jeronimo Junior on 30/04/20.
//  Copyright © 2020 Jeronimo Junior. All rights reserved.
//

import Foundation
import Alamofire

enum Result<T> {
    case success(T)
    case failure(Error)
}

class PostProvider {
    
    func getPosts(completion: @escaping (Result<[Post]>) -> Void){
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        AF.request(url)
            .validate()
            .responseDecodable(of: [Post].self) { response in
                switch response.result {
                case .success(let posts):
                    completion(.success(posts))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    func getPostDetail(postId: Int, completion: @escaping (Result<[PostDetail]>) -> Void){
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts/\(postId)/comments") else { return }
        
        AF.request(url)
            .validate()
            .responseDecodable(of: [PostDetail].self) { response in
                switch response.result {
                case .success(let comments):
                    completion(.success(comments))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    
}
