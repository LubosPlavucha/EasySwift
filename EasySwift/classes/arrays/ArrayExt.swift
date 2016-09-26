//
//  Arrays.swift
//  HomeBudgetSoft
//
//  Created by lubos plavucha on 21/10/14.
//  Copyright (c) 2014 Acepricot. All rights reserved.
//



    /** The method is extension of standard swift find method. It takes not only one object, returning its index in Array, but multiple ones. */
    public func find<C : Collection>(_ domain: C, values: [C.Iterator.Element]) -> [C.Index] where C.Iterator.Element : Equatable {
        
        var indexes:[C.Index] = []
        for value in values {
            if let index = domain.index(of: value) {
                indexes.append(index)
            }
        }
        return indexes
    }

        

