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
//    let numberOfLessons: Int?
//    let numberOfTests: Int?
    let numberOfLessons: String?
    let numberOfTests: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case imageUrl = "imageUrl"
        case numberOfLessons = "number_of_lessons"
        case numberOfTests = "number_of_tests"
    }
}

struct WebsiteDescription: Decodable {
    let courses: [Course]?
    let websiteDescription: String?
    let websiteName: String?
}
