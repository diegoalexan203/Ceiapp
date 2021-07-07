//
//  CeibaPostsDiego8aTests.swift
//  CeibaPostsDiego8aTests
//
//  Created by Diego on 6/07/21.
//

@testable import CeibaPostsDiego8a
import RxCocoa
import RxSwift
import RxTest
import XCTest

class UserPostsTests: XCTestCase {
    var scheduler: TestScheduler!
    var disposebag: DisposeBag!

    override func setUp() {
        scheduler = TestScheduler(initialClock: 0)
        disposebag = DisposeBag()
    }

    func testGetUsersShow() {
        let fake = FakePostsBL()
        let viewModel = UsersViewModel(postsBL: fake) // UsersViewModel(postsBL: fake)
        viewModel.input.viewShow.accept(true)

        let users = scheduler.createObserver([User]?.self)
        viewModel.output.users.asDriver().drive(users).disposed(by: disposebag)

        scheduler.start()

        let usersVM = viewModel.output.users.value
        XCTAssertNotNil(usersVM)
        viewModel.deleteDataBase()
    }
    
    
}
