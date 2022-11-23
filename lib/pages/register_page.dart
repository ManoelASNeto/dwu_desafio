import 'package:dwu_desafio/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _date = TextEditingController();
  final List<String> items = [
    'Não Informado',
    'Masculino',
    'Feminino',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cadastro de Novo Usario',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomTextFormField(
              info: 'Nome',
              input: TextInputType.text,
            ),
            const CustomTextFormField(
              info: 'Sobrenome',
              input: TextInputType.text,
            ),
            const CustomTextFormField(
              info: 'Idade',
              input: TextInputType.number,
            ),
            DropdownButton2(
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                });
              },
              hint: const Text('Genero'),
              items: items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            TextFormField(
              controller: _date,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                labelText: 'Selecione a Data',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onTap: () async {
                DateTime? pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));
                if (pickeddate != null) {
                  setState(() {
                    _date.text = pickeddate.toString();
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
