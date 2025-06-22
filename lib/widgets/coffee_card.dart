import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // Use a dark card background and a high-contrast yellow for text in dark mode
    final darkTextColor = Colors.amberAccent.shade200;
    final darkCardColor = const Color(
      0xFF23211E,
    ); // match your app's dark scaffold
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/product'),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? darkCardColor : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: 'coffee-image',
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: ColorFiltered(
                      colorFilter: isDark
                          ? ColorFilter.mode(
                              Colors.black.withOpacity(0.35),
                              BlendMode.darken,
                            )
                          : ColorFilter.mode(
                              Colors.transparent,
                              BlendMode.multiply,
                            ),
                      child: Image.asset(
                        'assets/img1.png',
                        fit: BoxFit.cover,
                        height: 120, // Set a fixed height for the image
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 0,
                  ),
                  decoration: BoxDecoration(
                    color: isDark ? darkCardColor : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cappuccino',
                        style: TextStyle(
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: isDark
                              ? Colors.white
                              : Colors.brown[900], // ADAPTIVE text
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          FloatingActionButton(
                            child: Text(
                              '4.5',
                              style: TextStyle(
                                fontSize: 12,
                                color: isDark
                                    ? darkTextColor
                                    : Colors.brown[900], // ADAPTIVE text
                              ),
                            ),
                            onPressed: () {},
                          ),
                          Spacer(),
                          Text(
                            '₹160',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isDark
                                  ? Colors.white
                                  : Colors.brown[800], // ADAPTIVE text
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.brown[700]
                      : const Color.fromARGB(255, 253, 0, 0),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.add,
                  color: isDark ? Colors.white : Colors.brown[700],
                ),
                padding: EdgeInsets.all(6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
