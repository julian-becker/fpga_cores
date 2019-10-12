#!/usr/bin/python3

import os
import sys
import yaml
import subprocess
import shutil

if __name__ == "__main__":
    exe = shutil.which('sbt')
    with open(sys.argv[1], 'r') as config_file:
        config = yaml.safe_load(config_file)
    subprocess.run([exe, config['parameters']['command']], cwd = config['files_root'], check = True)
