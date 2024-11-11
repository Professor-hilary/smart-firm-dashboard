import 'package:flutter/material.dart';
import 'package:smartlab/core/constants/color_constants.dart';

class UserDetailsMiniCard extends StatelessWidget {
  const UserDetailsMiniCard({
    super.key,
    required this.title,
    required this.color,
    required this.amountOfFiles,
    required this.numberOfIncrease,
  });

  final Color color;
  final String title, amountOfFiles;
  final int numberOfIncrease;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
              height: 20,
              width: 20,
              child: Container(
                color: color,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    "$numberOfIncrease",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Text(
            amountOfFiles,
            style: const TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
