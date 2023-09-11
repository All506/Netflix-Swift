//
//  HomeViewController.swift
//  Netflix-App
//
//  Created by Allan Trejos Salazar on 11/9/23.
//

import UIKit

class HomeViewController: UIViewController {

    private let homeFeedTable: UITableView = {
        //To take styles inside sections
        let table = UITableView(frame: .zero, style: .grouped)
        //Feeds table with CollecitonViewTableViewCell
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        //Let a space for hero view
        homeFeedTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //Will take the whole screen
        homeFeedTable.frame = view.bounds
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Will return one CollectionViewTableViewCell for each cell but if does not
        //one, it will create a UITableViewCell by default
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {return UITableViewCell()}
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //Height over the table
        return 40
    }
    
}
