//
//  School.swift
//  nyc_school_code_challenge
//
//  Created by Amali Krigger on 9/10/23.
//

import Foundation

struct School:Decodable {
    let schoolName:String
    let dbn:String
}

struct SAT:Decodable {
    let schoolName:String
    let satCriticalReadingAvgScore:String
    let satMathAvgScore:String
    let satWritingAvgScore:String
    let dbn:String
}
