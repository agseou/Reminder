//
//  MainItemCollectionViewCell.swift
//  Reminder
//
//  Created by 은서우 on 2024/02/15.
//

import UIKit
import SnapKit

class MainItemCollectionViewCell: BaseCollectionViewCell {
    
    // 앱을 직접 사용하니 long press 제스쳐? 적용해보면 좋겠다고 생각함
    let view = UIView()
    let number = UILabel()
    let icon = CircleIcon()
    let title = UILabel()
    
    override func configureHierarchy() {
        contentView.addSubview(view)
        view.addSubview(number)
        view.addSubview(icon)
        view.addSubview(title)
    }
    
    override func configureView() {
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        
        number.font = .systemFont(ofSize: 26, weight: .bold)
        number.text = "3"
        
        title.text = "오늘"
    }
    
    override func configureLayout() {
        view.snp.makeConstraints {
            $0.horizontalEdges.equalTo(contentView).inset(20)
            $0.verticalEdges.equalTo(contentView).inset(10)
        }
        number.snp.makeConstraints {
            $0.top.equalTo(view).inset(10)
            $0.right.equalTo(view).inset(10)
        }
        icon.snp.makeConstraints {
            $0.top.equalTo(view).inset(10)
            $0.left.equalTo(view).inset(10)
        }
        title.snp.makeConstraints {
            $0.bottom.equalTo(view).inset(10)
            $0.left.equalTo(view).inset(10)
        }
    }
}
