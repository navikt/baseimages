Oracle client + python 3.6
==========================

Docker image med:
* oracle klient
* python 3.6

Python ligger under `python3.6` og `python36`, mens pip ligger under `pip3` og `pip3.6`.


## Bygging av image:

Laste ned:
* oracle-instantclient18.3-basic-18.3.0.0.0-1.x86_64.rpm
* oracle-instantclient18.3-sqlplus-18.3.0.0.0-1.x86_64.rpm
* oracle-instantclient18.3-devel-18.3.0.0.0-1.x86_64.rpm

fra https://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html (krever oracle konto) og legge de i samme katalog som Dockerfilen.
