set -e


# Test only formats that I need
for format in json html summaryhtml text textcolor xml ; do
  echo $format
  pmd -R /ruleset.xml -d /testfiles/ --fail-on-violation false --format $format
done


