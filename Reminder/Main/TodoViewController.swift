//
//  TodoViewController.swift
//  Reminder
//
//  Created by 은서우 on 2024/02/19.
//

import UIKit
import SnapKit

class TodoViewController: BaseViewController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configureHierarchy() {
        view.addSubview(tableView)
    }
    
    override func configureView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "TodoTableViewCell")
    }
    
    override func configureLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension TodoViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath) as! TodoTableViewCell
        
        cell.selectionStyle = .none
        
        cell.titleLabel.text = "Title \(indexPath.row)"
        cell.detailLabel.text = "Details for item \(indexPath.row)"
        cell.dateLabel.text = "Date: \(Date())"
        cell.tagsLabel.text = "Tags: Example"
        
        return cell
    }
    
}
