deepspeed \
	--master_port=20001 \
	~/llama/gorilla/FastChat/fastchat/train/train.py \
	--save_total_limit 2 \
	--model_name_or_path /opt/models/llama \
	--data_path ~/llama/gorilla/data/training/torchhub_train.json \
	--fp16 True \
	--eval_data_path ~/llama/gorilla/data/training/torchhub_eval.json \
	--output_dir ~/llama/gorilla/training/models/gorilla-model-torchhub-v2/ \
	--num_train_epochs 5 \
	--per_device_train_batch_size 20 \
	--per_device_eval_batch_size 20 \
	--gradient_accumulation_steps 1 \
	--evaluation_strategy "steps" \
	--eval_steps 48 \
	--save_strategy "steps" \
	--save_steps 48 \
	--logging_steps 24 \
	--learning_rate 2e-5 \
	--weight_decay 0. \
	--warmup_ratio 0.03 \
	--lr_scheduler_type "cosine" \
	--tf32 False \
	--model_max_length 2048 \
	--gradient_checkpointing True \
	--lazy_preprocess True \
	--report_to "none" \
	--deepspeed ~/llama/gorilla/training/ds_config.json \

# output of data for trainer in FastCat


#TrainingArguments(                                                                                                          │pip                       23.2.1             pyhd8ed1ab_0    conda-forge
#_n_gpu=1,                                                                                                                   │prompt-toolkit            3.0.36                   pypi_0    pypi
#adafactor=False,                                                                                                            │protobuf                  4.24.3                   pypi_0    pypi
#adam_beta1=0.9,                                                                                                             │psutil                    5.9.5           py310h2372a71_1    conda-forge
#adam_beta2=0.999,                                                                                                           │pthread-stubs             0.4               h36c2ea0_1001    conda-forge
#adam_epsilon=1e-08,                                                                                                         │py-cpuinfo                8.0.0              pyhd8ed1ab_0    conda-forge
#auto_find_batch_size=False,                                                                                                 │pycparser                 2.21               pyhd8ed1ab_0    conda-forge
#bf16=False,                                                                                                                 │pydeprecate               0.3.2              pyhd8ed1ab_0    conda-forge
#bf16_full_eval=False,                                                                                                       │pygments                  2.16.1                   pypi_0    pypi
#cache_dir=None,                                                                                                             │pyparsing                 3.1.1              pyhd8ed1ab_0    conda-forge
#data_seed=None,                                                                                                             │pyrsistent                0.19.3          py310h2372a71_1    conda-forge
#dataloader_drop_last=False,                                                                                                 │pysocks                   1.7.1              pyha2e5f31_6    conda-forge
#dataloader_num_workers=0,                                                                                                   │python                    3.10.12         hd12c33a_0_cpython    conda-forge
#dataloader_pin_memory=True,                                                                                                 │python-dateutil           2.8.2                    pypi_0    pypi
#ddp_backend=None,                                                                                                           │python_abi                3.10                    4_cp310    conda-forge
#ddp_broadcast_buffers=None,                                                                                                 │pytorch                   1.12.1          cuda112py310he33e0d6_201    conda-forge
#ddp_bucket_cap_mb=None,                                                                                                     │pytorch-ranger            0.1.1              pyhd8ed1ab_0    conda-forge
#ddp_find_unused_parameters=None,                                                                                            │pyyaml                    6.0.1           py310h2372a71_1    conda-forge
#ddp_timeout=1800,                                                                                                           │questionary               2.0.1                    pypi_0    pypi
#debug=[],                                                                                                                   │readline                  8.2                  h8228510_1    conda-forge
#deepspeed=/home/mryakhov/llama/gorilla/training/ds_config.json,                                                             │requests                  2.31.0             pyhd8ed1ab_0    conda-forge
#disable_tqdm=False,                                                                                                         │rich                      13.5.3                   pypi_0    pypi
#dispatch_batches=None,                                                                                                      │ruamel.yaml               0.17.32         py310h2372a71_0    conda-forge
#do_eval=True,                                                                                                               │ruamel.yaml.clib          0.2.7           py310h1fa729e_1    conda-forge
#do_predict=False,                                                                                                           │setuptools                68.2.2             pyhd8ed1ab_0    conda-forge
#do_train=False,                                                                                                             │six                       1.16.0                   pypi_0    pypi
#eval_accumulation_steps=None,                                                                                               │sleef                     3.5.1                h9b69904_2    conda-forge
#eval_delay=0,                                                                                                               │tk                        8.6.13               h2797004_0    conda-forge
#eval_steps=48,                                                                                                              │torch-optimizer           0.1.0              pyhd8ed1ab_0    conda-forge
#evaluation_strategy=steps,                                                                                                  │torchmetrics              0.7.3              pyhd8ed1ab_0    conda-forge
#fp16=True,                                                                                                                  │torchvision               0.13.0          cuda112py310h453157a_0    conda-forge
#fp16_backend=auto,                                                                                                          │tqdm                      4.66.1             pyhd8ed1ab_0    conda-forge
#fp16_full_eval=False,                                                                                                       │typing_extensions         4.8.0              pyha770c72_0    conda-forge
#fp16_opt_level=O1,                                                                                                          │tzdata                    2023c                h71feb2d_0    conda-forge
#fsdp=[],                                                                                                                    │urllib3                   2.0.5              pyhd8ed1ab_0    conda-forge
#fsdp_config={'min_num_params': 0, 'xla': False, 'xla_fsdp_grad_ckpt': False},                                               │validators                0.22.0                   pypi_0    pypi
#fsdp_min_num_params=0,                                                                                                      │wcwidth                   0.2.6                    pypi_0    pypi
#fsdp_transformer_layer_cls_to_wrap=None,                                                                                    │websockets                10.4                     pypi_0    pypi
#full_determinism=False,                                                                                                     │wheel                     0.41.2             pyhd8ed1ab_0    conda-forge
#gradient_accumulation_steps=1,                                                                                              │xorg-libxau               1.0.11               hd590300_0    conda-forge
#gradient_checkpointing=True,                                                                                                │xorg-libxdmcp             1.1.3                h7f98852_0    conda-forge
#greater_is_better=None,                                                                                                     │xz                        5.2.6                h166bdaf_0    conda-forge
#group_by_length=False,
#half_precision_backend=auto,                                                                                                │protobuf                  4.24.3                   pypi_0    pypi
#hub_always_push=False,                                                                                                      │psutil                    5.9.5           py310h2372a71_1    conda-forge
#hub_model_id=None,                                                                                                          │pthread-stubs             0.4               h36c2ea0_1001    conda-forge
#hub_private_repo=False,                                                                                                     │py-cpuinfo                8.0.0              pyhd8ed1ab_0    conda-forge
#hub_strategy=every_save,                                                                                                    │pycparser                 2.21               pyhd8ed1ab_0    conda-forge
#hub_token=<HUB_TOKEN>,                                                                                                      │pydeprecate               0.3.2              pyhd8ed1ab_0    conda-forge
#ignore_data_skip=False,                                                                                                     │pygments                  2.16.1                   pypi_0    pypi
#include_inputs_for_metrics=False,                                                                                           │pyparsing                 3.1.1              pyhd8ed1ab_0    conda-forge
#jit_mode_eval=False,                                                                                                        │pyrsistent                0.19.3          py310h2372a71_1    conda-forge
#label_names=None,                                                                                                           │pysocks                   1.7.1              pyha2e5f31_6    conda-forge
#label_smoothing_factor=0.0,                                                                                                 │python                    3.10.12         hd12c33a_0_cpython    conda-forge
#learning_rate=2e-05,                                                                                                        │python-dateutil           2.8.2                    pypi_0    pypi
#length_column_name=length,                                                                                                  │python_abi                3.10                    4_cp310    conda-forge
#load_best_model_at_end=False,                                                                                               │pytorch                   1.12.1          cuda112py310he33e0d6_201    conda-forge
#local_rank=0,                                                                                                               │pytorch-ranger            0.1.1              pyhd8ed1ab_0    conda-forge
#log_level=passive,                                                                                                          │pyyaml                    6.0.1           py310h2372a71_1    conda-forge
#log_level_replica=warning,                                                                                                  │questionary               2.0.1                    pypi_0    pypi
#log_on_each_node=True,                                                                                                      │readline                  8.2                  h8228510_1    conda-forge
#logging_dir=/home/mryakhov/llama/gorilla/training/models/gorilla-model-torchhub-v2/runs/Sep27_17-14-32_eti-rolle-ucs5-gpu,  │requests                  2.31.0             pyhd8ed1ab_0    conda-forge
#logging_first_step=False,                                                                                                   │rich                      13.5.3                   pypi_0    pypi
#logging_nan_inf_filter=True,                                                                                                │ruamel.yaml               0.17.32         py310h2372a71_0    conda-forge
#logging_steps=24,                                                                                                           │ruamel.yaml.clib          0.2.7           py310h1fa729e_1    conda-forge
#logging_strategy=steps,                                                                                                     │setuptools                68.2.2             pyhd8ed1ab_0    conda-forge
#lr_scheduler_type=cosine,                                                                                                   │six                       1.16.0                   pypi_0    pypi
#max_grad_norm=1.0,                                                                                                          │sleef                     3.5.1                h9b69904_2    conda-forge
#max_steps=-1,                                                                                                               │tk                        8.6.13               h2797004_0    conda-forge
#metric_for_best_model=None,                                                                                                 │torch-optimizer           0.1.0              pyhd8ed1ab_0    conda-forge
#model_max_length=2048,                                                                                                      │torchmetrics              0.7.3              pyhd8ed1ab_0    conda-forge
#mp_parameters=,                                                                                                             │torchvision               0.13.0          cuda112py310h453157a_0    conda-forge
#no_cuda=False,                                                                                                              │tqdm                      4.66.1             pyhd8ed1ab_0    conda-forge
#num_train_epochs=5.0,                                                                                                       │typing_extensions         4.8.0              pyha770c72_0    conda-forge
#optim=adamw_torch,                                                                                                          │tzdata                    2023c                h71feb2d_0    conda-forge
#optim_args=None,                                                                                                            │urllib3                   2.0.5              pyhd8ed1ab_0    conda-forge
#output_dir=/home/mryakhov/llama/gorilla/training/models/gorilla-model-torchhub-v2/,                                         │validators                0.22.0                   pypi_0    pypi
#overwrite_output_dir=False,                                                                                                 │wcwidth                   0.2.6                    pypi_0    pypi
#past_index=-1,                                                                                                              │websockets                10.4                     pypi_0    pypi
#per_device_eval_batch_size=20,                                                                                              │wheel                     0.41.2             pyhd8ed1ab_0    conda-forge
#per_device_train_batch_size=20,                                                                                             │xorg-libxau               1.0.11               hd590300_0    conda-forge
#prediction_loss_only=False,                                                                                                 │xorg-libxdmcp             1.1.3                h7f98852_0    conda-forge
#push_to_hub=False,                                                                                                          │xz                        5.2.6                h166bdaf_0    conda-forge
#push_to_hub_model_id=None,                                                                                                  │yahp                      0.1.3                      py_0    mosaicml
#push_to_hub_organization=None,                                                                                              │yaml                      0.2.5                h7f98852_2    conda-forge
#push_to_hub_token=<PUSH_TO_HUB_TOKEN>,                                                                                      │yarl                      1.9.2                    pypi_0    pypi
#ray_scope=last,                                                                                                             │zipp                      3.17.0             pyhd8ed1ab_0    conda-forge
#remove_unused_columns=True,                                                                                                 │zlib                      1.2.13               hd590300_5    conda-forge
#report_to=[],                                                                                                               │zstd                      1.5.5                hfc55251_0    conda-forge
#resume_from_checkpoint=None,                                                                                                │
#run_name=/home/mryakhov/llama/gorilla/training/models/gorilla-model-torchhub-v2/,                                           │[mosaic] mryakhov@eti-rolle-ucs5-gpu:/
#save_on_each_node=False,
#save_safetensors=False,                                                                                                     │protobuf                  4.24.3                   pypi_0    pypi
#save_steps=48,                                                                                                              │psutil                    5.9.5           py310h2372a71_1    conda-forge
#save_strategy=steps,                                                                                                        │pthread-stubs             0.4               h36c2ea0_1001    conda-forge
#save_total_limit=2,                                                                                                         │py-cpuinfo                8.0.0              pyhd8ed1ab_0    conda-forge
#seed=42,                                                                                                                    │pycparser                 2.21               pyhd8ed1ab_0    conda-forge
#sharded_ddp=[],                                                                                                             │pydeprecate               0.3.2              pyhd8ed1ab_0    conda-forge
#skip_memory_metrics=True,                                                                                                   │pygments                  2.16.1                   pypi_0    pypi
#tf32=False,                                                                                                                 │pyparsing                 3.1.1              pyhd8ed1ab_0    conda-forge
#torch_compile=False,                                                                                                        │pyrsistent                0.19.3          py310h2372a71_1    conda-forge
#torch_compile_backend=None,                                                                                                 │pysocks                   1.7.1              pyha2e5f31_6    conda-forge
#torch_compile_mode=None,                                                                                                    │python                    3.10.12         hd12c33a_0_cpython    conda-forge
#torchdynamo=None,                                                                                                           │python-dateutil           2.8.2                    pypi_0    pypi
#tpu_metrics_debug=False,                                                                                                    │python_abi                3.10                    4_cp310    conda-forge
#tpu_num_cores=None,                                                                                                         │pytorch                   1.12.1          cuda112py310he33e0d6_201    conda-forge
#use_cpu=False,                                                                                                              │pytorch-ranger            0.1.1              pyhd8ed1ab_0    conda-forge
#use_ipex=False,                                                                                                             │pyyaml                    6.0.1           py310h2372a71_1    conda-forge
#use_legacy_prediction_loop=False,                                                                                           │questionary               2.0.1                    pypi_0    pypi
#use_mps_device=False,                                                                                                       │readline                  8.2                  h8228510_1    conda-forge
#warmup_ratio=0.03,                                                                                                          │requests                  2.31.0             pyhd8ed1ab_0    conda-forge
#warmup_steps=0,                                                                                                             │rich                      13.5.3                   pypi_0    pypi
#weight_decay=0.0,                                                                                                           │ruamel.yaml               0.17.32         py310h2372a71_0    conda-forge
#)                                                                                                                           │ruamel.yaml.clib          0.2.7           py310h1fa729e_1    conda-forge
#{'train_dataset': <__main__.LazySupervisedDataset object at 0x7f9f37b3efa0>, 'eval_dataset': <__main__.LazySupervisedDataset│setuptools                68.2.2             pyhd8ed1ab_0    conda-forgeobject at 0x7f9f37f48100>}