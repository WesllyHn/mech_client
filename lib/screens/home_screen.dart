import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mech_client/screens/login_screen.dart';
import 'package:mech_client/screens/repair_screen.dart';
import 'package:mech_client/screens/user_account_screen.dart';
import 'package:mech_client/screens/vehicle_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final List<Widget> _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'MechClient',
          style: TextStyle(
            color: Color(0xFFFF5C00), // Cor do título da AppBar
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black, // Cor dos ícones na AppBar
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.where_to_vote_outlined),
            color: Color(0xFFFF5C00),
            onPressed: () {
              // Para testar por enquanto
              singOut();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Center(
              child: UserAccountsDrawerHeader(
                accountName: Text("Nome: Simas"),
                accountEmail: Text("Email simas@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color(0xFFFF5C00),
                  child: Icon(
                    Icons.account_circle_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFFF5C00),
                ),
              ),
            ),
            ListTile(
              title: Text('Veículos'),
              leading: Icon(Icons.directions_car_outlined),
              onTap: () {
                const VehiclePage();
              },
            ),
            ListTile(
              title: Text('Conserto'),
              leading: Icon(Icons.toll_outlined),
              onTap: () {
                const RepairPage();
              },
            ),
            ListTile(
                title: Text('Conta'),
                leading: Icon(Icons.account_circle_outlined),
                onTap: () {
                  const UserAccount();
                }),
            Expanded(
              child:
                  SizedBox(), // Espaço em branco para preencher o espaço restante
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () {
                // Chama a função signOut() quando o ListTile "Sair" é clicado
                singOut();
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car_outlined),
            label: 'Veículos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Conta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.toll_outlined),
            label: 'Conserto',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFFF5C00),
        onTap: _onItemTapped,
      ),
    );
  }

  void singOut() async {
    await _firebaseAuth.signOut().then(
          (user) => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          ),
        );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VehiclePage(),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserAccount(),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RepairPage(),
    );
  }
}
