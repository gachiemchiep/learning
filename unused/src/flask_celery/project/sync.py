import json, falcon
from utils import fib

class start_task(object):

    def on_get(self, req, resp, number):
        result = {'number': number, 'Fibonacy': fib(int(number))}
        resp.body = json.dumps(result)