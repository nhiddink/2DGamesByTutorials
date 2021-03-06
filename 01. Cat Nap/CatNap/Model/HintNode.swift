//
//  HintNode.swift
//  CatNap
//
//  Created by Neil Hiddink on 7/21/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import SpriteKit

// MARK: HintNode: SKSpriteNode

class HintNode: SKSpriteNode {
    
    // MARK: Properties
    
    var shape = SKShapeNode()
    
    var arrowPath: CGPath = {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0.5, y: 65.69))
        bezierPath.addLine(to: CGPoint(x: 74.99, y: 1.5))
        bezierPath.addLine(to: CGPoint(x: 74.99, y: 38.66))
        bezierPath.addLine(to: CGPoint(x: 257.5, y: 38.66))
        bezierPath.addLine(to: CGPoint(x: 257.5, y: 92.72))
        bezierPath.addLine(to: CGPoint(x: 74.99, y: 92.72))
        bezierPath.addLine(to: CGPoint(x: 74.99, y: 126.5))
        bezierPath.addLine(to: CGPoint(x: 0.5, y: 65.69))
        bezierPath.close()
        return bezierPath.cgPath
    }()
    
    var fillColors = [UIColor.red, UIColor.yellow, UIColor.orange]
    
    // MARK: Touch Methods
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        interact()
    }
    
}

// MARK: HintNode: EventListenerNode

extension HintNode: EventListenerNode {
    func didMoveToScene() {
        isUserInteractionEnabled = true
        
        color = SKColor.clear
        shape = SKShapeNode(path: arrowPath)
        shape.strokeColor = SKColor.gray
        shape.lineWidth = 4
        shape.fillColor = SKColor.white
        shape.fillTexture = SKTexture(imageNamed: "wood_tinted")
        shape.alpha = 0.8
        addChild(shape)
        
        let move = SKAction.moveBy(x: -40, y: 0, duration: 1.0)
        let bounce = SKAction.sequence([move, move.reversed()])
        let bounceAction = SKAction.repeat(bounce, count: 3)
        shape.run(bounceAction, completion: {
            self.removeFromParent()
        })
    }
}

// MARK: HintNode: InteractiveNode

extension HintNode: InteractiveNode {
    func interact() {
        let random = Int(arc4random_uniform(UInt32(fillColors.count)))
        shape.fillColor = fillColors[random]
    }
}
