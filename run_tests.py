#!/usr/bin/env python3

import os
import sys

ROBOT_CMDLINE = 'robot -d  ./reports --loglevel TRACE --pythonpath ./resources %s "./\"tests"\"'


def set_test_environments_variables():
    try:
        ROOT_DIR = os.path.dirname(os.path.abspath(__file__))
        resources_path = f'{ROOT_DIR}/resources/'
        sys.path.append(resources_path)
    except Exception as e:
        raise Exception('Error in set_test_environments_variables! {}'.format(e))


def run_tests():
    try:
        tag = ""
        print("\nWHAT TEST TYPE DO YOU WISH TO USE?\n")
        print("""1.Do you want to run a regression?
2.Do you want to run tests using tags?
3.Exit/Quit
        """)

        select = input('What would you like to do? ')

        if select == "1":
            print("Running Regression!\n")
        elif select == "2":
            value = input('Type the tag you want to execute and click enter. ')
            tag = '--include ' + value
        elif select == "3":
            print("\nGoodbye")
            quit()
        else:
            print("\nNot Valid Choice Try again")
            quit()

        cmd = ROBOT_CMDLINE % tag
        os.system(cmd)
    except Exception as e:
        raise Exception('Error in include_tags! {}'.format(e))


def main():
    try:
        set_test_environments_variables()
        run_tests()
    except Exception as e:
        raise Exception('Error for run tests! {}'.format(e))


main()
