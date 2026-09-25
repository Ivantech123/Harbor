/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#include "nsHarborModsBackend.h"

#include "nsIXULRuntime.h"
#include "nsStyleSheetService.h"

#include "mozilla/PresShell.h"
#include "mozilla/dom/ContentParent.h"

#include "nsIURI.h"
#include "nsIFile.h"

#include "HarborStyleSheetCache.h"

namespace harbor {

namespace {
/// @brief Helper function to get the singleton instance of HarborStyleSheetCache.
/// @return A pointer to the singleton instance of HarborStyleSheetCache.
static auto GetHarborStyleSheetCache() -> HarborStyleSheetCache* {
  return HarborStyleSheetCache::Singleton();
}
}  // namespace

// Use the macro to inject all of the definitions for nsISupports.
NS_IMPL_ISUPPORTS(nsHarborModsBackend, nsIHarborModsBackend)

nsHarborModsBackend::nsHarborModsBackend() { (void)CheckEnabled(); }

auto nsHarborModsBackend::CheckEnabled() -> void {
  // Check if the mods backend is enabled based on the preference.
  bool inSafeMode = false;
  if (nsCOMPtr<nsIXULRuntime> appInfo =
          do_GetService("@mozilla.org/xre/app-info;1")) {
    appInfo->GetInSafeMode(&inSafeMode);
  }
  mEnabled = !inSafeMode &&
             !mozilla::Preferences::GetBool("harbor.themes.disable-all", false);
}

auto nsHarborModsBackend::RebuildModsStyles(const nsACString& aContents)
    -> nsresult {
  // Notify that the mods stylesheets have been rebuilt.
  return GetHarborStyleSheetCache()->RebuildModsStylesheets(aContents);
}

}  // namespace harbor

auto nsStyleSheetService::HarborMarkStylesAsChanged() -> void {
  for (auto& presShell : mPresShells) {
    if (presShell) {
      if (auto doc = presShell->GetDocument();
          doc && doc->IsInChromeDocShell()) {
        // Notify the document that styles have changed.
        doc->ApplicableStylesChanged();
      }
    }
  }
}
