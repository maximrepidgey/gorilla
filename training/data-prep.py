import json
import ast


def generate_training_data(filename, write):
    with open(write, "w") as w:
        with open(filename) as f:
            id = 0
            data = []
            for line in f:
                entry = {"id": "identity_{}".format(id)}
                id += 1
                line = json.loads(line)
                print(line)
                line = line["code"].split(", 'Output': ")
                # instruction = line[0].split("Instruction': ")[1] # extract the instruction
                instruction = line[0][1:] # extract the instruction and take away unwanted char
                # print(instruction)
                output = line[1]
                entry["conversations"] = [{"from": "human", "value": instruction}, {"from": "gpt", "value": output}]
                # data.append() # represent as an array with single element
                jsonString = json.dumps([entry])
                w.write(jsonString)
                w.write("\n")
                # if id == 2:
                #     break





if __name__ == '__main__':
    generate_training_data("../data/apibench/torchhub_train.json", "../data/training/torchhub_train.json")
