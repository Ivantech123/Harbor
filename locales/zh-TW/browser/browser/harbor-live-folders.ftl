# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = 即時資料夾選項

harbor-live-folder-last-fetched =
    .label = 上次擷取：{ $time }

harbor-live-folder-refresh =
    .label = 重新整理

harbor-live-folder-github-option-author-self =
    .label = 我建立的

harbor-live-folder-github-option-assigned-self =
    .label = 指派給我的

harbor-live-folder-github-option-review-requested =
    .label = 審查請求

harbor-live-folder-github-option-include-drafts =
    .label = 包含草稿拉取請求

harbor-live-folder-type-rss =
    .label = RSS 摘要

harbor-live-folder-option-fetch-interval =
    .label = 擷取間隔

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 分鐘
      *[other] { $mins } 分鐘
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 小時
      *[other] { $hours } 小時
    }

harbor-live-folder-rss-option-time-range =
    .label = 時間範圍

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] 最近 1 小時
      *[other] 最近 { $hours } 小時
    }

harbor-live-folder-time-range-all-time =
    .label = 所有時間

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] 最近 1 天
      *[other] 最近 { $days } 天
    }

harbor-live-folder-rss-option-item-limit =
    .label = 項目數上限

harbor-live-folder-rss-option-feed-url =
    .label = 摘要來源 URL

harbor-live-folder-rss-prompt-feed-url = 請輸入摘要來源 URL

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } 個項目

harbor-live-folder-failed-fetch =
    .label = 更新失敗
    .tooltiptext = 更新失敗。請再試一次。

harbor-live-folder-github-no-auth =
    .label = 未登入 GitHub
    .tooltiptext = 請重新登入 GitHub。

harbor-live-folder-github-no-filter =
    .label = 未設定篩選器
    .tooltiptext = 未設定篩選器，因此不會擷取任何內容。

harbor-live-folder-rss-invalid-url-title = 無法建立即時資料夾
harbor-live-folder-rss-invalid-url-description = 摘要來源 URL 無效。請檢查網址後再試一次。

harbor-live-folder-github-option-repo-filter =
    .label = 儲存庫

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = 拉取請求

harbor-live-folder-github-issues =
    .label = 議題

harbor-live-folder-github-option-repo-list-note =
    .label = 此清單是根據您目前開啟的拉取請求產生。

harbor-live-folders-promotion-title = 即時資料夾已建立！
harbor-live-folders-promotion-description = 您的 RSS 摘要或 GitHub 拉取請求中的最新內容會自動顯示在這裡。
