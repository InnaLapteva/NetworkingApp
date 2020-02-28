//
//  CourseCell.swift
//  NetworkingApp
//
//  Created by Manager on 28/02/2020.
//  Copyright © 2020 Inna. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {
    
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var lessonLabel: UILabel!
    @IBOutlet var testLabel: UILabel!
    
    func configure(with course: Course) {
        
        nameLabel.text = course.name
        lessonLabel.text = "Number of lessons: \(course.number_of_lessons ?? 0)"
        testLabel.text = "Number of tests: \(course.number_of_tests ?? 0)"
        
        DispatchQueue.global().async {
            guard let stringURL = course.imageUrl else {return}
            guard let url = URL(string: stringURL) else {return}
            guard let imageData = try? Data(contentsOf: url) else {return}
            
            DispatchQueue.main.async {
                self.courseImage.image = UIImage(data: imageData)
            }
        }
    }
}


