#!/bin/bash
cd "$HOME"
mkdir -p lab0
cd lab0
rm -r claude_monet 2>/dev/null
rm final_menu 2>/dev/null

mkdir -p claude_monet/kitchen/hot_station
mkdir -p claude_monet/kitchen/pastry_station
mkdir -p claude_monet/hall
mkdir -p claude_monet/bar
mkdir -p claude_monet/office
mkdir -p claude_monet/locker_room

cat > claude_monet/kitchen/hot_station/senya_task << 'EOF'
Сеня готовит мясо для банкета
Проверяет температуру горячего цеха
После смены считает оставшиеся продукты
EOF

cat > claude_monet/kitchen/hot_station/fedya_task << 'EOF'
Федя разделывает рыбу для гостей
Готовит фирменную закуску вместе с Сеней
Перед подачей зовёт Баринова
EOF

cat > claude_monet/kitchen/pastry_station/lui_dessert << 'EOF'
Луи выпекает коржи для мильфея
Готовит крем по старому рецепту
Оставляет один десерт для команды
EOF

cat > claude_monet/kitchen/pastry_station/katya_idea << 'EOF'
Катя предлагает новый шоколадный десерт
Баринов просит уменьшить количество сахара
Пробную порцию получает Макс
EOF

cat > claude_monet/kitchen/barinov_order << 'EOF'
Баринов собирает всю команду перед сменой
Каждый повар отвечает за своё рабочее место
Лёва контролирует выдачу блюд
EOF

cat > claude_monet/hall/waiter_plan << 'EOF'
Настя обслуживает столики у окна
Официанты встречают гостей в главном зале
Особые просьбы гостей передают Вике
EOF

cat > claude_monet/bar/kostya_report << 'EOF'
Костя проверил запас напитков
Для вечера подготовлены новые коктейли
Бар откроется одновременно с залом
EOF

cat > claude_monet/bar/nastya_note << 'EOF'
Настя просит Костю не опаздывать
После смены они ужинают вместе
Для гостей оставлены чистые бокалы
EOF

cat > claude_monet/office/vika_summary << 'EOF'
Вика проверила кухню и главный зал
Команда готова к вечерней смене
Отчёт нужно передать Нагиеву
EOF

cat > claude_monet/locker_room/max_note << 'EOF'
Макс придумал новое блюдо для меню
Баринов разрешил приготовить пробную порцию
Вика ждёт Макса после смены
EOF

cat > claude_monet/locker_room/leva_note << 'EOF'
Лёва проверяет форму новых поваров
Ключ от кладовой лежит у шефа
Последним кухню закрывает су-шеф
EOF

chmod 755 claude_monet
chmod u=rwx,g=rx,o= claude_monet/kitchen
chmod 750 claude_monet/kitchen/hot_station
chmod u=rw,g=r,o= claude_monet/kitchen/hot_station/senya_task
chmod 640 claude_monet/kitchen/hot_station/fedya_task
chmod u=rwx,g=rx,o= claude_monet/kitchen/pastry_station
chmod 644 claude_monet/kitchen/pastry_station/lui_dessert
chmod u=rw,g=r,o=r claude_monet/kitchen/pastry_station/katya_idea
chmod 640 claude_monet/kitchen/barinov_order
chmod u=rwx,g=rx,o= claude_monet/hall
chmod 644 claude_monet/hall/waiter_plan
chmod 750 claude_monet/bar
chmod u=rw,g=r,o= claude_monet/bar/kostya_report
chmod 640 claude_monet/bar/nastya_note
chmod u=rwx,g=rx,o= claude_monet/office
chmod 640 claude_monet/office/vika_summary
chmod 750 claude_monet/locker_room
chmod u=rw,g=r,o= claude_monet/locker_room/max_note
chmod 644 claude_monet/locker_room/leva_note

cp claude_monet/locker_room/max_note claude_monet/office/max_report
cp -r claude_monet/bar claude_monet/hall/bar_backup
ln -s claude_monet/kitchen/barinov_order final_menu
ln -s ../kitchen claude_monet/office/kitchen_access
ln claude_monet/kitchen/hot_station/senya_task claude_monet/kitchen/hot_station/senya_task_copy
cat claude_monet/kitchen/hot_station/senya_task claude_monet/kitchen/hot_station/fedya_task > claude_monet/kitchen/cook_tasks
cat claude_monet/hall/waiter_plan >> claude_monet/office/vika_summary
mv claude_monet/locker_room/max_note claude_monet/kitchen/max_final_note

echo "=== 4.1 ==="
ls -lR | grep "^-" | sort -k5,5nr | head -n 5
echo "=== 4.2 ==="
grep -rih "баринов\|макс" claude_monet | grep -v "порц" | sort | head -n 6
echo "=== 4.3 ==="
grep -ril "кост\|наст" claude_monet/bar claude_monet/hall/bar_backup | wc -l
echo "=== 4.4 ==="
(head -qn 1 claude_monet/kitchen/hot_station/*_task; tail -qn 1 claude_monet/kitchen/hot_station/*_task) | grep -i "сеня\|федя\|продукт" | sort -r
echo "=== 4.5 ==="
grep -v "Сеня\|Федя" claude_monet/kitchen/cook_tasks | sort -r | head -n 4 | wc -w
echo "=== 4.6 ==="
ls -liR | grep "^ *[0-9]* -" | grep -E "^ *[0-9]+ -[^ ]+ +2 " | sort -n
echo "=== 4.7 ==="
ls -lR | grep "^l" | grep -v "final" | sort -k9

rm claude_monet/office/max_report
rm final_menu
rm claude_monet/office/kitchen_access
rm claude_monet/kitchen/hot_station/senya_task_copy
rm claude_monet/locker_room/leva_note
rmdir claude_monet/locker_room
rm claude_monet/kitchen/max_final_note
rm -r claude_monet/hall/bar_backup
