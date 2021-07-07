//
//  DetailsUserPostsViewController.swift
//  CeibaPostsDiego8a
//
//  Created by Diego on 7/07/21.
//

import Foundation
import RxSwift
import UIKit

class DetailsUserPostsViewController: UIViewController {
    var user: User!
    var posts: [Post] = []
    let disposeBag = DisposeBag()
    let userPostsViewModel = DetailsUserPostsViewModel()

    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userEmailLabel: UILabel!
    @IBOutlet var userPhoneLabel: UILabel!

    @IBOutlet var postsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bind()
    }

    func setUI() {
        userNameLabel.text = user?.name
        userEmailLabel.text = user?.email
        userPhoneLabel.text = user?.phone
    }

    func bind() {
        if user != nil {
            userPostsViewModel.input.userId.accept("\(user.id ?? 0)")
            userPostsViewModel.output.posts.asObservable().subscribe(
                onNext: { posts in
                    self.cleanTable()
                    for post in posts ?? [] {
                        self.posts.append(post)
                        self.updateTable()
                    }

                }).disposed(by: disposeBag)
        }
    }

    func cleanTable() {
        postsTableView.endUpdates()
        posts.removeAll()
        postsTableView.reloadData()
    }

    func updateTable() {
        let indexPath = IndexPath(row: posts.count - 1, section: 0)

        postsTableView.beginUpdates()
        postsTableView.insertRows(at: [indexPath], with: .automatic)
        postsTableView.endUpdates()
    }
}

extension DetailsUserPostsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell") as! DetailsCell
        cell.setCell(post: post)
        return cell
    }
}
