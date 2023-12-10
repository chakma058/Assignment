// A.interface named Role
abstract class Role {
  void displayRole();
}

// B.class Person
class Person implements Role {
  String _name;
  int _age;
  String _address;

  // Constructor
  Person(this._name, this._age, this._address);

  // Getter methods
  String get getName => _name;
  int get getAge => _age;
  String get getAddress => _address;

  //implements the displayRole() method
  @override
  void displayRole() {
    print('Role:');
  }
}

// C.class Student that extends Person
class Student extends Person {
  String studentID;
  String grade;
  List<double> courseScores = [];

  // Constructor for Student
  Student(String name, int age, String address, this.studentID, this.grade)
      : super(name, age, address);

  // Override the displayRole() method
  @override
  void displayRole() {
    print('Role: Student ');
  }

  // Method to calculate the average score of courses
  double calculateAverageScore() {
    if (courseScores.isEmpty) {
      return 0.0;
    }
    double sum = courseScores.reduce((value, element) => value + element);
    return sum / courseScores.length;
  }
}

// D. class Teacher that extends Person
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught = [];

  // Constructor for Teacher
  Teacher(String name, int age, String address, this.teacherID)
      : super(name, age, address);

  // Override the displayRole() method
  @override
  void displayRole() {
    print('Role: Teacher');
  }

  // Method to display the courses taught by the teacher
  void displayCoursesTaught() {
    print('Courses Taught: ${coursesTaught.join('\n - ')}');
  }
}

// E. class StudentManagementSystem
class StudentManagementSystem {
  static void main() {
    // Create instances of Student and Teacher classes
    var student = Student('Emon', 28, '1203 Dhaka', 'ST47', 'A');
    var teacher = Teacher('Mr. Jhon', 40, '456 Badda St', 'T5');

    // Set attributes using appropriate methods
    student.courseScores = [85.0, 90.0, 78.0];
    teacher.coursesTaught = ['Math', 'Bangla', 'English'];

    //  displayRole() method to display the role of each person
    print('Student Information:');
    student.displayRole(); // Output: Role: Student
    print('Name:${student.getName} \n' +
        'Age:${student.getAge} \n' +
        'Address: ${student.getAddress}\n' +
        'Average Score: ${student.calculateAverageScore()}');
    print('\n');
    print('Teacher Information:');
    teacher.displayRole(); // Output: Role: Teacher
    print('Name:${teacher.getName} \n' +
        'Age:${teacher.getAge} \n' +
        'Address: ${student.getAddress}');
    teacher.displayCoursesTaught();
  }
}

void main() {
  StudentManagementSystem.main();
}
