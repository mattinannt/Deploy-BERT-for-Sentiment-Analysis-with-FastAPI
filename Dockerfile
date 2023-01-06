FROM rust:slim-bullseye

WORKDIR /app

COPY . .

RUN apt-get update
RUN apt-get install -y build-essential libssl-dev libffi-dev python3-dev python3-pip cargo pkg-config

RUN pip3 install --upgrade pip
RUN pip3 install fastapi uvicorn pydantic torch transformers==2.8.0 gdown

# Create the environment:
# RUN git clone https://github.com/curiousily/Deploy-BERT-for-Sentiment-Analysis-with-FastAPI.git .

RUN chmod +x bin/download_model
RUN bin/download_model

EXPOSE 8000

ENTRYPOINT ["bin/start_server"]