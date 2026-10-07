# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = ตัวเลือกโฟลเดอร์สด

harbor-live-folder-last-fetched =
    .label = การดึงข้อมูลล่าสุด: { $time }

harbor-live-folder-refresh =
    .label = รีเฟรช

harbor-live-folder-github-option-author-self =
    .label = ที่ฉันสร้าง

harbor-live-folder-github-option-assigned-self =
    .label = ที่มอบหมายให้ฉัน

harbor-live-folder-github-option-review-requested =
    .label = คำขอตรวจสอบ

harbor-live-folder-github-option-include-drafts =
    .label = รวมคำขอดึงโค้ดฉบับร่าง

harbor-live-folder-type-rss =
    .label = ฟีด RSS

harbor-live-folder-option-fetch-interval =
    .label = ช่วงเวลาดึงข้อมูล

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 นาที
      *[other] { $mins } นาที
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 ชั่วโมง
      *[other] { $hours } ชั่วโมง
    }

harbor-live-folder-rss-option-time-range =
    .label = ช่วงเวลา

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] 1 ชั่วโมงที่ผ่านมา
      *[other] { $hours } ชั่วโมงที่ผ่านมา
    }

harbor-live-folder-time-range-all-time =
    .label = ตลอดกาล

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] 1 วันที่ผ่านมา
      *[other] { $days } วันที่ผ่านมา
    }

harbor-live-folder-rss-option-item-limit =
    .label = จำนวนรายการสูงสุด

harbor-live-folder-rss-option-feed-url =
    .label = URL ของฟีด

harbor-live-folder-rss-prompt-feed-url = โปรดป้อน URL ของฟีด

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } รายการ

harbor-live-folder-failed-fetch =
    .label = อัปเดตไม่สำเร็จ
    .tooltiptext = อัปเดตไม่สำเร็จ โปรดลองอีกครั้ง

harbor-live-folder-github-no-auth =
    .label = ยังไม่ได้เข้าสู่ระบบ GitHub
    .tooltiptext = เข้าสู่ระบบ GitHub อีกครั้ง

harbor-live-folder-github-no-filter =
    .label = ยังไม่ได้ตั้งตัวกรอง
    .tooltiptext = ยังไม่ได้ตั้งตัวกรอง จึงไม่มีข้อมูลที่จะดึง

harbor-live-folder-rss-invalid-url-title = ไม่สามารถสร้างโฟลเดอร์สดได้
harbor-live-folder-rss-invalid-url-description = URL ของฟีดไม่ถูกต้อง โปรดตรวจสอบ URL แล้วลองอีกครั้ง

harbor-live-folder-github-option-repo-filter =
    .label = ที่เก็บข้อมูล

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = คำขอดึงโค้ด

harbor-live-folder-github-issues =
    .label = ปัญหา

harbor-live-folder-github-option-repo-list-note =
    .label = รายการนี้สร้างจากคำขอดึงโค้ดที่คุณเปิดอยู่

harbor-live-folders-promotion-title = สร้างโฟลเดอร์สดแล้ว!
harbor-live-folders-promotion-description = เนื้อหาล่าสุดจากฟีด RSS หรือคำขอดึงโค้ดบน GitHub จะปรากฏที่นี่โดยอัตโนมัติ
