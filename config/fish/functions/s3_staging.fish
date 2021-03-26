function s3_staging -d "Download files from AWS S3 staging"
  if string match -q -- "*/vault/*" $argv[1]
    set s3path (string replace '/vault' '/' $argv[1])
    aws s3 cp "s3://cubyn.staging.vault$s3path" $argv[2]
  else
    aws s3 cp "s3://cubyn.staging.default$argv[1]" $argv[2]
  end
end
