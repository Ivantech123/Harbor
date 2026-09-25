/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#ifndef mozilla_HarborStyleSheetCache_h_
#define mozilla_HarborStyleSheetCache_h_

#include "mozilla/css/Loader.h"
#include "mozilla/StaticPtr.h"

#ifndef HARBOR_MODS_FILENAME
#  define HARBOR_MODS_FILENAME u"harbor-themes.css"_ns
#endif

namespace harbor {

class HarborStyleSheetCache final : public nsISupports {
  using StyleSheet = mozilla::StyleSheet;

 public:
  NS_DECL_ISUPPORTS

  /**
   * @brief Get the mods stylesheet.
   * This is called when we need to get the mods stylesheets.
   * @returns The mods stylesheet.
   */
  auto GetModsSheet() -> StyleSheet*;

  /**
   * @brief Rebuild the mods stylesheets.
   * This is re-parses the mods stylesheet and applies it to all
   * the connected documents.
   * @param aContents The contents of the mods stylesheet.
   * @returns NS_OK on success, or an error code on failure.
   */
  nsresult RebuildModsStylesheets(const nsACString& aContents);

  static auto Singleton() -> HarborStyleSheetCache*;

 private:
  HarborStyleSheetCache() = default;
  ~HarborStyleSheetCache() = default;

  /**
   * @brief Load the stylesheet from the given file.
   * @param aFile The file to load the stylesheet from.
   */
  auto LoadSheetFile(nsIFile* aFile, mozilla::StyleOrigin aOrigin) -> void;

  static mozilla::StaticRefPtr<HarborStyleSheetCache> gHarborModsCache;

  RefPtr<StyleSheet> mModsSheet;
};

}  // namespace harbor

#endif
