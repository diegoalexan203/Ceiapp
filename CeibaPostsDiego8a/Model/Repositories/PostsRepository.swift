//
//  PostsRepository.swift
//  CeibaPostsDiego8a
//
//  Created by Diego on 6/07/21.
//

import Alamofire
import Foundation
import Moya
import RxSwift

class PostsRepository: PostsRepositoryBehavior {
    
    let api = MoyaProvider<PostsApi>(session :  Alamofire.Session.init())
    func getUsers() throws -> Observable<[User]> {
        api.rx.request(PostsApi.getUsers).asObservable().flatMap({ Response -> Observable<[User]> in
            
            if Response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let resultGetUsers = try decoder.decode([User].self, from: Response.data)
                    return Observable.just(resultGetUsers)
                }
            } else {
                let error = NSError(domain: "Error PostsﬁApi", code: Response.statusCode, userInfo: ["Error": Response.statusCode.description])
                return Observable.error(error)
            }
        })
    }
    
    func getPosts(id: String) throws -> Observable<[Post]> {
        return api.rx.request(PostsApi.getPosts(id: id)).asObservable().flatMap({ Response -> Observable<[Post]> in

            if Response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let resultGetPosts = try decoder.decode([Post].self, from: Response.data)
                    return Observable.just(resultGetPosts)
                }
            } else {
                let error = NSError(domain: "Error PostsApi", code: Response.statusCode, userInfo: ["Error": Response.statusCode.description])
                return Observable.error(error)
            }

        })
    }
    
}
