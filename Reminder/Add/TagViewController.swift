//
//  TagViewController.swift
//  Reminder
//
//  Created by 은서우 on 2024/02/15.
//

import UIKit
import SnapKit

class TagViewController: BaseViewController {
    
    let textfield = UITextField()

    // 택스트 필드에 입력 후, 엔터를 누르면 태그가 상단에 추가!
    // 상단에 추가되고나서 추가된 셀 자체가 automaticheight!
    // 어떻게 해야할까?
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    override func configureHierarchy() {
        view.addSubview(textfield)
    }
    
    override func configureView() {
        
    }
    
    override func configureLayout() {
        textfield.snp.makeConstraints {
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
    }

}
