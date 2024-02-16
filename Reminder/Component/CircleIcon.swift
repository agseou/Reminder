//
//  CircleIcon.swift
//  Reminder
//
//  Created by 은서우 on 2024/02/15.
//

import UIKit

class CircleIcon: UIButton {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: "calendar")
        config.cornerStyle = .capsule
        self.configuration = config
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
