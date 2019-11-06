//
//  GameViewController.swift
//  GameOfLife
//
//  Created by Luiza Fattori on 31/10/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController, SCNSceneRendererDelegate {

    let manager = Managers()
    let scene = GameScene()

    var scnView: SCNView = SCNView()

    @IBOutlet weak var scnViewOutlet: SCNView!
    @IBAction func nextGenAction(_ sender: Any) {
        isRunning = !isRunning
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // create a new scene

        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 35)
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)

        // retrieve the SCNView
        if let scnView = scnViewOutlet {
            self.scnView = scnView
        }

        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = UIColor.black
        
        // add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        scnView.addGestureRecognizer(tapGesture)

        scnView.delegate = self
        scnView.isPlaying = true
        scnView.loops = true
    }

    var nextTime: TimeInterval = 0
    var interval: TimeInterval = 0.3
    var isRunning: Bool = false
    var layer: Int = 1


    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if time >= nextTime && isRunning == true {
            scene.layerSetUp(layer)
            nextTime = time + interval
            layer += 1
        }
    }

    @objc
    func handleTap(_ gestureRecognize: UIGestureRecognizer) {

        // retrieve the SCNView
        
        // check what nodes are tapped
        let p = gestureRecognize.location(in: scnView)
        let hitResults = scnView.hitTest(p, options: [:])
        // check that we clicked on at least one object

        if hitResults.count > 0 {
            // retrieved the first clicked object
            let result = hitResults[0]

            // get its material
            if let individual = result.node as? Individuals {
                if individual.isAlive == false {
                    individual.isAlive = true
                } else {
                    individual.isAlive = false
                }
            }
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

}
