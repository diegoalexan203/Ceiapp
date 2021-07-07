//
//  PostsBL.swift
//  CeibaPostsDiego8a
//
//  Created by Diego on 6/07/21.
//

import Alamofire
import Foundation
import Moya
import RxSwift

class PostsBL:PostsBLBehavior {
    
    var postsRepository: PostsRepositoryBehavior
    
    
    init(repository: PostsRepositoryBehavior) {
        postsRepository = repository
    }
    
    init(){
        postsRepository = PostsRepository()
    }
    func getUsers() throws -> Observable<[User]> {
        return try postsRepository.getUsers().asObservable().flatMap({
            response -> Observable<[User]> in
            Observable.just(response)
        })
    }
    
    func getPosts(id: String) throws -> Observable<[Post]> {
        return try postsRepository.getPosts(id: id).asObservable().flatMap({
            response -> Observable<[Post]> in
            Observable.just(response)
        })
    }

}
