#!/usr/bin/env python

import argparse
from pathlib import Path
import logging

def parse_arguments():
    parser=argparse.ArgumentParser(
            description=""
            )

    optionalArgs = parser._action_groups.pop()
    optionalArgs.title = "Optional Arguments"

    requiredArgs = parser.add_argument_group("Required Arguments")

    requiredArgs.add_argument(
            "-i",
            "--input",
            type=lambda p: Path(p).resolve(strict=True),
            help="",
            dest="input",
            required=True,
            )
    requiredArgs.add_argument(
            "-o",
            "--output",
            type=lambda p: Path(p).resolve(),
            help="",
            dest="output",
            required=True,
            )
    

    parser._action_groups.append(optionalArgs)

    return parser.parse_args()


def main():
    args = parse_arguments()


if __name__ == '__main__':
    main()
