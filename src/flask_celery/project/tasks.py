from time import sleep

import celery
import utils

app = celery.Celery('tasks', broker='amqp://guest:guest@localhost:5672//', backend='amqp://guest:guest@localhost:5672//')


@app.task
def add(x, y):
    """
    :param int x:
    :param int y:
    :return: int
    """
    # sleep just for demonstration
    sleep(5)

    return x + y



