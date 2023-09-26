//
//  Color.swift
//  Pokemon
//
//  Created by Fajriharish on 26/09/23.
//

import SwiftUI

extension Color {
    static subscript(name: String) -> Color {
        switch name {
        case "green":
            return Color.green
        case "white":
            return Color.white
        case "black":
            return Color.black
        case "red":
            return Color.red
        case "blue":
            return Color.blue
        case "yellow":
            return Color.yellow
        case "orange":
            return Color.orange
        case "gray":
            return Color.gray
        case "brown":
            return Color.brown
        case "cyan":
            return Color.cyan
        case "indigo":
            return Color.indigo
        case "purple":
            return Color.purple
        case "teal":
            return Color.teal
        case "mint":
            return Color.mint
        case "pink":
            return Color.pink
        default:
            return Color.accentColor
        }
    }
}
