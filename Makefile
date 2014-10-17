pep8:
	@flake8 * --ignore=F403,F401 --exclude=requirements.txt,*.pyc,*.md,Makefile,LICENSE,*.in

clean:
	@find . -name "*.pyc" -delete

deps:
	@pip install -r requirements.txt

test: deps clean pep8
	@python manage.py test

settings:
	cp {{ project_name }}/local_settings.py.example {{ project_name }}/local_settings.py

run:
	@python manage.py runserver 8000

help:
	grep '^[^#[:space:]].*:' Makefile | awk -F ":" '{print $$1}'

setup: settings deps clean
	@python manage.py syncdb
