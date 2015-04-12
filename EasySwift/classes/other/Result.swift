//
//  Result.swift
//  HomeBudgetSoft
//
//  Created by lubos plavucha on 28/10/14.
//  Copyright (c) 2014 Acepricot. All rights reserved.
//

public struct Result<T, E> {
    
    
    
    private var success: T?
    private var error: E?
    
    
    public init (success: T) {
        self.success = success
    }
    
    
    public init (error: E) {
        self.error = error
    }
    
    
    public func isSuccess() -> Bool {
        return success != nil
    }
    
    public func isFailure() -> Bool {
        return error != nil
    }
    
    public func getSuccessMessage() -> T? {
        return self.success
    }
    
    public func getFailureMessage() -> E? {
        return self.error
    }
    

}
