#!/bin/bash

python ~/llama/gorilla/inference/gorilla_eval.py \
	--model-path ~/llama/gorilla/training/gorilla-model-torch-v0 \
	--question-file ~/llama/gorilla/eval/eval-data/questions/torchhub/questions_torchhub_0_shot.jsonl \
	--answer-file ~/llama/gorilla/eval/eval-data/responses-our/torchhub/responses_gorilla_0_shot.jsonl \

python ~/llama/gorilla/eval/eval-scripts/ast_eval_th.py \
	--api_dataset ~/llama/gorilla/data/api/torchhub_api.jsonl \
	--apibench ~/llama/gorilla/data/apibench/torchhub_eval.json \
	--llm_responses ~/llama/gorilla/eval/eval-data/responses-our/torchhub/responses_gorilla_0_shot1.jsonl \
