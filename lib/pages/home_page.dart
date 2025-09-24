import 'package:flutter/material.dart';
import 'package:aplikasites1/model/shoeService.dart';
import 'package:aplikasites1/model/shoeTreatment.dart';
import 'package:aplikasites1/model/shoeCleaning.dart';
import 'detail_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final displayName = username.isNotEmpty ? username : "User";

    final List<shoeService> services = [
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SvgPicture.asset(
              'assets/image/logo.svg',
              height: 60,
              color: const Color(0xFF3D60AC),
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
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
        ),      body: SingleChildScrollView(
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

            // List horizontal layanan
            SizedBox(
              height: 180,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: services.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, index) {
                  final service = services[index];
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
                            const Spacer(),
                            service is shoeCleaning
                                ? Text(
                                    "Kain: ${service.jenisKain.join(', ')}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black45,
                                    ),
                                  )
                                : Text(
                                    "Perawatan: ${(service as shoeTreatment).jenisPerawatan}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black45,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // About Us section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "About Us",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Kami adalah layanan perawatan sepatu terbaik dengan pengalaman bertahun-tahun. "
                    "Kami menyediakan layanan cleaning dan treatment untuk berbagai jenis sepatu dan kain. "
                    "Tujuan kami adalah memberikan sepatu Anda penampilan terbaik dan perawatan maksimal.\n\n"
                    "Hubungi kami untuk informasi lebih lanjut.",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}