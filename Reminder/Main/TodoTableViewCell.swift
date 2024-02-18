//
//  TodoTableViewCell.swift
//  Reminder
//
//  Created by 은서우 on 2024/02/19.
//

import UIKit

class TodoTableViewCell: BaseTableViewCell {
    
    let checkButton = UIButton()
    let stackView = UIStackView()
    
    let titleLabel = UILabel()
    let detailLabel = UILabel()
    let dateLabel = UILabel()
    let tagsLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func configureHierarchy() {
        addSubview(checkButton)
        addSubview(stackView)
        
    }
    
    override func configureLayout() {
        checkButton.setImage(UIImage(systemName: "circle"), for: .normal)
        checkButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)

        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailLabel)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(tagsLabel)

        checkButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(44)
        }

        stackView.snp.makeConstraints { make in
            make.leading.equalTo(checkButton.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}

