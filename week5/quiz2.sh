#!/bin/bash
URL="https://www.cyber.gov.au/acsc/view-all-content/alerts"
curl -s $URL | grep -i Content-Length | awk '{print $2}'