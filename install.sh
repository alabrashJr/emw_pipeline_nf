#Nextflow installation
export NXF_VER=19.04.1
wget -qO- https://get.nextflow.io | bash
mv nextflow ./bin
nextflow

#python requirements
pip2 install -r requirements2.txt && pip3 install -r requirements.txt

#Extract & Doc Preprocess Dependencies
git clone https://github.com/OsmanMutlu/python-boilerpipe.git && cd python-boilerpipe && python2 setup.py install && cd .. && rm -rf python-boilerpipe

#BERT
cd .. && git clone https://github.com/OsmanMutlu/pytorch-pretrained-BERT.git && cd pytorch-pretrained-BERT && python3 setup.py install && cd ..
mkdir .pytorch_pretrained_bert && cd .pytorch_pretrained_bert && wget https://s3.amazonaws.com/models.huggingface.co/bert/bert-base-uncased.tar.gz && wget https://s3.amazonaws.com/models.huggingface.co/bert/bert-base-uncased-vocab.txt && wget "https://www.dropbox.com/s/4eu8ib47vusqupk/doc_model.pt?dl=1" && mv doc_model.pt\?dl=1 doc_model.pt && wget "https://www.dropbox.com/s/a0ut89hnzehekpl/sent_model.pt?dl=1" && mv sent_model.pt\?dl=1 sent_model.pt && wget "https://www.dropbox.com/s/s23zklmhvwjsy8f/svm_model.pkl?dl=1" && mv svm_model.pkl\?dl=1 svm_model.pkl && wget "https://www.dropbox.com/s/q8jmj10ozrnhct4/token_model.pt?dl=1" && mv token_model.pt\?dl=1 token_model.pt

# Tokenizer
python3 -c "import nltk;nltk.download('popular', halt_on_error=False)"

# Create default output folder
mkdir emw_pipeline_nf/jsons