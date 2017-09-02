from time import sleep

def fib(number):
    if number == 1:
        return 1
    elif number == 0:
        return 0
    else:
        return fib(number - 1) + fib(number - 2)


def fib_async(number):
    if number == 1:
        return 1
    elif number == 0:
        return 0
    else:
        return fib(number - 1) + fib(number - 2)
