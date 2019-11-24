//
//  ViewController.swift
//  MVVMPracticeApplication
//
//  Created by Pramod Kumar on 11/09/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import UIKit

protocol HomeViewModelDelegate: class {
    func fetchHomeDataSuccess()
    func fetchHomeDataFail()
}

class HomeViewModel {

    //MARK:- Properties
    //MARK:- Public
    private(set) var allTransaction: AssetModel?
    
    weak var delegate: HomeViewModelDelegate? = nil
    
    var numberOfSection: Int {
        
        var temp: Int = 0

        guard let trans = allTransaction else {
            return temp
        }
        
        if !trans.checking.isEmpty {
            temp = temp + 1
        }
        if !trans.investment.isEmpty {
            temp = temp + 1
        }
        
        return temp
    }
    
    //MARK:- Methods
    //MARK:- Public
    func fetchHomeData() {
        NetworkManager.shared.getHomeData { [weak self](sucess, data) in
            guard let `self` = self else {return}
            
            if sucess {
                self.allTransaction = data
                self.delegate?.fetchHomeDataSuccess()
            }
            else {
                self.delegate?.fetchHomeDataFail()
            }
        }
    }
 
}
