// Налаштування тестового середовища Vitest
// Додаткові DOM-матчери можна підключити за потреби.

// Глобальні мок-функції для fetch
beforeEach(() => {
  console.error = vi.fn()
  console.log = vi.fn()
  global.fetch = vi.fn()
})

afterEach(() => {
  vi.clearAllMocks()
})
