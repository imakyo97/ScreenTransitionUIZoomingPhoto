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
        transitioningDelegate = self
    }

    @IBAction private func didTapCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension NextViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationTransitioning(animationType: .present)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationTransitioning(animationType: .dismiss)
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
