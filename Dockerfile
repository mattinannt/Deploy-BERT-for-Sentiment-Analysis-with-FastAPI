FROM python:3.9-bullseye

WORKDIR /app

COPY . .

ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1

RUN apt-get update
RUN apt-get install -y build-essential libssl-dev libffi-dev cargo pkg-config

RUN pip install --upgrade pip
RUN pip install fastapi uvicorn pydantic torch transformers==2.8.0 gdown

# Create the environment:
# RUN git clone https://github.com/curiousily/Deploy-BERT-for-Sentiment-Analysis-with-FastAPI.git .

RUN chmod +x bin/download_model
RUN bin/download_model

EXPOSE 8000

ENTRYPOINT ["bin/start_server"]