import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData(primarySwatch: Colors.blue),
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
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ExploreScreen(),
    Center(child: Icon(Icons.add_box_outlined)),
    const ReelsScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Billabong',
            fontSize: 28,
          ),
        ),
        actions: const [
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 16),
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.send, color: Colors.black),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://picsum.photos/id/${index + 100}/100/100',
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text('ayse$index', style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(),
          for (int i = 0; i < 3; i++) _buildPostCard(i),
        ],
      ),
    );
  }

  Widget _buildPostCard(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://picsum.photos/id/${index + 200}/100/100',
            ),
          ),
          title: Text('merve_kaya$index'),
          trailing: const Icon(Icons.more_vert),
        ),
        Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://picsum.photos/id/${index + 300}/500/300',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(icon: const Icon(Icons.comment), onPressed: () {}),
            IconButton(icon: const Icon(Icons.send), onPressed: () {}),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text('Beğenen: ayse343, merve456'),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Container(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: const [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 8),
              Text('Ara', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          children: List.generate(30, (index) {
            return Container(
              color: Colors.grey[300],
              child: Image.network(
                'https://picsum.photos/id/${index + 10}/200/200',
                fit: BoxFit.cover,
              ),
            );
          }),
        ),
      ),
    );
  }
}

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                'https://picsum.photos/id/${index + 400}/400/700',
                fit: BoxFit.cover,
              ),
              const Positioned(
                left: 10,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '@reelsuser',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Harika bir video!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Positioned(
                right: 10,
                bottom: 20,
                child: Column(
                  children: [
                    Icon(Icons.favorite, color: Colors.white),
                    SizedBox(height: 12),
                    Icon(Icons.comment, color: Colors.white),
                    SizedBox(height: 12),
                    Icon(Icons.send, color: Colors.white),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '@rabiaaphotography',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Icon(Icons.menu),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const CircleAvatar(radius: 40, backgroundColor: Colors.grey),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Column(
                          children: [
                            Text(
                              '10',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Gönderi'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '450',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Takipçi'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '180',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Takip'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rabia Bal',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Profili Düzenle'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Profili Paylaş'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.person_pin_outlined)),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  PostGridTab(),
                  Center(child: Text('Etiketlenenler')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostGridTab extends StatelessWidget {
  const PostGridTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        children: List.generate(15, (index) {
          return Container(
            color: Colors.grey[300],
            child: Image.network(
              'https://picsum.photos/id/${index + 50}/200/200',
              fit: BoxFit.cover,
            ),
          );
        }),
      ),
    );
  }
}
