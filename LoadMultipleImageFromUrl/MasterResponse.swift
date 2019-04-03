

import Foundation

public class MasterResponse:Decodable {
	public var _meta : _meta?
	public var result : Array<Result>?

}
public class _links:Decodable {
    public var `self` : Self?
    public var avatar : Avatar?
}
public class _meta:Decodable {
    public var success : Bool?
    public var code : Int?
    public var message : String?
    public var totalCount : Int?
    public var pageCount : Int?
    public var currentPage : Int?
    public var perPage : Int?
    public var rateLimit : RateLimit?
}
public class Avatar:Decodable {
    public var href : String?
}
public class RateLimit :Decodable{
    public var limit : Int?
    public var remaining : Int?
    public var reset : Int?
}
public class Result:Decodable {
    public var id : String?
    public var name : String?
    public var gender : String?
    public var dob : String?
    public var email : String?
    public var phone : String?
    public var website : String?
    public var address : String?
    public var status : String?
    public var _links : _links?
}
public class `Self`:Decodable {
    public var href : String?
}
