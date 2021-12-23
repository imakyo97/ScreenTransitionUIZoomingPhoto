//
//  CustomAnimator.swift
//  UIViewControllerTransitioning2
//
//  Created by 今村京平 on 2021/12/23.
//

import UIKit

final class CustomAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    enum Animation {
        case present
        case dismiss
    }

    private let animation: Animation

    init(animation: Animation) {
        self.animation = animation
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.5
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.view(forKey: .to),
              let fromView = transitionContext.view(forKey: .from) else {
            transitionContext.completeTransition(false)
            return
        }
        switch animation {
        case .present:
            transitionContext.containerView.addSubview(toView)
            presentAnimation(using: transitionContext, view: toView)
        case .dismiss:
            transitionContext.containerView.addSubview(toView)
            transitionContext.containerView.addSubview(fromView)
            dismissAnimation(using: transitionContext, view: fromView)
        }
    }

    private func presentAnimation(using transitionContext: UIViewControllerContextTransitioning, view: UIView) {
        view.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat(Double.pi * 2)
        rotationAnimation.duration = transitionDuration(using: transitionContext)
        view.layer.add(rotationAnimation, forKey: "rotationAnimation")
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            view.transform = CGAffineTransform(scaleX: 1, y: 1)
        } completion: { transitionContext.completeTransition($0) }
    }

    private func dismissAnimation(using transitionContext: UIViewControllerContextTransitioning, view: UIView) {
        UIView.animateKeyframes(withDuration: transitionDuration(using: transitionContext), delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                view.transform = CGAffineTransform(scaleX: 0, y: 0)
            }
        } completion: { transitionContext.completeTransition($0) }
    }
}
