#!/usr/bin/env bash

NOTES_BASE_URL=http://web:3000

curl \
-H 'Content-Type: application/json;charset=utf-8' \
-X GET \
-i "${NOTES_BASE_URL}/api/v1/notes" \

curl \
-H 'Content-Type: application/json;charset=utf-8' \
-X GET \
-i "http://web:3000/api/v1/notes" \
