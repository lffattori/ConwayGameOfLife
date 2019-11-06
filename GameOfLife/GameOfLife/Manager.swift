//
//  Manager.swift
//  GameOfLife
//
//  Created by Luiza Fattori on 01/11/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import Foundation
import SceneKit

// Cuidar das regras do jogo

class Managers {

    var individuals = [Individuals]()

    //    Zelador = cuidar dos vizinhos - verificar os vizinhos vivos
    func janitorCheckNeighbords (grid: [[Individuals]], x: Int, y: Int) -> Int {
        var count = 0

        if y-1 >= 0 && y-1 < grid.count {
            if x-1 >= 0 && x-1 < grid[y-1].count {
                if grid[y-1][x-1].isAlive == true {
                    count += 1
                }
            }
            if x >= 0 && x < grid[y-1].count {
                if grid[y-1][x].isAlive == true {
                    count += 1
                }
            }
            if x+1 >= 0 && x+1 < grid[y-1].count {
                if grid[y-1][x+1].isAlive == true {
                    count += 1
                }
            }
        }
        if y >= 0 && y-1 < grid.count {
            if x-1 >= 0 && x-1 < grid[y].count {
                if grid[y][x-1].isAlive == true {
                    count += 1
                }
            }

            if x+1 >= 0 && x+1 < grid[y].count {
                if grid[y][x+1].isAlive == true {
                    count += 1
                }
            }
        }
        if y+1 >= 0 && y+1 < grid.count {
            if x-1 >= 0 && x-1 < grid[y+1].count {
                if grid[y+1][x-1].isAlive == true {
                    count += 1
                }
            }
            if x >= 0 && x < grid[y+1].count {
                if grid[y+1][x].isAlive == true {
                    count += 1
                }
            }
            if x+1 >= 0 && x+1 < grid[y+1].count {
                if grid[y+1][x+1].isAlive == true {
                    count += 1
                }
            }
        }
        return count
    }
    //    Mafioso = vai mandar matar ou avivar
    func godfatherMobsterOrderToKillorRevivalgrid (grid: [[Individuals]], x: Int, y: Int, count: Int) -> Bool {

        if grid[y][x].isAlive == true {
            if count<=1 || count >= 4 {
                return false
            } else {
                return true
            }
        } else {
            if count == 3 {
                return true
            }
        }
        return false
    }
// Criador de novas grids
    func engineerThatPutIndividualsInNewJails (oldGrid: [[Individuals]], z: Int) -> [[Individuals]] {
        var newGrid : [[Individuals]] = []
        var count = 0

        for y in (0..<oldGrid.count) {
            newGrid.append([])
            for x in (0..<oldGrid[y].count) {
                newGrid[y].append(cloneIndividual(oldIndividual: oldGrid[y][x], z: z))

                count = janitorCheckNeighbords(grid: oldGrid, x: x, y: y)

                let alive = godfatherMobsterOrderToKillorRevivalgrid(grid: newGrid, x: x, y: y, count: count)
                newGrid[y][x].isAlive = alive
                newGrid[y][x].exists = alive

                }
            }
        return newGrid
    }

    func cloneIndividual(oldIndividual: Individuals, z: Int) -> Individuals {
        let newIndividual: Individuals = Individuals(x: oldIndividual.x, y: oldIndividual.y, z: z)

        newIndividual.isAlive = oldIndividual.isAlive
        newIndividual.exists = false

        return newIndividual
    }
}
