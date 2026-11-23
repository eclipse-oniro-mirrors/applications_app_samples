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

// Reference: ets/test/LifecycleState/ResourceManagement.test.ets (379 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptTabFractionalUnicodeTitleRoundTripTests(): void {
  describe('AdaptTabFractionalUnicodeTitleRoundTripTest', (): void => {
    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALUNICODETITLEROUNDTRIP_0001
    // @tc.name AdaptTabFractionalUnicodeTitleRoundTrip_0001
    // @tc.desc Verify model {"id":-0.5,"title":"\u80cc\u666f\u6a21\u7cca","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalUnicodeTitleRoundTrip_0001', 0, (): void => {
      const identifier: number = -0.5;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALUNICODETITLEROUNDTRIP_0002
    // @tc.name AdaptTabFractionalUnicodeTitleRoundTrip_0002
    // @tc.desc Verify model {"id":0.5,"title":"\u80cc\u666f\u6a21\u7cca","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalUnicodeTitleRoundTrip_0002', 0, (): void => {
      const identifier: number = 0.5;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALUNICODETITLEROUNDTRIP_0003
    // @tc.name AdaptTabFractionalUnicodeTitleRoundTrip_0003
    // @tc.desc Verify model {"id":1.25,"title":"\u80cc\u666f\u6a21\u7cca","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalUnicodeTitleRoundTrip_0003', 0, (): void => {
      const identifier: number = 1.25;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALUNICODETITLEROUNDTRIP_0004
    // @tc.name AdaptTabFractionalUnicodeTitleRoundTrip_0004
    // @tc.desc Verify model {"id":3.75,"title":"\u80cc\u666f\u6a21\u7cca","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalUnicodeTitleRoundTrip_0004', 0, (): void => {
      const identifier: number = 3.75;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALUNICODETITLEROUNDTRIP_0005
    // @tc.name AdaptTabFractionalUnicodeTitleRoundTrip_0005
    // @tc.desc Verify model {"id":-0.5,"title":"\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalUnicodeTitleRoundTrip_0005', 0, (): void => {
      const identifier: number = -0.5;
      const originalTitle: string = "\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629";
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALUNICODETITLEROUNDTRIP_0006
    // @tc.name AdaptTabFractionalUnicodeTitleRoundTrip_0006
    // @tc.desc Verify model {"id":0.5,"title":"\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalUnicodeTitleRoundTrip_0006', 0, (): void => {
      const identifier: number = 0.5;
      const originalTitle: string = "\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629";
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALUNICODETITLEROUNDTRIP_0007
    // @tc.name AdaptTabFractionalUnicodeTitleRoundTrip_0007
    // @tc.desc Verify model {"id":1.25,"title":"\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalUnicodeTitleRoundTrip_0007', 0, (): void => {
      const identifier: number = 1.25;
      const originalTitle: string = "\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629";
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALUNICODETITLEROUNDTRIP_0008
    // @tc.name AdaptTabFractionalUnicodeTitleRoundTrip_0008
    // @tc.desc Verify model {"id":3.75,"title":"\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalUnicodeTitleRoundTrip_0008', 0, (): void => {
      const identifier: number = 3.75;
      const originalTitle: string = "\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629";
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALUNICODETITLEROUNDTRIP_0009
    // @tc.name AdaptTabFractionalUnicodeTitleRoundTrip_0009
    // @tc.desc Verify model {"id":-0.5,"title":"e\u0301","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalUnicodeTitleRoundTrip_0009', 0, (): void => {
      const identifier: number = -0.5;
      const originalTitle: string = "e\u0301";
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALUNICODETITLEROUNDTRIP_0010
    // @tc.name AdaptTabFractionalUnicodeTitleRoundTrip_0010
    // @tc.desc Verify model {"id":0.5,"title":"e\u0301","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalUnicodeTitleRoundTrip_0010', 0, (): void => {
      const identifier: number = 0.5;
      const originalTitle: string = "e\u0301";
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALUNICODETITLEROUNDTRIP_0011
    // @tc.name AdaptTabFractionalUnicodeTitleRoundTrip_0011
    // @tc.desc Verify model {"id":1.25,"title":"e\u0301","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalUnicodeTitleRoundTrip_0011', 0, (): void => {
      const identifier: number = 1.25;
      const originalTitle: string = "e\u0301";
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALUNICODETITLEROUNDTRIP_0012
    // @tc.name AdaptTabFractionalUnicodeTitleRoundTrip_0012
    // @tc.desc Verify model {"id":3.75,"title":"e\u0301","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalUnicodeTitleRoundTrip_0012', 0, (): void => {
      const identifier: number = 3.75;
      const originalTitle: string = "e\u0301";
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
