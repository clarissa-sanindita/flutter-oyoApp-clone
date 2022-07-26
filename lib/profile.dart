import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oyo/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? nama;
  String? nim;

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nama = prefs.getString('nama') ?? '';
      nim = prefs.getString('nim') ?? '';
    });

    final FirebaseAuth auth = FirebaseAuth.instance;
auth.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          nama = user.displayName!;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          ProfilPict(),
          SizedBox(height: 20),
          ProfNama(nama: nama),
          ProfNim(nim: nim),
          SizedBox(
            height: 50,
          ),
          btnLogout(),
        ],
      ),
    );
  }
}

class btnLogout extends StatelessWidget {
  const btnLogout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 48,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.red,
        onPressed: () async {
          // AuthService loginGoogle=AuthService(FirebaseAuth.instance);
          //             try {
          //               await loginGoogle.signOutApp();
          //               Navigator.pushReplacementNamed(
          //                     context,
          //                     '/login',
          //                   );
          //             } catch (e) {
          //               print(e.toString());
          //             }
          final prefs = await SharedPreferences.getInstance();
          prefs.clear();
          Navigator.pushReplacementNamed(
           context,
           '/login',
         );
        },
        child: Text(
          'Logout',
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ProfNim extends StatelessWidget {
  const ProfNim({
    Key? key,
    required this.nim,
  }) : super(key: key);

  final String? nim;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color.fromARGB(255, 241, 241, 243),
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.key),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  "NIM",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Expanded(
                child: Text(
                  nim ?? '',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )),
    );
  }
}

class ProfNama extends StatelessWidget {
  const ProfNama({
    Key? key,
    required this.nama,
  }) : super(key: key);

  final String? nama;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color.fromARGB(255, 241, 241, 243),
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.person),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  "Nama Lengkap",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Expanded(
                child: Text(
                  nama ?? '',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )),
    );
  }
}

class ProfilPict extends StatelessWidget {
  const ProfilPict({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/profil_pict.jpeg"),
          ),
          Positioned(
            right: -12,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white)),
                color: Color(0xFFF5F6F9),
                onPressed: () {},
                child: Icon(Icons.camera),
              ),
            ),
          )
        ],
      ),
    );
  }
}
