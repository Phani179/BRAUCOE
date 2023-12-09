import 'package:flutter/material.dart';

class FeeBarItem extends StatefulWidget {
  const FeeBarItem({required this.feePaid, required this.year, super.key});

  final String year;

  final int feePaid;

  @override
  State<FeeBarItem> createState() => _FeeBarItemState();
}

class _FeeBarItemState extends State<FeeBarItem> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.year,
          style: const TextStyle(
            color: Color(0xFF382E1E),
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: 'LibreFranklin-Regular',
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isTapped = !isTapped;
            });
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.02,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFD9D9D9),
            ),
            clipBehavior: Clip.hardEdge,
            child: FractionallySizedBox(
                alignment: Alignment.topLeft,
                widthFactor: widget.feePaid / 35000,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF00512D),
                    borderRadius: BorderRadius.circular(20),
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        if (isTapped)
          Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('₹0'),
                    if (!(widget.feePaid / 35000 == 0 ||
                        widget.feePaid / 35000 == 1))
                      Expanded(
                        child: FractionallySizedBox(
                          widthFactor: widget.feePaid / 35000,
                          child: Center(
                            child: Text(
                              '₹${widget.feePaid.toString()}',
                            ),
                          ),
                        ),
                      ),
                    if ((widget.feePaid / 35000 == 0 ||
                        widget.feePaid / 35000 == 1))
                      const Spacer(),
                    const Text('₹35,000'),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Due amount: ₹${35000 - widget.feePaid}/-',
                  style: const TextStyle(
                    color: Color(0xFFCF0000),
                    fontSize: 16,
                    fontFamily: 'LibreFranklin-Regular',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
