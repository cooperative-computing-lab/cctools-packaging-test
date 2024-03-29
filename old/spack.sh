#!/bin/sh

git clone https://github.com/spack/spack spack

export SPACK_ROOT=`pwd`/spack
. spack/share/spack/setup-env.sh

if spack install cctools
then
    echo "spack install succeeded"
else
    cd /tmp/runner/spack-stage/spack-stage-cctools-*
    cat spack-build-out.txt
    echo "========================================================"
    cat spack-src/cctools.test.fail
    echo "========================================================"
    echo "spack install failed"
    echo "========================================================"
    exit 1
fi

if spack load cctools
then
    echo "spack load succeeded"
else
    echo "spack load failed"
    exit 1
fi

exec ./smoke.sh
