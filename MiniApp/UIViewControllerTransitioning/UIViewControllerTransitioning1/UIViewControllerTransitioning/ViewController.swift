//
//  ViewController.swift
//  UIViewControllerTransitioning
//
//  Created by 今村京平 on 2021/12/22.
//

import UIKit

final class ViewController: UIViewController {
    @IBAction private func didTapNextButton(_ sender: Any) {
        let nextViewController = NextViewController.instantiate()
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true, completion: nil)
    }
}

