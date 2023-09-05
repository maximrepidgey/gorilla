import json
import ast


def generate_training_data(filename, write):
    if "train" in filename:
        sep = ", 'Output': "
    else:
        sep = "\n###Output: "
    with open(write, "w") as w:
        with open(filename) as f:
            id = 1000
            data = []
            for line in f:
                entry = {"id": "identity_{}".format(id)}
                id += 1
                line = json.loads(line)
                # print(line)
                line = line["code"].split(sep)
                # instruction = line[0].split("Instruction': ")[1] # extract the instruction
                instruction = line[0][1:] # extract the instruction and take away unwanted char
                # print(instruction)
                output = line[1]
                entry["conversations"] = [{"from": "human", "value": instruction}, {"from": "gpt", "value": output}]
                data.append(entry) # represent as an array with single element
                #jsonString = json.dumps(entry)
                #w.write(jsonString)
                #w.write("\n")
                # if id == 2:
                #     break
        data = json.dumps(data)
        w.write(data)




if __name__ == '__main__':
    generate_training_data("../data/apibench/torchhub_eval.json", "../data/training/torchhub_eval.json")
