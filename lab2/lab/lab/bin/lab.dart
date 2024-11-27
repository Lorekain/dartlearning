import 'dart:math';

// Клас для нейронної мережі
class NeuralNetwork {
  late List<double> weights;
  final double learningRate;

  NeuralNetwork(int inputSize, this.learningRate) {
    // Ініціалізуємо ваги випадковими значеннями
    weights = List.generate(inputSize, (_) => Random().nextDouble() * 2 - 1);
  }

  // Активуюча функція (сигмоїда)
  double activation(double x) {
    return 1 / (1 + exp(-x));
  }

  // Похідна активуючої функції
  double activationDerivative(double x) {
    final sig = activation(x);
    return sig * (1 - sig);
  }

  // Передній прохід (прогнозування)
  double predict(List<double> inputs) {
    double weightedSum = 0;
    for (int i = 0; i < inputs.length; i++) {
      weightedSum += inputs[i] * weights[i];
    }
    return activation(weightedSum);
  }

  // Навчання нейронної мережі
  void train(
      List<List<double>> inputs, List<double> expectedOutputs, int epochs) {
    for (int epoch = 0; epoch < epochs; epoch++) {
      double totalError = 0;

      for (int i = 0; i < inputs.length; i++) {
        // Передній прохід
        final output = predict(inputs[i]);

        // Помилка
        final error = expectedOutputs[i] - output;

        // Оновлення ваг
        for (int j = 0; j < weights.length; j++) {
          final gradient = error * activationDerivative(output) * inputs[i][j];
          weights[j] += learningRate * gradient;
        }

        totalError += error * error;
      }

      if (epoch % 100 == 0) {
        print('Epoch $epoch, Error: $totalError');
      }
    }
  }
}

void main() {
  // Дані часового ряду
  final timeSeries = [
    1.92,
    4.01,
    1.48,
    5.45,
    1.56,
    5.42,
    1.28,
    4.34,
    1.51,
    5.49,
    1.32,
    4.00,
    0.49,
    4.19,
    1.53
  ];

  // Формуємо тренувальні дані
  final inputSize = 3;
  final trainingData = <List<double>>[];
  final expectedOutputs = <double>[];

  for (int i = 0; i < timeSeries.length - inputSize; i++) {
    trainingData.add(timeSeries.sublist(i, i + inputSize));
    if (i + inputSize < timeSeries.length) {
      expectedOutputs.add(timeSeries[i + inputSize]);
    }
  }

  // Ініціалізація та навчання нейронної мережі
  final nn = NeuralNetwork(inputSize, 0.01);
  nn.train(trainingData, expectedOutputs, 1000);

  // Тестування
  print('Тестування');
  for (int i = 0; i < trainingData.length; i++) {
    final prediction = nn.predict(trainingData[i]);
    print(
        'Input: ${trainingData[i]}, Expected: ${expectedOutputs[i]}, Predicted: ${prediction}');
  }
}
