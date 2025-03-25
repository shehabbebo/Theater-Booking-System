import 'dart:io';

void main() {
  List<List<String>> theater = List.generate(5, (_) => List.filled(5, 'E'));
  Map<String, Map<String, String>> bookings = {};

  while (true) {
    print("\n 🚀 Welcome To Our Theater 🚀");
    print("1. Book a new seat");
    print("2. Show the theater seats");
    print("3. Show users data");
    print("4. Exit");
    stdout.write("Input The number you want => ");
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      bookSeat(theater, bookings);
    } else if (choice == '2') {
      showSeats(theater);
    } else if (choice == '3') {
      showBookings(bookings);
    } else if (choice == '4') {
      print("Exiting...");
      break;
    } else {
      print("Invalid choice, please try again.");
    }
  }
}

void bookSeat(
    List<List<String>> theater, Map<String, Map<String, String>> bookings) {
  stdout.write("Enter row (1-5) or 'exit' to quit: ");
  String? rowInput = stdin.readLineSync();
  if (rowInput == 'exit') return;
  int row = int.tryParse(rowInput ?? '') ?? 0;

  stdout.write("Enter column (1-5): ");
  int col = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  if (row < 1 || row > 5 || col < 1 || col > 5) {
    print("Invalid seat position. Please enter a valid row and column.");
    return;
  }

  if (theater[row - 1][col - 1] == 'B') {
    print("Sorry, this seat is already booked.");
    return;
  }

  stdout.write("Enter your name: ");
  String? name = stdin.readLineSync();
  stdout.write("Enter your phone number: ");
  String? phone = stdin.readLineSync();

  theater[row - 1][col - 1] = 'B';
  bookings['$row,$col'] = {'name': name ?? '', 'phone': phone ?? ''};
  print("Seat booked successfully 🚀");
}

void showSeats(List<List<String>> theater) {
  print("\nTheater Seats:");
  for (var row in theater) {
    print(row.join(' '));
  }
}

void showBookings(Map<String, Map<String, String>> bookings) {
  print("\nUsers Booking Details:");
  if (bookings.isEmpty) {
    print("No bookings yet.");
  } else {
    bookings.forEach((seat, details) {
      print("Seat $seat: ${details['name']} - ${details['phone']}");
    });
  }
}
