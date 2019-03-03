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
    var bookingDate: DateComponents?
    var returnDate: DateComponents?
    static var bookingId:Int = 1
    
    init(){}
    init(BookingDate:DateComponents,ReturnDate:DateComponents, Customer:Customer, Movie:Movie, Quantity:Int){
        Booking.bookingId += 1
        self.customer = Customer
        self.movie = Movie
        self.quantity = Quantity
        self.bookingDate = BookingDate
        self.returnDate = ReturnDate
    }
    
    static func ExistedBooking(id:Int) -> Booking?{
        for Booking in AppDelegate.BookingList{
            if(Booking.id==id){
                return Booking
            }
        }
        return nil
    }
    
}
