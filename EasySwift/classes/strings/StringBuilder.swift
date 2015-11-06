public class StringBuilder {
    
    
    private var stringValue: String
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
    public func toString() -> String {
        return stringValue
    }
    /**
    Return the current length of the String object
    */
    public var length: Int {
        return stringValue.characters.count
    }
    /**
    Append a String to the object
    
    - parameter string: String
    :return: reference to this StringBuilder instance
    */
    public func append(string: String) -> StringBuilder {
        stringValue += string
        return self
    }
    /**
    Append a Printable to the object
    - parameter value: a value supporting the Printable protocol
    :return: reference to this StringBuilder instance
    */
    public func append<T: CustomStringConvertible>(value: T) -> StringBuilder {
        stringValue += value.description
        return self
    }
    
    /**
    Append a String and a newline to the object
    - parameter string: String
    :return: reference to this StringBuilder instance
    */
    public func appendLine(string: String) -> StringBuilder {
        stringValue += string + "\n"
        return self
    }
    
    /**
    Append a Printable and a newline to the object
    - parameter value: a value supporting the Printable protocol
    :return: reference to this StringBuilder instance
    */
    public func appendLine<T: CustomStringConvertible>(value: T) -> StringBuilder {
        stringValue += value.description + "\n"
        return self
    }
    /**
    Reset the object to an empty string
    
    :return: reference to this StringBuilder instance
    */
    public func clear() -> StringBuilder {
        stringValue = ""
        return self
    }
}



