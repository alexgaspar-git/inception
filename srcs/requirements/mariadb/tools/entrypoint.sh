#!/bin/sh
envsubst < /tools/create_db.sql | sponge /tools/create_db.sql
exec $@