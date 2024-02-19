//
//  TodoViewController.swift
//  Reminder
//
//  Created by 은서우 on 2024/02/19.
//

import UIKit
import SnapKit
import RealmSwift

class TodoViewController: BaseViewController {
    
    let tableView = UITableView()
    let repository = ReminderRepository()
    var list: Results<ReminderModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = repository.fetchItem()
        
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
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath) as! TodoTableViewCell
        
        cell.selectionStyle = .none
        let item = list[indexPath.row]
        
        cell.titleLabel.text = item.title
        cell.detailLabel.text =  item.memo
        cell.dateLabel.text = item.finalDate?.formattedDate
        cell.tagsLabel.text = item.tags
        
        return cell
    }
    
}
