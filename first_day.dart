import 'dart:io';

class User {
  String name;
  String phone;

  User({required this.name, required this.phone});

  @override
  String toString() => '$name - $phone';
}

class Theater {
  //  Singleton instance
  static final Theater _instance = Theater._internal();

  factory Theater() {
    return _instance;
  }

  Theater._internal() {
    seats = List.generate(rows, (_) => List.generate(cols, (_) => 'E'));
  }

  final int rows = 5;
  final int cols = 5;
  late List<List<String>> seats;
  Map<String, User> bookings = {};

  void showSeats() {
    print("\nTheater Seats:");
    for (var row in seats) {
      print(row.join(' '));
    }
    print('');
  }

  bool isAvailable(int row, int col) {
    return seats[row][col] == 'E';
  }

  void bookSeat(int row, int col, User user) {
    if (isAvailable(row, col)) {
      seats[row][col] = 'B';
      bookings['${row + 1},${col + 1}'] = user;
      print("✅ Seat booked successfully!\n");
    } else {
      print("❌ This seat is already booked.\n");
    }
  }

  void showBookings() {
    if (bookings.isEmpty) {
      print("No bookings yet.\n");
      return;
    }
    print("\nUsers Booking Details:");
    bookings.forEach((position, user) {
      print('Seat $position: $user');
    });
    print('');
  }
}

void main() {
  final theater = Theater();

  print("🚀 Welcome To Our Theater 🚀\n");

  while (true) {
    // print("📋 Menu:");
    print("1️⃣  Press 1 to book a new seat");
    print("2️⃣  Press 2 to show the theater seats");
    print("3️⃣  Press 3 to show users data");
    print("4️⃣  Press 4 to exit");

    stdout.write("input => ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Enter row (1-5) : ");
        String? rowInput = stdin.readLineSync();
        if (rowInput == null || rowInput.toLowerCase() == 'exit') continue;

        stdout.write("Enter column (1-5): ");
        String? colInput = stdin.readLineSync();

        if (rowInput != null && colInput != null) {
          int row = int.parse(rowInput) - 1;
          int col = int.parse(colInput) - 1;

          if (row >= 0 && row < 5 && col >= 0 && col < 5) {
            if (theater.isAvailable(row, col)) {
              stdout.write("Enter your name: ");
              String? name = stdin.readLineSync();
              stdout.write("Enter your phone number: ");
              String? phone = stdin.readLineSync();

              if (name != null && phone != null) {
                User user = User(name: name, phone: phone);
                theater.bookSeat(row, col, user);
              } else {
                print("❌ Invalid input.\n");
              }
            } else {
              print("❌ This seat is already booked.\n");
            }
          } else {
            print("❌ Invalid seat position.\n");
          }
        }
        break;

      case '2':
        theater.showSeats();
        break;

      case '3':
        theater.showBookings();
        break;

      case '4':
        print("👋 Goodbye!");
        return;

      default:
        print("❌ Invalid choice. Try again.\n");
    }
  }
}
