import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ktoapp/app/icons/icon.dart';

class BannerItem {
  final String title;
  final String desc;
  final Color color;
  final String image;
  final String link;

  BannerItem({
    required this.title,
    required this.desc,
    required this.color,
    required this.image,
    required this.link,
  });
}

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final List<BannerItem> bannerList = [
    BannerItem(
      title: 'Clube KTO',
      desc: 'Giro KTO, Missões e muito mais!',
      color: Color(0xffda0000),
      image: 'assets/images/temp/carousel_1.png',
      link: 'https://example.com/1',
    ),
    BannerItem(
      title: 'Corrida Diária Fortune',
      desc: 'Concorra a R\$ 180 mil em prêmios em dinheiro!',
      color: Color(0xFF16181c),
      image: 'assets/images/temp/carousel_2.png',
      link: 'https://example.com/2',
    ),
    BannerItem(
      title: 'CASSINO ONLINE',
      desc: 'Desfrute de milhares de jogos de cassino online!',
      color: Color(0xFF5b2e9a),
      image: 'assets/images/temp/carousel_3.png',
      link: 'https://example.com/3',
    ),
  ];

  ValueNotifier<int> current = ValueNotifier<int>(0);
  @override
  void dispose() {
    super.dispose();
    current.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 220.0,
            autoPlay: true,
            viewportFraction: 1,
            autoPlayInterval: Duration(seconds: 3),
            onPageChanged: (index, reason) {
              current.value = index;
            },
          ),
          items: bannerList.map((item) {
            return GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('will go to ${item.link}'),
                    duration: Duration(seconds: 3),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      Image.asset(
                        item.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),

                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: BannerItemView(item: item),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: bannerList.asMap().entries.map((entry) {
            return ValueListenableBuilder(
              valueListenable: current,
              builder: (context, value, child) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: value == entry.key
                        ? Color.fromRGBO(218, 0, 0, 1)
                        : Color(0xff323232),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class BannerItemView extends StatelessWidget {
  final BannerItem item;

  const BannerItemView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 100, // 你想要的波浪高度
            color: item.color,
          ),
        ),
        Container(
          width: double.infinity,
          color: item.color,
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown, // 按比例缩小文字
                child: Text(
                  item.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NNSwintonSTD',
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    item.desc,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                    ),
                  ),
                  Spacer(),
                  MyIcon.icon("ic_forword_arrow.svg", width: 20),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
// Text('Inter Bold Italic', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, fontStyle: FontStyle.italic))
// Text('NNSwintonSTD Heavy Italic', style: TextStyle(fontFamily: 'NNSwintonSTD', fontWeight: FontWeight.w900, fontStyle: FontStyle.italic))

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    // 原始 SVG 尺寸
    final double originalWidth = 337.0;
    final double originalHeight = 78.0;

    // 根据容器实际尺寸计算缩放比例
    double scaleX = size.width / originalWidth;
    double scaleY = size.height / originalHeight;

    // 按比例缩放，x 和 y 可以用不同的缩放因子（自适应）
    path.moveTo(56.25 * scaleX, 63.83 * scaleY);

    path.cubicTo(
      35.97 * scaleX,
      62.56 * scaleY,
      0 * scaleX,
      52.35 * scaleY,
      0 * scaleX,
      0 * scaleY,
    );

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(56.25 * scaleX, 63.83 * scaleY);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
