# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = 라이브 폴더 옵션

harbor-live-folder-last-fetched =
    .label = 마지막 가져오기: { $time }

harbor-live-folder-refresh =
    .label = 새로 고침

harbor-live-folder-github-option-author-self =
    .label = 내가 만든 항목

harbor-live-folder-github-option-assigned-self =
    .label = 나에게 할당된 항목

harbor-live-folder-github-option-review-requested =
    .label = 검토 요청

harbor-live-folder-github-option-include-drafts =
    .label = 초안 풀 리퀘스트 포함

harbor-live-folder-type-rss =
    .label = RSS 피드

harbor-live-folder-option-fetch-interval =
    .label = 가져오기 주기

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1분
      *[other] { $mins }분
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1시간
      *[other] { $hours }시간
    }

harbor-live-folder-rss-option-time-range =
    .label = 시간 범위

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] 최근 1시간
      *[other] 최근 { $hours }시간
    }

harbor-live-folder-time-range-all-time =
    .label = 전체 기간

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] 최근 1일
      *[other] 최근 { $days }일
    }

harbor-live-folder-rss-option-item-limit =
    .label = 항목 제한

harbor-live-folder-rss-option-feed-url =
    .label = 피드 URL

harbor-live-folder-rss-prompt-feed-url = 피드 URL을 입력하세요

harbor-live-folder-rss-option-item-limit-num =
    .label = 항목 { $limit }개

harbor-live-folder-failed-fetch =
    .label = 업데이트 실패
    .tooltiptext = 업데이트하지 못했습니다. 다시 시도하세요.

harbor-live-folder-github-no-auth =
    .label = GitHub에 로그인되지 않음
    .tooltiptext = GitHub에 다시 로그인하세요.

harbor-live-folder-github-no-filter =
    .label = 필터가 설정되지 않음
    .tooltiptext = 필터가 설정되지 않아 아무것도 가져오지 않습니다.

harbor-live-folder-rss-invalid-url-title = 라이브 폴더를 만들지 못함
harbor-live-folder-rss-invalid-url-description = 피드 URL이 잘못되었습니다. 주소를 확인한 후 다시 시도하세요

harbor-live-folder-github-option-repo-filter =
    .label = 저장소

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = 풀 리퀘스트

harbor-live-folder-github-issues =
    .label = 이슈

harbor-live-folder-github-option-repo-list-note =
    .label = 이 목록은 현재 진행 중인 풀 리퀘스트를 기준으로 생성됩니다.

harbor-live-folders-promotion-title = 라이브 폴더를 만들었습니다!
harbor-live-folders-promotion-description = RSS 피드 또는 GitHub 풀 리퀘스트의 최신 콘텐츠가 여기에 자동으로 표시됩니다.
