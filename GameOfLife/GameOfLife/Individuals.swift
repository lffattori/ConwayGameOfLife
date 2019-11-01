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
    var isAlive: Bool = false

    // As coordenadas do nosso quadradinho
    let x : Int
    let y : Int

    // Inicializando
    init(x: Int, y: Int){
        self.x = x
        self.y = y
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
