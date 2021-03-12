#!/usr/bin/env bash

perlcritic $INPUT_PERLCRITIC_ARGS | \
    reviewdog -f="checkstyle" \
        -name="${INPUT_TOOL_NAME}" \
        -reporter="${INPUT_REPORTER:-github-pr-check}" \
        -filter-mode="${INPUT_FILTER_MODE}" \
        -fail-on-error="${INPUT_FAIL_ON_ERROR}" \
        -level="${INPUT_LEVEL}" \
        ${INPUT_REVIEWDOG_FLAGS}
