//
//  UserPostViewModel.swift
//  HomeWork3
//
//  Created by emre usul on 7.04.2022.
//

import Foundation
import SwiftUI

protocol UserPostViewModelProtocol {
    var delegate: UserPostViewModelDelegate? { get set }
    var numberOfItems: Int? { get }
    func getPost()
}

protocol UserPostViewModelDelegate {
    
    func updatePostList(post:[UserPostList])
}

final class UserPostViewModel: UserPostViewModelProtocol {
    var numberOfItems: Int?
    var post:[UserPostList]?
    var delegate: UserPostViewModelDelegate?
    var service: UserPostServiceProtocol = UserPostService()
    
    
    func getPost() {
        service.getPostList { response in
            switch response {
            case .success(let result):
                self.post = result
                self.numberOfItems = self.post!.count - 90
                self.delegate?.updatePostList(post: result)
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    
    
}
