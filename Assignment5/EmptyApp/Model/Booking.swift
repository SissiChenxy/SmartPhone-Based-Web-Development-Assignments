//
//  Backend.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/21/19.
//  Copyright © 2019 rab. All rights reserved.
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
    
}


