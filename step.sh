#!/bin/bash
set -ex

is_mr_draft=$(curl --request GET --header "PRIVATE-TOKEN: ${gitlab_user_token}" -H "Accept: application/json" "${gitlab_api_url}/projects/${project_id}/merge_requests/${bitrise_pull_request}" | ruby -rjson -e 'puts JSON.parse($stdin.read)["draft"]')

echo $is_mr_draft

envman add --key IS_MR_DRAFT --value $is_mr_draft