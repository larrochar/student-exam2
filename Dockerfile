FROM centos:latest

ENV FLASK_APP js_example

ADD . .

RUN yum install -y python3

RUN pip3 install -e .

RUN pip3 install -e '.[test]'

EXPOSE 5000

CMD ["flask", "run", "--host", "0.0.0.0"]
