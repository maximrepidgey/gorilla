from transformers import AutoTokenizer, AutoModelForCausalLM, LlamaTokenizer

# this scripted was used to get LLaMA weights and tokenizer
if __name__ == "__main__":

    # model = AutoModelForCausalLM.from_pretrained("huggyllama/llama-7b")
    # model.save_pretrained("./llama")
    tokenizer = LlamaTokenizer.from_pretrained("huggyllama/llama-7b", legacy=False)
    tokenizer.save_pretrained("./llama")
    # print(tokenizer.decode([424, 423]))g
