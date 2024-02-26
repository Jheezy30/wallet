import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet/components/my_button.dart';
import 'package:wallet/components/my_card.dart';
import 'package:wallet/components/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.monetization_on,
          size: 32,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  size: 32,
                  color: Colors.pink[300],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            children: [
              // app bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "My",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Cards",
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add)),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              // cards
              Container(
                height: 200,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  children: [
                    MyCard(
                      balance: 5250.20,
                      cardNumber: 23456896,
                      expiryMonth: 10,
                      expiryYear: 24,
                      color: Colors.purple[300],
                    ),
                    MyCard(
                      balance: 4987.50,
                      cardNumber: 89745612,
                      expiryMonth: 12,
                      expiryYear: 24,
                      color: Colors.green[300],
                    ),
                    MyCard(
                      balance: 7894,
                      cardNumber: 45321623,
                      expiryMonth: 2,
                      expiryYear: 24,
                      color: Colors.blue[300],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //we add a smooth page indicator
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.grey.shade700,
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              // 3 buttons -> send + pay + bills
              // column -> stats + transactions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                      iconImagePath: 'lib/icons/send-money.png',
                      buttonText: 'Send',
                    ),
                    MyButton(
                      iconImagePath: 'lib/icons/credit-card.png',
                      buttonText: 'Pay',
                    ),
                    MyButton(
                      iconImagePath: 'lib/icons/bill.png',
                      buttonText: 'Bills',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    MyListTile(
                      imageIconPath: 'lib/icons/analysis.png',
                      tileTitle: 'Statistics',
                      tileSubTitle: 'Payment and Income',
                    ),
                    MyListTile(
                      imageIconPath: 'lib/icons/money-transfer.png',
                      tileTitle: 'Transactions',
                      tileSubTitle: 'Transaction History',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
