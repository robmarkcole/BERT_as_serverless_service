![baas](img/baas.png)

<h3 style="text-align:center; font-weight: bold">
 Serve PyTorch model as an API using AWS + serverless framework. Requires `pytorch_model.bin` which must be created by training and downloaded here (438 MB file)
</h3>

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)


**BAAS** - BERT As A Service, here we will be deploying a trained BERT model using serverless infrastructure.
The above BERT model is used to classify user daily transaction logs to the following classes.
> Food, Transport, Bills, Shopping. Credit


## Model building

To train the BERT model [![Open In Collab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1IAJrx15szXsGDjKx1qihrvzAWqp2exz5?usp=sharing)

Note: upload the processed.csv file, which the training data


## Serving Model using Lambda + serverless framework

### Architecture
![api](img/new_API.png)

## Build and test locally
```
docker build -t logbert-lambda .
docker run -p 8080:8080 logbert-lambda
```


## API results
Test in postman:
- POST to `http://localhost:8080/2015-03-31/functions/function/invocations` with body: 

```
{
    "log": "I brought bread and eggs today"
}
```

![response](img/resp.png)

## Tutorial

For complete tutorial please read [deploying-pytorch-model-as-a-serverless-servic](https://medium.com/geekculture/deploying-pytorch-model-as-a-serverless-service-339b4b93e517)

## Issues
* Had to unpin dependencies due to conflicts
* Cannot list external agents error=open /opt/extensions: no such file or directory -> add the .bin file
* "errorMessage": "Can't load tokenizer for './input/bert-base-uncased/' -> need to clone the model in `input` dir, consists of some json files. Also see https://github.com/huggingface/transformers/issues/353


## Troubleshooting
Use `docker ps` to get the name of the existing container.
Use the command `docker exec -it <container name> /bin/bash`

## Local dev - no docker
## Usage
* `python3 -m venv venv`
* `source venv/bin/activate`
* `pip install -r requirements.txt`
* `python3 inference.py`