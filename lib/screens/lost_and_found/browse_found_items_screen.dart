import 'package:flutter/material.dart';
import '/models/found_item.dart';

class BrowseFoundItemsScreen extends StatefulWidget {
  @override
  _BrowseFoundItemsScreenState createState() => _BrowseFoundItemsScreenState();
}

class _BrowseFoundItemsScreenState extends State<BrowseFoundItemsScreen> {
  final List<FoundItem> foundItems = [
    FoundItem(
      name: 'Wallet',
      description: 'Brown leather wallet with ID card inside.',
      location: 'Library Building',
      date: 'July 15, 2025',
    ),
    FoundItem(
      name: 'Laptop',
      description: 'HP Pavilion found near the cafeteria.',
      location: 'Cafeteria',
      date: 'July 16, 2025',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A5EBF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A5EBF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Browse Found Items',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildFilters(),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: foundItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return _buildFoundItemCard(foundItems[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() => Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE8E8F5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search items here',
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),
      );

  Widget _buildFilters() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(child: _buildFilterChip('Category')),
            const SizedBox(width: 12),
            Expanded(child: _buildFilterChip('Date')),
            const SizedBox(width: 12),
            Expanded(child: _buildFilterChip('Location')),
          ],
        ),
      );

  Widget _buildFilterChip(String label) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFE8E8F5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style:
              const TextStyle(color: Color(0xFF4A5EBF), fontWeight: FontWeight.w500),
        ),
      );

  Widget _buildFoundItemCard(FoundItem item) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(item.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(item.location,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                    const SizedBox(width: 20),
                    Text(item.date,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () => _showClaimDialog(context, item),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4A5EBF),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            ),
            child: const Text('Claim'),
          ),
        ],
      ),
    );
  }

  void _showClaimDialog(BuildContext context, FoundItem item) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Claim Item'),
        content: Text('Are you sure you want to claim "${item.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Claim request submitted!')),
              );
            },
            child: const Text('Claim'),
          ),
        ],
      ),
    );
  }
}
