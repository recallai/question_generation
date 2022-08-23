FROM huggingface/transformers-cpu:3.0.0

COPY . app/

RUN pip install --no-cache-dir --upgrade -r app/requirements.txt

ENV LC_ALL=C.UTF-8 
ENV LANG=C.UTF-8

RUN python3 -m nltk.downloader punkt

# to avoid following warning: https://github.com/huggingface/transformers/issues/5486
ENV TOKENIZERS_PARALLELISM=false

#startup jupyter by default on port 8888
CMD ["jupyter", "notebook","--ip", "0.0.0.0", "--no-browser",  "--port=8888", "--allow-root"]