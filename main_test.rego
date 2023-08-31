package main_test

import data.main

test_storage_denies {
    input := {
        "resource": "volume",
        "explain": true
    }
    output := main.decision with input as input
    output.allow == false
    output.reason == "denied by storage.policy1 | denied by storage.policy2"
}

test_network_denies {
    input := {
        "resource": "ip",
        "explain": true
    }
    output := main.decision with input as input
    output.allow == false
    output.reason == "denied by network.policy1"
}

# there is deny {false} for compute for all policies, so all resources in compute are allowed
test_compute_allows {
    input := {
        "resource": "vm",
        "explain": true
    }
    output := main.decision with input as input
    output.allow == true
}

