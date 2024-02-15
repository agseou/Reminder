//
//  MainViewController.swift
//  Reminder
//
//  Created by 은서우 on 2024/02/14.
//

import UIKit
import SnapKit

class MainViewController: BaseViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectoinViewLayout())
    var addTodoButton: UIBarButtonItem!
    var addListButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
    }
    
    override func configureHierarchy() {
        view.addSubview(collectionView)
    }
    
    override func configureView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainItemCollectionViewCell.self, forCellWithReuseIdentifier: "MainItemCollectionViewCell")
        collectionView.backgroundColor = .clear
        
        self.navigationItem.searchController = searchController
        let editButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(tapEditButton))
        navigationItem.rightBarButtonItem = editButton
        
        self.navigationController?.isToolbarHidden = false
        
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.title = "새로운 미리 알림"
        buttonConfig.image = UIImage(systemName: "plus.circle.fill")
        let button = UIButton(configuration: buttonConfig)
        button.addTarget(self, action: #selector(tapAddTodoButton), for: .touchUpInside)
        
        addTodoButton = UIBarButtonItem(customView: button)
        addListButton = UIBarButtonItem(title: "목록 추가", style: .plain, target: self, action: #selector(tapAddListButton))
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        var items = [UIBarButtonItem]()
        
        [addTodoButton,flexibleSpace,addListButton].forEach {
            items.append($0)
        }
        
        self.toolbarItems = items
    }
    
    override func configureLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    static func configureCollectoinViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width/2
        layout.itemSize = CGSize(width: width, height: width/2)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        return layout
    }
    
    @objc func tapEditButton() {
        print("tapEditButton tapped")
    }
    
    @objc func tapAddTodoButton() {
        let vc = UINavigationController(rootViewController: AddTodoViewController())
        present(vc, animated: true)
    }
    
    
    @objc func tapAddListButton() {
        
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainItemCollectionViewCell", for: indexPath) as! MainItemCollectionViewCell
        
        return cell
    }
    
    
}
