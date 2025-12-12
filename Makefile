CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -pedantic

# Add debug flags for development
ifdef DEBUG
	CXXFLAGS += -g -O0
else
	CXXFLAGS += -O2
endif

SRC_DIR = src
BUILD_DIR = build
TARGET = $(BUILD_DIR)/projektpp

SOURCES = $(wildcard $(SRC_DIR)/*.cpp)
OBJECTS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SOURCES))

all: $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o $@

clean:
	rm -rf $(BUILD_DIR)

run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run
