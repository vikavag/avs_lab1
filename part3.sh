#!/bin/bash
# Вариант 15. Часть 3: поиск/фильтрация, затем удаление.
# Запускать после part2.sh: bash part3.sh

set -e
cd "$HOME/lab0"

echo "===== Задание 4.1 ====="
ls -lR | grep "^-" | sort -k5,5nr | head -n 5

echo
echo "===== Задание 4.2 ====="
grep -rih "баринов\|макс" claude_monet | grep -v "порц" | sort | head -n 6

echo
echo "===== Задание 4.3 ====="
grep -ril "кост\|наст" claude_monet/bar claude_monet/hall/bar_backup | wc -l

echo
echo "===== Задание 4.4 ====="
(head -qn 1 claude_monet/kitchen/hot_station/*_task; tail -qn 1 claude_monet/kitchen/hot_station/*_task) | grep -i "сеня\|федя\|продукт" | sort -r

echo
echo "===== Задание 4.5 ====="
grep -v "Сеня\|Федя" claude_monet/kitchen/cook_tasks | sort -r | head -n 4 | wc -w

echo
echo "===== Задание 4.6 ====="
ls -liR | grep "^ *[0-9]* -" | grep -E "^ *[0-9]+ -[^ ]+ +2 " | sort -n

echo
echo "===== Задание 4.7 ====="
ls -lR | grep "^l" | grep -v "final" | sort -k9

echo
echo "===== Задание 5: удаление ====="
rm claude_monet/office/max_report
rm final_menu
rm claude_monet/office/kitchen_access
rm claude_monet/kitchen/hot_station/senya_task_copy
rm claude_monet/locker_room/leva_note
rmdir claude_monet/locker_room
rm claude_monet/kitchen/max_final_note
rm -r claude_monet/hall/bar_backup

echo
echo "Дерево после удаления:"
ls -lR
