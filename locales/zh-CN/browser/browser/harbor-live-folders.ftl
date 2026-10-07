# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = 实时文件夹选项

harbor-live-folder-last-fetched =
    .label = 上次获取：{ $time }

harbor-live-folder-refresh =
    .label = 刷新

harbor-live-folder-github-option-author-self =
    .label = 我创建的

harbor-live-folder-github-option-assigned-self =
    .label = 分配给我的

harbor-live-folder-github-option-review-requested =
    .label = 审查请求

harbor-live-folder-github-option-include-drafts =
    .label = 包含草稿拉取请求

harbor-live-folder-type-rss =
    .label = RSS 订阅源

harbor-live-folder-option-fetch-interval =
    .label = 获取间隔

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 分钟
      *[other] { $mins } 分钟
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 小时
      *[other] { $hours } 小时
    }

harbor-live-folder-rss-option-time-range =
    .label = 时间范围

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] 最近一小时
      *[other] 最近 { $hours } 小时
    }

harbor-live-folder-time-range-all-time =
    .label = 不限时间

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] 最近一天
      *[other] 最近 { $days } 天
    }

harbor-live-folder-rss-option-item-limit =
    .label = 条目数量上限

harbor-live-folder-rss-option-feed-url =
    .label = 订阅源 URL

harbor-live-folder-rss-prompt-feed-url = 请输入订阅源 URL

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } 条

harbor-live-folder-failed-fetch =
    .label = 更新失败
    .tooltiptext = 更新失败，请重试。

harbor-live-folder-github-no-auth =
    .label = 未登录 GitHub
    .tooltiptext = 请重新登录 GitHub。

harbor-live-folder-github-no-filter =
    .label = 未设置筛选条件
    .tooltiptext = 未设置筛选条件，不会获取任何内容。

harbor-live-folder-rss-invalid-url-title = 创建实时文件夹失败
harbor-live-folder-rss-invalid-url-description = 订阅源 URL 无效。请检查地址后重试。

harbor-live-folder-github-option-repo-filter =
    .label = 仓库

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = 拉取请求

harbor-live-folder-github-issues =
    .label = 议题

harbor-live-folder-github-option-repo-list-note =
    .label = 此列表根据您当前活跃的拉取请求生成。

harbor-live-folders-promotion-title = 实时文件夹已创建！
harbor-live-folders-promotion-description = 您的 RSS 订阅源或 GitHub 拉取请求中的最新内容将自动显示在此处。
