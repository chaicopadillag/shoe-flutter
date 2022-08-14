import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/providers/providers.dart';
import 'package:shoes_app/screens/screens.dart';

class ShoePreview extends StatelessWidget {
  final bool fullWidth;
  const ShoePreview({Key? key, this.fullWidth = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullWidth) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ShoeDescriptionScreen()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: fullWidth ? 5 : 20, vertical: fullWidth ? 5 : 10),
        child: Container(
          width: double.infinity,
          height: fullWidth ? 380 : 400,
          decoration: BoxDecoration(
              color: const Color(0xffffd54f),
              borderRadius: fullWidth
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )
                  : const BorderRadius.all(Radius.circular(50))),
          child: Column(
            children: [
              _ShapeShoe(fullWidth: fullWidth),
              if (!fullWidth) const _ShoeSizes()
            ],
          ),
        ),
      ),
    );
  }
}

class _ShapeShoe extends StatelessWidget {
  final bool fullWidth;
  const _ShapeShoe({
    Key? key,
    this.fullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeProv = Provider.of<ShoeProvider>(context);
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(fullWidth ? 50 : 20),
        child: Stack(
          children: [
            const Positioned(bottom: 10, right: 0, child: _ShoeShadow()),
            Image(image: AssetImage(shoeProv.shoeName)),
          ],
        ),
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.4,
      child: Container(
        width: 220,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(color: Color(0xffEAA14E), blurRadius: 30)
            ]),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  const _ShoeSizes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _ShoeSizeBox(7),
          _ShoeSizeBox(7.5),
          _ShoeSizeBox(8),
          _ShoeSizeBox(8.5),
          _ShoeSizeBox(9),
          _ShoeSizeBox(9.5),
        ],
      ),
    );
  }
}

class _ShoeSizeBox extends StatelessWidget {
  final double size;
  const _ShoeSizeBox(this.size);

  @override
  Widget build(BuildContext context) {
    final shoeProv = Provider.of<ShoeProvider>(context);
    return GestureDetector(
      onTap: () {
        // final shoeProv = Provider.of<ShoeProvider>(context, listen: false);
        shoeProv.shoeSize = size;
      },
      child: Container(
          alignment: Alignment.center,
          width: 45,
          height: 45,
          child: Text(
            size.toString().replaceAll(".0", ""),
            style: TextStyle(
                color: size == shoeProv.shoeSize
                    ? Colors.white
                    : const Color(0xffffd54f),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              color: size == shoeProv.shoeSize
                  ? const Color(0xffff9f02)
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                if (size == shoeProv.shoeSize)
                  const BoxShadow(
                      color: Color(0xffff9f02),
                      blurRadius: 10,
                      offset: Offset(0, 15))
              ])),
    );
  }
}
