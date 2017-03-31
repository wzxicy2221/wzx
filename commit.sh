set -x
set -e

git status

git add -A

git commit -m "$0"

git push
