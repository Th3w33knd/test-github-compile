NVCC = nvcc
# Targeting Turing, Ampere, Ada Lovelace, and Blackwell
NVCCFLAGS = -gencode arch=compute_75,code=sm_75 \
            -gencode arch=compute_86,code=sm_86 \
            -gencode arch=compute_89,code=sm_89 \
            -gencode arch=compute_90,code=sm_90
            
LIBS = -lcublas

TARGET = build/hello_cuda
SRC = hello.cu

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SRC)
	@mkdir -p build
	$(NVCC) $(NVCCFLAGS) $(SRC) -o $(TARGET) $(LIBS)

clean:
	rm -rf build/
