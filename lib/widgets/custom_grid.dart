import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_snap4/controllers/fetch_images.dart';

class CustomImageGrid extends StatelessWidget {
  final FetchImageController controller;

  const CustomImageGrid({Key? key, required this.controller,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.errorMessage.isNotEmpty) {
        return Center(child: Text(controller.errorMessage.value));
      }

      if (controller.imageUrls.isEmpty) {
        return const Center(child: Text('No Images Found'));
      }

      return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.8,
        ),
        itemCount: controller.imageUrls.length,
        itemBuilder: (context, index) {
          final imageUrl = controller.imageUrls[index];

          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 500,

              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          );
        },
      );
    });
  }
}