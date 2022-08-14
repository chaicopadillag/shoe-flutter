import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/helpers/helpers.dart';
import 'package:shoes_app/providers/providers.dart';
import 'package:shoes_app/widgets/widgets.dart';

class ShoeDescriptionScreen extends StatelessWidget {
  const ShoeDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusLight();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              const Hero(tag: 'shoe_one', child: ShoePreview(fullWidth: true)),
              Positioned(
                  top: 50,
                  child: FloatingActionButton(
                    elevation: 0,
                    highlightElevation: 0,
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      changeStatusDark();
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 40,
                    ),
                  ))
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: const [
              ShoeDescription(
                title: 'Nike Air Max 720',
                description:
                    "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
              ),
              SizedBox(height: 20),
              _BuyAmountNow(),
              SizedBox(height: 20),
              _ColorsItems(),
              SizedBox(height: 20),
              _ButtonsGroup()
            ],
          )))
        ],
      ),
    );
  }
}

class _ButtonsGroup extends StatelessWidget {
  const _ButtonsGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        _ButtonCircle(color: Colors.redAccent),
        _ButtonCircle(icon: Icons.shopping_cart),
        _ButtonCircle(icon: Icons.settings),
      ],
    );
  }
}

class _ButtonCircle extends StatelessWidget {
  final Color color;
  final IconData icon;

  const _ButtonCircle({
    Key? key,
    this.color = Colors.black12,
    this.icon = Icons.favorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Icon(
        icon,
        color: color,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
    );
  }
}

class _ColorsItems extends StatelessWidget {
  const _ColorsItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned(
                    left: 90,
                    child: _ColorButton(
                      color: Color(0xffc6d642),
                      index: 4,
                      imageUrl: 'assets/shoes/verde.png',
                    )),
                Positioned(
                    left: 60,
                    child: _ColorButton(
                      color: Color(0xffffad29),
                      index: 3,
                      imageUrl: 'assets/shoes/amarillo.png',
                    )),
                Positioned(
                    left: 30,
                    child: _ColorButton(
                      color: Color(0xff2099f1),
                      index: 2,
                      imageUrl: 'assets/shoes/azul.png',
                    )),
                _ColorButton(
                    color: Color(0xff364d56),
                    index: 1,
                    imageUrl: 'assets/shoes/negro.png'),
              ],
            ),
          ),
          ButtonCart(
            title: 'More colors',
            btnHeight: 20,
            btnWith: 120,
            color: const Color(0xffffc675),
          ),
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final int index;
  final String imageUrl;

  const _ColorButton({
    Key? key,
    required this.color,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final shoeProv = Provider.of<ShoeProvider>(context, listen: false);
          shoeProv.shoeName = imageUrl;
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _BuyAmountNow extends StatelessWidget {
  const _BuyAmountNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        child: Row(
          children: [
            const Text(
              '\$180.0',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Bounce(
                delay: const Duration(seconds: 1),
                from: 8,
                child:
                    ButtonCart(title: 'Buy now', btnHeight: 40, btnWith: 110)),
          ],
        ),
      ),
    );
  }
}
