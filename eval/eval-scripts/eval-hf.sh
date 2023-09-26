#!/bin/bash

python ~/llama/gorilla/inference/gorilla_eval.py \
	--model-path ~/llama/gorilla/training/models/gorilla-model-huggingface-v0 \
	--question-file ~/llama/gorilla/eval/eval-data/questions/huggingface/questions_huggingface_0_shot.jsonl \
	--answer-file ~/llama/gorilla/eval/eval-data/responses-our/huggingface/responses_huggingface_0_shot.jsonl \

python ~/llama/gorilla/eval/eval-scripts/ast_eval_hf.py \
	--api_dataset ~/llama/gorilla/data/api/huggingface_api.jsonl \
	--apibench ~/llama/gorilla/data/apibench/huggingface_eval.json \
	--llm_responses ~/llama/gorilla/eval/eval-data/responses-our/huggingface/responses_gorilla_0_shot.jsonl \
