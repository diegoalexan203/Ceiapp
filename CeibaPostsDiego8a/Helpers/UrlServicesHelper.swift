//
//  UrlServicesHelper.swift
//  CeibaPostsDiego8a
//
//  Created by Diego on 6/07/21.
//

import Foundation
enum UrlServicesHelper: CustomStringConvertible {
    case getPosts
    case getUsers

    var description: String {
        switch self {
        case .getPosts:
            return "posts"
        case .getUsers:
            return "users"
        }
    }
}
