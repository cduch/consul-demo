#!/bin/bash

consul kv put presenter "Carsten Duch"

echo "Now check out the value in the UI!"
sleep 60

consul kv delete presenter