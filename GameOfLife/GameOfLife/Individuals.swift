//
//  Idividuals.swift
//  GameOfLife
//
//  Created by Luiza Fattori on 01/11/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import Foundation
import SceneKit

public class Individuals: SCNNode {
    // Se o nosso individuo está vivo ou morto
    var isAlive: Bool {
        willSet {
            if newValue == false {
                dead()
            } else {
                alive()
            }
        }
    }
    // Como a célula vai estar se estiver viva
    func alive (){
        self.geometry?.firstMaterial?.emission.contents = UIColor.blue
        self.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
    }
    // Como a célula vai estar se estiver morta
    func dead (){
        self.geometry?.firstMaterial?.emission.contents = UIColor.yellow
        self.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
    }
    // Vai inicializar a célula ou não
    var exists: Bool = true
    // As coordenadas do nosso quadradinho
    let x : Int
    let y : Int
    let z : Int

    // Inicializando
    init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
        self.isAlive = false
        super.init()
        self.geometry = SCNBox(width: 0.8 , height: 0.8,
        length: 0.8, chamferRadius: 0.05)
        dead()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
