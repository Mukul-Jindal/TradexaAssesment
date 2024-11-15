import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradexaassignment/Components/constants.dart';
import 'package:tradexaassignment/Components/separator.dart';
import 'package:tradexaassignment/Components/movieCard.dart';
import 'package:tradexaassignment/provider/movieProvider.dart';

import 'Components/searchButton.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<movieProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  separator(),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: marzinConstants.horizontal,
                    ),
                    child: const Text(
                      'Home',
                      style: TextStyle(
                        fontSize: fontSizeConstants.heading,
                        fontWeight: FontWeight.bold,
                        color: colorConstants.headingColor,
                      ),
                    ),
                  ),
                  separator(),
                  searchButton(searchController, value),
                  separator(),
                  value.error != null
                      ? Center(
                          child: Text(
                            value.error!,
                            style: const TextStyle(
                              fontSize: fontSizeConstants.heading,
                              fontWeight: FontWeight.bold,
                              color: colorConstants.headingColor,
                            ),
                          ),
                        )
                      : value.movies == null
                          ? const Center(
                              child: Text(
                                "Search movie name",
                                style: TextStyle(
                                  fontSize: fontSizeConstants.heading,
                                  fontWeight: FontWeight.bold,
                                  color: colorConstants.headingColor,
                                ),
                              ),
                            )
                          : Container(
                              height: MediaQuery.of(context).size.height * 0.80,
                              margin: const EdgeInsets.symmetric(
                                horizontal: marzinConstants.horizontal,
                              ),
                              child: ListView.separated(
                                itemCount: value.movies!.length,
                                separatorBuilder: (context, index) {
                                  return separator();
                                },
                                itemBuilder: (context, index) {
                                  return movieCard(
                                      context, value.movies![index]);
                                },
                              ),
                            ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
