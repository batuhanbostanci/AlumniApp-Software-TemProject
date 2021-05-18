final String tableUsers = 'users';

class UserFields {
  static final List<String> values = [
    id, isAlumni, address, phoneNumber, jobTitle, registrationDate
  ];

  static final String id = '_id';
  static final String firstName = 'firstName';
  static final String lastName = 'lastName';
  static final String email = 'email';
  static final String isAlumni = 'isAlumni';
  static final String address = 'address';
  static final String phoneNumber = 'phoneNumber';
  static final String jobTitle = 'jobTitle';
  static final String registrationDate = 'registrationDate';
}

class AlumniUser {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final bool isAlumni;
  final String address;
  final String jobTitle;
  final DateTime registrationDate;

  const AlumniUser(
      {this.id,
      this.isAlumni,
      this.firstName,
      this.lastName,
      this.email,
      this.address,
      this.jobTitle,
      this.registrationDate});

  AlumniUser copy({
    int id,
    String firstName,
    String lastName,
    String email,
    bool isAlumni,
    String jonTitle,
    String address,
    DateTime registrationDate,
  }) =>
      AlumniUser(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: this.email,
        isAlumni: this.isAlumni,
        jobTitle: this.jobTitle,
        address: this.address,
        registrationDate: this.registrationDate,
      );

  static AlumniUser fromJson(Map<String, Object> json) => AlumniUser(
        id: json[UserFields.id] as int,
        firstName: json[UserFields.firstName] as String,
        lastName: json[UserFields.lastName] as String,
        email: json[UserFields.email] as String,
        isAlumni: json[UserFields.isAlumni] == 1,
        jobTitle: json[UserFields.jobTitle] as String,
        address: json[UserFields.address] as String,
        registrationDate:
            DateTime.parse(json[UserFields.registrationDate] as String),
      );

  Map<String, Object> toJson() => {
        UserFields.id: id,
        UserFields.firstName: firstName,
        UserFields.lastName: lastName,
        UserFields.jobTitle: jobTitle,
        UserFields.address: address,
        UserFields.isAlumni: isAlumni ? 1 : 0,
        UserFields.registrationDate: registrationDate.toIso8601String(),
        UserFields.email: email,
      };
}
