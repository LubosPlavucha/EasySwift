

import Foundation
import SystemConfiguration


open class Reachability {
    
    
    open class func isConnectedToNetwork() -> Bool{
        
        var status = false
        let url = URL(string: "https://google.com/")
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "HEAD"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 10.0
        
        var response: URLResponse?
        
        do {
            try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: &response) 
        } catch {}
        
        if let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200 {
            status = true
        }
        
        return status
    }
    
}
