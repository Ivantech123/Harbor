# Документация Harbor Browser

> [English Version](./README.md)

Добро пожаловать в документацию Harbor Browser! Этот гайд содержит всё, что вам нужно знать о разработке, сборке и внесении вклада в Harbor.

## Быстрая навигация

### Для пользователей
- **[Начало работы](./GETTING_STARTED_RU.md)** - Загрузка и установка
- **[Гайд по функциям](./FEATURES_RU.md)** - Обзор возможностей
- **[Часто задаваемые вопросы](./FAQ_RU.md)** - Ответы на популярные вопросы
- **[Решение проблем](./TROUBLESHOOTING_RU.md)** - Типичные проблемы и их решение

### Для разработчиков
- **[Внесение вклада](./CONTRIBUTING_RU.md)** - Как помочь проекту
- **[Git рабочий процесс](./GIT_WORKFLOW_RU.md)** - Стратегия ветвлений
- **[Процесс релиза](./RELEASE_PROCESS_RU.md)** - Как выпускаются версии
- **[Стратегия версионирования](./VERSION_STRATEGY_RU.md)** - Схема нумерации версий
- **[Архитектура](./ARCHITECTURE_RU.md)** - Структура и дизайн проекта

### Для мейнтейнеров
- **[Чеклист релиза](./RELEASE_PROCESS_RU.md#чеклист-релиза)** - Задачи перед релизом
- **[Гайд по обслуживанию](./MAINTENANCE_RU.md)** - Техническое обслуживание
- **[Политика безопасности](./SECURITY.md)** - Рекомендации по безопасности

## Структура документации

```
docs/
├── README_RU.md                 # Этот файл (Русский)
├── README.md                    # Английская версия
├── GETTING_STARTED_RU.md        # Гайд установки (РУ)
├── GETTING_STARTED.md           # Гайд установки (EN)
├── FEATURES_RU.md               # Обзор функций (РУ)
├── FEATURES.md                  # Обзор функций (EN)
├── CONTRIBUTING_RU.md           # Гайд контрибьютинга (РУ)
├── contribute.md                # Гайд контрибьютинга (EN)
├── GIT_WORKFLOW_RU.md           # Git процесс (РУ)
├── GIT_WORKFLOW.md              # Git процесс (EN)
├── RELEASE_PROCESS_RU.md        # Процесс релиза (РУ)
├── RELEASE_PROCESS.md           # Процесс релиза (EN)
├── VERSION_STRATEGY_RU.md       # Версионирование (РУ)
├── VERSION_STRATEGY.md          # Версионирование (EN)
├── ARCHITECTURE_RU.md           # Архитектура (РУ)
├── ARCHITECTURE.md              # Архитектура (EN)
├── FAQ_RU.md                    # Часто вопросы (РУ)
├── FAQ.md                       # Часто вопросы (EN)
├── TROUBLESHOOTING_RU.md        # Решение проблем (РУ)
├── TROUBLESHOOTING.md           # Решение проблем (EN)
├── MAINTENANCE_RU.md            # Обслуживание (РУ)
├── MAINTENANCE.md               # Обслуживание (EN)
└── SECURITY.md                  # Безопасность (EN)
```

## Первые шаги

### Новичок в Harbor?
1. **[Загрузите Harbor](../README.md)** - Получите последнюю версию
2. **[Гайд установки](./GETTING_STARTED_RU.md)** - Установите Harbor
3. **[Гайд по функциям](./FEATURES_RU.md)** - Узнайте возможности
4. **[Часто вопросы](./FAQ_RU.md)** - Быстрые ответы

### Хотите внести вклад?
1. **[Прочитайте Кодекс поведения](../CODE_OF_CONDUCT.md)** - Правила сообщества
2. **[Гайд контрибьютинга](./CONTRIBUTING_RU.md)** - Как помочь
3. **[Git процесс](./GIT_WORKFLOW_RU.md)** - Разработка
4. **[Архитектура](./ARCHITECTURE_RU.md)** - Структура проекта

### Настройка разработки
```bash
# Клонировать репозиторий
git clone https://github.com/Ivantech123/Harbor.git
cd Harbor

# Установить зависимости
npm install

# Подготовить среду разработки
npm run init

# Запустить версию для разработки
npm start
```

## Основные разделы

### 📖 Документация пользователя
- Установка и настройка
- Объяснение функций
- Горячие клавиши
- Параметры и настройки
- Решение проблем

### 👨‍💻 Документация разработчика
- Настройка разработки
- Структура кода
- Сборка и тестирование
- Отладка
- Процесс внесения вклада

### 🔧 Техническая документация
- Обзор архитектуры
- Описание компонентов
- Система сборки
- CI/CD конвейер
- Советы по производительности

### 📋 Документация процессов
- Git рабочий процесс
- Процедура релиза
- Стратегия версионирования
- Рекомендации по обслуживанию
- Политики безопасности

## Поддержка языков

Вся документация доступна на:
- **English (EN)** - Основной язык
- **Русский (RU)** - Полная русская документация

Каждый основной документ имеет локализированную версию:
- `FILENAME.md` - Английский
- `FILENAME_RU.md` - Русский

## Быстрые ссылки

| Тема | English | Русский |
|------|---------|---------|
| Начало работы | [GETTING_STARTED.md](./GETTING_STARTED.md) | [GETTING_STARTED_RU.md](./GETTING_STARTED_RU.md) |
| Функции | [FEATURES.md](./FEATURES.md) | [FEATURES_RU.md](./FEATURES_RU.md) |
| Контрибьютинг | [contribute.md](./contribute.md) | [CONTRIBUTING_RU.md](./CONTRIBUTING_RU.md) |
| Git процесс | [GIT_WORKFLOW.md](./GIT_WORKFLOW.md) | [GIT_WORKFLOW_RU.md](./GIT_WORKFLOW_RU.md) |
| Процесс релиза | [RELEASE_PROCESS.md](./RELEASE_PROCESS.md) | [RELEASE_PROCESS_RU.md](./RELEASE_PROCESS_RU.md) |
| Часто вопросы | [FAQ.md](./FAQ.md) | [FAQ_RU.md](./FAQ_RU.md) |

## Частые вопросы

**В: Где сообщить об ошибке?**  
О: [GitHub Issues](https://github.com/Ivantech123/Harbor/issues)

**В: Как предложить функцию?**  
О: [GitHub Discussions](https://github.com/Ivantech123/Harbor/discussions)

**В: Могу ли я внести вклад?**  
О: Да! Смотрите [Гайд контрибьютинга](./CONTRIBUTING_RU.md)

**В: Какая текущая версия?**  
О: Смотрите [CHANGELOG.md](../CHANGELOG.md)

## Ресурсы

- **Главная страница проекта:** [github.com/Ivantech123/Harbor](https://github.com/Ivantech123/Harbor)
- **Ошибки/Issues:** [GitHub Issues](https://github.com/Ivantech123/Harbor/issues)
- **Обсуждения:** [GitHub Discussions](https://github.com/Ivantech123/Harbor/discussions)
- **Документация Firefox:** [firefox-source-docs.mozilla.org](https://firefox-source-docs.mozilla.org/)

## Индекс документов

### Гайды пользователя
- [Начало работы - Установка](./GETTING_STARTED_RU.md)
- [Обзор функций](./FEATURES_RU.md)
- [Часто задаваемые вопросы](./FAQ_RU.md)
- [Гайд по решению проблем](./TROUBLESHOOTING_RU.md)

### Гайды разработчика
- [Внесение вклада в Harbor](./CONTRIBUTING_RU.md)
- [Git процесс и соглашения](./GIT_WORKFLOW_RU.md)
- [Обзор архитектуры](./ARCHITECTURE_RU.md)
- [Настройка разработки](./GETTING_STARTED_RU.md#локальная-настройка-разработки)

### Релизы и процессы
- [Процесс релиза](./RELEASE_PROCESS_RU.md)
- [Стратегия версионирования](./VERSION_STRATEGY_RU.md)
- [История изменений](../CHANGELOG.md)
- [Гайд обслуживания](./MAINTENANCE_RU.md)

### Справочник
- [Кодекс поведения](../CODE_OF_CONDUCT.md)
- [Политика безопасности](./SECURITY.md)
- [Лицензия проекта](../LICENSE)

## Помощь и поддержка

- 📖 **Документация:** Вы её читаете!
- 🐛 **Сообщить об ошибке:** [Создать Issue](https://github.com/Ivantech123/Harbor/issues/new)
- 💡 **Предложить функцию:** [Начать обсуждение](https://github.com/Ivantech123/Harbor/discussions/new)
- 💬 **Задать вопрос:** [GitHub Discussions](https://github.com/Ivantech123/Harbor/discussions)
- 📧 **Другое:** Смотрите [SECURITY.md](./SECURITY.md) для контакта по безопасности

---

**Последнее обновление:** 2026-10-08  
**Версия документации:** 1.0.0  
**Язык:** Русский | [English](./README.md)
