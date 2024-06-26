//
//  MLSpinningCircleView.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 20/06/24.
//

import UIKit

final class MLSpinningCircleView: UIView {
    private let spinningCircle = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        frame = CGRect(x: 0, y: 0, width: 100, height: 100)

        let rect = self.bounds
        let circularpath = UIBezierPath(ovalIn: rect)

        spinningCircle.path = circularpath.cgPath
        spinningCircle.fillColor = UIColor.clear.cgColor
        spinningCircle.strokeColor = UIColor.systemYellow.cgColor
        spinningCircle.lineWidth = 5
        spinningCircle.strokeEnd = 0.25
        spinningCircle.lineCap = .round

        self.layer.addSublayer(spinningCircle)
    }

    func animate() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.transform = CGAffineTransform(rotationAngle:  .pi)
        }) { (completed)in
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                self.transform = CGAffineTransform(rotationAngle: 0)
            }) { (completed) in
                self.animate()
            }
        }
    }

}
