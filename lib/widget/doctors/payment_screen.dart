import 'package:flutter/material.dart';
import 'package:graduation/widget/doctors/credit_card.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedValue = 0;
  final paymentLabels = ["Credit Card", "PayPal", "InstaPay", "Vodafone Cash"];
  final paymentIcons = [
    Icons.credit_card,
    Icons.payments_outlined,
    Icons.account_balance_wallet,
    Icons.money
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xff32AA90),
          ),
          child: Center(
            child: IconButton(
              padding: const EdgeInsets.only(left: 12, right: 10),
              iconSize: 20,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30, right: 60),
            child: Text(
              "Choose your payment method",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 23,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.03,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: paymentLabels.length,
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              itemBuilder: (context, index) {
                return RadioListTile<int>(
                  value: index,
                  groupValue: selectedValue,
                  onChanged: (int? value) {
                    setState(() {
                      selectedValue = value!;
                      if (selectedValue == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AddCreditCardScreen()),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(paymentLabels[selectedValue]),
                              content: const Text("Not available now"),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text(
                                    "Close",
                                    style: TextStyle(color: Color(0xff32AA90)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    });
                  },
                  title: Text(
                    paymentLabels[index],
                    style: const TextStyle(fontSize: 19),
                  ),
                  secondary: Icon(paymentIcons[index], color: Colors.black54),
                  activeColor: const Color(0xff32AA90),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
