#!/bin/bash

# Set the start and end dates for the last 365 days
end_date=$(date +%s)  # Current timestamp
start_date=$((end_date - 365 * 24 * 60 * 60))  # 365 days ago

# Loop through each day in the last 365 days
for ((day = start_date; day <= end_date; day += 24 * 60 * 60)); do
    # Randomly decide how many commits to make for this day (0 to 3)
    commit_count=$((RANDOM % 4))

    # Generate the commit date in the required format (macOS/BSD compatible)
    commit_date=$(date -r "$day" "+%a %b %d %H:%M %Y %z")

    # Make the commits
    for ((i = 1; i <= commit_count; i++)); do
        # Create a dummy file or modify an existing one
        echo "Commit on $commit_date" >> dummy_file.txt
        git add dummy_file.txt

        # Perform the commit with the specified date
        git commit --date="$commit_date" -m "Commit on $commit_date"
    done
done

echo "All commits completed."