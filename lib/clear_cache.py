import os, shutil
from .util.io import print_additional_info

def handler(args):
    path ="~/.cache/pacup"
    if args.verbosity > 0:
        print_additional_info("Deleting {}".format(path))
    try:
        shutil.rmtree(os.path.expanduser(path))
    except OSError:
        pass
