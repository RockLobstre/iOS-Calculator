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
    @IBOutlet weak var resultField: UILabel!
    @IBOutlet weak var equationField: UILabel!
    var firstOperand = ""
    var secondOperand = ""
    var op = ""
    var isSecond = false
    var isDecimal = true
    var secondFirstOperand = ""
    
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
        
        resultField.text = "0"
    }
    
    //handle orientaion changes
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        initializePastel()
    }
    
/*  CASE1: NUMBER PRESSED ************************************************************
    */
    @IBAction func numbersPressed(_ sender: UIButton) {
        let number = sender.titleLabel?.text
        if firstOperand == "" {
            resultField.text = ""
        }
        if number == "0" && resultField.text == "0" {
            return
        }
        //clear the result field if it's time for second number
        if isSecond && secondOperand == "" {
            resultField.text = ""
        }
        //decimal number
        if number == "." {
            if isDecimal == true {
                resultField.text = resultField.text! + number!
                isDecimal = false
                if isSecond {
                    secondOperand = secondOperand + number!
                }
                //first number is saved
                else{
                    firstOperand = firstOperand + number!
                }
            //avoid pressing '.' anymore
            } else {
                resultField.text = resultField.text!
            }
        //regular number
        } else {
            if(!isSecond){
                firstOperand = firstOperand + number!
            } else {
                secondOperand = secondOperand + number!
            }
            resultField.text = resultField.text! + number!
        }
    }
    
/*  CASE2: OPERATION PRESSED ************************************************************
     */
    @IBAction func operationPressed(_ sender: UIButton) {
        let operation = sender.titleLabel?.text
        op = operation!
        switch op {
        case "%":
            resultField.text = String(Double(firstOperand)! / 100)
            firstOperand = resultField.text!
            secondOperand = ""
        case "+/-":
            resultField.text = String(-1 * Double(firstOperand)!)
            firstOperand = resultField.text!
            secondOperand = ""
        default:
            if resultField.text == "0" || resultField.text == ""{
                resultField.text = "0"
            } else {
                equationField.text = op
                isSecond = true
                if firstOperand != "" && isSecond && secondOperand != "" {
                    self.calculatePress(UIButton())
                    firstOperand = resultField.text!
                    secondOperand = ""
                }
                secondFirstOperand = firstOperand
                isDecimal = true
                isSecond = true
                resultField.text = firstOperand
            }        }
        
    }
    
/*  CASE3: EQUALS BUTTON PRESSED ************************************************************
     */
    @IBAction func calculatePress(_ sender: UIButton) {
        equationField.text = ""
        if firstOperand != "" && isSecond == true {
            if secondOperand != "" {
                switch op {
                case "+":
                    isDecimal = true
                    resultField.text = String(Double(firstOperand)! + Double(secondOperand)!)
                    firstOperand = resultField.text!
                    secondOperand = ""
                case "-":
                    isDecimal = true
                    resultField.text = String(Double(firstOperand)! - Double(secondOperand)!)
                    firstOperand = resultField.text!
                    secondOperand = ""
                case "x":
                    isDecimal = true
                    resultField.text = String(Double(firstOperand)! * Double(secondOperand)!)
                    firstOperand = resultField.text!
                    secondOperand = ""
                case "/":
                    isDecimal = true
                    resultField.text = String(Double(firstOperand)! / Double(secondOperand)!)
                    firstOperand = resultField.text!
                    secondOperand = ""
                default:
                    resultField.text = "0"
                }
            } else {
                secondOperand = secondFirstOperand
            }
        
        }
    }
    
/*  CASE4: CLEAR PRESSED ************************************************************
     */
    @IBAction func clearPressed(_ sender: UIButton) {
        equationField.text = ""
        firstOperand = ""
        secondOperand = ""
        op = ""
        isSecond = false
        isDecimal = true
        resultField.text = "0"
        secondFirstOperand = ""
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

