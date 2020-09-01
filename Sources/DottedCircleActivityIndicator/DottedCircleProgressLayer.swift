//
//  DottedCircleProgressLayer.swift
//  
//
//  Created by sergey on 01.09.2020.
//

import Foundation
import UIKit

public struct ProgressLayerConfigurator {
  let fillColor: CGColor
  let backgroundColor: CGColor
  let strokeColor: CGColor
  let instanceColor: CGColor
  let frame: CGRect
  let instanceCount: Int
  let dotSize: CGFloat

  public init(fillColor: CGColor,
              backgroundColor: CGColor,
              strokeColor: CGColor,
              instanceColor: CGColor,
              frame: CGRect,
              instanceCount: Int,
              dotSize: CGFloat) {
    self.fillColor = fillColor
    self.backgroundColor = backgroundColor
    self.strokeColor = strokeColor
    self.instanceColor = instanceColor
    self.frame = frame
    self.instanceCount = instanceCount
    self.dotSize = dotSize
  }
}

public class DottedCircleProgressLayer: CAReplicatorLayer {

  public convenience init(fillColor: CGColor,
                          backgroundColor: CGColor,
                          strokeColor: CGColor,
                          instanceColor: CGColor,
                          frame: CGRect,
                          instanceCount: Int,
                          dotSize: CGFloat) {
    self.init();
    self.frame = frame

    self.instanceCount = instanceCount
    self.instanceDelay = CFTimeInterval(1 / Float(instanceCount))
    self.preservesDepth = false
    self.instanceColor = instanceColor

    let angle = Float(.pi * 2.0) / Float(instanceCount)
    self.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)

    let instanceLayer = CAShapeLayer()
    instanceLayer.frame = CGRect(
      x: 0,
      y: 0,
      width: dotSize,
      height: dotSize
    )
    instanceLayer.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: dotSize, height: dotSize)).cgPath
    instanceLayer.strokeColor = strokeColor
    instanceLayer.backgroundColor = backgroundColor
    instanceLayer.fillColor = fillColor
    self.addSublayer(instanceLayer)

    let fadeAnimation = CABasicAnimation(keyPath: "opacity")
    fadeAnimation.isRemovedOnCompletion = false;
    fadeAnimation.fromValue = 1.0
    fadeAnimation.toValue = 0.0
    fadeAnimation.duration = 1
    fadeAnimation.repeatCount = Float(Int.max)


    instanceLayer.opacity = 0.0
    instanceLayer.add(fadeAnimation, forKey: "FadeAnimation")
  }

  public convenience init(progressConfig: ProgressLayerConfigurator) {
    self.init()
    self.frame = progressConfig.frame
    self.instanceCount = progressConfig.instanceCount
    self.instanceDelay = CFTimeInterval(1 / Float(progressConfig.instanceCount))
    self.preservesDepth = false
    self.instanceColor = progressConfig.instanceColor

    let angle = Float(.pi * 2.0) / Float(progressConfig.instanceCount)
    self.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)

    let instanceLayer = CAShapeLayer()
    instanceLayer.frame = CGRect(
      x: 0,
      y: 0,
      width: progressConfig.dotSize,
      height: progressConfig.dotSize)
    instanceLayer.path = UIBezierPath(
      ovalIn: CGRect(
        x: 0,
        y: 0,
        width: progressConfig.dotSize,
        height: progressConfig.dotSize
      )
    ).cgPath
    instanceLayer.strokeColor = progressConfig.strokeColor
    instanceLayer.backgroundColor = progressConfig.backgroundColor
    instanceLayer.fillColor = progressConfig.fillColor
    instanceLayer.cornerRadius = progressConfig.dotSize / 2
    self.addSublayer(instanceLayer)

    let fadeAnimation = CABasicAnimation(keyPath: "opacity")
    fadeAnimation.isRemovedOnCompletion = false;
    fadeAnimation.fromValue = 1.0
    fadeAnimation.toValue = 0.0
    fadeAnimation.duration = 1
    fadeAnimation.repeatCount = Float(Int.max)

    instanceLayer.opacity = 0.0
    instanceLayer.add(fadeAnimation, forKey: "FadeAnimation")
  }
}
