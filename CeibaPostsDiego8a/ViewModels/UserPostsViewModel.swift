//
//  UserPostsViewModel.swift
//  CeibaPostsDiego8a
//
//  Created by Diego on 6/07/21.
//

import Foundation
import Moya
import RxCocoa
import RxSwift

class UsersViewModel: ViewModelProtocol {
    let disposeBag = DisposeBag()
    let usersDB = DBHelper()
    var postsBl: PostsBLBehavior

    struct Input {
        var viewShow = BehaviorRelay<Bool?>(value: false)
    }

    struct Output {
        var users = BehaviorRelay<[User]?>(value: nil)
        var loading = BehaviorRelay<Bool?>(value: false)
    }

    let input: Input
    let output: Output

    init(postsBL: PostsBLBehavior) {
        input = Input()
        output = Output()
        postsBl = postsBL
        bind()
        deleteDataBase()
    }

    init() {
        input = Input()
        output = Output()
        postsBl = PostsBL(repository: PostsRepository())
        bind()
    }

    func bind() {
        output.loading.accept(true)
        input.viewShow.subscribe(onNext: { show in

            if show ?? false {
                if !self.usersDB.usersTableHasData() {
                    self.getUsersFromApi()
                }

                self.showUsers()
            }

        }).disposed(by: disposeBag)
    }

    func getUsersFromApi() {
        do {
            try postsBl.getUsers().asObservable().retry(1)
                .subscribe(onNext: { response in
                    let users = response
                    for user in users {
                        self.usersDB.create(user: user)
                    }
                    self.showUsers()
                })
        } catch {
            print("Error", "No se pudo cargar el servicio")
        }
    }

    func showUsers() {
        output.users.accept(usersDB.getUsers())
        output.loading.accept(false)
    }

    func deleteDataBase() {
        usersDB.deleteAll()
    }
}
