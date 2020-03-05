//
//  CoursesViewController.swift
//  NetworkingApp
//
//  Created by Manager on 28/02/2020.
//  Copyright © 2020 Inna. All rights reserved.
//

import UIKit
import Alamofire

class CoursesViewController: UITableViewController {
    
    private let jsonUrlOne = "https://swiftbook.ru//wp-content/uploads/api/api_course"
    private let jsonUrlTwo = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    private let jsonUrlhree = "https://swiftbook.ru//wp-content/uploads/api/api_website_description"
    private let jsonUrlFour = "https://swiftbook.ru//wp-content/uploads/api/api_missing_or_wrong_fields"
    
    private var courses: [Course] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath) as! CourseCell
        let course = courses[indexPath.row]
        cell.configure(with: course)
     
     return cell
     }
     

}

//MARK: privet methods (эти методы должны быть в классе  NetworkManager)

extension CoursesViewController {
    
    func fetchDataV1() {
        guard let url = URL(string: jsonUrlOne) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                let course = try decoder.decode(Course.self, from: data)
                print(course)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    func fetchDataV2() {
        guard let url = URL(string: jsonUrlTwo) else {return}
               
               URLSession.shared.dataTask(with: url) { (data, _, _) in
                   guard let data = data else { return }
                   
                   let decoder = JSONDecoder()
                   do {
                       let courses = try decoder.decode([Course].self, from: data)
                       print(courses)
                   } catch let error {
                       print(error)
                   }
                   
               }.resume()
        
    }
    
    func fetchDataV3() {
        guard let url = URL(string: jsonUrlhree) else {return}
        
       URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                let websiteDescribtion = try decoder.decode(WebsiteDescription.self, from: data)
                print(websiteDescribtion)
            } catch let error {
                print(error)
            }

        }.resume()
        
    }
    
    func fetchDataV4() {
        guard let url = URL(string: jsonUrlFour) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                let websiteDescribtion = try decoder.decode(WebsiteDescription.self, from: data)
                print(websiteDescribtion)
            } catch let error {
                print(error.localizedDescription)
            }

        }.resume()
        
    }
    
    func fetchCourses() {
        guard let url = URL(string: jsonUrlTwo) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.courses = try decoder.decode([Course].self, from: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }

    func postRequest() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        let course = ["name" : "Networking", "numberOfLessons": "10"]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //правило добавления записи на сервер
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: course, options: []) else {return}
        // если использовать try. то надо оборачивать в блок do catch
        
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {print(error); return }
            guard let response = response, let data = data else {return}
            print(response)
            
            do {
                let course = try JSONSerialization.jsonObject(with: data, options: [])
                print(course)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
        
        
    }
    
    func fetchDataWithAlamofire() {
        // request(jsonUrlFour)
    
        
    }
    
    
    
}
