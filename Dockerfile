FROM python:3.10.17-bullseye

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

WORKDIR /app

RUN pip install --upgrade pip
RUN pip install torch==2.6.0 torchvision==0.21.0 torchaudio==2.6.0 --index-url https://download.pytorch.org/whl/cu124

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "demo_gradio.py"]
EXPOSE 7860