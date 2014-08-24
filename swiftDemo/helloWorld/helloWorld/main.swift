//
//  main.swift
//  helloWorld
//
//  Created by 侯 坤明 on 14-6-16.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

import Foundation

println("Hello, World!")
println(20)

var a = 10, b = 20;

var c = String(a) + "30"

var d = (c)

for var i = 0; i < 10; i++ {
    d += String(i)
}

func add(a:Float, b:Float) -> Float{
    return a + b
}



add(10, 20)

switch add(5, 0){
case let x where x < 3:
    print( "<3")
case (5...80):
    print("5...80")
default:
    "default"
    
}

print("sadf")

