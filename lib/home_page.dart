import 'package:caluclator/widgets/custom_appbar.dart';
import 'package:caluclator/widgets/custom_button.dart';
import 'package:caluclator/widgets/custom_category_widget.dart';
import 'package:caluclator/widgets/custom_deal_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {
      'categoryImage': 'assets/images/makeup_category.png',
      'categoryTitle': 'Beauty',
    },
    {
      'categoryImage': 'assets/images/women_category.png',
      'categoryTitle': 'Women',
    },
    {
      'categoryImage': 'assets/images/kid_category.png',
      'categoryTitle': 'Kids',
    },
    {'categoryImage': 'assets/images/men_category.png', 'categoryTitle': 'Men'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryList(),
              SizedBox(height: 20),
              _buildOfferCard(),
              SizedBox(height: 20),
              _buildDealOfTheDay(),
              SizedBox(height: 20),
              _buildSpecialOffersSection(),
              SizedBox(height: 20),
              _buildShoePromoSection(),
              SizedBox(height: 20),
              _buildTrendingProductsSection(),
              SizedBox(height: 20),
              _buildNewArrivalsSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Category List
  Widget _buildCategoryList() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              CustomCategoryWidget(
                categoryImagePath: categories[index]['categoryImage'] ?? '',
                categoryTitle: categories[index]['categoryTitle'] ?? '',
              ),
              SizedBox(width: 10),
            ],
          );
        },
      ),
    );
  }

  // Offer Card
  Widget _buildOfferCard() {
    return SizedBox(
      width: double.infinity,
      height: 189,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        color: Color(0xffFD6E86),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "50-40% OFF",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "Now in (product)",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            SizedBox(height: 6),
            Text(
              "All colours",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            SizedBox(height: 13),
            SizedBox(
              width: 130,
              child: CustomButton(onPressed: () {}, text: 'Shop Now'),
            ),
          ],
        ),
      ),
    );
  }

  // Deal of the Day
  Widget _buildDealOfTheDay() {
    return CustomDealCard(
      title: 'Deal of the Day',
      subtitle: "22h 55m 20s remaining",
      buttonText: 'View All',
    );
  }

  // Special Offers Section
  Widget _buildSpecialOffersSection() {
    return Row(
      children: [
        Image.asset('assets/images/offer.png'),
        SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Special Offers',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'We make sure you get the\noffer you need at best prices',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Shoe Promo Section
  Widget _buildShoePromoSection() {
    return Container(
      height: 150,
      child: Row(
        children: [
          Image.asset(
            'assets/images/box_border.png',
            height: double.infinity,
            width: 20,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Image.asset('assets/images/shoes.png', height: 100),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Flat and Heels",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 2),
              Text("Stand a chance to get rewarded"),
              SizedBox(height: 8),
              CustomButton(
                bgColor: Color(0xffF83758),
                onPressed: () {},
                text: 'Visit now',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Trending Products Section
  Widget _buildTrendingProductsSection() {
    return CustomDealCard(
      bgColor: Color(0xffFD6E87),
      title: 'Trending Products',
      subtitle: 'Last Date 29/02/22',
      buttonText: 'View All',
    );
  }

  // New Arrivals Section
  Widget _buildNewArrivalsSection() {
    return Column(
      children: [
        Image.asset('assets/images/banner.png'),
        CustomDealCard(
          buttonColor: Color(0xffF83758),
          textColor: Colors.black,
          bgColor: Colors.white,
          title: 'New Arrivals',
          subtitle: "Summer's 25 Collection",
          buttonText: 'View All',
        ),
      ],
    );
  }
}
