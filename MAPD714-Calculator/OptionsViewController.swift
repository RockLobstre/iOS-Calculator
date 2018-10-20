//
//  OptionsViewController.swift
//  MAPD714-Calculator
//
//  Created by Matin Salehi on 2018-10-20.
//  Copyright © 2018 Matin Salehi. All rights reserved.
//

import UIKit
import Pastel

class OptionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Initialize Background Floating Gradient (Pastel)
        initializePastel()
    }
    

    /*********************************************************************************************/
    func initializePastel() {
        let pastelView = PastelView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 1500, height: 1500)))
        
        //MARK: -  Custom Direction
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        
        //MARK: -  Custom Duration
        
        pastelView.animationDuration = 5.0
        
        //MARK: -  Custom Color
        pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                              UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                              UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                              UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)])
        
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
    }

}
