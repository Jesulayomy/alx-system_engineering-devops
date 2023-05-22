#!/usr/bin/python3
""" Calls to data from the jsonplaceholder website """

import requests
import sys

if __name__ == "__main__":
    EMPLOYEE_ID = sys.argv[1]

    link = "https://jsonplaceholder.typicode.com/users"
    user_response = requests.get(f"{link}/{EMPLOYEE_ID}")
    EMPLOYEE_NAME = user_response.json().get("name")

    todo_list = requests.get(f"{link}/{EMPLOYEE_ID}/todos").json()
    total = len(todo_list)
    completed = [
            task.get('title')
            for task in todo_list
            if task.get('completed') is True
        ]

    print("Employee {} is done with tasks({}/{})".format(
        EMPLOYEE_NAME,
        len(completed),
        total))

    for task in completed:
        print(f"\t {task}")
