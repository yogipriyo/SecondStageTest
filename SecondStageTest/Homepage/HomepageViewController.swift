//
//  HomepageViewController.swift
//  SecondStageTest
//
//  Created by Yogi Priyo Prayogo on 27/12/20.
//  Copyright © 2020 Yogi Priyo Prayogo. All rights reserved.
//

import UIKit

class HomepageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    let cellReuseIdentifier = "CategoryTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupTable()
    }
    
    private func setupTable() {
        self.categoryTableView.dataSource = self
        self.categoryTableView.delegate = self
        
        let categoryCell = UINib(nibName: "CategoryTableViewCell", bundle: nil)
        self.categoryTableView.register(categoryCell, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellReuseIdentifier) as? CategoryTableViewCell ?? UITableViewCell()
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mealListVC: MealListViewController = MealListViewController()
        self.navigationController?.pushViewController(mealListVC, animated: true)
    }

}
