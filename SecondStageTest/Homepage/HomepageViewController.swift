//
//  HomepageViewController.swift
//  SecondStageTest
//
//  Created by Yogi Priyo Prayogo on 27/12/20.
//  Copyright © 2020 Yogi Priyo Prayogo. All rights reserved.
//

import UIKit
import Alamofire
import PKHUD

final class HomepageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var categoryTableView: UITableView!
    
    // MARK: - Properties
    let cellReuseIdentifier = "CategoryTableViewCell"
    var mealCategories: [MealCategory] = []
    
    // MARK: - Life Cycles
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupNavbar()
        self.getMealCategories()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupTable()
    }
    
    // MARK: - Private Funcs
    private func setupNavbar() {
        self.navigationItem.title = "Homepage"
    }
    
    private func getMealCategories() {
        HUD.show(.progress)
        AF.request("https://www.themealdb.com/api/json/v1/1/categories.php")
        .validate()
        .responseDecodable(of: MealCategoryBase.self) { (response) in
            guard let mealCategories = response.value else { return }
            self.mealCategories = mealCategories.categories
            self.categoryTableView.reloadData()
            HUD.hide()
        }
    }
    
    private func setupTable() {
        self.categoryTableView.dataSource = self
        self.categoryTableView.delegate = self
        self.categoryTableView.tableFooterView = UIView()
        
        let categoryCell = UINib(nibName: "CategoryTableViewCell", bundle: nil)
        self.categoryTableView.register(categoryCell, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    // MARK: - Table delegate & datasources
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mealCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? CategoryTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.setupContent(self.mealCategories[indexPath.row])

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
