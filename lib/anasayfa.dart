import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  String alinanVeri = "";
  var tfControl = TextEditingController();
  String resimAdi = "baklava.png";
  bool switchKontrol = false;
  bool checkboxKontrol = false;
  int radioDeger = 0;
  bool progressKontrol = false;
  double ilerleme = 30.0;
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();
  var ulkelerListesi = <String>[];
  String secilenUlke = "Türkiye";

  @override
  void initState() {
    super.initState();
    ulkelerListesi.add("Türkiye");
    ulkelerListesi.add("İtalya");
    ulkelerListesi.add("Japonya");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Widgets Kullanımı"),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              GestureDetector(child: Text(alinanVeri), onTap: () {
                print("text tıklandı");
              },),

              GestureDetector(
                  onTap: () {
                    print("container tıklandı");
                  },
                  onDoubleTap: () {
                    print("container cift tıklandı");
                  },
                  onLongPress: () {
                    print("containera uzun tıklandı");
                  },
                  child: Container(
                    width: 200,
                    height: 100,
                    color: Colors.red,
                  )
              ),

              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: TextField(
                  controller: tfControl,
                  decoration: const InputDecoration(hintText: "Veri"),
                  keyboardType: TextInputType.number,
                  obscureText: true,

                ),
              ),

              ElevatedButton(onPressed: () {
                setState(() {
                  alinanVeri = tfControl.text;
                });
              }, child: const Text("oku")),

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    resimAdi = "kofte.png";
                  });
                }, child: const Text("Resim 1")),

                //Image.asset("resimler/$resimAdi"),
                SizedBox(width: 72, height: 72, child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/$resimAdi")),

                ElevatedButton(onPressed: () {
                  setState(() {
                    resimAdi = "ayran.png";
                  });

                }, child: const Text("Resim 2")),
              ],),

              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 200,
                  child: SwitchListTile( //bulunduğu alan kadar kendisini yaymaya çalışır
                    title: const Text("Dart"),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: switchKontrol,
                    onChanged: (value) {
                      setState(() {
                        switchKontrol = value;
                      });
                    },
                  ),
                ),

                SizedBox(
                  width: 200,
                  child: CheckboxListTile(
                    title: const Text("Flutter"),
                    value: checkboxKontrol,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (value) {
                    setState(() {
                      checkboxKontrol = value!;
                    });
                  },),
                ),

                Row(children: [
                  Expanded(
                    child: RadioListTile(title: const Text("Barcelona"),value: 1, groupValue: radioDeger, onChanged: (value) {
                      setState(() {
                        radioDeger = value!;
                      });
                    },),
                  ),

                  Expanded(
                    child: RadioListTile(title: const Text("Real Madrid"),value: 2, groupValue: radioDeger, onChanged: (value) {
                      setState(() {
                        radioDeger = value!;
                      });
                    },),
                  ),


                ],),

                Text(ilerleme.toInt().toString()),

                Slider(max: 100.0, min: 0.0,value: ilerleme, onChanged: (veri) {
                  setState(() {
                    ilerleme = veri;
                  });
                },),

                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                  SizedBox(width: 120,child: TextField(controller: tfSaat, decoration: const InputDecoration(hintText: "Saat"),)),
                  IconButton(onPressed: () {
                    showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now())).then((value) {
                      tfSaat.text = "${value!.hour} : ${value.minute}";
                    });
                  }, icon: const Icon(Icons.access_time)),

                  SizedBox(width: 120,child: TextField(controller: tfTarih, decoration: const InputDecoration(hintText: "Tarih"),)),
                  IconButton(onPressed: () {
                    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2030)).then((value) {
                      tfTarih.text = "${value!.day} / ${value.month} / ${value.year}";
                    });
                  }, icon: const Icon(Icons.access_time))
                ],),

                DropdownButton(
                    value: secilenUlke,
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    items: ulkelerListesi.map((oankiulke) {
                      return DropdownMenuItem(value: oankiulke,child: Text(oankiulke),);
                    }).toList(),
                    onChanged: (veri) {
                      setState(() {
                        secilenUlke =veri!;
                      });
                    },
                ),


                ElevatedButton(onPressed: () {
                  print("switch durum: $switchKontrol");
                  print("checkbox durum: $checkboxKontrol");
                  print("radio durum: $radioDeger");
                  print("slider durum: $ilerleme");
                  print("secilen ulke: $secilenUlke");
                }, child: const Text("Göster")),

                ElevatedButton(onPressed: () {
                  setState(() {
                    progressKontrol = true;
                  });
                }, child: const Text("Başla")),

                Visibility(visible: progressKontrol, child: const CircularProgressIndicator()),

                ElevatedButton(onPressed: () {
                  setState(() {
                    progressKontrol = false;
                  });
                }, child: const Text("Dur")),





              ],)

            ],
          ),
        ),
      )
    );
  }
}

//http://kasimadalan.pe.hu/yemekler/resimler/baklava.png
//http://kasimadalan.pe.hu/yemekler/resimler/ayran.png
