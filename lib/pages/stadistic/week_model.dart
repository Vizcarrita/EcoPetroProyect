class PorcentageModel {
  String title;
  double porcentage;
  List<PorcentageModel>? porcentages;

  PorcentageModel({
    required this.title,
    required this.porcentage,
    this.porcentages,
  });

  /// Dias de la semana 1
  static List<PorcentageModel> dayOne = [
    PorcentageModel(
      title: 'Lunes',
      porcentage: 10,
    ),
    PorcentageModel(
      title: 'Martes',
      porcentage: 10,
    ),
    PorcentageModel(
      title: 'Miercoles',
      porcentage: 10,
    ),
    PorcentageModel(
      title: 'Jueves',
      porcentage: 10,
    ),
    PorcentageModel(
      title: 'Viernes',
      porcentage: 10,
    ),
    PorcentageModel(
      title: 'Sabado',
      porcentage: 10,
    ),
    PorcentageModel(
      title: 'Domingo',
      porcentage: 10,
    ),
  ];

  /// Semanas el dia 1
  static List<PorcentageModel> weekOne = [
    PorcentageModel(
      title: 'Semana 1',
      porcentage: 1,
      porcentages: dayOne,
    ),
    PorcentageModel(
      title: 'Semana 2',
      porcentage: 2,
    ),
    PorcentageModel(
      title: 'Semana 3',
      porcentage: 3,
    ),
    PorcentageModel(
      title: 'Semana 4',
      porcentage: 4,
    ),
  ];

  /// Meses
  static List<PorcentageModel> months = [
    PorcentageModel(
      title: 'Enero',
      porcentage: 1,
      porcentages: PorcentageModel.weekOne,
    ),
    PorcentageModel(
      title: 'Febrero',
      porcentage: 2,
    ),
    PorcentageModel(
      title: 'Marzo',
      porcentage: 3,
    ),
    PorcentageModel(
      title: 'Abril',
      porcentage: 4,
    ),
    PorcentageModel(
      title: 'Mayo',
      porcentage: 5,
    ),
    PorcentageModel(
      title: 'Junio',
      porcentage: 6,
    ),
    PorcentageModel(
      title: 'Julio',
      porcentage: 7,
    ),
    PorcentageModel(
      title: 'Agosto',
      porcentage: 8,
    ),
    PorcentageModel(
      title: 'Septiembre',
      porcentage: 6,
    ),
    PorcentageModel(
      title: 'Octubre',
      porcentage: 10,
    ),
    PorcentageModel(
      title: 'Noviembre',
      porcentage: 11,
    ),
    PorcentageModel(
      title: 'Diciembre',
      porcentage: 12,
    ),
  ];
}
