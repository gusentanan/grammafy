# Patrol Integration Testing Setup

## Overview

This document explains how to run Patrol integration tests in the Grammafy app. Patrol provides advanced UI testing capabilities with native automation features.

## Prerequisites

### 1. Install Patrol CLI
```bash
dart pub global activate patrol_cli
```

### 2. Set up Android Emulator or Device
- **Option A**: Android Studio Emulator
  - Open Android Studio
  - Start an Android emulator (API 28+ recommended)
  
- **Option B**: Physical Device  
  - Connect Android device via USB
  - Enable Developer Options and USB Debugging
  - Run `flutter devices` to verify connection

### 3. Verify Setup
```bash
# Check if patrol is available
patrol --version

# Check if device/emulator is detected
flutter devices
```

## Running Integration Tests

### Method 1: Using Patrol CLI (Recommended)
```bash
# Run all integration tests with live app interaction
patrol test

# Run specific test file
patrol test integration_test/grammar_correction_flow_test.dart

# Run with development mode (hot restart support)
patrol develop
```

### Method 2: Using Flutter Integration Test
```bash
# Standard Flutter integration test (no native automation)
flutter test integration_test/

# Specific test file
flutter test integration_test/grammar_correction_flow_test.dart
```

### Method 3: Using Test Runner Script
```bash
# Run complete test suite (includes integration tests)
./test_runner.sh
```

## What Happens During Integration Tests

### 1. **App Launch**
- The integration test launches the actual Grammafy app
- You'll see the app running on your emulator/device
- Tests interact with the real UI elements

### 2. **Automated Interactions**
- Tap tone selection chips (Formal, Neutral, Friendly)
- Enter text in the grammar input field
- Tap send/paste buttons  
- Verify UI state changes

### 3. **Test Scenarios**
- **Grammar Correction Workflow**: Complete user journey
- **Error Handling**: Edge cases and error states
- **Conversation History**: Multiple message handling  
- **Performance Testing**: Rapid interactions
- **Native Automation**: System-level interactions (when available)

### 4. **Expected Behavior**
```
🚀 Integration Test Execution:
├── App launches automatically
├── Tests execute UI interactions
├── Real user workflows are validated
├── Performance and stability verified  
└── Results reported in terminal
```

## Test Files Structure

```
integration_test/
└── grammar_correction_flow_test.dart  # Main integration tests
    ├── Grammar correction complete workflow
    ├── Error handling workflow  
    ├── Conversation history workflow
    ├── App bar interactions
    ├── Rapid user interactions stress test
    ├── Native automation features
    └── UI responsiveness and performance
```

## Troubleshooting

### Common Issues

#### 1. "No devices found"
```bash
# Check connected devices
flutter devices

# For emulator issues  
flutter emulators --launch <emulator_name>
```

#### 2. "patrol command not found"
```bash
# Reinstall Patrol CLI
dart pub global deactivate patrol_cli
dart pub global activate patrol_cli

# Verify PATH includes pub global packages
echo $PATH
```

#### 3. "Build failed" or "App crashes"
```bash
# Clean build cache
flutter clean
flutter pub get

# Rebuild and test
flutter build apk --debug
```

#### 4. "Tests timeout or hang"
```bash
# Check if emulator is responsive
adb devices

# Restart ADB if needed
adb kill-server
adb start-server
```

### Debug Mode

For debugging integration tests:
```bash
# Run with verbose output
patrol test --verbose

# Run in development mode with hot restart
patrol develop

# Run specific test with Flutter debug
flutter test integration_test/grammar_correction_flow_test.dart --verbose
```

## Advanced Features

### Native Automation (Examples)

The integration tests include examples of Patrol's native automation:

```dart
// Network conditions
await $.native.enableCellular();
await $.native.disableWifi();

// System interactions
await $.native.enableDarkMode();
await $.native.pressHome();

// Permissions
await $.native.grantPermissionWhenInUse();

// Notifications  
await $.native.openNotifications();
await $.native.tapOnNotificationByIndex(0);
```

### Performance Testing

Tests include performance validation:
- Rapid UI interactions
- Memory usage monitoring
- Response time verification
- Stability under load

## Integration with CI/CD

For automated testing in CI/CD pipelines:

```yaml
# GitHub Actions example
- name: Run Patrol Integration Tests
  run: |
    patrol test --no-device-finder
  env:
    FLUTTER_TEST_ENVIRONMENT: ci
```

## Best Practices

1. **Keep tests independent** - Each test should set up its own state
2. **Use realistic data** - Test with real-world scenarios
3. **Handle timing** - Use `await $.pumpAndSettle()` appropriately  
4. **Test error cases** - Include negative test scenarios
5. **Verify end states** - Always check final UI state

## Performance Expectations

- **Test execution time**: 30-60 seconds per test scenario
- **App startup**: 3-5 seconds on emulator
- **UI interactions**: Near real-time response
- **Memory usage**: Monitored and validated

This setup ensures comprehensive end-to-end testing of the Grammafy app's core functionality with real device interactions.