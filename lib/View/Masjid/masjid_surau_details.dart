import 'package:ejaarah_app/API/Get/get_api.dart';
import 'package:ejaarah_app/Helper/card_container.dart';
import 'package:ejaarah_app/Model/service_model.dart';
import 'package:ejaarah_app/Model/waktu_solat_model.dart';
import 'package:flutter/material.dart';

class MasjidSurauDetails extends StatefulWidget {
  final String category;
  final String location;
  final String title;
  final String imagePath;

  const MasjidSurauDetails({
    super.key,
    required this.category,
    required this.location,
    required this.title,
    required this.imagePath,
  });

  @override
  State<MasjidSurauDetails> createState() => _MasjidSurauDetailsState();
}

class _MasjidSurauDetailsState extends State<MasjidSurauDetails> {
  late Future<List<ServiceModel>> futureService;
  late Future<List<WaktuSolatHarianModel>> futureSolat;

  @override
  void initState() {
    super.initState();
    futureService = MockApiService().fetchService();
    futureSolat = MockApiWaktuSolat().fetchWaktu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(
          0xFFFDF5E6,
        ), // Matching your gold gradient start
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Constrain the logo size so it doesn't overflow
                    Container(
                      width: 60,
                      height: 60,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(widget.imagePath, fit: BoxFit.contain),
                    ),
                    const SizedBox(width: 15),
                    // Use Expanded here to ensure text wraps instead of overflowing
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.category.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 10,
                              letterSpacing: 1.2,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            widget.location,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                            maxLines: 1,
                            overflow:
                                TextOverflow.ellipsis, // Adds "..." if too long
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // _buildServiceGrid(),
              gridDemo(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Waktu Solat Harian"),
                        Text(
                          "Isnin, 20 April 2026",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),

                        Row(
                          children: [
                            Icon(Icons.pin_drop_outlined),
                            SizedBox(width: 10),

                            Expanded(
                              child: Text(
                                "Masjid Raja Haji Fi Sabilillah Cyberjaya | Cyberjaya, Selangor",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        _buildWaktuHarianGrid(),
                        SizedBox(height: 20),
                        Text("Waktu Solat Mingguan"),
                        SizedBox(height: 10),
                        _buildMingguanGrid(),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget gridDemo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GridView(
        shrinkWrap: true, // مهم!
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 10,
          childAspectRatio: 0.8,
          crossAxisCount: 4,
        ),
        children: [
          ReusableItemCard(
            itemName: 'Sumbangan',
            imagePath: "assets/images/ejaarahCoklat_no_bg.png",
          ),
          ReusableItemCard(
            itemName: 'Khairat',
            imagePath: "assets/images/ejaarahCoklat_no_bg.png",
          ),
          ReusableItemCard(
            itemName: 'Kebajikan',
            imagePath: "assets/images/ejaarahCoklat_no_bg.png",
          ),
          ReusableItemCard(
            itemName: 'Aduan',
            imagePath: "assets/images/ejaarahCoklat_no_bg.png",
          ),

          ReusableItemCard(
            itemName: 'Program',
            imagePath: "assets/images/ejaarahCoklat_no_bg.png",
          ),
          ReusableItemCard(
            itemName: 'Ramadhan',
            imagePath: "assets/images/ejaarahCoklat_no_bg.png",
          ),
          ReusableItemCard(
            itemName: 'Qurban',
            imagePath: "assets/images/ejaarahCoklat_no_bg.png",
          ),
          ReusableItemCard(
            itemName: 'Aset',
            imagePath: "assets/images/ejaarahCoklat_no_bg.png",
          ),
        ],
      ),
    );
  }

  Widget _buildServiceGrid() {
    return FutureBuilder<List<ServiceModel>>(
      future: MockApiService().fetchService(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final services = snapshot.data ?? [];

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: services.length,
          itemBuilder: (context, index) {
            final service = services[index];

            return Opacity(
              // Set opacity based on availability
              opacity: service.available ? 1.0 : 0.5,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        // Logic: If available, allow click. If not, null (disables InkWell).
                        onTap: service.available
                            ? () {
                                print("Clicked ${service.title}");
                              }
                            : null,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(service.image),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    service.title,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildWaktuHarianGrid() {
    return FutureBuilder<List<WaktuSolatHarianModel>>(
      future: MockApiWaktuSolat().fetchWaktu(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final waktuSolat = snapshot.data ?? [];

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.4,
          ),
          itemCount: waktuSolat.length,
          itemBuilder: (context, index) {
            final waktu = waktuSolat[index];

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(waktu.imagePath),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        waktu.waktuSolat,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        waktu.jamSolat,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildMingguanGrid() {
    return FutureBuilder<List<WaktuSolatMingguanModel>>(
      future: MockApiWaktuSolatMingguan().fetchWaktu(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        final mingguanData = snapshot.data ?? [];

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mingguanData.length,
          itemBuilder: (context, index) {
            final day = mingguanData[index];

            return Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      day.tarikhMelayu,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(day.tarikhArab, style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 10),

                    // NESTED GRID: This builds the 3-column prayer times
                    GridView.builder(
                      shrinkWrap: true, // Crucial for nested lists
                      physics:
                          NeverScrollableScrollPhysics(), // Let the Parent scroll
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2.0,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemCount: day.senaraiWaktu.length,
                      itemBuilder: (context, gridIndex) {
                        final solat = day.senaraiWaktu[gridIndex];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                solat.namaWaktu,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                solat.jam,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
