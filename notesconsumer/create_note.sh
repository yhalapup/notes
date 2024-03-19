#!/usr/bin/env bash

NOTES_BASE_URL=http://web:3000

curl \
-H 'Content-Type: application/json;charset=utf-8' \
-X POST \
-i "${NOTES_BASE_URL}/api/v1/notes" \
--data @- <<'DATA'
{
  "note":
    {
      "title": "title from script",
      "content": "content from script"
    }
}
DATA
