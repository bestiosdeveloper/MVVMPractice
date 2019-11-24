//
//  CommonTableViewCell.swift
//  MVVMPracticeApplication
//
//  Created by Pramod Kumar on 21/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import UIKit


struct Transaction: Codable {
    var title: String = ""
    var price: String = ""
    
    enum CodingKeys : String,CodingKey {
        case title
        case price
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.price = try container.decode(String.self, forKey: .price)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.price, forKey: .price)
    }
}

struct AssetModel: Codable {
    
    var checking: [Transaction] = []
    var investment: [Transaction] = []
    
    enum TopLevelCodingKeys: String, CodingKey {
        case data
    }
    enum AssetModelCodingKeys: String, CodingKey {
        case checking
        case investment
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TopLevelCodingKeys.self)
        let assetContainer = try container.nestedContainer(keyedBy: AssetModelCodingKeys.self, forKey: .data)
        checking = try assetContainer.decode([Transaction].self, forKey: .checking)
        investment = try assetContainer.decode([Transaction].self, forKey: .investment)
    }
}
