#!/usr/bin/env bash

###
if [ ! -d ./test/libs/bats ]; then {
    git submodule init
    git submodule add https://github.com/sstephenson/bats test/libs/bats
    git submodule add https://github.com/ztombol/bats-assert test/libs/bats-assert
    git submodule add https://github.com/ztombol/bats-support test/libs/bats-support
    git add .
    git commit -m "installed bats"
} else {
    echo "BATS already instaled"
}

# END SCRIPT