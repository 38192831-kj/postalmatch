from flask import Flask

from api import main
from configuration import Configuration


app = Flask(__name__)
app.add_url_rule("/", view_func=main, methods=['POST'])


if __name__ == '__main__':
    server_config = Configuration.get_config('server.json')
    app.run(
        debug=True,
        host=server_config['host'],
        port=server_config['port']
    )
