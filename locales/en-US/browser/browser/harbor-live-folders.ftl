# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Live Folder Options

harbor-live-folder-last-fetched =
    .label = Last fetch: { $time }

harbor-live-folder-refresh =
    .label = Refresh

harbor-live-folder-github-option-author-self =
    .label = Created by Me

harbor-live-folder-github-option-assigned-self =
    .label = Assigned to Me

harbor-live-folder-github-option-review-requested =
    .label = Review Requests

harbor-live-folder-github-option-include-drafts =
    .label = Include Draft Pull Requests

harbor-live-folder-type-rss =
    .label = RSS Feed

harbor-live-folder-option-fetch-interval =
    .label = Fetch Interval

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minute
      *[other] { $mins } minutes
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 hour
      *[other] { $hours } hours
    }

harbor-live-folder-rss-option-time-range =
    .label = Time Range

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Last hour
      *[other] Last { $hours } hours
    }

harbor-live-folder-time-range-all-time =
    .label = All time

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Last day
      *[other] Last { $days } days
    }

harbor-live-folder-rss-option-item-limit =
    .label = Item Limit

harbor-live-folder-rss-option-feed-url =
    .label = Feed URL

harbor-live-folder-rss-prompt-feed-url = Please enter the feed URL

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } items

harbor-live-folder-failed-fetch =
    .label = Failed to update
    .tooltiptext = Failed to update. Try again.

harbor-live-folder-github-no-auth =
    .label = Not signed in to GitHub
    .tooltiptext = Sign back in to GitHub.

harbor-live-folder-github-no-filter =
    .label = Filter is not set
    .tooltiptext = No filter set, nothing will be fetched.

harbor-live-folder-rss-invalid-url-title = Failed to create the Live Folder
harbor-live-folder-rss-invalid-url-description = The feed URL is invalid. Check the address and try again

harbor-live-folder-github-option-repo-filter =
    .label = Repositories

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Pull Requests

harbor-live-folder-github-issues =
    .label = Issues

harbor-live-folder-github-option-repo-list-note =
    .label = This list is generated based on your currently active pull requests.

harbor-live-folders-promotion-title = Live Folder Created!
harbor-live-folders-promotion-description = Latest content from your RSS feeds or GitHub pull requests will appear here automatically.
