# Домашнее задание к занятию 5. «Оркестрация кластером Docker контейнеров на примере Docker Swarm» - Паромов Роман.

## Задача 1

### Дайте письменые ответы на вопросы:

В чём отличие режимов работы сервисов в Docker Swarm-кластере: replication и global?

* В режиме replication количество рекплик не зависит от количества нод, и может быть развернуто в любом количестве и не привязано к количетву нод, то есть может быть несколько реплик на одной ноде и ни одной реплики на другой. В режиме global создается по сервису на ноду.

Какой алгоритм выбора лидера используется в Docker Swarm-кластере?

* Для управления глобальным состоянием кластера используется алгоритм Raft, который выбирает лидера из нод.

Что такое Overlay Network?

* Это сеть построеная поверх другой сети, самый простой пример это VPN. В Docker Swarm используется для связи контейнеров в разных хостах.

## Задача 2

### Создайте ваш первый Docker Swarm-кластер в Яндекс Облаке.

Чтобы получить зачёт, предоставьте скриншот из терминала (консоли) с выводом команды:
```
docker node ls
```
![](https://github.com/Romera14/05-virt-05-docker-swarm/blob/main/node%20ls.png)

## Задача 3

Создайте ваш первый, готовый к боевой эксплуатации кластер мониторинга, состоящий из стека микросервисов.

Чтобы получить зачёт, предоставьте скриншот из терминала (консоли), с выводом команды:
```
docker service ls
```
![](https://github.com/Romera14/05-virt-05-docker-swarm/blob/main/service%20ls.png)

## Задача 4 (*)

Выполните на лидере Docker Swarm-кластера команду, указанную ниже, и дайте письменное описание её функционала — что она делает и зачем нужна:
```
# см.документацию: https://docs.docker.com/engine/swarm/swarm_manager_locking/
docker swarm update --autolock=true
```
