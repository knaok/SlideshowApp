//
//  ExpandViewController.swift
//  SlideshowApp
//
//  Created by Nao Kato on 2021/07/17.
//

import UIKit

class ExpandViewController: UIViewController {
    @IBOutlet weak var expandedImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    var index_image:Int = 0
    
    var imageArray:[UIImage] = [
        UIImage(named: "0.jpg")!,
        UIImage(named: "1.jpg")!,
        UIImage(named: "2.jpg")!,
        UIImage(named: "3.jpg")!,
        UIImage(named: "4.jpg")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        expandedImage.image = imageArray[index_image]
        
        // Do any additional setup after loading the view.
    }
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
