import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/components/dialog_simple.dart';

class DialogReporterDestiniesFinished {
  BuildContext context;
  String filename;
  String? filePath;

  DialogReporterDestiniesFinished(
      {required this.context, required this.filename, this.filePath});

  String get _title => "Reporte Generado";

  set path(String path) => filePath = path;

  String get _path => filePath ?? "";

  List<Widget> get _listBody {
    return <Widget>[
      const Text('Ubicación del archivo:'),
      const Divider(),
      Text(_path),
      const Divider(),
      const Text('Nombre del archivo:'),
      const Divider(),
      Text(filename),
    ];
  }

  List<Widget> get _actions {
    return <Widget>[
      TextButton(
        child: const Text('Cerrar'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )
    ];
  }

  void showDialog() {
    showMyDialogSimple(context, _title, _listBody, _actions);
  }
}
