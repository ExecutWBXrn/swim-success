import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserDetailScreen extends HookConsumerWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Верхня частина: Аватарка та Ім'я
            const Center(
              child: CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              '@johndoe_dev',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Картка з інформацією
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildDetailTile(
                    Icons.email,
                    'Email',
                    'john.doe@example.com',
                  ),
                  const Divider(height: 1),
                  _buildDetailTile(Icons.phone, 'Phone', '+380 99 123 45 67'),
                  const Divider(height: 1),
                  _buildDetailTile(
                    Icons.location_on,
                    'Address',
                    'Street Name, 123, Kyiv',
                  ),
                  const Divider(height: 1),
                  _buildDetailTile(
                    Icons.language,
                    'Website',
                    'www.johndoe.dev',
                  ),
                  const Divider(height: 1),
                  _buildDetailTile(Icons.work, 'Company', 'Best Software Inc.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailTile(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        label,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
