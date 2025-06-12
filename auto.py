import os
import re

def process_mk_file(filepath):
    with open(filepath, 'r') as f:
        lines = f.readlines()

    new_lines = []
    pattern = re.compile(r'^(\w+)_objs\s*=\s*(\w+)\.o\s*$')
    inserted = False

    for line in lines:
        new_lines.append(line)
        match = pattern.match(line)
        if match and not inserted:
            func = match.group(2)
            # Insert after this line
            new_lines.append(f"{func}_bin = {func}\n")
            inserted = True  # Only insert once per file, as requested

    if inserted:
        with open(filepath, 'w') as f:
            f.writelines(new_lines)
        print(f"Modified: {filepath}")

def find_and_process_mk_files(start_dir='.'):
    for root, dirs, files in os.walk(start_dir):
        for file in files:
            if file.endswith('.mk'):
                process_mk_file(os.path.join(root, file))

if __name__ == '__main__':
    find_and_process_mk_files()
