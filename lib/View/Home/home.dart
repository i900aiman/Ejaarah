import 'package:ejaarah_app/API/Get/get_api.dart';
import 'package:ejaarah_app/Helper/card_container.dart';
import 'package:ejaarah_app/Model/location_model.dart';
import 'package:ejaarah_app/View/Masjid/masjid_surau_details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<LocationModel>> futureLocation;

  @override
  void initState() {
    super.initState();
    // Initialize the API call when the screen starts
    futureLocation = MockApiLocation().fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFDF5E6), Color(0xFFE3F2FD)],
          ),
        ),
        child: SafeArea(
          child: FutureBuilder<List<LocationModel>>(
            future: futureLocation,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text("Error loading data"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No location found"));
              }

              final locations = snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Image.asset(
                        "assets/images/ejaarahCoklat_no_bg.png",
                        height: 40, // Adjust height as needed
                      ),
                    ),

                    const SizedBox(height: 30),

                    _buildSectionHeader(
                      "AKSES TERKINI",
                      "${locations.length} dipaparkan",
                    ),
                    const SizedBox(height: 20),

                    _buildHorizontalList(
                      locations
                          .map(
                            (v) => InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => MasjidSurauDetails(
                                      category: v.category,
                                      location: v.location,
                                      title: v.title,
                                      imagePath: v.imagePath,
                                    ),
                                  ),
                                );
                                print(v.category + v.imagePath + v.location);
                              },
                              child: VenueCard(
                                category: v.category,
                                location: v.location,
                                title: v.title,
                                imagePath: v.imagePath,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String trailing) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
          Text(
            trailing,
            style: const TextStyle(color: Colors.black45, fontSize: 10),
          ),
        ],
      ),
    );
  }

  // Helper to build the horizontal scrolling area
  Widget _buildHorizontalList(List<Widget> cards) {
    return SizedBox(
      height: 250, // Fixed height for the card area
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: cards,
      ),
    );
  }
}
