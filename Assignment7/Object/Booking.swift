//
//  Booking.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/2/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import Foundation
class Booking{
    var id: Int = bookingId
    var customer: Customer?
    var movie: Movie?
    var quantity: Int?
    var bookingDate: String?
    var returnDate: String?
    static var bookingId:Int = 1
    
    init(){}
    init(BookingDate:String,ReturnDate:String, Customer:Customer, Movie:Movie, Quantity:Int){
        Booking.bookingId += 1
        self.customer = Customer
        self.movie = Movie
        self.quantity = Quantity
        self.bookingDate = BookingDate
        self.returnDate = ReturnDate
    }
    
    static func FindBooking(id:Int) -> Booking?{
        for Booking in AppDelegate.BookingList{
            if(Booking.id==id){
                return Booking
            }
        }
        return nil
    }
    static func ExistedBooking(movie:String,customer:String,quantity:Int,bookingDate:String,returnDate:String) -> Booking?{
        for Booking in AppDelegate.BookingList{
            if(Booking.movie?.name==movie&&Booking.customer?.name==customer&&Booking.quantity==quantity&&Booking.bookingDate==bookingDate&&Booking.returnDate==returnDate){
                return Booking
            }
        }
        return nil
    }
    
}
