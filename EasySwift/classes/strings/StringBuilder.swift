open class StringBuilder {
    
    
    fileprivate var stringValue: String
    /**
    Construct with initial String contents
    
    - parameter string: Initial value; defaults to empty string
    */
    public init(string: String = "") {
        self.stringValue = string
    }
    /**
    Return the String object
    :return: String
    */
    open func toString() -> String {
        return stringValue
    }
    /**
    Return the current length of the String object
    */
    open var length: Int {
        return stringValue.characters.count
    }
    /**
    Append a String to the object
    
    - parameter string: String
    :return: reference to this StringBuilder instance
    */
    open func append(_ string: String) -> StringBuilder {
        stringValue += string
        return self
    }
    /**
    Append a Printable to the object
    - parameter value: a value supporting the Printable protocol
    :return: reference to this StringBuilder instance
    */
    open func append<T: CustomStringConvertible>(_ value: T) -> StringBuilder {
        stringValue += value.description
        return self
    }
    
    /**
    Append a String and a newline to the object
    - parameter string: String
    :return: reference to this StringBuilder instance
    */
    open func appendLine(_ string: String) -> StringBuilder {
        stringValue += string + "\n"
        return self
    }
    
    /**
    Append a Printable and a newline to the object
    - parameter value: a value supporting the Printable protocol
    :return: reference to this StringBuilder instance
    */
    open func appendLine<T: CustomStringConvertible>(_ value: T) -> StringBuilder {
        stringValue += value.description + "\n"
        return self
    }
    /**
    Reset the object to an empty string
    
    :return: reference to this StringBuilder instance
    */
    open func clear() -> StringBuilder {
        stringValue = ""
        return self
    }
}



