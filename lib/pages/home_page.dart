import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.25,
            child: SvgPicture.asset(
              'assets/inicio.svg',
              semanticsLabel: 'fondo',
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.yellow.shade200,
                  Colors.blue,
                  Colors.blue.shade100,
                ],
              ),
            ),
          ),
          Column(
            children: [
              Spacer(),
              Container(
                width: double.infinity,
                height: size.height * 0.75,
                child: Contenido(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.teal,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: Colors.teal,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.music_note,
            color: Colors.teal,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.replay_rounded,
            color: Colors.teal,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: Colors.teal,
          ),
          label: '',
        ),
      ],
      backgroundColor: Colors.white,
    );
  }
}

class Contenido extends StatelessWidget {
  const Contenido({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Categorias'),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.only(left: 20),
          height: 80,
          child: Botones(),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Ready sets'),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.only(left: 20),
          height: 180,
          child: Tarjetas(),
        ),
        Spacer(),
        Reproduccion(),
      ],
    );
  }
}

class Reproduccion extends StatelessWidget {
  const Reproduccion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.teal.shade800,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset('assets/background.svg'),
        ),
        title: Text(
          'Valley',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.play_arrow,
            color: Colors.teal.shade800,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          mini: true,
        ),
      ),
    );
  }
}

class Tarjetas extends StatelessWidget {
  const Tarjetas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 200,
          height: 180,
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: SvgPicture.asset('assets/inicio.svg'),
                ),
                Spacer(),
                ListTile(
                  leading: Text('Meditation'),
                  trailing: FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.teal,
                    elevation: 0,
                    onPressed: () {},
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        );
      },
      itemCount: 3,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: 30);
      },
    );
  }
}

class Botones extends StatelessWidget {
  Botones({Key? key}) : super(key: key);

  final List icono = iconos;
  final List categoria = categorias;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            FloatingActionButton(
              elevation: 1,
              backgroundColor: Colors.white,
              onPressed: () {},
              child: Icon(
                icono.elementAt(index),
                color: Colors.teal,
              ),
            ),
            Text(categoria.elementAt(index))
          ],
        );
      },
      itemCount: icono.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 15,
        );
      },
    );
  }
}

final List<IconData> iconos = [
  Icons.cloud,
  Icons.nature,
  Icons.location_city,
  Icons.spa,
  Icons.bed,
];

final List<String> categorias = [
  'Rain',
  'Nature',
  'City',
  'Relax',
  'ASMR',
];
