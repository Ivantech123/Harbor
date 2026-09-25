# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = علامات التبويب على اليسار
    .accesskey = ر
harbor-toolbar-context-compact-mode = 
    .label = الوضع المدمج
harbor-toolbar-context-compact-mode-enable = 
    .label = تمكين الوضع المدمج
    .accesskey = د
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = إخفاء الشريط الجانبي
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = إخفاء شريط الأدوات
harbor-toolbar-context-compact-mode-hide-both = 
    .label = إخفاء كليهما
    .accesskey = خ
harbor-toolbar-context-move-to-folder = 
    .label = Move to Folder...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = مجلّد جديد
    .accesskey = ن
sidebar-harbor-expand = 
    .label = توسيع الشريط الجانبي
sidebar-harbor-create-new = 
    .label = إنشاء جديد...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] تفريغ والتبديل إلى علامة التبويب
           *[other] تفريغ { $tabCount } علامات التبويب والتبديل إلى الأولى
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] إعادة تعيين علامة التبويب وتثبيتها
           *[other] إعادة تعيين وتثبيت { $tabCount }
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] العودة إلى الرابط المثبت
        [harbor-default-pinned-cmd] فصل عن علامة التبويب المثبتة
       *[other] { $tabSubtitle }
    }
