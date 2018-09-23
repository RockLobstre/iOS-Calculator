//
//  ViewController.swift
//  MAPD714-Calculator
//
//  Created by Matin Salehi on 2018-09-20.
//  Copyright © 2018 Matin Salehi. All rights reserved.
//

import UIKit
import Pastel
import RevealingSplashView

class ViewController: UIViewController {
    // OUTLETS
    @IBOutlet weak var resultField: UILabel!
    @IBOutlet weak var equationFiels: UILabel!
    
    //VARIABLES
    var firstOperand = ""
    var secondOperand = ""
    var op = ""
    var isOperation = false
    
    
/*********************************************************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize Background Floating Gradient (Pastel)
        initializePastel()
        
        //Initialize a revealing Splash
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "appLogo")!,iconInitialSize: CGSize(width: 170, height: 170), backgroundColor: UIColor(red:156/255, green:39/255, blue:176/255, alpha:1.0))
        
        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.popAndZoomOut
            //Starts animation
        revealingSplashView.startAnimation(){}
    }
    
    //handle orientaion changes
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        initializePastel()
    }
    
/*  CASE1: NUMBER PRESSED ************************************************************
    */
    @IBAction func numbersPressed(_ sender: UIButton) {
        let number = sender.titleLabel?.text
        if(!isOperation){
            firstOperand = firstOperand + number!
        } else {
            secondOperand = secondOperand + number!
        }
        resultField.text = resultField.text! + number!
    }
    
/*  CASE2: OPERATION PRESSED ************************************************************
     */
    @IBAction func operationPressed(_ sender: UIButton) {
        let operation = sender.titleLabel?.text
        switch operation {
        case "-","+","x","/","%":
            op = operation!
            isOperation = true
        default:
            resultField.text = "0"
        }
    }
    
/*  CASE3: EQUALS BUTTON PRESSED ************************************************************
     */
    @IBAction func calculatePress(_ sender: UIButton) {
        switch op {
        case "+":
            resultField.text = String(Double(firstOperand)! + Double(firstOperand)!)
            firstOperand = resultField.text!
            secondOperand = ""
        case "-":
            resultField.text = String(Double(firstOperand)! - Double(firstOperand)!)
            firstOperand = resultField.text!
            secondOperand = ""
        case "x":
            resultField.text = String(Double(firstOperand)! * Double(firstOperand)!)
            firstOperand = resultField.text!
            secondOperand = ""
        case "/":
            resultField.text = String(Double(firstOperand)! / Double(firstOperand)!)
            firstOperand = resultField.text!
            secondOperand = ""
        default:
            resultField.text = "0"
        }
    }
    
/*  CASE4: CLEAR PRESSED ************************************************************
     */
    @IBAction func clearPressed(_ sender: UIButton) {
        firstOperand = ""
        secondOperand = ""
        op = ""
        isOperation = false
        resultField.text = "0"
    }
    
/*********************************************************************************************/
    func initializePastel() {
        let pastelView = PastelView(frame: view.bounds)
        
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

