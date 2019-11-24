//
//  CustomButton.swift
//  MVVMPracticeApplication
//
//  Created by Pramod Kumar on 22/11/19.
//  Copyright © 2019 Renu Devi. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    func commonInit() -> Void {
        // Register for `UIContentSizeCategory.didChangeNotification`
        NotificationCenter.default.addObserver(self, selector: #selector(preferredContentSizeChanged(_:)), name: UIContentSizeCategory.didChangeNotification, object: nil)

    }
    
    @objc func preferredContentSizeChanged(_ notification: Notification) {
        titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
    }
}
