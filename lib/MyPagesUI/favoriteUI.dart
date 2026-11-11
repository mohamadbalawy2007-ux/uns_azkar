import 'package:azkar_muslim/My_Data/FavoritesData.dart';
import 'package:azkar_muslim/MyPagesUI/favoriteAction.dart';
import 'package:flutter/material.dart';

class favoriteUI extends StatefulWidget {
  const favoriteUI({super.key});

  @override
  State<favoriteUI> createState() => _favoriteUIState();
}

class _favoriteUIState extends State<favoriteUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 51, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 78, 49),
        title: Text(
          "الأذكار المفضلة",
          style: TextStyle(
            fontSize: 27,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ValueListenableBuilder<List<FavItem>>(
          valueListenable: FavoritesData.Items,
          builder: (context, items, _) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(right: 16, top: 20, bottom: 14),
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 20, 78, 49),
                        border: Border.all(
                          width: 1.5,
                          color: const Color.fromARGB(255, 13, 109, 61),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "أذكار",
                            style: TextStyle(
                              color: Color.fromARGB(255, 221, 171, 19),
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            " ${items.length}",
                            style: TextStyle(
                              color: Color.fromARGB(255, 221, 171, 19),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  if (items.isEmpty) favoriteAction(),

                  for (final item in items) _FavoriteCard(item: item),
                  SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FavoriteCard extends StatelessWidget {
  final FavItem item;

  const _FavoriteCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 14),
        child: Material(
          color: const Color.fromARGB(255, 20, 78, 49),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              color: Color.fromARGB(255, 13, 109, 61),
              width: 1,
            ),
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => _FavoriteViewUI(item: item),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "ذِكر مفضل",
                        style: TextStyle(
                          color: Color.fromARGB(255, 221, 171, 19),
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          FavoritesData.Toggle(item.Path, item.Name);
                          debugPrint("☆ Removed from favorite: ${item.Name}");
                        },
                        child: const Icon(
                          Icons.star_rounded,
                          color: Color.fromARGB(255, 221, 171, 19),
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.Name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      height: 170,
                      width: double.infinity,
                      child: Image.asset(
                        item.Path,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FavoriteViewUI extends StatelessWidget {
  final FavItem item;

  const _FavoriteViewUI({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.Name,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 20, 78, 49),
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
      ),
      backgroundColor: const Color.fromARGB(255, 19, 51, 31),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Image.asset(item.Path, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}