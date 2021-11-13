#!/bin/bash

active_count=$(task +ACTIVE count)
pending_count=$(task +PENDING count)

echo " ($active_count/$pending_count)"
