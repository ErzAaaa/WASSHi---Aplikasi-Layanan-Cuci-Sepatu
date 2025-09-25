import 'package:flutter/material.dart';
import 'package:aplikasites1/model/shoeService.dart';
import 'package:aplikasites1/model/shoeTreatment.dart';
import 'package:aplikasites1/model/shoeCleaning.dart';
import 'detail_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<shoeService> _filteredServices = [];
  final List<shoeService> _services = [
    shoeCleaning(
      id: 1,
      type: "Fast Clean",
      deskripsi: "Membersihkan sepatu anda secara cepat tanpa menunggu lama",
      harga: 35000,
      jenisKain: ["Canvas", "Suede"],
      warnaKain: "Putih",
    ),
    shoeTreatment(
      id: 2,
      type: "Leather Treatment",
      deskripsi: "Perawatan sepatu kulit",
      harga: 75000,
      jenisPerawatan: "Kulit",
      durasi: "3 hari",
    ),
    shoeCleaning(
      id: 3,
      type: "Sport Clean",
      deskripsi: "Sepatu olahraga",
      harga: 60000,
      jenisKain: ["Canvas", "Suede"],
      warnaKain: "Hitam",
    ),
    shoeTreatment(
      id: 4,
      type: "Suede Treatment",
      deskripsi: "Perawatan sepatu suede",
      harga: 80000,
      jenisPerawatan: "Suede",
      durasi: "4 hari",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _filteredServices = _services; // Awalnya tampilkan semua layanan
  }

  void _filterServices(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredServices = _services;
      } else {
        _filteredServices = _services
            .where((service) =>
                service.type.toLowerCase().contains(query.toLowerCase()) ||
                service.deskripsi.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayName = widget.username.isNotEmpty ? widget.username : "User";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SvgPicture.asset(
            'assets/image/logo.svg',
            height: 40,
            color: const Color(0xFF3D60AC),
          ),
        ),
        title: SizedBox(
          height: 40,
          child: TextField(
            controller: _searchController,
            onChanged: _filterServices,
            decoration: InputDecoration(
              hintText: "Cari layanan...",
              hintStyle: const TextStyle(fontSize: 14),
              prefixIcon: const Icon(Icons.search, size: 20),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              // Tampilkan dialog konfirmasi logout
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Konfirmasi Logout"),
                  content: const Text("Apakah Anda yakin ingin logout?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Tutup dialog
                      },
                      child: const Text("Batal"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Tutup dialog
                        Navigator.of(context).pushReplacementNamed('/login'); // Navigasi ke halaman login
                      },
                      child: const Text("Logout"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sapaan username
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Selamat datang, $displayName 🎉",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
            ),

            const SizedBox(height: 20),

            const SizedBox(height: 20),

            // List horizontal layanan
            SizedBox(
              height: 180,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: _filteredServices.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, index) {
                  final service = _filteredServices[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(service: service),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Container(
                        width: 220,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              service is shoeCleaning
                                  ? Icons.cleaning_services
                                  : Icons.healing,
                              color: Colors.blueAccent,
                              size: 36,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              service.type,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              service.deskripsi,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}