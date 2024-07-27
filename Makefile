#!make
.PHONY: start

export PYTHONPATH := $(shell pwd):$(PYTHONPATH)

default: help

help: Makefile
	@echo " Choose a command run in "$(PROJECTNAME)":"
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'

## make start: команда для старта приложения
start:
	python main.py

## make check: проверка кода с линтером ruff (make check VALUE=--unsafe-fixes, make check VALUE=--fix)
check:
	ruff check . ${VALUE}

## make format: проверка кода с форматтером ruff
format:
	ruff format . ${VALUE}

## make pip: команда для установки всех зависимостей
pip:
	source ./venv/bin/activate && pip install --upgrade pip && pip install -r ./requirements.txt

## make venv: команда для создания виртуального окружения
venv:
	python3 -m venv venv && source ./venv/bin/activate
