/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#ifndef mozilla_HarborModsBackend_h_
#define mozilla_HarborModsBackend_h_

#include "nsIHarborModsBackend.h"
#include "nsIHarborCommonUtils.h"

#include "mozilla/ServoStyleSet.h"
#include "mozilla/dom/Document.h"

namespace harbor {

class nsHarborModsBackend final : public nsIHarborModsBackend {
  NS_DECL_ISUPPORTS
  NS_DECL_NSIHARBORMODSBACKEND

 public:
  explicit nsHarborModsBackend();

 protected:
  /**
   * @brief Check for the preference and see if the app is on safe mode.
   */
  auto CheckEnabled() -> void;

 private:
  ~nsHarborModsBackend() = default;
  bool mEnabled = false;
};

}  // namespace harbor

#endif
