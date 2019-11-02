#!/usr/bin/env python3
import json
import os
from pathlib import Path
import yaml

v_output_file = Path('_site/config/version.json')
v_input_file = Path('config/version.yml')


if v_input_file.exists:
    with open(v_input_file, 'r') as f:
        yaml_data = yaml.safe_load(f)
    print(yaml_data)
    with open(v_output_file, 'w') as jsonfile:
        json.dump(yaml_data, jsonfile, ensure_ascii=True,
                  indent=4, sort_keys=True)
else:
    raise IOError
