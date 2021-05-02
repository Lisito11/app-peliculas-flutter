import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {

  final List<Pelicula> peliculas;

  CardSwiper({ @required this.peliculas });

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemWidth: _screenSize.width * 0.6,
        itemHeight: _screenSize.height * 0.49,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) => _card(context, peliculas[index]),
        itemCount: peliculas.length,
        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );
  }

  Widget _card(BuildContext context, Pelicula pelicula){
    pelicula.uniqueId = UniqueKey().toString();
    final tarjeta = Hero(
      tag: pelicula.uniqueId,
      child: ClipRRect(
        child: FadeInImage(
          image: NetworkImage(pelicula.getPosterImg()),
          placeholder: AssetImage('assets/img/no-image.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(18.0),
      ),
    );

    return GestureDetector(
      child: tarjeta,
      onTap: (){
        Navigator.pushNamed(context, "detalle", arguments: pelicula);
      },
    );

  }

}
