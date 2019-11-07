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
    var grid = [[Individuals]]()
    var gridIndividual = [[[Individuals]]]()
    var manager = Managers()

    override init() {
        super.init()

        // Populando a matriz
        for row:Int in 0...32 {
            // fazendo arrays, que são linhas com elementos
            var singleRow = [Individuals]()
            
            for col:Int in 0...32 {
                let cell = Individuals(x: col, y: row, z: 0)
                let offset: Int = 16
                
                cell.position.x = Float(row - offset)
                cell.position.y = Float(col - offset)

                if Int.random(in: 0...10) < 3 {
                    cell.isAlive = true
                }
                singleRow.append(cell)
                // Faz as coisas aparecerem na tela
                self.rootNode.addChildNode(cell)
            }
            // Adiciona essas linhas dentro da nossa matriz = array de arrays
            grid.append(singleRow)
            gridIndividual.append(self.grid)
        }
        // Cada vez que o código percorre esse for, nós adicionamos uma coluna dentro da matriz
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func layerSetUp(_ layer: Int) {
        let newGrid = manager.engineerThatPutIndividualsInNewHouses(oldGrid: grid, z: layer)
        creatANewGrid(newGrid, layer)
        grid = newGrid
    }

    func creatANewGrid(_ newGrid: [[Individuals]], _ layer: Int) {
        for row:Int in 0...32 {
        for col:Int in 0...32 {
            let cell = newGrid[row][col]

            let offset: Int = 16

            cell.position.x = Float(row - offset)
            cell.position.y = Float(col - offset)
            cell.position.z = Float(Double(layer) * (0.8 + 0.35))

            if cell.exists {
                self.rootNode.addChildNode(cell)
                }
            }
        }
    }
}
