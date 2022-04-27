//
//  UserViewModel.swift
//  HomeWork3
//
//  Created by emre usul on 6.04.2022.
//

import Foundation

//ViewController tarafından erişilmek istediklerim
protocol UsersListViewModelProtocol {
    
    var delegate: UsersListViewModelDelegate? { get set }
    var numberOfItem: Int? { get }
    func getUserList()
   
    
}

//ViewControllere haber vermek istediklerim
protocol UsersListViewModelDelegate {
    
    func updateUserList(user: [UsersList])
}


final class UsersViewModel: UsersListViewModelProtocol {
    var numberOfItem: Int?
    var user:[UsersList]?
    var delegate: UsersListViewModelDelegate?
    var service: UserServiceProtocol = UserService()
    
    
    
    func getUserList() {
        service.getUserList { [self] response in
            switch response {
            case .success(let result):
                self.user = result
                self.numberOfItem  = self.user!.count
                self.delegate?.updateUserList(user: result)
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    
   
    
    
}
