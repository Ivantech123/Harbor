/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#include "gtest/gtest.h"

#include "mozilla/nsHarborBoostsBackend.h"

using harbor::nsHarborBoostsBackend;

namespace {

const nscolor kResolveColors[] = {
    NS_RGBA(0, 0, 0, 255),       NS_RGBA(255, 255, 255, 255),
    NS_RGBA(128, 128, 128, 255), NS_RGBA(255, 0, 0, 255),
    NS_RGBA(0, 255, 0, 255),     NS_RGBA(0, 0, 255, 255),
    NS_RGBA(40, 44, 52, 255),    NS_RGBA(248, 248, 248, 255),
    NS_RGBA(20, 22, 28, 255),    NS_RGBA(80, 80, 80, 200),
    NS_RGBA(240, 17, 99, 1),     NS_RGBA(0, 0, 0, 0),
};

}  // namespace

// Removing the null-frame guard would crash chrome-process callers that
// legitimately pass nullptr (canvas getComputedStyle, font-palette binding,
// the StyleColor(nscolor)/StyleColor(StyleAbsoluteColor) overloads).
TEST(HarborBoostsResolveStyleColor, NullFrameIsIdentity)
{
  for (nscolor c : kResolveColors) {
    EXPECT_EQ(nsHarborBoostsBackend::ResolveStyleColor(c, nullptr), c);
  }
}

TEST(HarborBoostsResolveStyleColor, NullFrameIsIdempotent)
{
  for (nscolor c : kResolveColors) {
    nscolor once = nsHarborBoostsBackend::ResolveStyleColor(c, nullptr);
    nscolor twice = nsHarborBoostsBackend::ResolveStyleColor(once, nullptr);
    EXPECT_EQ(once, c);
    EXPECT_EQ(twice, c);
  }
}
