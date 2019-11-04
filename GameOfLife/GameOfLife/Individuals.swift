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
        self.geometry?.firstMaterial?.emission.contents = UIColor.red
        self.geometry?.firstMaterial?.diffuse.contents = UIColor.red
    }
    // Como a célula vai estar se estiver morta
    func dead (){
        self.geometry?.firstMaterial?.emission.contents = UIColor.lightGray
        self.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
    }

    // As coordenadas do nosso quadradinho
    let x : Int
    let y : Int

    // Inicializando
    init(x: Int, y: Int){
        self.x = x
        self.y = y
        self.isAlive = false
        super.init()
        dead()
        self.geometry = SCNBox(width: 0.6 , height: 0.6,
        length: 0.08, chamferRadius: 0.005)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
