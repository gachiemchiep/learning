import falcon
import async, sync

app = falcon.API()

# registration of routes

# sync task
# app.add_route('/sync/{number}', sync.start_task())

# async task
app.add_route('/async/{number}', async.start_task())
app.add_route('/async/status/{pid}', async.status_task())
