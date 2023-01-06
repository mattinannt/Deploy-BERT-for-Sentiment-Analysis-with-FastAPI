FROM python:3.9-bullseye

WORKDIR /app

COPY . .

RUN pip install fastapi uvicorn pydantic torch transformers==2.8.0 gdown

# Create the environment:
# RUN git clone https://github.com/curiousily/Deploy-BERT-for-Sentiment-Analysis-with-FastAPI.git .

RUN chmod +x bin/download_model
RUN bin/download_model

EXPOSE 8000

ENTRYPOINT ["bin/start_server"]