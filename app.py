from flask import Flask, request, jsonify, render_template
from flask_sqlalchemy import SQLAlchemy
import time

backend_service = Flask(__name__)
backend_service.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://yeldos:qwerty1234@meloman_db/meloman_db'
backend_service.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

mysql_server_admin = SQLAlchemy(backend_service)


class Kitap(mysql_server_admin.Model):
    id = mysql_server_admin.Column(mysql_server_admin.Integer, primary_key=True)
    kitap_name = mysql_server_admin.Column(mysql_server_admin.String(80), nullable=False)
    writer = mysql_server_admin.Column(mysql_server_admin.String(80), nullable=False)
    release_date = mysql_server_admin.Column(mysql_server_admin.Integer, nullable=False)
    issuer = mysql_server_admin.Column(mysql_server_admin.String(80), nullable=False)
    pages = mysql_server_admin.Column(mysql_server_admin.Integer, nullable=False)


@backend_service.route('/')
def management_page():
    return render_template('index.html')


@backend_service.route('/kitaps', methods=['GET'])
def all_kitaps():
    kitaps = Kitap.query.all()
    return jsonify([{'id': kitap.id, 'kitap_name': kitap.kitap_name, 'writer': kitap.writer,
                     'release_date': kitap.release_date, 'issuer': kitap.issuer, 'pages': kitap.pages}
                    for kitap in kitaps])


@backend_service.route('/kitaps', methods=['POST'])
def insert_kitap():
    new_values = request.get_json()
    zhana_kitap = Kitap(**new_values)
    mysql_server_admin.session.add(zhana_kitap)
    mysql_server_admin.session.commit()
    return jsonify({'id': zhana_kitap.id}), 201


def database_waiting():
    with backend_service.app_context():
        while True:
            try:
                mysql_server_admin.create_all()
                print("Ура! База данных подключена и таблицы созданы.")
                break
            except Exception as e:
                print("Не получилось подключится(", str(e))
                time.sleep(2)


if __name__ == '__main__':
    database_waiting()
    backend_service.run(host='0.0.0.0', debug=True)
