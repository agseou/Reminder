//
//  PriorityViewController.swift
//  Reminder
//
//  Created by 은서우 on 2024/02/15.
//

import UIKit
import SnapKit

class PriorityViewController: BaseViewController {
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    let list: [String] = ["없음", "낮음", "중간", "높음"]
    var seleted: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.post(name: Notification.Name("Priority"), object: nil, userInfo: ["selectedPriority": seleted])
    }
    
    override func configureHierarchy() {
        view.addSubview(tableView)
    }
    
    override func configureView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func configureLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
    }
    
    
    
}

extension PriorityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = list[indexPath.row]
        if seleted == list[indexPath.row] {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        seleted = list[indexPath.row]
        
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
