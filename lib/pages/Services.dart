import 'package:flutter/material.dart';
import 'package:achei_mudei/widgets/servicesDetailsBuilder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServicesBuilder extends StatefulWidget {
  @override
  _ServicesBuilder createState() => _ServicesBuilder();
}

class _ServicesBuilder extends State<ServicesBuilder> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(5),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              servicesMaterial('Assessoria', FontAwesomeIcons.userTie, context, 1),
              servicesMaterial('Documentista Imobiliário', FontAwesomeIcons.fileAlt, context, 2),
              servicesMaterial('Elaboração de Contrato', FontAwesomeIcons.handshake, context, 3),
              servicesMaterial('Escritório de Advocacia', FontAwesomeIcons.gavel, context, 4),
              servicesMaterial('Registro de Imóveis', FontAwesomeIcons.home, context, 5),
              servicesMaterial('Simulações de Financiamento', FontAwesomeIcons.handHoldingUsd, context, 6),
            ],
          ),
        ),
      ],
    );
  }
}

Widget servicesMaterial(String label, IconData icon, BuildContext context, int index) {

  return Material(
    color: Colors.blue,
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ServicesDetails(index: index)));
      }, // handle your onTap here
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: Colors.white),
            SizedBox(height: 20),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}