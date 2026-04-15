import 'package:flutter/material.dart';

// Import our custom widgets (created below)

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // --- MOCK LOGGED IN CONDITION ---
  // Change this to true to test the Authenticated UI
  bool isLoggedIn = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Maintain the background gradient from the web app
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFDF5E6), Color(0xFFE3F2FD)], // Light gold to light blue
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 2. Custom App Bar / Header (replicates web layout)
                _buildCustomAppBar(),
                const SizedBox(height: 25),

                // 3. Conditional UI rendering based on isLoggedIn
                if (!isLoggedIn)
                  const UnauthenticatedProfileView() // Left Image content
                else
                  const AuthenticatedProfileView(), // Right Image content

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Helper to replicate web app header style ---
  Widget _buildCustomAppBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Small "MASJID" label
        const Text("MASJID", style: TextStyle(color: Colors.black45, fontSize: 10, letterSpacing: 1.2, fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        // Title: Masjid Raja Haji Fi Sabilillah...
        const Text(
          "Raja Haji Fi Sabilillah Cyberjaya",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ],
    );
  }
}


class UnauthenticatedProfileView extends StatelessWidget {
  const UnauthenticatedProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Decide layout based on screen width (for larger phones/tablets)
        bool isWideScreen = constraints.maxWidth > 500;

        if (isWideScreen) {
          // Row layout for wider screens (replicates web columns)
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(flex: 3, child: _MainLoginCard()),
              const SizedBox(width: 20),
              const Expanded(flex: 2, child: _AccountUsageCard()),
            ],
          );
        } else {
          // Column layout for narrower portrait phones
          return const Column(
            children: [
              _MainLoginCard(),
              SizedBox(height: 20),
              _AccountUsageCard(),
            ],
          );
        }
      },
    );
  }
}

class _MainLoginCard extends StatelessWidget {
  const _MainLoginCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Profil", style: TextStyle(color: Colors.black45, fontSize: 12)),
          const SizedBox(height: 8),
          const Text(
            "Login / Daftar Pengguna",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          ),
          const SizedBox(height: 15),
          const Text(
            "Buka akaun pengguna untuk Masjid Raja Haji Fi Sabilillah Cyberjaya. Anda boleh log masuk atau daftar terus melalui endpoint auth dari backend semasa.",
            style: TextStyle(color: Colors.black54, height: 1.5, fontSize: 13),
          ),
          const SizedBox(height: 30),
          const Text("Akses Pengguna", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 5),
          const Text("Login atau daftar akaun pengguna...", style: TextStyle(color: Colors.black54, fontSize: 12)),
          const SizedBox(height: 15),
          
          // Mimicking the segmented control
          _buildSegmentedTab(),
          
          const SizedBox(height: 25),
          // Email Field
          const Text("Email", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 13)),
          const SizedBox(height: 8),
          _buildTextField(hint: "contoh@email.com", icon: Icons.mail_outline),
          
          const SizedBox(height: 20),
          // Password Field
          const Text("Password", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 13)),
          const SizedBox(height: 8),
          _buildTextField(hint: "Masukkan password", icon: Icons.lock_outline, isPassword: true),
          
          const SizedBox(height: 25),
          // Blue Action Button
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                foregroundColor: Colors.white,
                elevation: 0,
                // shape: RoundedRectangle4(),
              ),
              child: const Text("Login Pengguna", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSegmentedTab() {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(child: _TabItem(title: "Login", isActive: true)),
          Expanded(child: _TabItem(title: "Daftar", isActive: false)),
        ],
      ),
    );
  }

  Widget _buildTextField({required String hint, required IconData icon, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black38, fontSize: 13),
        prefixIcon: Icon(icon, color: Colors.black38, size: 20),
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
      ),
    );
  }
}

// Mimicking "Kegunaan Akaun" gray box
class _AccountUsageCard extends StatelessWidget {
  const _AccountUsageCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.person_outline, color: Colors.black45, size: 22),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Kegunaan Akaun", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                SizedBox(height: 8),
                Text(
                  "Akaun pengguna ini boleh digunakan untuk akses peribadi, rekod sumbangan sendiri, dan ciri lain untuk Raja Haji Fi Sabilillah Cyberjaya.",
                  style: TextStyle(color: Colors.black54, height: 1.5, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Supporting Widget for SegmentedTab
class _TabItem extends StatelessWidget {
  final String title;
  final bool isActive;
  const _TabItem({required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF334155) : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.white : const Color(0xFF64748B),
          ),
        ),
      ),
    );
  }
}


class AuthenticatedProfileView extends StatelessWidget {
  const AuthenticatedProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWideScreen = constraints.maxWidth > 500;

        if (isWideScreen) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(flex: 3, child: _ActiveProfileMainCard()),
              const SizedBox(width: 20),
              const Expanded(flex: 2, child: _UserActionsSideCard()),
            ],
          );
        } else {
          return const Column(
            children: [
              _ActiveProfileMainCard(),
              SizedBox(height: 20),
              _UserActionsSideCard(),
            ],
          );
        }
      },
    );
  }
}

class _ActiveProfileMainCard extends StatelessWidget {
  const _ActiveProfileMainCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Profil", style: TextStyle(color: Colors.black45, fontSize: 12)),
          const SizedBox(height: 8),
          const Text(
            "Akaun Pengguna",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          ),
          const SizedBox(height: 15),
          const Text(
            "Maklumat akaun anda untuk akses pengguna Masjid Raja Haji Fi Sabilillah Cyberjaya.",
            style: TextStyle(color: Colors.black54, height: 1.5, fontSize: 13),
          ),
          const SizedBox(height: 30),
          const Text("Profil Aktif", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 5),
          const Text("Akaun ini disambungkan kepada Masjid Raja Haji Fi Sabilillah Cyberjaya.", style: TextStyle(color: Colors.black54, fontSize: 12)),
          const SizedBox(height: 20),
          
          // Mimicking the User Card within a Card
          _buildUserInformationCard(),
        ],
      ),
    );
  }

  Widget _buildUserInformationCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
      child: Row(
        children: [
          // Mimicking the avatar "E"
          Container(
            width: 50, height: 50,
            decoration: const BoxDecoration(color: Color(0xFFE2E8F0), shape: BoxShape.circle),
            child: const Center(child: Text("E", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF64748B)))),
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("eman", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(height: 4),
                Text("aiman@gmail.com", style: TextStyle(color: Colors.black54, fontSize: 12)),
                SizedBox(height: 4),
                Text("Ahli Kariah", style: TextStyle(color: Colors.black45, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Side card for logged-in users
class _UserActionsSideCard extends StatelessWidget {
  const _UserActionsSideCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.person_outline, color: Colors.black45, size: 22),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Akses Pengguna", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    SizedBox(height: 8),
                    Text(
                      "Bila anda log masuk, maklumat pengguna ini boleh digunakan semula untuk modul sumbangan dan ciri pengguna lain.",
                      style: TextStyle(color: Colors.black54, height: 1.5, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          // Blue Log Keluar Button
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton.icon(
              onPressed: () {
                // ADD LOGOUT LOGIC HERE
              },
              icon: const Icon(Icons.logout, size: 18),
              label: const Text("Log Keluar", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}