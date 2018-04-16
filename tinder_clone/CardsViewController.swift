//
//  CardsViewController.swift
//  tinder_clone
//
//  Created by Kelvin Lui on 4/13/18.
//  Copyright © 2018 Kelvin Lui. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cardInitialCenter = userImageView.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "profileViewSegue", sender: nil)
    }
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if sender.state == .began {
            //
        } else if sender.state == .changed {
            // check whether drag on top half or bottom half
            let location = sender.location(in: userImageView)
            if location.y >= userImageView.center.y {
                if translation.x > 0 {
                    userImageView.transform =  userImageView.transform.rotated(by: translation.x/userImageView.frame.width)
                } else {
                    userImageView.transform =  userImageView.transform.rotated(by: -translation.x/userImageView.frame.width)
                }
            } else {
                if translation.x > 0 {
                    userImageView.transform =  userImageView.transform.rotated(by: -translation.x/userImageView.frame.width)
                } else {
                    userImageView.transform =  userImageView.transform.rotated(by: translation.x/userImageView.frame.width)
                }
            }
        } else {
            if translation.x > 50 {
                UIView.animate(withDuration: 0.5) {
                    self.userImageView.center.x = 2*self.view.frame.width
                }
            } else if translation.x < -50 {
                UIView.animate(withDuration: 0.5) {
                    self.userImageView.center.x = -self.view.frame.width
                }
            } else {
                UIView.animate(withDuration: 0.5) {
                    self.userImageView.center = self.cardInitialCenter
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
