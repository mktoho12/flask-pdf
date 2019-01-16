from flask import Flask                           
from flask import make_response
from pdf import mkpdf

app = Flask(__name__)

@app.route('/')
def hello_world():
    return "Hello World!"

@app.route('/pdf')
def pdf():
    mkpdf()
    response = make_response()
    response.data = open("/tmp/unicode.pdf", "rb").read()
    response.headers['Content-Disposition'] = 'attachment; filename=unicode.pdf'
    response.mimetype = 'application/pdf'
    return response
