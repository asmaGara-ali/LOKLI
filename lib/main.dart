
import 'package:flutter/material.dart';

void main() {
  runApp(const LokliApp());
}

class LokliApp extends StatelessWidget {
  const LokliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LOKLI',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF8F8F2),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF246B50),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategory = 0;

  final List<String> categories = [
    'All',
    'Electronics',
    'Tools',
    'Sports',
    'Home',
  ];

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Canon Camera',
      'category': 'Electronics',
      'price': '25',
      'icon': Icons.camera_alt_outlined,
      'color': Color(0xFFE5E9DF),
    },
    {
      'name': 'Power Drill',
      'category': 'Tools',
      'price': '15',
      'icon': Icons.handyman_outlined,
      'color': Color(0xFFF1E7D5),
    },
    {
      'name': 'Camping Tent',
      'category': 'Sports',
      'price': '20',
      'icon': Icons.park_outlined,
      'color': Color(0xFFE5E9DF),
    },
    {
      'name': 'Office Chair',
      'category': 'Home',
      'price': '10',
      'icon': Icons.chair_outlined,
      'color': Color(0xFFF1E7D5),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LOKLI',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF246B50),
                          letterSpacing: 2,
                        ),
                      ),
                      Text(
                        'Borrow. Share. Connect.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: const Color(0xFFE5E9DF),
                    child: const Icon(
                      Icons.person_outline,
                      color: Color(0xFF246B50),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Welcome
              const Text(
                'Find what you need,',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF25352D),
                ),
              ),
              const Text(
                'right in your community.',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF246B50),
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 22),

              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for anything...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Categories
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF25352D),
                ),
              ),

              const SizedBox(height: 14),

              SizedBox(
                height: 42,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: 9),
                  itemBuilder: (context, index) {
                    final selected = selectedCategory == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 17,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? const Color(0xFF246B50)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: selected
                                ? Colors.white
                                : const Color(0xFF25352D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 28),

              // Popular items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular items',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF25352D),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        color: Color(0xFF246B50),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.where((product) {
                  return selectedCategory == 0 ||
                      product['category'] == categories[selectedCategory];
                }).length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.82,
                ),
                itemBuilder: (context, index) {
                  final filteredProducts = products.where((product) {
                    return selectedCategory == 0 ||
                        product['category'] ==
                            categories[selectedCategory];
                  }).toList();

                  final product = filteredProducts[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: product['color'],
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(17),
                              ),
                            ),
                            child: Icon(
                              product['icon'],
                              size: 65,
                              color: const Color(0xFF246B50),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(11),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${product['price']} TND / day',
                                style: const TextStyle(
                                  color: Color(0xFF246B50),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),

      // Bottom navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF246B50),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add Item',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
