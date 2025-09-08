#!/bin/bash

# Grammafy Test Runner Script

echo "🧪 Running Grammafy Unit Tests..."
echo "=================================="

# Run all unit tests
flutter test test/unit/ --reporter=expanded

# Check if tests passed
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ All tests passed!"
    echo ""
    echo "📊 Generating coverage report..."
    flutter test --coverage test/unit/
    echo ""
    echo "📈 Coverage report generated in coverage/lcov.info"
else
    echo ""
    echo "❌ Some tests failed!"
    exit 1
fi