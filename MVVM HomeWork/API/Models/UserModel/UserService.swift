//
//  UserService.swift
//  HomeWork3
//
//  Created by emre usul on 6.04.2022.
//

import Foundation
import Alamofire

protocol UserServiceProtocol {
    func getUserList(completion: @escaping (Result<[UsersList],Error>) -> Void)
}


class UserService: UserServiceProtocol  {
    
    public init() {}
    
    func getUserList(completion: @escaping (Result<[UsersList], Error>) -> Void) {
       let urlString = "https://jsonplaceholder.typicode.com/users"
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.decoderUser
                do {
                    let userList = try decoder.decode([UsersList].self, from: data)
                    
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
