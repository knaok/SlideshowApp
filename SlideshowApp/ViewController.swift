//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Nao Kato on 2021/07/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var LeftButton: UIButton!
    @IBOutlet weak var RightButton: UIButton!
    
  
    //Declared image index
    var index_image = 0
    
    //Declared timer for slideshow
    var timer: Timer!
    
    
    //Defined image array
    var imageArray:[UIImage] = [
        UIImage(named: "0.jpg")!,
        UIImage(named: "1.jpg")!,
        UIImage(named: "2.jpg")!,
        UIImage(named: "3.jpg")!,
        UIImage(named: "4.jpg")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set the image
        imageView.image = imageArray[index_image]
    }

    
    
    @IBAction func playButton(_ sender: Any) {
    //when playing
    if(timer == nil){
        
        //disable Left&Right Button
        LeftButton.isEnabled = false
        RightButton.isEnabled = false
        
        //set timer
        timer = Timer.scheduledTimer(timeInterval:2.0, target:self, selector: #selector(turnPage), userInfo: nil, repeats: true)
        
        //change button name to "Pause"
        playButton.setTitle("Pause", for: .normal)

    //when pausing
    } else {
        //enable Left&Right Button
        LeftButton.isEnabled = true
        RightButton.isEnabled = true
        
        //stop timer
        timer.invalidate()
        
        //delete timer
        timer = nil
        
        //change button name to "Play"
        playButton.setTitle("Play", for: .normal)
        
    }
    }
    
    @objc func turnPage() {
        // increment the index
        index_image += 1
        if (index_image == imageArray.count) {
                index_image = 0
            
        }
    //set the image
    imageView.image = imageArray[index_image]
    }
    
    //go to the previous page manually
    @IBAction func leftButton(_ sender: Any) {
        index_image += -1
        if (index_image == -1) {
                index_image = imageArray.count-1
        }
        //set the image
        imageView.image = imageArray[index_image]
        //change button name to "Play"
        playButton.setTitle("Play", for: .normal)
    }
        
    //go to the next page manually
    @IBAction func rightButton(_ sender: Any) {
        index_image += 1
        if (index_image == imageArray.count) {
                index_image = 0
        }
        //set the image
        imageView.image = imageArray[index_image]
        
        //change button name to "Play"
        playButton.setTitle("Play", for: .normal)
    }

    //segue when touched image
    @IBAction func buttonTapped(_ sender: Any) {
        if (timer != nil){
            timer.invalidate()
            timer = nil
            
            //enable Left&Right Button
            LeftButton.isEnabled = true
            RightButton.isEnabled = true
            
            //change button name to "Play"
            playButton.setTitle("Play", for: .normal)
        }
        performSegue(withIdentifier: "toExpandedView", sender: nil)
    }
    
    //takeover image to expand
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toExpandedView") {
            let expandedViewController:ExpandViewController = (segue.destination as? ExpandViewController)!
            expandedViewController.index_image = index_image
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}
