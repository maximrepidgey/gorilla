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
                instruction = line[0][1:] # extract the instruction and take away unwanted char

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




if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--apibench_file", type=str, default=None, help="the ApiBench file with the data")
    parser.add_argument("--output_file", type=str, default=None, help="the output file this script writes to")
    args = parser.parse_args()

    # generate_data(args.apibench_file, args.output_file)
    # todo uncomment above and delete below
    # generate_data("../data/apibench/huggingface_eval.json", "../data/training/huggingface_eval.json")
    # generate_data("../data/apibench/huggingface_train.json", "../data/training/huggingface_train.json")
    # generate_data("../data/apibench/torchhub_train.json", "../data/training/torchhub_train.json")
    # generate_data("../data/apibench/torchhub_eval.json", "../data/training/torchhub_eval.json")
    # generate_data("../data/apibench/tensorflow_eval.json", "../data/training/tensorflow_eval.json")
    # generate_data("../data/apibench/tensorflow_train.json", "../data/training/tensorflow_train.json")
