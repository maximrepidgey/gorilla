from transformers import AutoTokenizer, AutoModelForCausalLM, AutoModelForSequenceClassification

if __name__ == "__main__":
    # model = AutoModelForSequenceClassification.from_pretrained("mrm8488/bert-tiny-finetuned-enron-spam-detection")
    # model = AutoModelForCausalLM.from_pretrained("yahma/llama-7b-hf")
    tokenizer = AutoTokenizer.from_pretrained("yahma/llama-7b-hf", legacy=True)
    tokenizer.save_pretrained("./llama")
