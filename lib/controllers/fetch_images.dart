import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FetchImageController extends GetxController {


  var imageUrls = <String>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchImages();
    super.onInit();
  }

  Future<void> fetchImages() async {
    final supabase = Supabase.instance.client;

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final List<FileObject> files =
      await supabase.storage.from('images').list();

      // 🔥 filter only image files
      final imageFiles = files.where((file) {
        return file.name.endsWith('.jpg') ||
            file.name.endsWith('.jpeg') ||
            file.name.endsWith('.png') ||
            file.name.endsWith('.webp');
      }).toList();

      final urls = imageFiles
          .map((file) =>
          supabase.storage.from('images').getPublicUrl(file.name))
          .toList();

      imageUrls.assignAll(urls);

    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}