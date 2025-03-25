# Theater Booking System (Dart)

## Overview
This is a simple **Theater Booking System** written in **Dart** without using Object-Oriented Programming (OOP). It allows users to book seats in a 5x5 theater, view the seat layout, and see booking details.

## Features
- **Book a Seat**: Users can select a seat by entering a row and column number.
- **Check Availability**: The system prevents double booking.
- **Store User Data**: Each booking is stored with the user’s name and phone number.
- **Display Seat Layout**: Shows which seats are booked (B) and which are available (E).
- **Show Booking Details**: Displays the list of booked seats with user information.
- **Exit Option**: Users can exit the system anytime.

## Example Run
```
Welcome To Our Theater
1. Book a new seat
2. Show the theater seats
3. Show users data
4. Exit
Input => 2

Theater Seats:
E E E E E
E E E E E
E E E E E
E E E E E
E E E E E
```

```
Input => 1
Enter row (1-5) or 'exit' to quit:
Input => 3
Enter column (1-5):
Input => 4
Enter your name:
Input => Ahmed
Enter your phone number:
Input => 010456755555
Seat booked successfully!
```

## Future Improvements
- Add a **GUI version** using Flutter.
- Implement **OOP** for better structuring.
- Add **seat cancellation** and **multiple theater sizes**.


