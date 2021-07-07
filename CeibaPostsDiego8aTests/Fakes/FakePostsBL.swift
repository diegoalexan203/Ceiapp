//
//  FakePostsBL.swift
//  CeibaPostsDiego8aTests
//
//  Created by Diego on 7/07/21.
//

@testable import CeibaPostsDiego8a
import Foundation
import RxCocoa
import RxSwift
import RxTest
import XCTest

class FakePostsBL: PostsBL {
    override init() {
        super.init()
    }

    override func getUsers() throws -> Observable<[User]> {
        var userResponse = [User]()

        let user1 = User(id: 1, name: "Diego Ochoa", username: "dochoaz", email: "diegoalexan203@gmail.com", phone: "3004546846", website: "https://diegoalexander8a.blogspot.com.co/")
        let user2 = User(id: 2, name: "Maria Eugenia Mejia", username: "mmejia", email: "eugeniagilm@hotmail.com", phone: "3017481551", website: "")
     
        userResponse.append(user1)
        userResponse.append(user2)

        return Observable<[User]>.from(optional: userResponse)
    }

    override func getPosts(id: String) throws -> Observable<[Post]> {
        var postResponse = [Post]()

        let post1 = Post(userId: 1, id: 1, title: "Lorem", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tristique et egestas quis ipsum suspendisse ultrices gravida dictum. Scelerisque felis imperdiet proin fermentum leo vel orci porta. Quis lectus nulla at volutpat diam ut venenatis tellus. Elit ullamcorper dignissim cras tincidunt lobortis. A cras semper auctor neque vitae tempus quam pellentesque nec. Lorem mollis aliquam ut porttitor leo. Tincidunt lobortis feugiat vivamus at. Mauris ultrices eros in cursus turpis massa tincidunt. Purus sit amet volutpat consequat mauris nunc congue. Ac feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper. Est sit amet facilisis magna etiam tempor orci eu. Pharetra convallis posuere morbi leo urna molestie at. Tellus pellentesque eu tincidunt tortor aliquam nulla. At lectus urna duis convallis convallis tellus id. Amet risus nullam eget felis eget nunc. Nibh venenatis cras sed felis eget. Egestas tellus rutrum tellus pellentesque eu.")
        
        let post2 = Post(userId: 1, id: 2, title: "Lorem Ipsum Generator", body: "Generate Lorem Ipsum placeholder text. Select the number of characters, words, sentences or paragraphs, and hit generate!")
        
        let post3 = Post(userId: 2, id: 3, title: "Lorem Ipsum Generator 3", body: "Generate Lorem Ipsum placeholder text. Select the number of characters, words, sentences or paragraphs, and hit generate!")
        
        postResponse.append(post1)
        postResponse.append(post2)
        postResponse.append(post3)
        
        return Observable<[Post]>.from(optional: postResponse.filter{post in return  post.userId == Int(id)})
    }
}
