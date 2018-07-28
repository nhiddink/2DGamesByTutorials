//
//  HomeScreenViewController.swift
//  CircuitRacer
//
//  Created by Neil Hiddink on 7/28/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: HomeScreenViewController: UIViewController

class HomeScreenViewController: UIViewController {
    @IBAction func playGame(_ sender: UIButton) {
        SKTAudio.sharedInstance().playSoundEffect("button_press.wav")
        if let selectCarVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectCarViewController") as? SelectCarViewController {
            navigationController?.pushViewController(selectCarVC, animated: true)
        }
        
    }
}

