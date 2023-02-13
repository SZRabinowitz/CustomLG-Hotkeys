
#!/bin/bash

OUTPUT=$(dumpsys window windows | grep -E 'mCurrentFocus|mFocusedApp' | sed -n 's/.*u0 \(.*\) .*/\1/p')
PACKAGE_NAME=$(echo $OUTPUT | cut -d "/" -f 1)
ACTIVITY_NAME=$(echo $OUTPUT | cut -d "/" -f 2)
if [[ $ACTIVITY_NAME == "."* ]]; then
  ACTIVITY_NAME="$PACKAGE_NAME"$(echo $ACTIVITY_NAME | sed 's/\./\./g')
else
  ACTIVITY_NAME="$ACTIVITY_NAME"
fi
echo $PACKAGE_NAME $ACTIVITY_NAME
