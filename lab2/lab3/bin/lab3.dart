import 'dart:io';
import 'package:image/image.dart';

void main() {
  // Завантаження зображення
  final imagePath = 'input_image.jpg'; // Шлях до зображення
  final inputImage = decodeImage(File(imagePath).readAsBytesSync());

  if (inputImage == null) {
    print('Помилка: неможливо завантажити зображення.');
    return;
  }

  // Перетворення на відтінки сірого
  final grayImage = grayscale(inputImage);

  // Фільтр: вертикальне виявлення країв
  final kernel = [
    [0, 1, 0],
    [0, 1, 0],
    [0, 1, 0]
  ];

  final convolvedImage = applyConvolution(grayImage, kernel);

  // ReLU активація
  final reluImage = applyReLU(convolvedImage);

  // Max pooling (2x2)
  final pooledImage = maxPooling(reluImage, 2);

  // Збереження результатів
  File('output_convolved.png').writeAsBytesSync(encodePng(convolvedImage));
  File('output_relu.png').writeAsBytesSync(encodePng(reluImage));
  File('output_pooled.png').writeAsBytesSync(encodePng(pooledImage));

  print('Результати збережено:');
  print('- Convolved: output_convolved.png');
  print('- ReLU: output_relu.png');
  print('- Pooled: output_pooled.png');
}

// Функція згортки
Image applyConvolution(Image image, List<List<int>> kernel) {
  final output = Image(image.width, image.height);
  final kernelSize = kernel.length;
  final offset = kernelSize ~/ 2;

  for (int y = 0; y < image.height; y++) {
    for (int x = 0; x < image.width; x++) {
      int newValue = 0;

      for (int ky = 0; ky < kernelSize; ky++) {
        for (int kx = 0; kx < kernelSize; kx++) {
          final px = x + kx - offset;
          final py = y + ky - offset;

          if (px >= 0 && px < image.width && py >= 0 && py < image.height) {
            final pixelValue =
                image.getPixel(px, py) & 0xFF; // Отримання значення
            newValue += pixelValue * kernel[ky][kx];
          }
        }
      }

      newValue = newValue.clamp(0, 255); // Обмеження значення пікселя
      output.setPixel(x, y, getColor(newValue, newValue, newValue));
    }
  }

  return output;
}

// ReLU активація
Image applyReLU(Image image) {
  final output = Image(image.width, image.height);

  for (int y = 0; y < image.height; y++) {
    for (int x = 0; x < image.width; x++) {
      final pixelValue = image.getPixel(x, y) & 0xFF;
      final newValue = pixelValue > 0 ? pixelValue : 0;
      output.setPixel(x, y, getColor(newValue, newValue, newValue));
    }
  }

  return output;
}

// Max Pooling
Image maxPooling(Image image, int poolSize) {
  final output = Image(image.width ~/ poolSize, image.height ~/ poolSize);

  for (int y = 0; y < output.height; y++) {
    for (int x = 0; x < output.width; x++) {
      int maxVal = 0;

      for (int py = 0; py < poolSize; py++) {
        for (int px = 0; px < poolSize; px++) {
          final pixelX = x * poolSize + px;
          final pixelY = y * poolSize + py;

          if (pixelX < image.width && pixelY < image.height) {
            final pixelValue = image.getPixel(pixelX, pixelY) & 0xFF;
            maxVal = maxVal > pixelValue ? maxVal : pixelValue;
          }
        }
      }

      output.setPixel(x, y, getColor(maxVal, maxVal, maxVal));
    }
  }

  return output;
}
