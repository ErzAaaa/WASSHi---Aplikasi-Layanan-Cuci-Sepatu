import 'package:flutter/material.dart';
import 'package:aplikasites1/model/shoeService.dart';
import 'package:aplikasites1/model/shoeCleaning.dart';
import 'package:aplikasites1/model/shoeTreatment.dart';

class DetailPage extends StatelessWidget {
  final shoeService service;

  const DetailPage({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    IconData icon = service is shoeCleaning
        ? Icons.cleaning_services
        : Icons.healing;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail ${service.type}"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header card dengan ikon & nama layanan
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.blueAccent.withOpacity(0.1),
                      child: Icon(icon, size: 32, color: Colors.blueAccent),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        service.type,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Deskripsi
            Text(
              service.deskripsi,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 20),

            // Harga
            Card(
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Harga: Rp ${service.harga.toStringAsFixed(0)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Detail tambahan
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (service is shoeCleaning) ...[
                      const Text(
                        "Detail Cleaning",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("Jenis Kain: ${(service as shoeCleaning).jenisKain.join(', ')}"),
                      Text("Warna Kain: ${(service as shoeCleaning).warnaKain}"),
                    ] else if (service is shoeTreatment) ...[
                      const Text(
                        "Detail Treatment",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("Jenis Perawatan: ${(service as shoeTreatment).jenisPerawatan}"),
                      Text("Durasi: ${(service as shoeTreatment).durasi}"),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
