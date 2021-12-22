//
//  NextViewController.swift
//  UIViewControllerTransitioning
//
//  Created by 今村京平 on 2021/12/22.
//

import UIKit

final class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func didTapCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension NextViewController {
    static func instantiate() -> NextViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Next")
        as! NextViewController
        return nextViewController
    }
}
