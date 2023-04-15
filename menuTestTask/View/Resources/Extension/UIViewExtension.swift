//
//  UIView.swift
//  menuTestTask
//
//  Created by admin1 on 15.04.23.
//

import UIKit

extension UIView {
    func addViews(view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func buttonAnimation(_ button: UIButton) {
        button.addTarget(self, action: #selector(handleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        
        button.addTarget(self, action: #selector(handleOut), for: [
            .touchDragOutside,
            .touchUpInside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc func handleIn() {
        UIView.animate(withDuration: 0.15) { self.backgroundColor = R.Colors.active }
    }
    
    @objc func handleOut(bgColor: UIColor) {
        UIView.animate(withDuration: 0.15) { self.backgroundColor = .white }
    }
}
