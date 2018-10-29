install:
	virtualenv testing
	. testing/bin/activate
	pip install --user -r requirements.txt
	cd testing/bin
	ls
jenkins_test:
	testing/bin/nosetests app/ -v
