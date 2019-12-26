import 'package:flutter/material.dart';
import 'package:teste_funcando/widgets/servicosDetalhesBuilder.dart';
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
              servicosMaterial('Assessoria', FontAwesomeIcons.userTie, context, 1),
              servicosMaterial('Documentista Imobiliário', FontAwesomeIcons.fileAlt, context, 2),
              servicosMaterial('Elaboração de Contrato', FontAwesomeIcons.handshake, context, 3),
              servicosMaterial('Escritório de Advocacia', FontAwesomeIcons.gavel, context, 4),
              servicosMaterial('Registro de Imóveis', FontAwesomeIcons.home, context, 5),
              servicosMaterial('Simulações de Financiamento', FontAwesomeIcons.handHoldingUsd, context, 6),
            ],
          ),
        ),
      ],
    );
  }
}

Widget servicosMaterial(String label, IconData icone, BuildContext context, int index) {

  return Material(
    color: Colors.blue,
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ServicosDetalhesBuilder(index: index)));
      }, // handle your onTap here
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