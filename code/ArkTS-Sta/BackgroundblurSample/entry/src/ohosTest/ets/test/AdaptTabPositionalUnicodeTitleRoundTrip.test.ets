/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { TabInfoFixture as TabInfo } from '../fixtures/TabInfoFixture';

// Reference: ets/test/Integration/NetworkConnectivity.test.ets (109 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptTabPositionalUnicodeTitleRoundTripTests(): void {
  describe('AdaptTabPositionalUnicodeTitleRoundTripTest', (): void => {
    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALUNICODETITLEROUNDTRIP_0001
    // @tc.name AdaptTabPositionalUnicodeTitleRoundTrip_0001
    // @tc.desc Verify model {"id":0,"title":"\u80cc\u666f\u6a21\u7cca","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalUnicodeTitleRoundTrip_0001', 0, (): void => {
      const identifier: number = 0;
      const originalTitle: string = "\u80cc\u666f\u6a21\u7cca";
      const selectedIcon: string = "selected.png";
      const defaultIcon: string = "normal.png";
      const primary = new TabInfo(identifier, originalTitle, selectedIcon, defaultIcon);
      const sibling = new TabInfo(identifier, originalTitle, selectedIcon, defaultIcon);
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary === sibling).assertFalse();
      const replacementTitle: string = 'Updated:' + originalTitle;
      primary.title = replacementTitle;
      expect(primary.title).assertEqual(replacementTitle);
      expect(primary.id).assertEqual(identifier);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.title).assertEqual(originalTitle);
      primary.title = '';
      expect(primary.title).assertEqual('');
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      primary.title = originalTitle;
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALUNICODETITLEROUNDTRIP_0002
    // @tc.name AdaptTabPositionalUnicodeTitleRoundTrip_0002
    // @tc.desc Verify model {"id":1,"title":"\u80cc\u666f\u6a21\u7cca","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalUnicodeTitleRoundTrip_0002', 0, (): void => {
      const identifier: number = 1;
      const originalTitle: string = "\u80cc\u666f\u6a21\u7cca";
      const selectedIcon: string = "selected.png";
      const defaultIcon: string = "normal.png";
      const primary = new TabInfo(identifier, originalTitle, selectedIcon, defaultIcon);
      const sibling = new TabInfo(identifier, originalTitle, selectedIcon, defaultIcon);
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary === sibling).assertFalse();
      const replacementTitle: string = 'Updated:' + originalTitle;
      primary.title = replacementTitle;
      expect(primary.title).assertEqual(replacementTitle);
      expect(primary.id).assertEqual(identifier);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.title).assertEqual(originalTitle);
      primary.title = '';
      expect(primary.title).assertEqual('');
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      primary.title = originalTitle;
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALUNICODETITLEROUNDTRIP_0003
    // @tc.name AdaptTabPositionalUnicodeTitleRoundTrip_0003
    // @tc.desc Verify model {"id":2,"title":"\u80cc\u666f\u6a21\u7cca","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalUnicodeTitleRoundTrip_0003', 0, (): void => {
      const identifier: number = 2;
      const originalTitle: string = "\u80cc\u666f\u6a21\u7cca";
      const selectedIcon: string = "selected.png";
      const defaultIcon: string = "normal.png";
      const primary = new TabInfo(identifier, originalTitle, selectedIcon, defaultIcon);
      const sibling = new TabInfo(identifier, originalTitle, selectedIcon, defaultIcon);
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary === sibling).assertFalse();
      const replacementTitle: string = 'Updated:' + originalTitle;
      primary.title = replacementTitle;
      expect(primary.title).assertEqual(replacementTitle);
      expect(primary.id).assertEqual(identifier);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.title).assertEqual(originalTitle);
      primary.title = '';
      expect(primary.title).assertEqual('');
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      primary.title = originalTitle;
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALUNICODETITLEROUNDTRIP_0004
    // @tc.name AdaptTabPositionalUnicodeTitleRoundTrip_0004
    // @tc.desc Verify model {"id":3,"title":"\u80cc\u666f\u6a21\u7cca","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalUnicodeTitleRoundTrip_0004', 0, (): void => {
      const identifier: number = 3;
      const originalTitle: string = "\u80cc\u666f\u6a21\u7cca";
      const selectedIcon: string = "selected.png";
      const defaultIcon: string = "normal.png";
      const primary = new TabInfo(identifier, originalTitle, selectedIcon, defaultIcon);
      const sibling = new TabInfo(identifier, originalTitle, selectedIcon, defaultIcon);
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary === sibling).assertFalse();
      const replacementTitle: string = 'Updated:' + originalTitle;
      primary.title = replacementTitle;
      expect(primary.title).assertEqual(replacementTitle);
      expect(primary.id).assertEqual(identifier);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.title).assertEqual(originalTitle);
      primary.title = '';
      expect(primary.title).assertEqual('');
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      primary.title = originalTitle;
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });
  });
}
