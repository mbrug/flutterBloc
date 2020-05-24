//steps
// 1 imports
// 2 lista de empleados
// 3 stream controller
// 4 Getter: stream sink
// 5 Constructor - anadir data escuchar cambios
// 6 funciones principales
// 7 Dispose


import 'dart:async';
import '../models/employee.dart';

class EmployeeBloc {
  List<Employee> _employeeList = [
    Employee(1, "michael", 4000.0),
    Employee(2, "Javier", 4000.0),
    Employee(3, "Pochet", 4000.0),
    Employee(4, "Yoiler", 4000.0),
  ];

  //Streams Controller
  final _employeeListStreamController = StreamController<List<Employee>>();
  final _employeeIncrementStreamController = StreamController<Employee>();
  final _employeeDecrementStreamController = StreamController<Employee>();

  //Getter: stream and sink
  Stream <List<Employee>> get employeeListStream => _employeeListStreamController.stream;
  StreamSink <List<Employee>> get employeeListSink => _employeeListStreamController.sink;

  StreamSink <Employee> get employeeSalarioIncrement =>
      _employeeIncrementStreamController.sink;
  StreamSink <Employee> get employeeSalarioDecrement =>
      _employeeDecrementStreamController.sink;

  EmployeeBloc(){
    _employeeListStreamController.add(_employeeList);
    _employeeIncrementStreamController.stream.listen(_increment);
    _employeeDecrementStreamController.stream.listen(_decrement);
  }

  _increment(Employee employee){
    double salarioActual = employee.salario;
    double salarioIncrement = salarioActual * 20/100;

    _employeeList[employee.id -1].salario = salarioActual + salarioIncrement;
    employeeListSink.add(_employeeList);
  }

  _decrement(Employee employee){
    double salarioActual = employee.salario;
    double salarioDecrement = salarioActual * 20/100;

    _employeeList[employee.id -1].salario = salarioActual - salarioDecrement;
    employeeListSink.add(_employeeList);
  }

  //dispose
  void dispose(){
    _employeeListStreamController.close();
    _employeeIncrementStreamController.close();
    _employeeDecrementStreamController.close();
  }

}