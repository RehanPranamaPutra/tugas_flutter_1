import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageMahasiswa extends StatefulWidget {
  const PageMahasiswa({super.key});

  @override
  State<PageMahasiswa> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PageMahasiswa> {
  TextEditingController nim = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController noTelp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  String? valJurusan, valProdi, inputForm;
  final _formKey = GlobalKey<FormState>();

  // Future selectData() async {
  //   DateTime? picDate = await showDatePicker(
  //     initialDate: DateTime.now(),
  //     context: context,
  //     firstDate: DateTime(1950),
  //     lastDate: DateTime(2100),
  //   );
  //   if (picDate != null) {
  //     tglLahir.text = DateFormat("dd-MM-yyyy").format(picDate);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('Form Mahasiswa', style: TextStyle(fontSize: 10)),
                ),
                SizedBox(height: 13),
                CostumeInput(
                  labelInput: 'NIM',
                  controller: nim,
                  hintText: '2301092030',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 13),
                CostumeInput(
                  labelInput: 'Nama',
                  controller: nama,
                  hintText: 'Rehan',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 13),
                CostumeInput(
                  labelInput: 'No Telp',
                  controller: noTelp,
                  hintText: '0815',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 13),
                // CostumeInput(
                //   labelInput: 'tanggal lahir',
                //   controller: tglLahir,
                //   hintText: '01-09-2004',
                //   textInputType: TextInputType.text,
                //   onTap: () {
                //     selectData();
                //   },
                // ),
                SizedBox(height: 13),
                CostumeInput(
                  labelInput: 'Alamat',
                  controller: alamat,
                  hintText: 'jl.melati',
                  textInputType: TextInputType.text,
                 
                ),
                SizedBox(height: 15),
                Text("Pilih Jurusan", style: TextStyle(fontSize: 18)),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    value: valJurusan,
                    underline: Container(),
                    isExpanded: true,
                    items:
                        [
                          'TI',
                          "Elektro",
                          "Mesin",
                        ].map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(e),
                            ),
                          );
                        }).toList(),
                    onChanged: (val) {
                      setState(() {
                        valJurusan = val;
                      });
                    },
                  ),
                ),
                SizedBox(height: 18),
                Text('Jenis Kelamin', style: TextStyle(fontSize: 18)),
                SizedBox(height: 15),
                Row(
                  children: [
                    Flexible(
                      child: CostumeRadio(
                        groupValue: valProdi.toString(),
                        value: 'MI',
                        onChanged: (val) {
                          setState(() {
                            valProdi = val;
                          });
                        },
                      ),
                    ),
                    Flexible(
                      child: CostumeRadio(
                        groupValue: valProdi.toString(),
                        value: 'TRPL',
                        onChanged: (val) {
                          setState(() {
                            valProdi = val;
                          });
                        },
                      ),
                    ),
                     Flexible(
                      child: CostumeRadio(
                        groupValue: valProdi.toString(),
                        value: 'TKOM',
                        onChanged: (val) {
                          setState(() {
                            valProdi = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                CostumButton(
                  bgColor: Colors.red,
                  labelColor: Colors.white,
                  labelButton: "Save",
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        if (valJurusan != null && valProdi != null) {
                          inputForm =
                              "NIM : ${nim.text}\n"
                              "Nama : ${nama.text}\n"
                              "no TElp : ${noTelp.text}\n"
                              // "Tanggal Lahir : ${tglLahir.text}\n"
                              "Jurusan: ${valJurusan.toString()}\n"
                              "Prodi: ${valProdi.toString()}";
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(inputForm.toString())),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Silahkan pilih Jurusan  dan Prodi',
                              ),
                            ),
                          );
                        }
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CostumeInput extends StatelessWidget {
  final String labelInput;
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final VoidCallback? onTap;

  const CostumeInput({
    super.key,
    required this.labelInput,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    this.obscureText = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelInput, style: TextStyle(fontSize: 18)),
        TextFormField(
          controller: controller,
          validator: (val) {
            return val!.isEmpty ? 'Input tidak boleh kosong' : null;
          }, // berfungsi untuk memproses input -> mengambil data dari input
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          keyboardType: textInputType,
          obscureText: obscureText,
          onTap: () {
            onTap?.call();
          },
        ),
      ],
    );
  }
}

class CostumeRadio extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;

  const CostumeRadio({
    super.key,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RadioListTile(
        value: value,
        groupValue: groupValue,
        onChanged: (val) {
          if (val != null) {
            onChanged(val);
          }
        },
        title: Text(value),
      ),
    );
  }
}

class CostumButton extends StatelessWidget {
  final Color bgColor;
  final String labelButton;
  final VoidCallback onPressed;
  final Color labelColor;

  const CostumButton({
    super.key,
    required this.bgColor,
    required this.labelColor,
    required this.labelButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          backgroundColor: bgColor,
        ),
        onPressed: () {
          onPressed.call();
        },
        child: Text(labelButton, style: TextStyle(color: labelColor)),
      ),
    );
  }
}
