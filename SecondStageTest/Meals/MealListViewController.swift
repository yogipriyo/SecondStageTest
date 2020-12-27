//
//  MealListViewController.swift
//  SecondStageTest
//
//  Created by Yogi Priyo Prayogo on 27/12/20.
//  Copyright © 2020 Yogi Priyo Prayogo. All rights reserved.
//

import UIKit

class MealListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mealTableView: UITableView!
    
    let cellReuseIdentifier = "MealTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupTable()
    }
    
    private func setupTable() {
        self.mealTableView.dataSource = self
        self.mealTableView.delegate = self
        
        let mealCell = UINib(nibName: "MealTableViewCell", bundle: nil)
        self.mealTableView.register(mealCell, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellReuseIdentifier) as? MealTableViewCell ?? UITableViewCell()
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mealDetailsVC: MealDetailsViewController = MealDetailsViewController()
        self.navigationController?.pushViewController(mealDetailsVC, animated: true)
    }

}
