import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/model.dart';

class HomePageController extends GetxController {

  // var isDrawerOpen = false.obs;
  //
  // void toggleDrawer() {
  //   isDrawerOpen.value = !isDrawerOpen.value;
  // }


  List<chirstmodel> cristdata = [
    chirstmodel(
        text1: "Taj Mahal",
        text2:"The Taj Mahal Crown of the Palace is an ivory-white marble mausoleum on the right bank of the river Yamuna in Agra, Uttar Pradesh, India. It was commissioned in 1631 by the fifth Mughal emperor, Shah Jahan (1628–1658) to house the tomb of his beloved wife, Mumtaz Mahal; it also houses the tomb of Shah Jahan himself.",
        text3: "Start from\n\$ 130 / person"),
    chirstmodel(
        text1: "Golden Temple",
        text2: "The Golden Temple (also known as the Harimandir Sahib House of God', Punjabi pronunciationor the Darbār Sahib,'exalted court''or Suvaran Mandir[2]) is a gurdwara located in the city of Amritsar, Punjab, India.It is the preeminent spiritual site of Sikhism",
        text3:  "Start from\n\$ 100 / person"),
    chirstmodel(text1: "Machu Picchu, Cusco - Perú",
                 text2: "Shimla is the capital of Himachal Pradesh and a popular hill-station among Indian families and honeymooners. Situated at the height of 2200m, it was the summer capital of British India. The hill station still retains its old-world charm with beautiful colonial architecture, pedestrian-friendly Mall Road and the ridge lined up with multiple shops, cafes and restaurants",
                 text3:  "Start from\n\$ 140 / person"),
    chirstmodel(text1: "Bryggen, Bergen, Norway",
        text2: "Bryggen is a must-see attraction when you visit Bergen.The very first buildings in Bergen were erected by the harbour and this area has for centuries been a lively and central part of the city.",
        text3:  "Start from\n\$ 180 / person"),
  ];

  List<beachmodel> beaches=[
    beachmodel(images:"assets/aa.jpg",texts: "Ionian Coast from Taormina", rating: 1 ),
    beachmodel(images:"assets/bb.jpg",texts:"Taormina,City of Messina, Italy", rating: 2 ),
    beachmodel(images:"assets/cc.jpg",texts: "The Maldives-Conrad Rangali Islands", rating: 3 ),
    beachmodel(images:"assets/beach1.jpg" ,texts: "Morjim Beach in Goa, India.", rating: 4),
  ];

  List<lakemodel> lakes=[
    lakemodel(images: "assets/111.jpg",texts: "h"),
    lakemodel(images: "assets/222.jpg",texts: "h"),
    lakemodel(images: "assets/333.jpg",texts: "h"),
    lakemodel(images: "assets/444.jpg",texts: "Wanaka,Otago,New Zealand"),
  ];


  List<mounmodel> mountains=[
    mounmodel(images: "assets/1111.jpg",texts: "Seven Rila Lakes, Bulgaria"),
    mounmodel(images: "assets/2222.jpg",texts: "Babia Góra, Polska"),
    mounmodel(images: "assets/3333.jpg",texts: "Shar Mountain, North Macedonia"),
    mounmodel(images: "assets/4444.jpg", texts: "Zelenci Nature Reserve,Kranjska Gora"),
  ];

  List<rivermodel> rivers=[
    rivermodel(images: "assets/c.jpg",texts: "Yamuna Nagar, Haryana, India"),
    rivermodel(images: "assets/d.jpg", texts: 'Eibsee, Grainau, Deutschland'),
    rivermodel(images: "assets/b.jpg", texts:'Milwaukee, WI, USA'),
    rivermodel(images: "assets/a.jpg", texts: 'Lago di Braies, Braies, BZ, Italia'),
  ];

  List<imagesmodel>image1=[
    imagesmodel(image1: "assets/12.png", text1: "Beach",),
    imagesmodel(image1: "assets/21.png", text1: "Mountain"),
    imagesmodel(image1: "assets/31.png", text1: "Lake"),
    imagesmodel(image1: "assets/41.png", text1: "River"),

  ];



  List<imagemodel> imagelist = [
    imagemodel(images: "assets/ab.jpg", texts: 'Taj Mahal, Agra,Uttar Pradesh,India'),
    imagemodel(images: "assets/af.jpg", texts: 'Harmandir Sahib temple,Amritsar,India'),
    imagemodel(images: "assets/ab.jpeg", texts: 'Shimla,Himachal Pradesh'),
    imagemodel(images: "assets/ae.jpg", texts: 'Thajwas Glacier Sonamarg, Kashmir '),
  ];

  List<textmodel> textlist = [
    textmodel(texts: "Taj Mahal, Agra,Uttar Pradesh,India"),
    textmodel(texts: "Harmandir Sahib temple,Amritsar,India"),
    textmodel(texts: "Shimla,Himachal Pradesh"),
    textmodel(texts: "Thajwas Glacier Sonamarg, Kashmir "),
  ];

  final List<roommodel> rooms=[
    roommodel(images:"assets/room1.jpeg", texts: 'Luxury Room City View', texts1: '28000' ),
    roommodel(images:"assets/room2.jpeg", texts: 'Taj Club Executive Room', texts1: '27000' ),
    roommodel(images:"assets/room3.jpeg", texts: "Luxury Residence",texts1: '20000' ),
    roommodel(images:"assets/room4.jpeg", texts: 'Taj Club Premium Room', texts1: '27000' ),
    roommodel(images:"assets/room5.jpeg", texts: 'Luxury Residence', texts1: '24000' ),
    roommodel(images:"assets/room6.jpeg", texts: 'Taj Club Suite', texts1: '30000' ),
    roommodel(images:"assets/room7.jpeg", texts: 'aj Club Balcony Suite 1', texts1: '28000' ),
  ];

}