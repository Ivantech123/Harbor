# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = 현재 프로필
unified-extensions-description = 확장 프로그램은 { -brand-short-name }에 더 많은 추가 기능을 제공하는 데 사용됩니다.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] 에센셜 탭 초기화
           *[false] 고정된 탭 초기화
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = 에센셜에 추가
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max }개 추가됨
tab-context-harbor-remove-essential = 
    .label = 에센셜에서 제거하기
    .accesskey = R
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] 에센셜 URL 편집
           *[false] 고정된 탭 URL 편집
        }
    .accesskey = P
tab-context-harbor-replace-pinned-url-with-current = 
    .label = 현재 URL로 변경
    .accesskey = C
tab-context-harbor-edit-pinned-url = 
    .label = 편집…
    .accesskey = E
tab-context-harbor-edit-title = 
    .label = 라벨 편집...
tab-context-harbor-edit-icon = 
    .label = 아이콘 편집...
harbor-themes-corrupted = { -brand-short-name } 모드 파일이 손상되었습니다. 기본 테마로 재설정되었습니다.
harbor-shortcuts-corrupted = { -brand-short-name } 단축키 파일이 손상되었습니다. 기본 단축키 설정으로 재설정 되었습니다.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    새 탭 페이지가 필요 없는 새로운 주소 표시줄이 활성화 되었습니다.<br/><br/>
    새 탭을 열어서 새로운 URL 바를 만나보세요!
harbor-disable = 비활성화
pictureinpicture-minimize-btn = 
    .aria-label = 최소화
    .tooltip = 최소화
harbor-panel-ui-gradient-generator-custom-color = 커스텀 색상
harbor-copy-current-url-confirmation = 현재 URL을 복사했습니다!
harbor-copy-current-url-as-markdown-confirmation = 현재 URL을 마크다운으로 복사했습니다!
harbor-general-cancel-label = 
    .label = 취소
harbor-general-confirm = 
    .label = 확인
harbor-pinned-tab-replaced = 고정 URL이 현재 URL로 변경되었습니다!
harbor-pinned-tab-url-edited = 고정된 탭 URL이 변경되었습니다!
harbor-pinned-tab-url-invalid = 올바른 URL 형식이 아닙니다.
harbor-pinned-tab-edit-url-title = 고정된 탭 URL 편집
harbor-pinned-tab-edit-url-label = 이 고정된 탭이 고정할 URL을 입력하세요:
harbor-tabs-renamed = 탭의 이름이 성공적으로 변경되었습니다!
harbor-background-tab-opened-toast = 새 백그라운드 탭이 열렸습니다!
harbor-workspace-renamed-toast = 워크스페이스 이름이 변경되었습니다!
harbor-split-view-limit-toast = 패널을 더 추가할 수 없습니다!
harbor-toggle-compact-mode-button = 
    .label = 사이드바 축소 모드
    .tooltiptext = 사이드바 축소 토글

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = 더 알아보기
harbor-close-label = 닫기
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = 검색...
harbor-icons-picker-emoji = 
    .label = 이모티콘
harbor-icons-picker-svg = 
    .label = 아이콘
harbor-emojis-picker-search = 
    .placeholder = 이모지 검색
urlbar-search-mode-zen_actions = 액션
harbor-site-data-settings = 설정
harbor-generic-manage = 관리
harbor-generic-more = 더 보기
harbor-generic-next = 다음
harbor-essentials-promo-label = 에센셜에 추가
harbor-essentials-promo-sublabel = 가장 좋아하는 탭을 바로 열 수 있게
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = 허용됨
harbor-site-data-setting-block = 금지됨
harbor-site-data-protections-enabled = 활성화됨
harbor-site-data-protections-disabled = 비활성화됨
harbor-site-data-setting-cross-site = 사이트 간 공유 쿠키
harbor-site-data-security-info-extension = 
    .label = 확장
harbor-site-data-security-info-secure = 
    .label = 안전함
harbor-site-data-security-info-not-secure = 
    .label = 안전하지 않음
harbor-site-data-manage-addons = 
    .label = 확장 프로그램 관리
harbor-site-data-get-addons = 
    .label = 확장 프로그램 추가
harbor-site-data-site-settings = 
    .label = 모든 사이트 설정
harbor-site-data-header-share = 
    .tooltiptext = 이 페이지 공유
harbor-site-data-header-reader-mode = 
    .tooltiptext = 읽기 모드 켜기
harbor-site-data-header-screenshot = 
    .tooltiptext = 화면 캡쳐
harbor-site-data-header-bookmark = 
    .tooltiptext = 이 페이지 북마크
harbor-urlbar-copy-url-button = 
    .tooltiptext = URL 복사
harbor-site-data-setting-site-protection = 추적 보호

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = 애드온, 권한, 그리고 더 많은 것을 위한 새로운 곳
harbor-site-data-panel-feature-callout-subtitle = 아이콘을 클릭해 사이트 설정, 보안 정보 조회, 확장 프로그램 접근, 기타 행동을 수행할 수 있습니다.
harbor-open-link-in-glance = 
    .label = 글랜스로 링크 열기
    .accesskey = G
harbor-sidebar-notification-updated-heading = 업데이트 완료!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = { -brand-short-name }의 새로운 기능
harbor-sidebar-notification-updated-tooltip = 
    .title = 업데이트 기록 보기
harbor-sidebar-notification-donate-label = { -brand-short-name } 후원
harbor-sidebar-notification-donate-tooltip = 
    .title = 프로젝트에 후원하기
harbor-sidebar-notification-restart-safe-mode-label = 무언가 고장났나요?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = 안전 모드로 다시 시작
harbor-window-sync-migration-dialog-title = 창을 동기화 상태로 유지
harbor-window-sync-migration-dialog-message = Harbor이 이제 같은 기기에서 창을 동기화합니다. 한 창에서의 변경이 다른 창에서도 즉시 적용됩니다.
harbor-window-sync-migration-dialog-learn-more = 더 알아보기
harbor-window-sync-migration-dialog-accept = 알겠습니다
harbor-appmenu-new-blank-window = 
    .label = 새 빈 창
