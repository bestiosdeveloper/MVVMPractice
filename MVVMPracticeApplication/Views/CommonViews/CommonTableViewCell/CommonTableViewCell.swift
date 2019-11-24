//
//  CommonTableViewCell.swift
//  MVVMPracticeApplication
//
//  Created by Renu Devi on 21/11/19.
//  Copyright © 2019 Renu Devi. All rights reserved.
//

import UIKit

class CommonTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nextButton: CustomButton!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    static let reusableIdentifier: String = "CommonTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.cornerRadius = 8.0
        selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureData(transection: Transaction) {
        self.detailLabel.text = transection.title
        
        let amountStr = "\(AppConstant.currentCurrency)\(transection.price)"
        self.amountLabel.text = amountStr
        self.nextButton.setTitle(amountStr, for: .normal)
        
    }

}
