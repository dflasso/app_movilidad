import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/components/title_level1.dart';
import 'package:geo_espe_app_movilidad/src/modules/settings/report_destinies_finished.dart';
import 'package:geo_espe_app_movilidad/src/theme/theme.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  bool isExpandedPanel = false;

  void handleExpansionEvent(int index, bool isExpanded) {
    setState(() {
      isExpandedPanel = !isExpanded;
    });
  }

  Widget header(BuildContext context, bool isExpanded) {
    return ListTile(
      leading: Icon(
        Icons.text_snippet,
        color: Pallette.primary.dark,
      ),
      tileColor: Pallette.primary.light,
      title: const TitleLevel1(title: 'Reportes'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: handleExpansionEvent,
      children: <ExpansionPanel>[
        ExpansionPanel(
            headerBuilder: header,
            body: const ReportDestiniesFinished(),
            isExpanded: isExpandedPanel,
            backgroundColor: Pallette.primary.light)
      ],
      dividerColor: Pallette.primary.dark,
    );
  }
}
