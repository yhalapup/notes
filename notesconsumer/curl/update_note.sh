#!/usr/bin/env bash

NOTES_BASE_URL=http://web:3000

curl \
-H 'Content-Type: application/json;charset=utf-8' \
-X PATCH \
-i "${NOTES_BASE_URL}/api/v1/notes/1" \
--data @- <<'DATA'
{
  "note":
    {
      "title": "updated title",
      "content": "updated content"
    }
}
DATA
