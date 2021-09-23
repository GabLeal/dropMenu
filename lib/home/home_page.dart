import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:menudrop/components/drop_down_custom/drop.dart';
import 'package:menudrop/home/controller.dart';
import 'package:menudrop/home/model_example.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Esse modelo pode ser passado com o retorno de uma lista de model vindo da API
  DropController<ModelExemplo> dropController = DropController(
    items: [
      ModelExemplo(name: 'RJ', value: 12),
      ModelExemplo(name: 'SP', value: 10),
      ModelExemplo(name: 'AC', value: 4),
      ModelExemplo(name: 'MG', value: 7),
      ModelExemplo(name: 'RS', value: 5),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DEMO"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Titulo',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                CustomDropdown<ModelExemplo>(
                    itemSelected: Text(dropController.itemTextSelected),
                    controller: dropController,
                    icon: const FaIcon(
                      FontAwesomeIcons.chevronDown,
                      size: 12,
                    ),
                    child: const Text(
                      'Placeholder',
                    ),
                    onChange: (ModelExemplo value, int index) {
                      dropController.itemSelected(value.name);
                    },
                    dropdownButtonStyle: const DropdownButtonStyle(
                      width: 300,
                      height: 40,
                      elevation: 1,
                      backgroundColor: Colors.white,
                      primaryColor: Colors.black87,
                    ),
                    dropdownStyle: DropdownStyle(
                      borderRadius: BorderRadius.circular(8),
                      elevation: 0,
                      padding: const EdgeInsets.all(5),
                    ),
                    items: dropController.items.map((e) {
                      return DropdownItem<ModelExemplo>(
                        value: e,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(e.name),
                          ),
                        ),
                      );
                    }).toList()),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Text(
                  '*** outros componentes que podem ficar abaixo deste widget ***'),
            )
          ],
        ),
      ),
    );
  }
}
