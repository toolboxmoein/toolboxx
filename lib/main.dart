import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'جعبه ابزار املاک',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // تم روشن
      darkTheme: ThemeData.dark(), // تم تاریک
      themeMode: ThemeMode.system, // حالت تم بر اساس تنظیمات سیستم
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';
  bool showTasksPage = false;
  int _selectedIndex = 0;
  bool isDarkMode = false; // حالت شب

  final List<Map<String, dynamic>> services = [
    {'title': 'قیمت چند؟', 'icon': Icons.house, 'color': Colors.orange},
    {'title': 'مشتریان', 'icon': Icons.people, 'color': Colors.green},
    {'title': 'کارها', 'icon': Icons.checklist, 'color': Colors.purple},
    {'title': 'آموزش املاک', 'icon': Icons.school, 'color': Colors.pink},
    {'title': 'اخبار مرتبط', 'icon': Icons.article, 'color': Colors.blue},
    {'title': 'استعلامات', 'icon': Icons.search, 'color': Colors.yellow},
    {'title': 'محاسبات', 'icon': Icons.calculate, 'color': Colors.lime},
    {'title': 'قیمت بازار', 'icon': Icons.trending_up, 'color': Colors.red},
    {'title': 'فایل‌ها', 'icon': Icons.folder, 'color': Colors.indigo},
    {
      'title': 'قراردادها',
      'icon': Icons.document_scanner,
      'color': Colors.amber
    },
    {'title': 'فاکتور', 'icon': Icons.receipt, 'color': Colors.brown},
    {'title': 'حسابداری', 'icon': Icons.account_balance, 'color': Colors.cyan},
    {'title': 'دفترخانه‌ها', 'icon': Icons.gavel, 'color': Colors.orangeAccent},
    {'title': 'ابزارها', 'icon': Icons.build, 'color': Colors.greenAccent},
    {'title': 'یادداشت‌ها', 'icon': Icons.note, 'color': Colors.pinkAccent},
    {
      'title': 'کاور پست و استوری',
      'icon': Icons.image,
      'color': Colors.lightBlue
    },
  ];

  void _onServiceButtonPressed(String title) {
    if (title == 'کارها') {
      setState(() {
        showTasksPage = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('شما "$title" را انتخاب کردید')),
      );
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('به زودی فعال می‌شود')),
    );
  }

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showTasksPage) {
      return TaskManagementPage(
        onBackPressed: () {
          setState(() {
            showTasksPage = false;
          });
        },
      );
    }

    final filteredServices = services.where((service) {
      return service['title'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return MaterialApp(
      theme: isDarkMode
          ? ThemeData.dark()
          : ThemeData.light(), // تغییر تم بر اساس حالت شب
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'حالت شب',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('حالت شب'),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    toggleDarkMode(value);
                  },
                ),
              ),
              ListTile(
                title: Text('راهنما'),
                onTap: () {
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('راهنما'),
                        content: Text('به زودی فعال میشود'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('بستن'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: Text('درباره ما'),
                onTap: () {
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('درباره ما'),
                        content: Text(
                            'این اپلیکیشن برای مدیریت املاک طراحی شده است.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('بستن'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: Text('تماس با ما'),
                onTap: () {
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('تماس با ما'),
                        content: Text(
                            'برای تماس با ما، به ایمیل info@example.com مراجعه کنید.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('بستن'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[800] : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'دنبال چه ابزاری می‌گردی؟',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      hintStyle: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search,
                    color: isDarkMode ? Colors.white : Colors.black),
                onPressed: () {},
              ),
            ],
          ),
          backgroundColor: isDarkMode ? Colors.black : Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  print('بنر کلیک شد');
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/baner-main-n1.jpg', // مسیر عکس بنر
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.all(16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 0.8,
                ),
                itemCount: filteredServices.length,
                itemBuilder: (context, index) {
                  return ServiceButton(
                    title: filteredServices[index]['title'],
                    icon: filteredServices[index]['icon'],
                    color: filteredServices[index]['color'],
                    onPressed: _onServiceButtonPressed,
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  print('بنر دوم کلیک شد');
                },
                child: Container(
                  height: 100,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[800] : Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'این یک بنر دیگر است',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
              backgroundColor: isDarkMode ? Colors.black : Colors.white,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'خانه',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'پروفایل',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.build),
                  label: 'ابزارها',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'تنظیمات',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TaskManagementPage extends StatelessWidget {
  final VoidCallback onBackPressed;

  const TaskManagementPage({required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مدیریت کارها'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: onBackPressed,
        ),
      ),
      body: Center(
        child: Text(
          'صفحه مدیریت کارها',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ServiceButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Function(String) onPressed;

  const ServiceButton({
    required this.title,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              onPressed(title);
            },
            child: Center(
              child: Icon(icon, size: 36.0, color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 4.0),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.0,
                color: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.color, // استفاده از bodyMedium
              ),
              overflow: TextOverflow.visible,
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}
