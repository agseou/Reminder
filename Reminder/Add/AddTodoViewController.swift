//
//  AddTodoViewController.swift
//  Reminder
//
//  Created by 은서우 on 2024/02/15.
//

import UIKit
import SnapKit

class AddTodoViewController: BaseViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    var date: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(receiveDate), name: NSNotification.Name("didSelectDate"), object: nil)
        
    }
    
    override func configureHierarchy() {
        view.addSubview(tableView)
    }
    
    override func configureView() {
        self.title = "새로운 미리 알림"
        
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(tapCancelButton))
        self.navigationItem.leftBarButtonItem = cancelButton
        
        // Create the "Add" button on the right
        let addButton = UIBarButtonItem(title: "추가", style: .done, target: self, action: #selector(tapAddButtonTapped))
        self.navigationItem.rightBarButtonItem = addButton
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func configureLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc func tapCancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func tapAddButtonTapped() {
        print("Add action triggered")
    }
    
    @objc func receiveDate(_ notification: NSNotification) {
        if let date = notification.userInfo?["selectedDate"] as? String {
            self.date = date
        }
    }
}

extension AddTodoViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension AddTodoViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        switch indexPath.section {
        case 0:
            let textField = UITextField()
            textField.placeholder = "입력하세여"
            cell.contentView.addSubview(textField)
            textField.delegate = self // Set the delegate
            
            textField.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(15)
            }
        case 1:
            cell.textLabel?.text = "마감일"
            cell.detailTextLabel?.text = date
            cell.accessoryType = .disclosureIndicator
        case 2:
            cell.textLabel?.text = "태그"
            cell.accessoryType = .disclosureIndicator
        case 3:
            cell.textLabel?.text = "우선순위"
            cell.accessoryType = .disclosureIndicator
        case 4:
            cell.textLabel?.text = "이미지 추가"
            cell.accessoryType = .disclosureIndicator
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            if let textFieldCell = tableView.cellForRow(at: indexPath),
               let textField = textFieldCell.contentView.subviews.first(where: { $0 is UITextField }) as? UITextField {
                textField.becomeFirstResponder()
            }
            
        case 1:
            let dateVC = DateViewController()
            dateVC.view.backgroundColor = .white
            dateVC.title = "마감일"
            navigationController?.pushViewController(dateVC, animated: true)
            
        case 2:
            let tagsVC = TagViewController()
            tagsVC.view.backgroundColor = .white
            tagsVC.title = "태그"
            navigationController?.pushViewController(tagsVC, animated: true)
            
        case 3:
            let priorityVC = PriorityViewController()
            priorityVC.view.backgroundColor = .white
            priorityVC.title = "우선순위"
            navigationController?.pushViewController(priorityVC, animated: true)
            
        case 4: break
            // 이미지 피커
            
        default:
            break
        }
    }
}
