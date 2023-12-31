## Комп'ютерні системи імітаційного моделювання
## СПм-22-3, **Привалов Богдан Вікторович**
### Лабораторна робота №**1**. Опис імітаційних моделей та проведення обчислювальних експериментів

<br>

### Варіант 4, модель у середовищі NetLogo:
[Urban Suite - Pollution](http://www.netlogoweb.org/launch#http://www.netlogoweb.org/assets/modelslib/Curricular%20Models/Urban%20Suite/Urban%20Suite%20-%20Pollution.nlogo). Забруднення повітря та боротьба з ним.
<br>

### Вербальний опис моделі:
Симуляція забруднення повітря є дослідженням екосистеми хижак-жертва. Моделювання популяції людей, дерев та електростанцій в замкнутому середовищі. Використовуючи цю модель, можна досліджувати поведінку популяцій протягом тривалого часу, коли вони динамічно взаємодіють: хижаків (забруднення) і здобич (людей) можна порівнювати протягом кількох поколінь, оскільки їхні популяції демонструють регулярний або нерегулярний репродуктивний успіх.
### Керуючі параметри:
- **initial-population** визначає початкову кількість населення.
- **birth-rate** рівень нарожуваності, який визначає скільки людей народжується щорічно.
- **planting-rate** рівень посадки дерев, який визначає скільки дерев висаджено щорічно.
- **power-plants** кількість електростанцій.
- **polluting-rate** рівень забрудненості, який генерується внаслідок діяльності електростанцій.

### Внутрішні параметри:
- **people** кількість населення, яка впливає на споживання ресурсів та викиди забруднюючих речовин.
- **trees** кількість дерев в місті, які впливають на зменшення рівня забруднення повітря через поглинання забруднюючих речовин.
- **pollution** рівень забруднення повітря, який визначається сумою всіх джерел забруднення в місті.

### Показники роботи системи:
- Рівень забруднення повітря - відображає поточний рівень забруднення повітря.
- Кількість дерев - відображає поточну дерев в місті, які сприяють зменшенню забруднення.
- Кількість населення - відображає поточну кількість мешканців міста, які впливають на споживання ресурсів та викиди забруднюючих речовин.


### Недоліки моделі:
Модель спрощено моделює джерела забруднення повітря, і вона не враховує різноманітність і складність джерел забруднення, такі як різні типи промисловості, транспортні види і викиди.
Модель обмежена в налаштуваннях параметрів, що не дозволяє відобразити реальну глибину та різноманіття факторів, які впливають на забруднення повітря в міському середовищі.
Модель може бути обмеженою у відтворенні реального впливу "зелених" ініціатив на зменшення забруднення. Вона може не враховувати інші фактори, такі як планування міста, екологічна освіта тощо.

## Обчислювальні експерименти

### 1. Вплив кількості електростанцій на забрудненність середовища
Досліджується залежність середньої кількості електростанцій
Експерименти проводяться при 0-20 електростанціях, з кроком 5, усього 5 симуляцій.  
Інші керуючі параметри мають значення за замовчуванням:
- **initial-population**: 30
- **birth-rate**: 0.1
- **planting-rate**: 0.05
- **polluting-rate**: 3

<table>
<thead>
<tr><th>Електростанції</th><th>Дерева max</th><th>Населення max</th><th>Забруднення max</th><th>Роки</th></tr>
</thead>
<tbody>
<tr><td>0</td><td>389</td><td>191</td><td>0</td><td>138</td></tr>
<tr><td>5</td><td>495</td><td>236</td><td>121</td><td>232</td></tr>
<tr><td>10</td><td>878</td><td>406</td><td>291</td><td>233</td></tr>
<tr><td>15</td><td>1408</td><td>625</td><td>404</td><td>239</td></tr>
<tr><td>20</td><td>362</td><td>169</td><td>1034</td><td>164</td></tr>
</tbody>
</table>

![Залежність забруднення від електростанцій](https://github.com/pryvalovbogdan/nure/blob/main/KCIM/lab1/Screenshot%202023-09-29%20at%2015.34.44.png)
Графік наочно показує, що при збільшенні кількості електростанцій кратно збільшується забрудненість середовища.


### 2. Вплив народжуваності на довготу житття популяції
Досліджується залежність середньої довжини життся населення в залежності від народжуваності
Експерименти проводяться при 0-2 коеф., з кроком 5, усього 5 симуляцій.  
Інші керуючі параметри мають значення за замовчуванням:
- **initial-population**: 30
- **planting-rate**: 0.05
- **polluting-rate**: 3
- **power-plants**: 2

<table>
<thead>
<tr><th>Коеф. народжуваності</th><th>Дерева max</th><th>Населення max</th><th>Забруднення max</th><th>Роки</th></tr>
</thead>
<tbody>
<tr><td>0</td><td>72</td><td>30</td><td>94</td><td>51</td></tr>
<tr><td>0.05</td><td>152</td><td>68</td><td>61</td><td>84</td></tr>
<tr><td>0.1</td><td>895</td><td>392</td><td>203</td><td>719</td></tr>
<tr><td>0.15</td><td>30345</td><td>51562</td><td>46</td><td>83</td></tr>
<tr><td>0.2</td><td>31116</td><td>93165</td><td>48</td><td>53</td></tr>
</tbody>
</table>

![Залежність популяціі від народжуваності](https://github.com/pryvalovbogdan/nure/blob/main/KCIM/lab1/Screenshot%202023-09-29%20at%2015.35.45.png)
Графік наочно показує, що при збільшенні народжуваності кратно збільшується кількість населення, але при цьому також сбільшується кількість дерев і зменшується забруднення.


### 2.Вплив коефіціенту посадки дерев на забрудненність середовища
Досліджується залежність забрудненості від посадки дерев
Експерименти проводяться при 0-1 коеф. посадки, з кроком 5, усього 5 симуляцій.  
Інші керуючі параметри мають значення за замовчуванням:
- **initial-population**: 30
- **birth-rate**: 0.1
- **power-plants**: 2
- **polluting-rate**: 3

<table>
<thead>
<tr><th>Коеф. посадки</th><th>Дерева max</th><th>Населення max</th><th>Забруднення max</th><th>Роки</th></tr>
</thead>
<tbody>
<tr><td>0</td><td>0</td><td>413</td><td>1048</td><td>425</td></tr>
<tr><td>0.02</td><td>196</td><td>240</td><td>326</td><td>266</td></tr>
<tr><td>0.04</td><td>1294</td><td>650</td><td>126</td><td>648</td></tr>
<tr><td>0.06</td><td>4265</td><td>1416</td><td>42</td><td>1814</td></tr>
<tr><td>0.08</td><td>15480</td><td>4202</td><td>63</td><td>781</td></tr>
<tr><td>1</td><td>3486</td><td>681</td><td>41</td><td>1250</td></tr>
</tbody>
</table>

![Залежність забрудненності від посадки_дерев](https://github.com/pryvalovbogdan/nure/blob/main/KCIM/lab1/Screenshot%202023-09-29%20at%2015.35.55.png)
Графік наочно показує, що при збільшенні посадки дерев кратно збільшується довдинна життя популяції, і кратно зменшується забруднення.
