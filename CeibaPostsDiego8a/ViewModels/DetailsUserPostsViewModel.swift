//
//  DetailsUserPostsViewModel.swift
//  CeibaPostsDiego8a
//
//  Created by Diego on 7/07/21.
//

import Alamofire
import Foundation
import Moya
import RxCocoa
import RxSwift

class DetailsUserPostsViewModel: ViewModelProtocol {
    let disposeBag = DisposeBag()
    let usersDB = DBHelper()
    var postsBl: PostsBLBehavior

    struct Input {
        var viewShown = BehaviorRelay<Bool?>(value: false)
        var userId = BehaviorRelay<String?>(value: nil)
    }

    struct Output {
        var posts = BehaviorRelay<[Post]?>(value: nil)
    }

    let input: Input
    let output: Output

    init(postsBl: PostsBLBehavior) {
        input = Input()
        output = Output()
        self.postsBl = postsBl
        bind()
    }

    init() {
        input = Input()
        output = Output()
        postsBl = PostsBL(repository: PostsRepository())
        bind()
    }

    func bind() {
        input.userId.subscribe(onNext: { id in

            if id != nil {
                self.getUserPostsFromApi(id: id!)
            }

        }).disposed(by: disposeBag)
    }

    func getUserPostsFromApi(id: String) {
        do {
            try postsBl.getPosts(id: id).asObservable().retry(1).subscribe(onNext: { response in

                let posts = response

                self.output.posts.accept(posts)

            })

        } catch {
            print("Error", "No se pudo cargar el servicio")
        }
    }
}
