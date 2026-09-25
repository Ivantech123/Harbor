# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

<panel type="arrow" orient="vertical" id="PanelUI-harbor-emojis-picker" position="bottomright topright" side="bottom">
  <hbox id="PanelUI-harbor-picker-header">
    <toolbarbutton class="toolbarbutton-1" />
    <hbox id="PanelUI-harbor-emojis-buttons-wrapper">
      <toolbarbutton id="PanelUI-harbor-emojis-picker-change-emojis" class="selected" data-l10n-id="harbor-icons-picker-emoji" />
      <toolbarbutton id="PanelUI-harbor-emojis-picker-change-svg" data-l10n-id="harbor-icons-picker-svg" />
    </hbox>
    <toolbarbutton id="PanelUI-harbor-emojis-picker-none" class="toolbarbutton-1" />
  </hbox>
  <hbox id="PanelUI-harbor-emojis-picker-pages">
    <vbox emojis="true">
      <hbox id="PanelUI-harbor-emojis-picker-header">
        <html:input type="search" id="PanelUI-harbor-emojis-picker-search" data-l10n-id="harbor-emojis-picker-search" />
      </hbox>
      <hbox id="PanelUI-harbor-emojis-picker-list" />
    </vbox>
    <hbox svgs="true" id="PanelUI-harbor-emojis-picker-svgs" />
  </hbox>
</panel>
