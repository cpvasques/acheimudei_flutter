import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServicosBuilder extends StatefulWidget {
  @override
  _ServicosBuilder createState() => _ServicosBuilder();
}

class _ServicosBuilder extends State<ServicosBuilder> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              servicosMaterial('Escritório de Advocacia', FontAwesomeIcons.gavel),
              servicosMaterial('Documentista Imobiliário', FontAwesomeIcons.fileAlt),
              servicosMaterial('Elaboração de Contrato', FontAwesomeIcons.handshake),
            ],
          ),
        ),
      ],
    );
  }
}

Widget servicosMaterial(String label, IconData icone) {
  return Material(
    color: Colors.blue,
    child: InkWell(
      onTap: () => print("Container pressed"), // handle your onTap here
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icone, size: 45, color: Colors.white),
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