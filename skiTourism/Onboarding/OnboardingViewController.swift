//
//  OnboardingViewController.swift
//  skiTourism
//
//  Created by Илья Груздев on 26.01.2022.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
//    some data?
    let imageArray = [UIImage(named: "Onboarding1"),
                      UIImage(named: "Onboarding2"),
                      UIImage(named: "Onboarding3"),
                      UIImage(named: "Onboarding4")]
    
    private let imgView = UIImageView()
    private let leftView = UIView()
    private let rightView = UIView()
    private var currentIndex = 0
    private let nextButton = UIButton()
    private let pageControl = UIPageControl(frame: .zero)
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .red
        setup()
        configure()
    }
    
    func setup() {
//        setup left/right views/recognizers to change "pages"
        view.addSubview(leftView)
        view.addSubview(rightView)
        
        leftView.translatesAutoresizingMaskIntoConstraints = false
        rightView.translatesAutoresizingMaskIntoConstraints = false
        
        leftView.backgroundColor = .clear
        rightView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            leftView.topAnchor.constraint(equalTo: view.topAnchor),
            leftView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            leftView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            leftView.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            
            rightView.topAnchor.constraint(equalTo: view.topAnchor),
            rightView.leadingAnchor.constraint(equalTo: leftView.trailingAnchor),
            rightView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rightView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        let leftTap = UITapGestureRecognizer(target: self, action: #selector(handleLeftTap))
        let rightTap = UITapGestureRecognizer(target: self, action: #selector(handleRightTap))
        
        leftView.addGestureRecognizer(leftTap)
        rightView.addGestureRecognizer(rightTap)
        
//        add imageView in fullscreen
        view.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        imgView.sizeToFit()
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: view.topAnchor),
            imgView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imgView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.backgroundColor = .white
        nextButton.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -10),
            pageControl.heightAnchor.constraint(equalToConstant: 135),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        pageControl.transform = CGAffineTransform(scaleX: 2, y: 2)
        pageControl.numberOfPages = imageArray.count
        pageControl.backgroundColor = .clear
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = .gray
        pageControl.isUserInteractionEnabled = false
    }
    
    func configure() {
//        set image with currentIndex
        UIView.transition(with: imgView,
                          duration: 0.25,
                          options: .transitionCrossDissolve,
                          animations: { self.imgView.image = self.imageArray[self.currentIndex] },
                          completion: nil)
        pageControl.currentPage = currentIndex
        
//        change func to button in last page
        if currentIndex == imageArray.count - 1 {
            nextButton.removeTarget(self, action: #selector(handleRightTap), for: .touchUpInside)
            nextButton.addTarget(self, action: #selector(endButton), for: .touchUpInside)
        } else {
            nextButton.removeTarget(self, action: #selector(endButton), for: .touchUpInside)
            nextButton.addTarget(self, action: #selector(handleRightTap), for: .touchUpInside)
        }
    }
    
    @objc func handleLeftTap() {
//        changing color for our background to look good
        if currentIndex == 2 {
            UIView.transition(with: nextButton,
                              duration: 0.25,
                              options: .transitionCrossDissolve,
                              animations: { self.nextButton.backgroundColor = .black
                                            self.nextButton.setTitleColor(.white, for: .normal) },
                              completion: nil)
            
            UIView.transition(with: pageControl,
                              duration: 0.25,
                              options: .transitionCrossDissolve,
                              animations: { self.pageControl.currentPageIndicatorTintColor = .black },
                              completion: nil)
        } else {
            UIView.transition(with: nextButton,
                              duration: 0.25,
                              options: .transitionCrossDissolve,
                              animations: { self.nextButton.backgroundColor = .white
                                            self.nextButton.setTitleColor(.black, for: .normal) },
                              completion: nil)
            
            UIView.transition(with: pageControl,
                              duration: 0.25,
                              options: .transitionCrossDissolve,
                              animations: { self.pageControl.currentPageIndicatorTintColor = .white },
                              completion: nil)
        }
//        if we on last page and going back, change button text to default
        if currentIndex == imageArray.count-1 {
            nextButton.setTitle("Next", for: .normal)
        }
        
        if !imageArray.isEmpty {
            if currentIndex != 0 {
                currentIndex -= 1
                configure()
            }
        }
    }
    
    @objc func handleRightTap() {
//        changing color for our background to look good
        if currentIndex == 0 {
            UIView.transition(with: nextButton,
                              duration: 0.25,
                              options: .transitionCrossDissolve,
                              animations: { self.nextButton.backgroundColor = .black
                                            self.nextButton.setTitleColor(.white, for: .normal) },
                              completion: nil)
            
            UIView.transition(with: pageControl,
                              duration: 0.25,
                              options: .transitionCrossDissolve,
                              animations: { self.pageControl.currentPageIndicatorTintColor = .black },
                              completion: nil)
        } else {
            UIView.transition(with: nextButton,
                              duration: 0.25,
                              options: .transitionCrossDissolve,
                              animations: { self.nextButton.backgroundColor = .white
                                            self.nextButton.setTitleColor(.black, for: .normal) },
                              completion: nil)
            
            UIView.transition(with: pageControl,
                              duration: 0.25,
                              options: .transitionCrossDissolve,
                              animations: { self.pageControl.currentPageIndicatorTintColor = .white },
                              completion: nil)
        }
//        if we at pre-last page, we need set on last page new text on button
        if currentIndex == imageArray.count-2 {
            nextButton.setTitle("End", for: .normal)
        }
        
        if !imageArray.isEmpty {
            if currentIndex < imageArray.count-1 {
                currentIndex += 1
                configure()
            }
        }
    }
    
    @objc func endButton() {
//      when end
    }
}
