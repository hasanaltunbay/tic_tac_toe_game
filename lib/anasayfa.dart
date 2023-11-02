import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool ilkOyuncu=true;
  List<String> deger=["","","","","","","","",""];

  int oSkor=0;
  int xSkor=0;
  int berabere=0;

  void tikla(int index){



    setState(() {
      if(ilkOyuncu && deger[index]==""){
        deger[index]="O";
        berabere=berabere+1;
      }else if(!ilkOyuncu && deger[index]==""){
        deger[index]="X";
        berabere=berabere+1;
      }
      ilkOyuncu=!ilkOyuncu;
      kazananOyuncu();
    });
  }

  void kazananOyuncu(){
    //çapraz
    if(deger[6]==deger[4] &&
        deger[6]==deger[2] &&
        deger[6]!=""){
      kazananMesaj(deger[6]);
    }
    //çapraz
    if(deger[0]==deger[4] &&
        deger[0]==deger[8] &&
        deger[0]!=""){
      kazananMesaj(deger[0]);
    }
    //1.satir
    if(deger[0]==deger[1] &&
       deger[0]==deger[2] &&
       deger[0]!=""){
      kazananMesaj(deger[0]);
    }
    //2.satir
    if(deger[3]==deger[4] &&
        deger[3]==deger[5] &&
        deger[3]!=""){
      kazananMesaj(deger[3]);
    }
    //3.satir
    if(deger[6]==deger[7] &&
        deger[6]==deger[8] &&
        deger[6]!=""){
      kazananMesaj(deger[6]);
    }
    //1.sütun
    if(deger[0]==deger[3] &&
        deger[0]==deger[6] &&
        deger[0]!=""){
      kazananMesaj(deger[0]);
    }
    //2.sütun
    if(deger[1]==deger[4] &&
        deger[1]==deger[7] &&
        deger[1]!=""){
      kazananMesaj(deger[1]);
    }
    //3.sütun
    if(deger[2]==deger[5] &&
        deger[2]==deger[8] &&
        deger[2]!=""){
      kazananMesaj(deger[2]);
    }
    else if(berabere==9){
      berabereMesaj();
    }

  }

  void kazananMesaj(String oyuncu){
    showDialog(barrierDismissible: false ,context: context, builder: (context){

      return AlertDialog(
        title: Text("Kazanan $oyuncu oyuncusu"),
        actions: [
          TextButton(onPressed: (){
            tahtayiTemizle();
            Navigator.of(context).pop();
          },
            child: Text("Tekrar Oyna"),)
        ],
      );
    });
    if(oyuncu=="O"){
      oSkor=oSkor+1;
    }else if(oyuncu=="X"){
      xSkor=xSkor+1;
    }
  }

  void tahtayiTemizle(){

    setState(() {
      for(int i=0; i<9; i++){
        deger[i]="";
      }
    });
    berabere=0;
  }

  void berabereMesaj(){
    showDialog(barrierDismissible: false ,context: context, builder: (context){

      return AlertDialog(
        title: Text("Berabere"),
        actions: [
          TextButton(onPressed: (){
            tahtayiTemizle();
            Navigator.of(context).pop();
          },
            child: Text("Tekrar Oyna"),)
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child:Container(
                child:  Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Oyuncu O",style: TextStyle(fontSize: 25,color: Colors.white),),
                          Text(oSkor.toString(),style: TextStyle(fontSize: 25,color: Colors.white),),
                        ],
                      ),
                    ),
                    SizedBox(width: 35,),
                    Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Oyuncu X",style: TextStyle(fontSize: 25,color: Colors.white),),
                          Text(xSkor.toString(),style: TextStyle(fontSize: 25,color: Colors.white),),
                        ],
                      ),
                    ),
                  ],
                ),
              )
          ),
          Expanded(
            flex: 4,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    tikla(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color:Colors.grey ),
                    ),
                    child: Center(
                      child: Text(deger[index],style: TextStyle(color: Colors.white,fontSize: 35),),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              child:Container(

              )
          ),
        ],
      ),
    );
  }
}
