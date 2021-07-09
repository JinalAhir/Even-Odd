//
//  ViewController.swift
//  oddeven
//
//  Created by DCS on 13/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let btnx:UIButton = {
        let button = UIButton()
        button.setTitle("Even-Odd", for: .normal)
        button.addTarget(self, action: #selector(clickx),for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 6
        return button
    }()
    private let txt:UITextField = {
        let text = UITextField()
        text.backgroundColor = .gray
        text.textColor = .blue
        text.textAlignment = .center
        text.layer.cornerRadius = 6
        text.placeholder = "Enter the value"
        return text
    }()
    @objc private func clickx()
    {
        print("checking..")
        
        guard let num = Int(txt.text!) else {
            let alert = UIAlertController(title: "Worning!!", message: "Please enter a number", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
            return
        }
        
        let vc = ResultVC()
        
        if num % 2 == 0 {
            vc.result = "Even Number"
        } else {
            vc.result = "Odd Number"
        }
        
        navigationController?.pushViewController(vc, animated: false)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Even-Odd"
        view.addSubview(btnx)
        view.addSubview(txt)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        btnx.frame = CGRect(x: 40, y: (view.height/2) - 30, width: view.width - 80, height:60)
        txt.frame = CGRect(x: 40, y: (view.height/2) - 100, width: view.width - 80, height: 50)
    }
   
}

