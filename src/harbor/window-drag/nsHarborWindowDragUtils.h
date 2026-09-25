/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#ifndef harbor_nsHarborWindowDragUtils_h_
#define harbor_nsHarborWindowDragUtils_h_

#include "nsIHarborWindowDragUtils.h"

#define HARBOR_WINDOW_DRAG_UTILS_CONTRACTID "@mozilla.org/harbor/window-drag-utils;1"

namespace harbor {

class nsHarborWindowDragUtils final : public nsIHarborWindowDragUtils {
  NS_DECL_ISUPPORTS
  NS_DECL_NSIHARBORWINDOWDRAGUTILS

 public:
  nsHarborWindowDragUtils() = default;

 private:
  ~nsHarborWindowDragUtils() = default;
};

}  // namespace harbor

#endif
