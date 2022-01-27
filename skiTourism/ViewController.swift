//
//  ViewController.swift
//  skiTourism
//
//  Created by Илья Груздев on 26.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2, width: 100, height: 50))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        view.addSubview(button)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        
    }
    
    @objc func handleButton() {
        dismiss(animated: true, completion: nil)
    }

}

