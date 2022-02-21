FROM public.ecr.aws/lambda/python:3.8

# copy function cpde and models into /var/task
COPY ./ ./

# install our dependencies
RUN python3 -m pip install -r requirements.txt
RUN python3 ./model/download_tokenizers.py

# Set the CMD to your handler 
CMD [ "handler.predict"]