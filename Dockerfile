FROM python:3.9-slim
WORKDIR /usr/src/app
COPY . .
RUN pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt
EXPOSE 8501 8000
ENV MODEL_PATH="./chatglm3-6b"
CMD ["streamlit", "run", "./web+api/run.py"]
HEALTHCHECK \
  CMD curl -f http://localhost:8000/ && curl -f http://localhost:8501/ || exit 1
