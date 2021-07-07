//
//  PostsRepositoryBehavior.swift
//  CeibaPostsDiego8a
//
//  Created by Diego on 6/07/21.
//

import Foundation
import RxSwift

protocol PostsRepositoryBehavior {
    func getPosts(id: String) throws -> Observable<[Post]>
    func getUsers() throws -> Observable<[User]>
}
