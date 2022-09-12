class DiagnosisModel {
  DiagnosisModel({
    required this.id,
    required this.diagnosesId,
    required this.patientsId,
    required this.diagnoses,
    required this.doctorsId,
    required this.additionalInformation,
    required this.doctorName,
    required this.date,
  });

  final int id;
  final String diagnosesId;
  final String patientsId;
  final String diagnoses;
  final String doctorsId;
  final String additionalInformation;
  final String doctorName;
  final DateTime date;

  factory DiagnosisModel.fromJson(Map<String, dynamic> json) => DiagnosisModel(
        id: json["id"],
        diagnosesId: json["diagnoses_id"],
        patientsId: json["patients_id"],
        diagnoses: json["diagnoses"],
        doctorsId: json["doctors_id"],
        additionalInformation: json["additional_information"],
        doctorName: json["doctor_name"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "diagnoses_id": diagnosesId,
        "patients_id": patientsId,
        "diagnoses": diagnoses,
        "doctors_id": doctorsId,
        "additional_information": additionalInformation,
        "doctor_name": doctorName,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
