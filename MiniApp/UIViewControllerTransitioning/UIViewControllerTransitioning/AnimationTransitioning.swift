//
//  AnimationTransitioning.swift
//  UIViewControllerTransitioning
//
//  Created by 今村京平 on 2021/12/22.
//

import UIKit

final class AnimationTransitioning: NSObject, UIViewControllerAnimatedTransitioning {

    private let animationType: AnimationType

    enum AnimationType {
        case present
        case dismiss
    }

    init(animationType: AnimationType) {
        self.animationType = animationType
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.5
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let to = transitionContext.viewController(forKey: .to),
              let from = transitionContext.viewController(forKey: .from) else {
            transitionContext.completeTransition(false)
            return
        }

        switch animationType {
        case .present:
            transitionContext.containerView.addSubview(to.view)
            presentAnimation(with: transitionContext, viewToAnimate: to.view)
        case .dismiss:
            transitionContext.containerView.addSubview(to.view)
            transitionContext.containerView.addSubview(from.view)
            dismissAnimation(with: transitionContext, viewToAnimate: from.view)
        }
    }

   private func presentAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView) {
        viewToAnimate.clipsToBounds = true
        viewToAnimate.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0.0,
                       usingSpringWithDamping: 100.0,
                       initialSpringVelocity: 0.1,
                       options: .curveEaseOut) {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        } completion: { finised in
            transitionContext.completeTransition(finised)
        }
    }

    private func dismissAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView) {
        UIView.animateKeyframes(withDuration: transitionDuration(using: transitionContext),
                                delay: 0.0,
                                options: .calculationModeLinear) {
            UIView.addKeyframe(withRelativeStartTime: 0.0,
                               relativeDuration: 0.5) {
                viewToAnimate.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            }
        } completion: { (finised) in
            transitionContext.completeTransition(finised)
        }
    }
}
