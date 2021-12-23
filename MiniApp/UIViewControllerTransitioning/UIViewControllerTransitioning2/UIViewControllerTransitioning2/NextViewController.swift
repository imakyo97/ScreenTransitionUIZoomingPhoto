//
//  NextViewController.swift
//  UIViewControllerTransitioning2
//
//  Created by 今村京平 on 2021/12/23.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        transitioningDelegate = self
    }

    @IBAction private func didTapCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension NextViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        CustomAnimator(animation: .present)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        CustomAnimator(animation: .dismiss)
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
