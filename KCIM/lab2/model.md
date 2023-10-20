## Комп'ютерні системи імітаційного моделювання
## СПм-22-3, **Привалов Богдан Вікторович**
### Лабораторна робота №**2**. Редагування імітаційних моделей у середовищі NetLogo

<br>

### Варіант 4, модель у середовищі NetLogo:
[Urban Suite - Pollution](http://www.netlogoweb.org/launch#http://www.netlogoweb.org/assets/modelslib/Curricular%20Models/Urban%20Suite/Urban%20Suite%20-%20Pollution.nlogo)

<br>

### Внесені зміни у вихідну логіку моделі, за варіантом:

**Реалізовано позитивний вплив наявності електростанцій на вірогідність появи нових людей. Додано нову змінну 'power-plant-influence' у властивостях клітин, яка збільшує ймовірність народження нових людей:**


<pre>
patches-own [
  power-plant-influence
]
</pre>
Змінюємо вірогідність висадки дерев у клітинах поблизу електростанцій:
<pre>
to maybe-plant  ;; person procedure
  if random-float 1 < planting-rate + power-plant-influence [
    hatch-trees 1 [
      set health 5
      set color green
    ]
  ]
end
</pre>
Реалізуємо позитивний вплив наявності електростанцій на вірогідність появи нових людей:
<pre>
to reproduce  ;; person procedure
  if health > 4 and random-float 1 < birth-rate + power-plant-influence [
    hatch-people 1 [
      set health 5
    ]
  ]
end
</pre>

Додана властивість power-plant-influence для клітин, щоб відслідковувати вплив електростанцій на них. Електростанції тепер впливають на сусідні клітинах, збільшуючи вірогідність висадки дерев та народження нових людей.


![Скріншот моделі в процесі симуляції](default.png)
![Скріншот моделі в процесі симуляції](influence.png)

### Внесені зміни у вихідну логіку моделі, на власний розсуд:
Розглянемо вплив вітру на росповсюдження зараження. Додано новий атрибут wind-speed, wind-direction.

<pre>
patches-own [
  wind-speed
  wind-direction
]
</pre>
Додано новий метод для симуляції вітру:
<pre>
to move  ;; wind-path procedure
  rt random-float 30 - random-float 30
  fd wind-speed
  if pcolor = red [ set color blue - 2 ]
end
</pre>
Зменшимо еффект зараження зі збільшенням щвидкості вітру:
<pre>

to pollute  ;; patch procedure
  if is-power-plant? [
    set pcolor red
    set pollution polluting-rate
  ]
  
 if pollution > 0 [
    set pollution pollution - (pollution * wind-speed / 100)
  ]

  set pcolor scale-color red (pollution - .1) 5 0
end
</pre>

### Вплив швидкості вітру на забрудненність середовища
Досліджується залежність забрудненості від посадки дерев
Експерименти проводяться при 0-10 коеф. посадки, з кроком 5, усього 5 симуляцій.  
Інші керуючі параметри мають значення за замовчуванням:
- **initial-population**: 30
- **birth-rate**: 0.1
- **power-plants**: 2
- **polluting-rate**: 3
- **planting-rate**: 0.05

<table>
<thead>
<tr><th>Швидкість вітру</th><th>Дерева max</th><th>Населення max</th><th>Забруднення max</th></tr>
</thead>
<tbody>
<tr><td>0</td><td>84</td><td>37</td><td>129</td></tr>
<tr><td>2</td><td>86</td><td>34</td><td>102</td></tr>
<tr><td>4</td><td>89</td><td>36</td><td>86</td></tr>
<tr><td>6</td><td>83</td><td>35</td><td>71</td></tr>
<tr><td>8</td><td>67</td><td>36</td><td>52</td></tr>
<tr><td>10</td><td>59</td><td>37</td><td>41</td></tr>
</tbody>
</table>

З висновку експерименту видно, що при збільшенні вітру забруднення зменшується.

![Скріншот моделі в процесі симуляції](wind-dependency.png)
Фінальний код моделі та її інтерфейс доступні за [посиланням](model.nlogo). *// якщо вносили зміни до інтерфейсу середовища моделювання - то експорт потрібен у форматі nlogo, як тут. Інакше, якщо змінювався лише код логіки моделі, достатньо викласти лише його, як [тут](model-code.html),якщо експортовано з десктопної версії NetLogo, або окремим текстовим файлом, шляхом копіпасту з веб-версії*.
<br>

