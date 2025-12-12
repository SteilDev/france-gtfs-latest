for g in *.zip; do
    gtfstidy "$g" \
      -i \
      --fix \
      --recluster-stops \
      --dist-threshold-stop 100 \
      --red-trips-fuzzy \
      --red-stops-fuzzy \
      --fix-zip \
      --remove-red-services \
      --remove-fillers \
      --drop-shapes \
      --delete-orphans \
      --drop-single-stop-trips \
      --drop-too-fast-trips \
      --output "$g"
done > tidy.log

gtfstidy \
    --prefix="fr:" \
    --recluster-stops \
    --remove-red-agencies \
    --remove-red-routes \
    --remove-red-services \
    --delete-orphans \
    --dist-threshold-stop 200 \
    --red-stops-fuzzy \
    --drop-shapes \
    --fix \
    --remove-fillers \
    --minimize-services \
    --ensure-stop-parents \
    --stable-stop-ids-parents \
    --explicit-calendar \
    *.zip \
    -o gtfs_france_clean.zip
>> tidy.log
