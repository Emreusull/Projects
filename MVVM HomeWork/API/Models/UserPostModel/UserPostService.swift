//
//  UserPostService.swift
//  HomeWork3
//
//  Created by emre usul on 7.04.2022.
//

import Foundation
import Alamofire

protocol UserPostServiceProtocol {
    func getPostList(completion: @escaping (Result<[UserPostList],Error>) -> Void)
}


class UserPostService: UserPostServiceProtocol  {
    
    public init() {}
    
    func getPostList(completion: @escaping (Result<[UserPostList], Error>) -> Void) {
       let urlString = "https://jsonplaceholder.typicode.com/posts"
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.decoderUser
                do {
                    let userList = try decoder.decode([UserPostList].self, from: data)
                    
                    completion(.success(userList))
                } catch {
                    print("******* JSON DECODE ERROR ******")
                }
            case .failure(let error):
                completion(.failure(error))
            }
    
        }
    }
    
}
