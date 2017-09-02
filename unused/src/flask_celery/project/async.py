import json, falcon

from tasks import add
from celery.result import AsyncResult


class start_task(object):

    def on_get(self, req, resp, number):
        task = add.delay(int(number), int(number))

        resp.status = falcon.HTTP_200
        result = {'task_id': task.id}

        resp.body = json.dumps(result)


class status_task(object):

    def on_get(self, req, resp, pid):
        task_result = AsyncResult(pid)

        result = {'status': task_result.status, 'result': task_result.result}

        resp.status = falcon.HTTP_200
        resp.body = json.dumps(result)