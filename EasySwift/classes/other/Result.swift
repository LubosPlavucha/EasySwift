//
//  Result.swift
//  HomeBudgetSoft
//
//  Created by lubos plavucha on 28/10/14.
//  Copyright (c) 2014 Acepricot. All rights reserved.
//

public enum Result<T, E> {
    
    /*
        We can't use this at the moment due to a LLVM Error:
        error: unimplemented IR generation feature non-fixed multi-payload enum layout
        LLVM ERROR: unimplemented IRGen feature! non-fixed multi-payload enum layout
        case Success(T)
        case Failure(E)
    
        TODO once it is fixed in Swift -> use it without autoclosure annotation
    */
    
    
    case Success(@autoclosure() -> T)
    case Failure(@autoclosure() -> E)
    
    
    
    public func isSuccess() -> Bool {
        switch self {
            case .Success: return true
            default: return false
        }
    }
    
    public func isFailure() -> Bool {
        return !self.isSuccess()
    }
    
    public func success() -> T? {
        switch self {
            case .Success(let x): return Optional.Some(x())
            default: return nil
        }
    }
    
    public func failure() -> E? {
        switch self {
            case .Failure(let e): return Optional.Some(e())
            default: return nil
        }
    }
    
    
    public func map<U>(f: T -> U) -> Result<U, E> {
        
        switch self {
            case Success(let value):
                return .Success(f(value()))
            case Failure(let failure):
                return .Failure(failure())
        }
    }
    

    

}
