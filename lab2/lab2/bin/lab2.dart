import 'dart:math';

// Модель прикладу
class KeyboardExample {
  final String type;
  final bool hasBacklight;
  final bool hasNumPad;
  final int price;
  final String manufacturer;
  final String decision;

  KeyboardExample({
    required this.type,
    required this.hasBacklight,
    required this.hasNumPad,
    required this.price,
    required this.manufacturer,
    required this.decision,
  });
}

// Функція для обчислення ентропії
double entropy(List<KeyboardExample> examples) {
  var total = examples.length;
  var positive = examples.where((e) => e.decision == 'Купити').length;
  var negative = total - positive;

  if (positive == 0 || negative == 0) return 0.0;

  var pPos = positive / total;
  var pNeg = negative / total;

  return -(pPos * log(pPos) / log(2) + pNeg * log(pNeg) / log(2));
}

// Функція для обчислення приросту інформації
double informationGain(List<KeyboardExample> examples, String attribute,
    bool Function(KeyboardExample) predicate) {
  var totalEntropy = entropy(examples);
  var total = examples.length;

  var positiveSubset = examples.where(predicate).toList();
  var negativeSubset = examples.where((e) => !predicate(e)).toList();

  var weightedEntropy =
      (positiveSubset.length / total) * entropy(positiveSubset) +
          (negativeSubset.length / total) * entropy(negativeSubset);

  return totalEntropy - weightedEntropy;
}

// Клас вузла дерева
class DecisionNode {
  final String attribute;
  final Map<bool, DecisionNode?> branches;
  final String? decision;

  DecisionNode({
    required this.attribute,
    required this.branches,
    this.decision,
  });
}

// Побудова дерева на основі алгоритму ID3
DecisionNode buildTree(List<KeyboardExample> examples) {
  if (examples.every((e) => e.decision == 'Купити')) {
    return DecisionNode(attribute: '', branches: {}, decision: 'Купити');
  }
  if (examples.every((e) => e.decision == 'Не купити')) {
    return DecisionNode(attribute: '', branches: {}, decision: 'Не купити');
  }

  // Вибір атрибута з найбільшим приростом інформації
  var attributes = [
    'type',
    'hasBacklight',
    'hasNumPad',
    'price',
    'manufacturer'
  ];
  var bestAttribute = attributes[0];
  var bestGain = 0.0;
  bool Function(KeyboardExample)? bestPredicate;

  for (var attribute in attributes) {
    bool Function(KeyboardExample) predicate;
    if (attribute == 'type') {
      predicate = (e) => e.type == 'Геймерська';
    } else if (attribute == 'hasBacklight') {
      predicate = (e) => e.hasBacklight;
    } else if (attribute == 'hasNumPad') {
      predicate = (e) => e.hasNumPad;
    } else if (attribute == 'price') {
      predicate = (e) => e.price <= 2500 && e.price >= 1000;
    } else {
      predicate =
          (e) => ['Razer', 'SteelSeries', 'a4tech'].contains(e.manufacturer);
    }

    var gain = informationGain(examples, attribute, predicate);
    if (gain > bestGain) {
      bestGain = gain;
      bestAttribute = attribute;
      bestPredicate = predicate;
    }
  }

  // Розбиваємо на гілки
  var trueBranch = examples.where(bestPredicate!).toList();
  var falseBranch = examples.where((e) => !bestPredicate!(e)).toList();

  return DecisionNode(
    attribute: bestAttribute,
    branches: {
      true: buildTree(trueBranch),
      false: buildTree(falseBranch),
    },
  );
}

// Функція для прийняття рішення на основі дерева
String classify(KeyboardExample example, DecisionNode node) {
  if (node.decision != null) return node.decision!;

  var attributeValue;
  if (node.attribute == 'type') {
    attributeValue = example.type == 'Геймерська';
  } else if (node.attribute == 'hasBacklight') {
    attributeValue = example.hasBacklight;
  } else if (node.attribute == 'hasNumPad') {
    attributeValue = example.hasNumPad;
  } else if (node.attribute == 'price') {
    attributeValue = example.price <= 2500 && example.price >= 1000;
  } else {
    attributeValue =
        ['Razer', 'SteelSeries', 'a4tech'].contains(example.manufacturer);
  }

  return classify(example, node.branches[attributeValue]!);
}

