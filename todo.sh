#!/bin/bash

# File to store tasks
TODO_FILE="tasks.txt"

# Create the file if it doesn't exist
touch $TODO_FILE

# Function to show menu
show_menu() {
  echo "----- TO-DO LIST -----"
  echo "1. View tasks"
  echo "2. Add task"
  echo "3. Mark task as done"
  echo "4. Delete task"
  echo "5. Exit"
}
while true; do
  show_menu
  read -p "Choose an option [1-5]: " choice

  case $choice in
    1)
      echo "Your tasks:"
      nl -w2 -s'. ' $TODO_FILE
      ;;
    2)
      read -p "Enter new task: " task
      echo "[ ] $task" >> $TODO_FILE
      echo "Task added!"
      ;;
    3)
      nl -w2 -s'. ' $TODO_FILE
      read -p "Enter task number to mark as done: " num
      sed -i "${num}s/\[ \]/[x]/" $TODO_FILE
      echo "Task marked as done."
      ;;
    4)
      nl -w2 -s'. ' $TODO_FILE
      read -p "Enter task number to delete: " num
      sed -i "${num}d" $TODO_FILE
      echo "Task deleted."
      ;;
    5)
      echo "Goodbye!"
      break
      ;;
    *)
      echo "Invalid option. Try again."
      ;;
  esac

  echo ""
done
