import 'package:flutter/material.dart';
import 'package:shoes_app/helpers/helpers.dart';
import 'package:shoes_app/widgets/widgets.dart';

class ShoeScreen extends StatelessWidget {
  const ShoeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusDark();
    return Scaffold(
      body: Column(
        children: const [
          CustomAppBar(title: 'For you'),
          SizedBox(height: 10),
          _ShoeDescription(),
          AddCart(
            price: 180.0,
          )
        ],
      ),
    );
  }
}

class _ShoeDescription extends StatelessWidget {
  const _ShoeDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: const [
          Hero(tag: 'shoe_one', child: Material(child: ShoePreview())),
          ShoeDescription(
            title: 'Nike Air Max 720',
            description:
                "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
          ),
        ],
      ),
    ));
  }
}
