#!/bin/bash

python ~/llama/gorilla/inference/gorilla_eval.py \
	--model-path ~/llama/gorilla/training/models/gorilla-model-tensorflow-v0 \
	--question-file ~/llama/gorilla/eval/eval-data/questions/tensorflow/questions_tensorflow_0_shot.jsonl \
	--answer-file ~/llama/gorilla/eval/eval-data/responses-our/tensorflow/responses_gorilla_0_shot.jsonl \

python ~/llama/gorilla/eval/eval-scripts/ast_eval_tf.py \
	--api_dataset ~/llama/gorilla/data/api/tensorflow_api.jsonl \
	--apibench ~/llama/gorilla/data/apibench/tensorflow_eval.json \
	--llm_responses ~/llama/gorilla/eval/eval-data/responses-our/tensorflow/responses_gorilla_0_shot.jsonl \
