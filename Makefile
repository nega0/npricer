all:
	@true

.PHONY: clean test

test1:
	@echo Running pricer with a target size of 1...
	@cat pricer.in | ./pricer -t 1 > nega1.out
	@echo Comparing to known good test output...
	@diff -u test/pricer.out.1 nega1.out > /dev/null
	@echo

test200:
	@echo Running pricer with a target size of 200...
	@cat pricer.in | ./pricer -t 200 > nega200.out
	@echo Comparing to known good test output...
	@diff -u test/pricer.out.200 nega200.out > /dev/null

test10000:
	@echo Running pricer with a target size of 10000...
	@cat pricer.in | ./pricer -t 10000 > nega10000.out
	@echo Comparing to known good test output...
	@diff -u test/pricer.out.10000 nega10000.out > /dev/null

test: test1 test200 test10000

clean:
	-rm -rf *.out

