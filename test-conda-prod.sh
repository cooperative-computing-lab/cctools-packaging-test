#!/bin/sh

# Install everything from conda production.
. ./install-conda-prod.sh

# Run the basic smoke tests.
. ./test-makeflow-workqueue.sh
. ./test-makeflow-taskvine.sh
