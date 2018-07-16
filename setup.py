#!/usr/bin/env python

from setuptools import setup
import re

script_content = open('pandoc-pipe').read()
metadata = dict(re.findall("__([a-z]+)__\s*=\s*'([^']+)'", script_content))

setup(
    name="pandoc-pipe",
    version=metadata['version'],
    description="Substitudes CodeBlock by piped output of command",
    url="https://github.com/igsha/pandoc-pipe",
    author="igsha",
    license="LICENSE",
    classifiers=[
        "Development Status :: 2 - Pre-Alpha",
        "Environment :: Console",
        "Intended Audience :: End Users/Desktop",
        "License :: OSI Approved :: MIT License",
        "Operating System :: POSIX",
        "Programming Language :: Python",
        "Topic :: Text Processing"
    ],
    scripts=['pandoc-pipe'],
    install_requires=['panflute >= 1.10.6'],
)
