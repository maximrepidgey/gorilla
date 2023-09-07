from transformers import AutoTokenizer, AutoModelForCausalLM

# this scripted was used to get LLaMA weights and tokenizer
if __name__ == "__main__":
    model = AutoModelForCausalLM.from_pretrained("yahma/llama-7b-hf")
    model.save_pretrained("./llama")
    tokenizer = AutoTokenizer.from_pretrained("yahma/llama-7b-hf", legacy=True)
    tokenizer.save_pretrained("./llama")
