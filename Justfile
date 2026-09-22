
# create a kind cluster with dependenices
up:
    ./dev/up.sh

# taredown the kind cluster
down:
    ./dev/down.sh

# clean all
clean: down
    rm -r .venv

# install python packages and dependancy repo
install:
     if [[ ! -d .venv ]] ; then uv venv; fi
     source .venv/bin/activate
     ./dev/install-packages.sh

# run the project notebook
notebook:
    ./makewithml/notebooks/madewithml.ipynb
