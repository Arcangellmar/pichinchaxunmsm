import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'dart:math';
import 'dart:async';

import 'utils/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DataPage(),
    );
  }
}

class DataPage extends StatelessWidget {
  DataPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController numberVoucherController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController importController = TextEditingController();
  final int randomNumber = 10000000 + Random().nextInt(99999999 - 10000000);
  int? typeMoney;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      body: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultSize * 2, vertical: kDefaultSize),
            child: Column(
              children: <Widget>[
                const SizedBox(height: kDefaultSize * 2),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 150 * MediaQuery.of(context).textScaleFactor,
                        child: SvgPicture.asset("assets/img/Banco_Pichincha_logo.svg"),
                      )
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 150 * MediaQuery.of(context).textScaleFactor,
                        child: SvgPicture.asset("assets/img/UNMSM.svg"),
                      )
                    ),
                  ],
                ),
                const SizedBox(height: kDefaultSize * 2),
                Text("Ingrese los datos", style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                const SizedBox(height: kDefaultSize * 2),
                Text("Numero de voucher N°" + randomNumber.toString(), textAlign: TextAlign.center),
                const SizedBox(height: kDefaultSize * 2),

                const Text("N° Cuenta:"),
                const SizedBox(height: kDefaultSize),
                TextFormField(
                  keyboardType: TextInputType.name,
                  enabled: false,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    fillColor: Colors.black12,
                    filled: true,
                    prefixIcon: Icon(Icons.numbers),
                    label: Text("000270016684"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)))),
                ),
                const SizedBox(height: kDefaultSize * 2),

                const Text("Fecha:"),
                const SizedBox(height: kDefaultSize),
                TextFormField(
                  keyboardType: TextInputType.name,
                  enabled: false,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    fillColor: Colors.black12,
                    filled: true,
                    prefixIcon: const Icon(Icons.date_range),
                    label: Text(DateFormat("dd/MM/yyyy").format(DateTime.now())),
                    border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)))),
                ),
                const SizedBox(height: kDefaultSize * 2),

                const Text("Concepto de Pago:"),
                const SizedBox(height: kDefaultSize),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text("Concepto de pago"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    prefixIcon: Icon(Icons.numbers),
                    hintText: "Ejemplo: 210-338",),
                  controller: numberVoucherController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Ingrese un texto";
                    RegExp regex = RegExp("");
                    if (!regex.hasMatch(value)) return "Ingrese un  dato valido";
                    return null;
                  },
                ),
                const SizedBox(height: kDefaultSize * 2),

                const Text("Tipo de Moneda:"),
                const SizedBox(height: kDefaultSize),
                DropdownButtonFormField <int>(
                  onChanged: (value) => typeMoney = value,
                  items: const [
                    DropdownMenuItem(child: Text("Soles"), value: 1,),
                    DropdownMenuItem(child: Text("Dolares"), value: 2,),
                  ],
                  decoration: const InputDecoration(
                    label: Text("Moneda"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    prefixIcon: Icon(Icons.monetization_on),
                    hintText: "Ejemplo: Soles",),
                  validator: (value) {
                    if (value == null) return "Ingrese un texto";
                    // RegExp regex = RegExp("");
                    // if (!regex.hasMatch(value)) return "Ingrese un  dato valido";
                    return null;
                  }
                ),
                const SizedBox(height: kDefaultSize * 2),

                const Text("Nombre:"),
                const SizedBox(height: kDefaultSize),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text("Nombre"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    prefixIcon: Icon(Icons.person),
                    hintText: "Ejemplo: Rolando",),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Ingrese un texto";
                    RegExp regex = RegExp("");
                    if (!regex.hasMatch(value)) return "Ingrese un  dato valido";
                    return null;
                  },
                ),
                const SizedBox(height: kDefaultSize * 2),

                const Text("Codigo:"),
                const SizedBox(height: kDefaultSize),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text("Codigo"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    prefixIcon: Icon(Icons.numbers),
                    hintText: "Ejemplo: 19200262",),
                  controller: codeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Ingrese un texto";
                    RegExp regex = RegExp("");
                    if (!regex.hasMatch(value)) return "Ingrese un  dato valido";
                    return null;
                  },
                ),
                const SizedBox(height: kDefaultSize * 2),

                const Text("Descripcion:"),
                const SizedBox(height: kDefaultSize),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text("Descripcion"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    prefixIcon: Icon(Icons.text_snippet),
                    hintText: "Ejemplo: Adelanto",),
                  controller: descController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Ingrese un texto";
                    RegExp regex = RegExp("");
                    if (!regex.hasMatch(value)) return "Ingrese un  dato valido";
                    return null;
                  },
                ),
                const SizedBox(height: kDefaultSize * 2),

                const Text("Importe:"),
                const SizedBox(height: kDefaultSize),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text("Importe"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    prefixIcon: Icon(Icons.attach_money),
                    hintText: "Ejemplo: 130.00",),
                  controller: importController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Ingrese un texto";
                    RegExp regex = RegExp("");
                    if (!regex.hasMatch(value)) return "Ingrese un  dato valido";
                    return null;
                  },
                ),
                const SizedBox(height: kDefaultSize * 2),
                InkWell(
                  onTap: () {
                    if(formKey.currentState!.validate()){
                      Timer(const Duration(seconds: 5), () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ConfirmPage())));
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Enviando Datos"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text("Procesando Informacion"),
                              SizedBox(height: kDefaultSize * 2),
                              CircularProgressIndicator()
                            ],
                          ),
                        )
                      );
                    }
                  },
                  child: Container(
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)), color: Colors.blue,),
                    child: Padding(
                      padding: const EdgeInsets.all(kDefaultSize),
                      child: Text("Confirmar",
                        style: TextStyle(
                          fontSize: kDefaultText * MediaQuery.of(context).textScaleFactor,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    )
                  ),
                ),
                const SizedBox(height: kDefaultSize * 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ConfirmPage extends StatelessWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Datos enviados", style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: kDefaultSize * 2),
            InkWell(
              onTap: () {
                Navigator.popUntil(context, (route) => false);
                Navigator.push(context, MaterialPageRoute(builder: (_) => DataPage()));
              },
              child: Container(
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)), color: Colors.blue,),
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultSize),
                  child: Text("Nuevo Pago",
                    style: TextStyle(
                      fontSize: kDefaultText * MediaQuery.of(context).textScaleFactor,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                )
              ),
            )
          ],
        )
      ),
    );
  }
}
