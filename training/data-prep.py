import argparse
import json


def generate_data(filename, write):
    """
    Processes the ApiBench data and return formatted data for the training using FastChat. If the sample is malformed,
    it is ignored.
    Note: this is not an original pre-processing for the Gorilla.
    """

    print("Parsing " + filename)
    with open(write, "w") as w:
        with open(filename) as f:
            id = 0  # todo change identity
            mal_num = 0
            data = []
            sep = "Output"
            for line in f:
                entry = {"id": "identity_{}".format(id)}
                id += 1
                line = json.loads(line)
                line = line["code"].split(sep)
                # instruction = line[0].split("Instruction': ")[1] # extract the instruction
                instruction = line[0]
                # after splitting, try to extract the output, if the string is malformed, ignore it
                try:
                    output = line[1]

                    entry["conversations"] = [{"from": "human", "value": instruction}, {"from": "gpt", "value": output.lstrip()}] # remove the white space in front
                    data.append(entry) # represent as an array with single element
                except IndexError:
                    mal_num += 1
            total_data = len(data)
        data = json.dumps(data)
        w.write(data)
        print("Total samples parsed: {}. Total samples discarded: {}. \n".format(total_data, mal_num))


def data_preprocess_hug(filename, write):
    with open(write, "w") as w:
        with open(filename) as f:
            ll = {}
            mal_num = 0
            for line in f:
                line = json.loads(line)
                line = line["code"].split("Output")
                print(line)
                # line[0] = line[0].replace("###", "")
                # line[0] = line[0].replace("Instruction", "")
                # line[0] = line[0].strip()
                if len(line) != 2:
                    mal_num += 1
                    continue

                instruction = line[0].split(":")
                instruction = instruction[1]
                instruction = instruction.replace("###", "")
                instruction = instruction.strip()

                output = line[1][2:]
                # print(instruction, output)

        print(mal_num)


def generate_data_mosaic(filename, write):
    print("Parsing " + filename)
    with open(write, "w") as w:
        with open(filename) as f:
            mal_num = 0
            data = []
            sep = "Output"
            for line in f:
                line = json.loads(line)
                line = line["code"].split(sep)
                # instruction = line[0].split("Instruction': ")[1] # extract the instruction
                instruction = line[0]
                # after splitting, try to extract the output, if the string is malformed, ignore it
                try:
                    output = line[1]

                    entry = json.dumps({'prompt': instruction, 'response': "###Output" + output.lstrip()})  # remove the white space in front
                    w.write(str(entry)+"\n")
                except IndexError:
                    mal_num += 1
            total_data = len(data)
        print("Total samples parsed: {}. Total samples discarded: {}. \n".format(total_data, mal_num))


if __name__ == '__main__':
    # parser = argparse.ArgumentParser()
    # parser.add_argument("--apibench_file", type=str, default=None, help="the ApiBench file with the data")
    # parser.add_argument("--output_file", type=str, default=None, help="the output file this script writes to")
    # args = parser.parse_args()

    # data_preprocess_hug("../data/apibench/huggingface_train.json", "../data/finetune/huggingface_train.json")
    # generate_data(args.apibench_file, args.output_file)
    generate_data_mosaic("../data/apibench/huggingface_train.json", "../data/finetune/huggingface_train.jsonl")
    generate_data_mosaic("../data/apibench/huggingface_eval.json", "../data/finetune/huggingface_eval.jsonl")
    # todo uncomment above and delete below
    # generate_data("../data/apibench/huggingface_eval.json", "../data/training/huggingface_eval.json")
    # generate_data("../data/apibench/huggingface_train.json", "../data/training/huggingface_train.json")
    # generate_data("../data/apibench/torchhub_train.json", "../data/training/torchhub_train.json")
    # generate_data("../data/apibench/torchhub_eval.json", "../data/training/torchhub_eval.json")
    # generate_data("../data/apibench/tensorflow_eval.json", "../data/training/tensorflow_eval.json")
    # generate_data("../data/apibench/tensorflow_train.json", "../data/training/tensorflow_train.json")
