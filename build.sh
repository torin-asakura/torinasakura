#!/bin/bash

tags=`git tag -l --points-at HEAD`
trigger="$(echo $CODEBUILD_WEBHOOK_TRIGGER)"

for tag in $(echo $tags); do
  if [[ "$trigger" == *"$tag"* ]]; then
    package="$(echo $tag | cut -d'@' -f2)"
    version="$(echo $tag | cut -d'@' -f3)"

    relative_package_path=$(grep -R --exclude-dir "node_modules" --include "package.json" "\"@${package}\"" -l .)
    package_path="${relative_package_path/\.\//$PWD/}"
    dockerfile="${package_path/package\.json/Dockerfile}"

    if [ -f "$dockerfile" ]; then
      s1="${package/@/}"
      s2="${s1/\//_}"
      s3="${s2/-/_}"
      repo="$(printenv "$s3")"

      if [ "$repo" ]; then
        docker build -t $repo:latest --file $dockerfile .
        docker tag $repo:latest $repo:$version
        docker push $repo:$version
        docker push $repo:latest
      fi
    fi
  fi
done
