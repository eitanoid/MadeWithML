
# create a kind cluster with dependenices
up:
    ./dev/up.sh

# taredown the kind cluster
down:
    ./dev/down.sh

# clean all
clean: down
    rm -r .venv

# install python packages
install:
    ./dev/install-packages.sh
