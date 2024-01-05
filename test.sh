SORTED_IMAGES=$(curl -s -H "Authorization: Bearer dckr_pat_-pGPDIrPWvIziatfggMf8bjfkNo" "https://hub.docker.com/v2/repositories/stigma137/jsonplaceholder-node-app/tags/" | jq -r '.results | .[] | .last_updated + " " + .name' | sort -r | awk '{print $2}')
KEEP_IMAGES=$(echo "$SORTED_IMAGES" | head -n 5)
echo $KEEP_IMAGES
for tag in $SORTED_IMAGES; do
  if ! echo "$KEEP_IMAGES" | grep -q "$tag"; then
    echo "Deleting image: $tag"
    curl -X DELETE -H "Authorization: Bearer $TOKEN" "https://hub.docker.com/v2/repositories/$REPO/tags/$tag/"
  fi
done