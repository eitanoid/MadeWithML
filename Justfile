
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
   source ./.env
   jupyter lab ./makewithml/notebooks/madewithml.ipynb

# port-forward to kubernetes Ray deployment
ray-port-forward:
    kubectl port-forward service/raycluster-kuberay-head-svc 8265:8265 > /dev/null &
