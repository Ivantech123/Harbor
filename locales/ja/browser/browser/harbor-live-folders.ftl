# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = ライブフォルダーのオプション

harbor-live-folder-last-fetched =
    .label = 最終取得: { $time }

harbor-live-folder-refresh =
    .label = 更新

harbor-live-folder-github-option-author-self =
    .label = 自分が作成したもの

harbor-live-folder-github-option-assigned-self =
    .label = 自分に割り当てられたもの

harbor-live-folder-github-option-review-requested =
    .label = レビュー依頼

harbor-live-folder-github-option-include-drafts =
    .label = ドラフトのプルリクエストを含める

harbor-live-folder-type-rss =
    .label = RSS フィード

harbor-live-folder-option-fetch-interval =
    .label = 取得間隔

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 分
      *[other] { $mins } 分
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 時間
      *[other] { $hours } 時間
    }

harbor-live-folder-rss-option-time-range =
    .label = 期間

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] 過去 1 時間
      *[other] 過去 { $hours } 時間
    }

harbor-live-folder-time-range-all-time =
    .label = 全期間

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] 過去 1 日
      *[other] 過去 { $days } 日
    }

harbor-live-folder-rss-option-item-limit =
    .label = 件数上限

harbor-live-folder-rss-option-feed-url =
    .label = フィード URL

harbor-live-folder-rss-prompt-feed-url = フィード URL を入力してください

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } 件

harbor-live-folder-failed-fetch =
    .label = 更新に失敗しました
    .tooltiptext = 更新に失敗しました。もう一度お試しください。

harbor-live-folder-github-no-auth =
    .label = GitHub にサインインしていません
    .tooltiptext = GitHub に再度サインインしてください。

harbor-live-folder-github-no-filter =
    .label = フィルターが設定されていません
    .tooltiptext = フィルターが設定されていないため、取得する内容はありません。

harbor-live-folder-rss-invalid-url-title = ライブフォルダーを作成できませんでした
harbor-live-folder-rss-invalid-url-description = フィード URL が無効です。アドレスを確認してから、もう一度お試しください

harbor-live-folder-github-option-repo-filter =
    .label = リポジトリ

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = プルリクエスト

harbor-live-folder-github-issues =
    .label = イシュー

harbor-live-folder-github-option-repo-list-note =
    .label = この一覧は、現在アクティブなプルリクエストに基づいて生成されます。

harbor-live-folders-promotion-title = ライブフォルダーを作成しました！
harbor-live-folders-promotion-description = RSS フィードまたは GitHub のプルリクエストの最新コンテンツが、ここに自動的に表示されます。