void main() {
  // Вхідні дані
  var examples = [
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: true,
        hasNumPad: true,
        price: 2300,
        manufacturer: 'Razer',
        decision: 'Купити'),
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: true,
        hasNumPad: true,
        price: 2400,
        manufacturer: 'SteelSeries',
        decision: 'Купити'),
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: true,
        hasNumPad: true,
        price: 2600,
        manufacturer: 'Razer',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: false,
        hasNumPad: true,
        price: 2000,
        manufacturer: 'Razer',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Офісна',
        hasBacklight: true,
        hasNumPad: true,
        price: 1200,
        manufacturer: 'Logitech',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Офісна',
        hasBacklight: true,
        hasNumPad: false,
        price: 2300,
        manufacturer: 'Razer',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: true,
        hasNumPad: true,
        price: 1500,
        manufacturer: 'SteelSeries',
        decision: 'Купити'),
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: true,
        hasNumPad: true,
        price: 2500,
        manufacturer: 'Razer',
        decision: 'Купити'),
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: true,
        hasNumPad: true,
        price: 3000,
        manufacturer: 'Razer',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: true,
        hasNumPad: true,
        price: 900,
        manufacturer: 'SteelSeries',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: true,
        hasNumPad: true,
        price: 2200,
        manufacturer: 'a4tech',
        decision: 'Купити'),
    KeyboardExample(
        type: 'Офісна',
        hasBacklight: true,
        hasNumPad: false,
        price: 1500,
        manufacturer: 'Razer',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: false,
        hasNumPad: true,
        price: 2300,
        manufacturer: 'SteelSeries',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Офісна',
        hasBacklight: true,
        hasNumPad: true,
        price: 1200,
        manufacturer: 'Logitech',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Офісна',
        hasBacklight: false,
        hasNumPad: true,
        price: 900,
        manufacturer: 'Dell',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Офісна',
        hasBacklight: false,
        hasNumPad: false,
        price: 1100,
        manufacturer: 'HP',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Офісна',
        hasBacklight: true,
        hasNumPad: false,
        price: 2000,
        manufacturer: 'Logitech',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Офісна',
        hasBacklight: false,
        hasNumPad: true,
        price: 2500,
        manufacturer: 'Microsoft',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Офісна',
        hasBacklight: true,
        hasNumPad: true,
        price: 1800,
        manufacturer: 'Genius',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Офісна',
        hasBacklight: false,
        hasNumPad: true,
        price: 1300,
        manufacturer: 'HP',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Офісна',
        hasBacklight: true,
        hasNumPad: true,
        price: 1400,
        manufacturer: 'Dell',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: true,
        hasNumPad: true,
        price: 2300,
        manufacturer: 'ASUS',
        decision: 'Не купити'),
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: true,
        hasNumPad: false,
        price: 1800,
        manufacturer: 'Logitech',
        decision: 'Купити'),
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: true,
        hasNumPad: true,
        price: 1600,
        manufacturer: 'Razer',
        decision: 'Купити'),
  ];

  // Побудова дерева рішень
  var decisionTree = buildTree(examples);

  // Тестування нових прикладів
  var testExamples = [
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: true,
        hasNumPad: false,
        price: 2000,
        manufacturer: 'Razer',
        decision: ''),
    KeyboardExample(
        type: 'Офісна',
        hasBacklight: false,
        hasNumPad: true,
        price: 1500,
        manufacturer: 'Logitech',
        decision: ''),
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: true,
        hasNumPad: true,
        price: 3000,
        manufacturer: 'SteelSeries',
        decision: ''),
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: false,
        hasNumPad: false,
        price: 1200,
        manufacturer: 'HP',
        decision: ''),
    KeyboardExample(
        type: 'Геймерська',
        hasBacklight: true,
        hasNumPad: true,
        price: 1550,
        manufacturer: 'Razer',
        decision: ''),
  ];

  for (var example in testExamples) {
    var decision = classify(example, decisionTree);
    print(
        'Рішення для прикладу: ${example.type}, ${example.hasBacklight}, ${example.hasNumPad}, ${example.price}, ${example.manufacturer} - $decision');
  }
}
