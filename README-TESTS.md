# EasyVocab - Automated Tests

## Overview

This project includes automated tests for critical features:
- ✅ **Word Translation** (MyMemory API)
- ✅ **Text Generation** (OpenAI & Gemini APIs)

## Running Tests

### Browser-Based Tests (Recommended)

1. Open `tests.html` in your browser
2. Click "Run All Tests"
3. View results in real-time

```bash
# Open in default browser (Windows)
start tests.html

# Or manually open the file in your browser
```

### Test Coverage

#### Translation Tests (MyMemory API)
- ✅ Single word translation (hello → bonjour)
- ✅ Common vocabulary (coffee → café)
- ✅ Phrase translation (good morning → bonjour)
- ✅ Error handling (empty queries)

#### Text Generation Tests
- ✅ API key validation (OpenAI, Gemini)
- ✅ Prompt building for different CEFR levels (A1-C2)
- ✅ Empty word list handling
- ✅ Phrase vs single word detection
- ✅ Story validation (all words included)
- ✅ Temperature and token limits

## Test Results

Tests are color-coded:
- 🟢 **Green** - Passed
- 🔴 **Red** - Failed  
- 🟡 **Yellow** - Running

## Adding New Tests

```javascript
runner.test('Test name', async () => {
  // Your test code here
  assert(condition, 'Error message');
  assertEquals(actual, expected, 'Error message');
  assertContains(text, substring, 'Error message');
});
```

## CI/CD Integration

### GitHub Actions (Future)

Create `.github/workflows/test.yml`:

```yaml
name: Run Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run browser tests
        run: npx playwright test tests.html
```

## Manual Testing Checklist

Before each release, manually test:

### Translation Feature
- [ ] Click "Verify Translations" with empty English field
- [ ] Verify single word translation works
- [ ] Verify phrase translation works
- [ ] Check French field is populated correctly
- [ ] Test with multiple words at once

### Text Generation Feature
- [ ] Click "Generate Text" without API key (should use templates)
- [ ] Add OpenAI API key and test generation
- [ ] Add Gemini API key and test generation
- [ ] Test different CEFR levels (A1, A2, B1, B2, C1, C2)
- [ ] Verify all vocabulary words appear in generated text
- [ ] Check story is coherent and grammatically correct
- [ ] Test with phrases and single words mixed

### Listening Practice
- [ ] Select multiple word lists
- [ ] Generate text from multiple lists
- [ ] Verify word count is correct
- [ ] Play audio and check it works
- [ ] Test sentence-by-sentence recording
- [ ] Verify pronunciation scoring

## Known Issues

- Translation API may rate-limit after many requests (100/day free tier)
- AI text generation requires valid API keys
- Browser security may block some API calls (CORS)

## Troubleshooting

**Tests fail with CORS errors:**
- Open tests.html from a local server, not file://
- Use: `python -m http.server 8080`
- Then open: `http://localhost:8080/tests.html`

**Translation tests fail:**
- Check internet connection
- MyMemory API may be temporarily down
- Rate limit may be reached (wait 24h)

**Text generation tests fail:**
- These test prompt building, not actual API calls
- Real API tests require valid keys (tested manually)

## Future Improvements

- [ ] Add E2E tests with Playwright/Puppeteer
- [ ] Mock API responses for offline testing
- [ ] Add performance benchmarks
- [ ] Test mobile responsiveness automatically
- [ ] Add visual regression testing
- [ ] Integrate with CI/CD pipeline

## License

MIT License - See main README.md
