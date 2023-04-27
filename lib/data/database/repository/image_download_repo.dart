import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:path_provider/path_provider.dart';

class ImageDowloadRepo {
  Future<List<Recipe>> downloadRecipeImages(List<Recipe> recipes) async {
    var recipeList = <Recipe>[];
    var futures = <Future<void>>[];
    final fileNotFound =
        await getImageFileFromAssets("assets/images/пусто.jpg");
    for (var recipe in recipes) {
      futures.add(Future(() async => {
            recipeList.add(await _downloadForRecipe(recipe, fileNotFound.path))
          }));
    }
    await Future.wait(futures);
    return recipeList;
  }

  Future<Recipe> _downloadForRecipe(Recipe recipe, String fileNotFound) async {
    final Recipe newRecipe;
    final exist = await _checkExist(recipe.img);
    if (exist) {
      final Directory tempDir = await getApplicationDocumentsDirectory();
      newRecipe = recipe.copyWith(
          img: File('${tempDir.path}/${recipe.img.split("/").last}').path);
    } else {
      if (recipe.img.isNotEmpty) {
        final file = await getImageFileFromNet(recipe.img, fileNotFound);
        newRecipe = recipe.copyWith(img: file.path);
      } else {
        newRecipe = recipe.copyWith(img: fileNotFound);
      }
    }
    return newRecipe;
  }

  Future<void> _deleteFile(File file) async {
    if (await file.exists()) {
      await file.delete();
    }
  }

  Future<bool> _checkExist(String imgNet) async {
    final Directory tempDir = await getApplicationDocumentsDirectory();
    return await File('${tempDir.path}/${imgNet.split("/").last}').exists();
  }

  Future<File> getImageFileFromAssets(String filename) async {
    final Directory tempDir = await getApplicationDocumentsDirectory();
    ByteData byteData = await rootBundle.load(filename);
    File file = await File('${tempDir.path}/$filename').create(recursive: true);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
  }

  Future<File> getImageFileFromNet(String filepath, String fileNotFound) async {
    final Directory tempDir = await getApplicationDocumentsDirectory();
    HttpClient httpClient = HttpClient();
    File file;
    var request = await httpClient.getUrl(Uri.parse(filepath));
    var response = await request.close();
    if (response.statusCode == 200) {
      var bytes = await consolidateHttpClientResponseBytes(response);
      file = await File('${tempDir.path}/${filepath.split("/").last}')
          .create(recursive: true);
      await file.writeAsBytes(bytes);
    } else {
      file = File(fileNotFound);
    }
    return file;
  }
}
