# Mrtesh Tool v0.3.3
Этот репозиторий содержит Mrtesh Tool для тестирования bash скриптов разработанных на ядре Mrcmd.

## Статус проекта
Проект находится на стадии бета-тестирования.

## Быстрый старт
> Для Windows два пути использования утилиты:
> - WSL2 - инструкция по установке находится [здесь](https://github.com/mondegor/mrcmd/blob/master/docs/WIN_WSL_DOCKER_GUIDE.md);
> - GitBash - скачать можно [здесь](https://git-scm.com/download/win);

### Инсталляция утилиты
- Выбрать рабочую директорию, где должна быть расположена утилита;
- `curl -L -o mrtesh.zip https://github.com/mondegor/mrtesh/archive/refs/tags/v0.3.3.zip`
- `unzip mrtesh.zip && rm mrtesh.zip && mv mrtesh-0.3.3 mrtesh && chmod +x ./mrtesh/test.sh`
- Для Linux, WSL: `sudo bash ./mrtesh/register.sh`
- Для Windows: `register.bat` // ВНИМАНИЕ: запускать из PowerShell или проводника под админом
- `mrtesh help` // проверить, что утилита была установлена

## Описание проекта
**Mrtesh Tool** - утилита, написанная на языке bash в строгой нотации. Позволяет тестировать
  bash скрипты разработанные на ядре Mrcmd. Её архитектура состоит из следующих компонентов:
- ядро утилиты основанное на ядре Mrcmd;
- компонент `Isolated Area`, который поочерёдно передаёт управление тестовым скриптам изолируя их от самой утилиты и друг от друга;
- контроллер, который, используя ядро, обрабатывает внешние команды и перенаправляет их в компонент `Isolated Area`;

<img src="https://github.com/mondegor/mrtesh/blob/master/docs/img/mrtesh-architecture.png" width="539">

## Сопутствующие проекты
- [Mrcmd Tool для группировки и запуска unix команд и консольных скриптов](https://github.com/mondegor/mrcmd)
