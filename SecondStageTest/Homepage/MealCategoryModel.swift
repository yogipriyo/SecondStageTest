//
//  MealCategoryModel.swift
//  SecondStageTest
//
//  Created by Yogi Priyo Prayogo on 27/12/20.
//  Copyright © 2020 Yogi Priyo Prayogo. All rights reserved.
//

import Foundation

struct MealCategory: Codable {
  let idCategory: String
  let strCategory: String
  let strCategoryThumb: String
  let strCategoryDescription: String
}

struct MealCategoryBase: Codable {
    let categories: [MealCategory]
}
