

import Foundation
import SystemConfiguration


public class Reachability {
    
    
    public class func isConnectedToNetwork() -> Bool{
        
        var status = false
        let url = NSURL(string: "https://google.com/")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "HEAD"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 10.0
        
        var response: NSURLResponse?
        
        do {
            try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response) 
        } catch {}
        
        if let httpResponse = response as? NSHTTPURLResponse where httpResponse.statusCode == 200 {
            status = true
        }
        
        return status
    }
    
}
