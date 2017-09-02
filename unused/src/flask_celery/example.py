from time import sleep

import requests
# start new task
task_info = requests.get('http://127.0.0.1:8000/async/10')
print task_info
task_info = task_info.json()
print task_info

while True:
    # check status of task by task_id while task is working
    result = requests.get('http://127.0.0.1:8000/async/status/' + task_info['task_id'])
    task_status = result.json()

    print task_status

    if task_status['status'] == 'SUCCESS' and task_status['result']:
        print 'Task with id = %s is finished' % task_info['task_id']
        print 'Result: %s' % task_status['result']
        break
    # sleep and check status one more time
    sleep(1)
