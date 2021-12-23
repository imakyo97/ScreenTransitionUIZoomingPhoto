//
//  ViewController.swift
//  UIViewControllerTransitioning2
//
//  Created by 今村京平 on 2021/12/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func didTapNextButton(_ sender: Any) {
        let nextViewController = NextViewController.instantiate()
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true, completion: nil)
    }
}

