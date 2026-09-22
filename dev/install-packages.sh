#!/usr/bin/env bash

uv pip install -r https://raw.githubusercontent.com/GokuMohandas/Made-With-ML/main/requirements.txt
uv pip install "setuptools<80" async_timeout ray[default]
