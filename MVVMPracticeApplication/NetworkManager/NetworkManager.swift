//
//  CommonTableViewCell.swift
//  MVVMPracticeApplication
//
//  Created by Pramod Kumar on 21/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import UIKit

struct NetworkManager {
    
    //MARK:- Properties
    //MARK:-
    static let shared = NetworkManager()
    
    
    //MARK:- Methods
    //MARK:- Private
    private init() {}
    
    //MARK:- Public
    func getHomeData(completion: ((Bool, AssetModel?) -> Void)) {
        guard let filePath = Bundle.main.path(forResource: "Data", ofType: "json") else {
            completion(false, nil)
            return
        }
        
        
        printDebug(filePath)
        guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath), options: .dataReadingMapped) else {
            completion(false, nil)
            return
        }
        
        let decoder = JSONDecoder()
        let assetM = try? decoder.decode(AssetModel.self, from: jsonData)
        completion(true, assetM)
    }
}
