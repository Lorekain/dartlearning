import 'package:cooking_book/model/dish.dart';
import 'package:cooking_book/model/ingredient.dart';

List<Dish> dishList = [
  Dish(
      id: 0,
      title: 'Дашин смаколик',
      description: 'Супертонкий бутербродик з вкуснючим соусом',
      complexity: 'супер ультра мега хард',
      imagePath: 'assets/img/breakfast.jpg',
      recipe:
          'Приготування: Зробити тости із хліба, дати трохи охолонути Мякіть авокадо перетерти виделкою з крем сиром, додати спеції за смаком. Отриману намазку розподіляемо на тости, зверху кладемо листя салату. Лосось слабкої солі нарізаємо на тонкі смужки і кладемо на салат. Огірок нарізаємо на тонкі смужки і кладемо поверх риби, додаємо соус і готово!',
      ingredient: [
        Ingredients('чупачупс', '20г', 'assets/img/garlic.png'),
      ]),
  Dish(
      id: 1,
      title: 'Колесна зірка',
      description: '5 капсук з основним каталізатором',
      complexity: 'супер изич',
      imagePath: 'assets/img/evening.jpg',
      recipe: 'отьтак вотьтак 1',
      ingredient: [
        Ingredients('чупачупс', 'сосалка', 'assets/img/garlic.png')
      ]),
  Dish(
      id: 2,
      title: '1000-7 малінок ',
      description: 'башня малінок з вилкою (її не їсти) ',
      complexity: 'ядернохард ',
      imagePath: 'assets/img/deserts.jpg',
      recipe: 'отьтак вотьтак 2',
      ingredient: [
        Ingredients('чупачупс', 'сосалка', 'assets/img/garlic.png')
      ]),
  Dish(
      id: 3,
      title: 'Піпа',
      description: 'лілпіпка',
      complexity: 'easy',
      imagePath: 'assets/img/main_dishes_2.jpg',
      recipe: 'отьтак вотьтак 3',
      ingredient: [
        Ingredients('чупачупс', 'сосалка', 'assets/img/garlic.png')
      ]),
  Dish(
      id: 4,
      title: 'Дашина помідорка',
      description: 'помідорка соковита',
      complexity: 'Ізіч',
      imagePath: 'assets/img/main_dishes_2.jpg',
      recipe: 'Потрошим помідорку і запихуем туда крабові палки з сиром',
      ingredient: [
        Ingredients('Помідорки', '', 'assets/img/garlic.png'),
        Ingredients('Крабові палички', '', 'assets/img/garlic.png'),
        Ingredients('шось іще', '', 'assets/img/garlic.png'),
      ]),
  Dish(
      id: 5,
      title: 'Панкекі',
      description: 'вкусно яебу',
      complexity: 'Для Толі сложно',
      imagePath: 'assets/img/main_dishes_2.jpg',
      recipe: 'Делаем тісто і жарим, поливаем вареньям',
      ingredient: [
        Ingredients('Мука', '', 'assets/img/garlic.png'),
        Ingredients('Молоко', '', 'assets/img/garlic.png'),
        Ingredients('яйки', '', 'assets/img/garlic.png'),
        Ingredients('Вареня', '', 'assets/img/garlic.png'),
      ]),
  Dish(
      id: 6,
      title: 'Пітса',
      description: 'Пітса лінива',
      complexity: 'Супер ізі',
      imagePath: 'assets/img/main_dishes_2.jpg',
      recipe: 'На лаваш кидаем все шо есть в холодосі і в духовку',
      ingredient: [
        Ingredients('Лаваш', '', 'assets/img/garlic.png'),
        Ingredients(' і все шо надо уже викинуть но жалко', '',
            'assets/img/garlic.png'),
      ]),
  Dish(
      id: 7,
      title: 'Омлет',
      description: 'Ну омлет шо ще добавить',
      complexity: 'ізіч',
      imagePath: 'assets/img/main_dishes_2.jpg',
      recipe: 'Яйця молоко і приправки поболтихать і вилить на сковородку',
      ingredient: [
        Ingredients('Яйця', '', 'assets/img/garlic.png'),
        Ingredients('Молоко', '', 'assets/img/garlic.png'),
        Ingredients('приправки', '', 'assets/img/garlic.png'),
      ]),
  Dish(
      id: 8,
      title: 'Рибка',
      description: 'Рибка в духовочкі',
      complexity: 'Хардуся',
      imagePath: 'assets/img/main_dishes_2.jpg',
      recipe:
          'Рибку чістимо маринуємо і в духовку, можно добавить до неї овощей',
      ingredient: [
        Ingredients('Рибка', '', 'assets/img/garlic.png'),
        Ingredients('лімон', '', 'assets/img/garlic.png'),
        Ingredients('приправки', '', 'assets/img/garlic.png'),
        Ingredients('можна овощі', '', 'assets/img/garlic.png'),
      ]),
];
