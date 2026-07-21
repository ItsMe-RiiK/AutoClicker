CXX := g++
CXXFLAGS := -Wall -O2 $(shell pkg-config --cflags gtk+-3.0)
LDFLAGS := $(shell pkg-config --libs gtk+-3.0)

RELEASE_DIR := release

SRC_DIR := src
BUILD_DIR := build

TARGET := $(RELEASE_DIR)/AutoClicker
SRC := $(SRC_DIR)/app.cpp
OBJ := $(BUILD_DIR)/app.o

all: prep $(TARGET)

prep:
	@mkdir -p $(BUILD_DIR) $(RELEASE_DIR)

$(TARGET): $(OBJ)
	$(CXX) -o $@ $^ $(LDFLAGS)
	@echo "Built AutoClicker at $(TARGET)"

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -rf $(BUILD_DIR) $(TARGET)

.PHONY: all prep clean
