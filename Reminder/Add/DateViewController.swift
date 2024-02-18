//
//  DateViewController.swift
//  Reminder
//
//  Created by 은서우 on 2024/02/15.
//

import UIKit
import SnapKit

class DateViewController: BaseViewController {
    
    var datePicker: UIDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.post(name: Notification.Name("didSelectDate"), object: nil, userInfo: ["selectedDate": datePicker.date])
        
        datePicker.addTarget(self, action: #selector(didSelectDate), for: .valueChanged)
    }

    @objc func didSelectDate() {
        // NotificationCenter를 사용하여 선택된 날짜를 알림으로 보냅니다.
        NotificationCenter.default.post(name: Notification.Name("didSelectDate"), object: nil, userInfo: ["selectedDate": datePicker.date])
    }
    
    
    override func configureHierarchy() {
        view.addSubview(datePicker)
    }
    
    
    override func configureView() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
    }
    
    override func configureLayout() {
        datePicker.snp.makeConstraints {
            $0.center.equalTo(view)
        }
    }
}
