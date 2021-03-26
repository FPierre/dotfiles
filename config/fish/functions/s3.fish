function s3 -d "Download files from AWS S3 production"
  if string match -q -- "*/vault/*" $argv[1]
    set s3path (string replace '/vault' '' $argv[1])
    aws s3 cp "s3://cubyn.prod.vault$s3path" $argv[2]
  else
    aws s3 cp "s3://cubyn.prd$argv[1]" $argv[2]
  end
end
