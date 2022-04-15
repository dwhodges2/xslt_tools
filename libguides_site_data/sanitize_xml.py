# XML export from libguides may have illegal characters.
# Strip them out with regex and save as a new file.
import re


def sanitize_xml(in_path, out_path):
    # strip out some bad bytes that will foul up parsing.
    with open(in_path, "r") as f:
        content = f.read()
    repl = re.subn(r"[\x01-\x08\x0b\x0c\x0e-\x1f]",
                   "?", content, flags=re.DOTALL)
    with open(out_path, "w+") as f:
        f.write(repl[0])
    if repl[1] > 0:
        return f"WARNING: Replaced {str(repl[1])} illegal characters in {in_path}"
