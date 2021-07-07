//
//  DetailsUsersPostsTest.swift
//  CeibaPostsDiego8aTests
//
//  Created by Diego on 7/07/21.
//

import Foundation
import RxCocoa
import RxSwift
import RxTest
import XCTest


class DetailsUsersPostsTest: XCTestCase {
    var scheduler: TestScheduler!
    var disposebag: DisposeBag!

    override func setUp() {
        scheduler = TestScheduler(initialClock: 0)
        disposebag = DisposeBag()
    }


    func testGestPostUserExist() {
        let fake = FakePostsBL()
        let viewModel = DetailsUserPostsViewModel(postsBl: fake)
        viewModel.input.viewShown.accept(true)
        viewModel.input.userId.accept("1")

        let posts = scheduler.createObserver([Post]?.self)
        viewModel.output.posts.asDriver().drive(posts).disposed(by: disposebag)
        
        scheduler.start()
        let postsReturn = viewModel.output.posts.value
        XCTAssertNotNil(postsReturn)
        
    }
}
