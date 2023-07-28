//
//  Test + Ex.swift
//  TestKeeperFW
//
//  Created by Даниил Мухсинятов on 28.07.2023.
//

import UIKit
import EasyPeasy

extension UIView {
    func loadingIndicator(_ show: Bool, centerYInset: CGFloat = 0, color: UIColor = .white, style: UIActivityIndicatorView.Style = .medium, isBlur: Bool = false) {
        
        let bacView = UIView()
        let tag = 9876
        let bacViewTag = 121313
        
        if let indicator = self.viewWithTag(tag) as? UIActivityIndicatorView {
            if show {
                indicator.startAnimating()
            } else {
                indicator.stopAnimating()
                self.viewWithTag(bacViewTag)?.removeFromSuperview()
                self.viewWithTag(tag)?.removeFromSuperview()
            }
        } else if show {
            if isBlur {
                bacView.tag = bacViewTag
                bacView.backgroundColor = .gray.withAlphaComponent(0.5)
                self.addSubview(bacView)
                bacView.easy.layout(Edges())
            }
            
            let indicator = UIActivityIndicatorView(style: style)
            let buttonHeight = self.bounds.size.height
            let buttonWidth = self.bounds.size.width
            
            indicator.color = color
            indicator.center = CGPointMake(buttonWidth/2, buttonHeight/2)
            indicator.tag = tag
            
            self.addSubview(indicator)
            if centerYInset != 0 {
                indicator.easy.layout([CenterX(), Top(centerYInset)])
            } else {
                indicator.easy.layout([Center()])
            }
            
            indicator.startAnimating()
        }
    }
    
    func addBorder(to side: UIRectEdge, color: UIColor, borderWidth: CGFloat, opacity: Float = 1, cornerRadius: CGFloat = 0) {
        if side == .all {
            for s in [UIRectEdge.top, UIRectEdge.bottom, UIRectEdge.left, UIRectEdge.right] {
                let subLayer = CALayer()
                subLayer.borderColor = color.cgColor
                subLayer.opacity = opacity
                subLayer.borderWidth = borderWidth
                let origin = findOrigin(side: s, borderWidth: borderWidth)
                let size = findSize(side: s, borderWidth: borderWidth)
                subLayer.frame = CGRect(origin: origin, size: size)
                subLayer.masksToBounds = true
                subLayer.cornerRadius = cornerRadius
                layer.addSublayer(subLayer)
            }
        } else {
            let subLayer = CALayer()
            subLayer.borderColor = color.cgColor
            subLayer.opacity = opacity
            subLayer.borderWidth = borderWidth
            let origin = findOrigin(side: side, borderWidth: borderWidth)
            let size = findSize(side: side, borderWidth: borderWidth)
            subLayer.frame = CGRect(origin: origin, size: size)
            subLayer.masksToBounds = true
            subLayer.cornerRadius = cornerRadius
            layer.addSublayer(subLayer)
        }
    }
    
    private func findOrigin(side: UIRectEdge, borderWidth: CGFloat) -> CGPoint {
        switch side {
        case .right:
            return CGPoint(x: frame.maxX - borderWidth, y: 0)
        case .bottom:
            return CGPoint(x: 0, y: frame.maxY - borderWidth)
        default:
            return .zero
        }
    }

    private func findSize(side: UIRectEdge, borderWidth: CGFloat) -> CGSize {
        switch side {
        case .left, .right:
            return CGSize(width: borderWidth, height: frame.size.height)
        case .top, .bottom:
            return CGSize(width: frame.size.width, height: borderWidth)
        default:
            fatalError("gg")
        }
    }
}
