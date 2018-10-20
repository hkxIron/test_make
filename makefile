SRCS=$(wildcard *.cc)# 将所有的.cc文件打印出来
objects := $(patsubst %.cc,%.o,$(wildcard *.cc))
SUBDIR=$(shell ls -d */) # 当前目录的子目录
SUBOBJ=$(SRCS:%.cc=%.o)  # 生成.cc对应的.o文件
.PHONY:d1
d1:
	@echo "所有的.cc文件:$(SRCS)" # 将所有的.cc文件打印出来, test_vec.cc test.cc
	@echo "所有object文件:$(objects)" #test_vec.o test.o
	@echo "当前目录子目录:$(SUBDIR)" # src/
	@echo "生成.cc对应的.o文件:$(SUBOBJ)" # #test_vec.o test.o

# 另一种方式,使用find
CXX = g++ -std=c++11
CXXFLAGS = -g -Wall -O3
SRCS2 = ${shell find . -type f  | grep \.cc | grep -v "_vec" }
OBJS2 = $(addprefix build/, $(SRCS2:.cc=.o))
MAIN_PROG = ${shell find . -type f  | grep "_main.cc" | sed s/\.cc//g } 
SRCS3 = ${shell find . -type f  | grep \.cc | grep -v "_main" }
OBJS3 = $(addprefix build/, $(SRCS3:.cc=.o))

.PHONY:d2
d2:
	mkdir -p build
	@echo "生成.cc对应的.o文件:$(SRCS2)" # test_vec.o,圆括号与花括号均可
	@echo "生成.cc对应的.o文件:${SRCS2}" # test_vec.o
	@echo "加上前缀:${OBJS2}"
	@echo "主程序的bin:${MAIN_PROG}"


all: ${MAIN_PROG}
	@echo "注意,如果目标已经存在,则不会重新链接"

#%_main: build/%.o  #%代表通配符的意思
#%_main: $(OBJS3)  #%代表通配符的意思
%_main:   #%代表通配符的意思
	${CXX} ${CXXFLAGS} -o $@ $@.cc $^ #$@目标文件的完整名称, $^ 所有不重复的目标依赖文件，以空格分开

build/%.o : %.cc
	@echo "文件夹:$(@D)"
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -c $^ -o $@

.PHONY:clean
clean:
	rm -rf build ${MAIN_PROG}

.SECONDARY: $(OBJS3)
