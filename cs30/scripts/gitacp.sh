FILES_TO_ADD=$1
COMMIT_MESSAGE=$2
PUSH_DESTINATION=$3

git add $FILES_TO_ADD
git commit -m "$COMMIT_MESSAGE"
git push $PUSH_DESTINATION
