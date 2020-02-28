//
//  Course.swift
//  NetworkingApp
//
//  Created by Manager on 28/02/2020.
//  Copyright © 2020 Inna. All rights reserved.
//

struct Course: Decodable {
    let name: String?
    let imageUrl: String?
    let number_of_lessons: Int?
    let number_of_tests: Int?
}

struct WebsiteDescription: Decodable {
    let courses: [Course]?
    let websiteDescription: String?
    let websiteName: String?
}
