#!/bin/bash
# check_profile_rc.sh — статическая сверка m3note-profile.rc с profile-l681.mk.
# Каждый файл, который profile-l681.mk кладёт в /vendor/meizu/l681/<путь>, должен
# быть привязан (bind) в rc ровно на /vendor/<путь с firmware/etc>, и наоборот.
# Исключение — bin/: исполняемые файлы не биндятся (neverallow mounton на exec_type),
# их сервисы запускают /vendor/meizu/l681/bin/<имя> напрямую.
# Пусто = совпадает. Запуск из корня этого репозитория.
set -u
mk=$(sed -n 's#.*:\$(M3NOTE_L681_DIR)/\([^ ]*\).*#\1#p' profile-l681.mk | grep -v '^bin/' | sort)
rc=$(sed -n 's#^ *mount none /vendor/meizu/l681/\([^ ]*\) /vendor/\([^ ]*\) bind$#\1 \2#p' m3note-profile.rc |
     while read -r src dst; do
         [ "$src" = "$dst" ] || echo "РАЗНЫЕ ПУТИ: $src -> $dst" >&2
         echo "$src"
     done | sort)
[ "$mk" = "$rc" ] && exit 0
echo "profile-l681.mk и m3note-profile.rc расходятся:"
diff <(echo "$mk") <(echo "$rc")
exit 1
