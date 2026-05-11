import 'package:ejaarah_app/Helper/profile_helper.dart';
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
                if (isLoggedIn)
                   UnauthenticatedProfileView() // Left Image content
                else
                   AuthenticatedProfileView(), // Right Image content

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

