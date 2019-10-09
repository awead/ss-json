#!/bin/bash

export POSTGRES_USER=ssjson
export POSTGRES_DB=ssjson
export POSTGRES_PASSWORD=ssjson
export POSTGRES_HOST=127.0.0.1
export POSTGRES_PORT=5432
export OAUTH_APP_ID=8GPCI-bhFMv-EXeqIHta9cnRNE5AQ15kMO3n690LFkQ
export OAUTH_APP_SECRET=d6PytTnEpLKPtEih6cXDnuRAbqvqTfC2r01E45KXUNc
export OAUTH_APP_URL=http://localhost:3001

rails db:migrate

rails s -p 3000
