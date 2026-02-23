NVCC = nvcc
NVCCFLAGS = -arch=sm_80
TARGET = build/hello_cuda
SRC = hello.cu

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SRC)
	@mkdir -p build
	$(NVCC) $(NVCCFLAGS) $(SRC) -o $(TARGET)

clean:
	rm -rf build/
