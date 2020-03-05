//
//  MainCollectionViewController.swift
//  NetworkingApp
//
//  Created by Manager on 28/02/2020.
//  Copyright © 2020 Inna. All rights reserved.
//

import UIKit
import Alamofire

//протокол CaseIterable позволяет из элементов перечисления создать массив
enum UserAction: String, CaseIterable {
    case downloadImage = "Download Image"
    case exampleOne = "Example One"
    case exampleTwo = "Example Two"
    case exampleThree = "Example Three"
    case exampleFour = "Example Four"
    case ourCourses = "Our Courses"
    case postRequest = "POST Request"
    case alamofireGet = "Alamofire Get"
}

class MainCollectionViewController: UICollectionViewController {
    
    private let userActions = UserAction.allCases
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! UserActionCell
        
        cell.label.text = userActions[indexPath.item].rawValue
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    //когда тапаем по ячайке, опрелеяем ее индекс и понимаем по какому сегвею выполняется переход
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let userAsction = userActions[indexPath.item]
        
        switch userAsction {
        case .downloadImage:
            performSegue(withIdentifier: "DownloadImage", sender: nil)
        case .exampleOne:
            performSegue(withIdentifier: "ExampleOne", sender: nil)
        case .exampleTwo:
            performSegue(withIdentifier: "ExampleTwo", sender: nil)
        case .exampleThree:
            performSegue(withIdentifier: "ExampleThree", sender: nil)
        case .exampleFour:
            performSegue(withIdentifier: "ExampleFour", sender: nil)
        case .ourCourses:
            performSegue(withIdentifier: "OurCourses", sender: nil)
        case .postRequest:
            performSegue(withIdentifier: "PostRequest", sender: nil)
        case .alamofireGet:
            performSegue(withIdentifier: "AlamofireGet", sender: nil)
        }
        
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "DownloadImage" {
            let coursesVC = segue.destination as! CoursesViewController
            
            switch segue.identifier {
            case "ExampleOne":
                coursesVC.fetchDataV1()
            case "ExampleTwo":
                coursesVC.fetchDataV2()
            case "ExampleThree":
                coursesVC.fetchDataV3()
            case "ExampleFour":
                coursesVC.fetchDataV4()
            case "OurCourses":
                coursesVC.fetchCourses()
            case "PostRequest":
                coursesVC.postRequest()
            case "AlamofireGet":
                coursesVC.fetchDataWithAlamofire()
            default: break
            }
        }
    }
    
}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    //задаем ширину ячейки, опираяся на ширину экрана
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 100)
        
    }
    
}
