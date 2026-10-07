# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right =
    .label = علامات التبويب على اليمين
    .accesskey = ي

harbor-toolbar-context-compact-mode =
    .label = الوضع المضغوط
harbor-toolbar-context-compact-mode-enable =
    .label = تمكين الوضع المضغوط
    .accesskey = ت
harbor-toolbar-context-compact-mode-just-tabs =
    .label = إخفاء الشريط الجانبي
harbor-toolbar-context-compact-mode-just-toolbar =
    .label = إخفاء شريط الأدوات
harbor-toolbar-context-compact-mode-hide-both =
    .label = إخفاء كليهما
    .accesskey = ك

harbor-toolbar-context-move-to-folder =
    .label = نقل إلى مجلد
    .accesskey = ن

harbor-toolbar-context-new-folder =
    .label = مجلد جديد
    .accesskey = ج

sidebar-harbor-expand =
  .label = توسيع الشريط الجانبي

sidebar-harbor-create-new =
  .label = إنشاء جديد

tabbrowser-unload-tab-button =
.tooltiptext =
    { $tabCount ->
        [one] إلغاء تحميل علامة التبويب والتبديل إليها
        *[other] إلغاء تحميل { $tabCount } من علامات التبويب والتبديل إلى علامة التبويب الأولى
    }

tabbrowser-reset-pin-button =
.tooltiptext =
    { $tabCount ->
        [one] إعادة تعيين علامة التبويب وتثبيتها
        *[other] إعادة تعيين { $tabCount } من علامات التبويب وتثبيتها
    }

harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] العودة إلى الرابط المثبّت
        [harbor-default-pinned-cmd] فصل عن علامة التبويب المثبّتة
        *[other] { $tabSubtitle }
    }
