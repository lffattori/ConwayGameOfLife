//
//  GameScene.swift
//  GameOfLife
//
//  Created by Luiza Fattori on 31/10/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import Foundation
import SceneKit

class GameScene: SCNScene {

    // Nossa matriz (que vai ser nossa grid) inicializada vazia
    var individuals = [[Individuals]]()

    override init() {
        super.init()

        // Populando a matriz
        for row:Int in 0...32 {
            // fazendo arrays, que são linhas com elementos
            var singleRow = [Individuals]()
            for col:Int in 0...32 {
                let individual = Individuals(x: col, y: row)

                let offset: Int = 16
                
                individual.position.x = Float(row - offset)
                individual.position.y = Float(col - offset)

                singleRow.append(individual)
                // Faz as coisas aparecerem na tela
                self.rootNode.addChildNode(individual)
            }
            // Adiciona essas linhas dentro da nossa matriz = array de arrays
            individuals.append(singleRow)
        }
        // Cada vez que o código percorre esse for, nos adicionamos uma coluna dentro da matriz
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
