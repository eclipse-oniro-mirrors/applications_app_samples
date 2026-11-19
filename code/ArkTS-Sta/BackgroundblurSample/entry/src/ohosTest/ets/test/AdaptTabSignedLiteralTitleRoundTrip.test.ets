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

// Reference: ets/test/Interaction/TouchInteraction.test.ets (933 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptTabSignedLiteralTitleRoundTripTests(): void {
  describe('AdaptTabSignedLiteralTitleRoundTripTest', (): void => {
    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0001
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0001
    // @tc.desc Verify model {"id":-1,"title":"<b>Tab</b>","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0001', 0, (): void => {
      const identifier: number = -1;
      const originalTitle: string = "<b>Tab</b>";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0002
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0002
    // @tc.desc Verify model {"id":-2,"title":"<b>Tab</b>","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0002', 0, (): void => {
      const identifier: number = -2;
      const originalTitle: string = "<b>Tab</b>";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0003
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0003
    // @tc.desc Verify model {"id":-2147483648,"title":"<b>Tab</b>","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0003', 0, (): void => {
      const identifier: number = -2147483648;
      const originalTitle: string = "<b>Tab</b>";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0004
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0004
    // @tc.desc Verify model {"id":2147483647,"title":"<b>Tab</b>","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0004', 0, (): void => {
      const identifier: number = 2147483647;
      const originalTitle: string = "<b>Tab</b>";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0005
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0005
    // @tc.desc Verify model {"id":-1,"title":"$r(app.string.tab)","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0005', 0, (): void => {
      const identifier: number = -1;
      const originalTitle: string = "$r(app.string.tab)";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0006
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0006
    // @tc.desc Verify model {"id":-2,"title":"$r(app.string.tab)","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0006', 0, (): void => {
      const identifier: number = -2;
      const originalTitle: string = "$r(app.string.tab)";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0007
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0007
    // @tc.desc Verify model {"id":-2147483648,"title":"$r(app.string.tab)","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0007', 0, (): void => {
      const identifier: number = -2147483648;
      const originalTitle: string = "$r(app.string.tab)";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0008
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0008
    // @tc.desc Verify model {"id":2147483647,"title":"$r(app.string.tab)","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0008', 0, (): void => {
      const identifier: number = 2147483647;
      const originalTitle: string = "$r(app.string.tab)";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0009
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0009
    // @tc.desc Verify model {"id":-1,"title":"tab://home?x=1&y=2","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0009', 0, (): void => {
      const identifier: number = -1;
      const originalTitle: string = "tab://home?x=1&y=2";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0010
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0010
    // @tc.desc Verify model {"id":-2,"title":"tab://home?x=1&y=2","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0010', 0, (): void => {
      const identifier: number = -2;
      const originalTitle: string = "tab://home?x=1&y=2";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0011
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0011
    // @tc.desc Verify model {"id":-2147483648,"title":"tab://home?x=1&y=2","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0011', 0, (): void => {
      const identifier: number = -2147483648;
      const originalTitle: string = "tab://home?x=1&y=2";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0012
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0012
    // @tc.desc Verify model {"id":2147483647,"title":"tab://home?x=1&y=2","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0012', 0, (): void => {
      const identifier: number = 2147483647;
      const originalTitle: string = "tab://home?x=1&y=2";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0013
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0013
    // @tc.desc Verify model {"id":-1,"title":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0013', 0, (): void => {
      const identifier: number = -1;
      const originalTitle: string = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0014
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0014
    // @tc.desc Verify model {"id":-2,"title":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0014', 0, (): void => {
      const identifier: number = -2;
      const originalTitle: string = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0015
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0015
    // @tc.desc Verify model {"id":-2147483648,"title":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0015', 0, (): void => {
      const identifier: number = -2147483648;
      const originalTitle: string = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0016
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0016
    // @tc.desc Verify model {"id":2147483647,"title":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","selected":"selected.png","normal":"normal.png","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0016', 0, (): void => {
      const identifier: number = 2147483647;
      const originalTitle: string = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0017
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0017
    // @tc.desc Verify model {"id":-1,"title":"<b>Tab</b>","selected":"","normal":"normal.svg","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0017', 0, (): void => {
      const identifier: number = -1;
      const originalTitle: string = "<b>Tab</b>";
      const selectedIcon: string = "";
      const defaultIcon: string = "normal.svg";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0018
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0018
    // @tc.desc Verify model {"id":-2,"title":"<b>Tab</b>","selected":"","normal":"normal.svg","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0018', 0, (): void => {
      const identifier: number = -2;
      const originalTitle: string = "<b>Tab</b>";
      const selectedIcon: string = "";
      const defaultIcon: string = "normal.svg";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0019
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0019
    // @tc.desc Verify model {"id":-2147483648,"title":"<b>Tab</b>","selected":"","normal":"normal.svg","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0019', 0, (): void => {
      const identifier: number = -2147483648;
      const originalTitle: string = "<b>Tab</b>";
      const selectedIcon: string = "";
      const defaultIcon: string = "normal.svg";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0020
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0020
    // @tc.desc Verify model {"id":2147483647,"title":"<b>Tab</b>","selected":"","normal":"normal.svg","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0020', 0, (): void => {
      const identifier: number = 2147483647;
      const originalTitle: string = "<b>Tab</b>";
      const selectedIcon: string = "";
      const defaultIcon: string = "normal.svg";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0021
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0021
    // @tc.desc Verify model {"id":-1,"title":"$r(app.string.tab)","selected":"","normal":"normal.svg","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0021', 0, (): void => {
      const identifier: number = -1;
      const originalTitle: string = "$r(app.string.tab)";
      const selectedIcon: string = "";
      const defaultIcon: string = "normal.svg";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0022
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0022
    // @tc.desc Verify model {"id":-2,"title":"$r(app.string.tab)","selected":"","normal":"normal.svg","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0022', 0, (): void => {
      const identifier: number = -2;
      const originalTitle: string = "$r(app.string.tab)";
      const selectedIcon: string = "";
      const defaultIcon: string = "normal.svg";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0023
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0023
    // @tc.desc Verify model {"id":-2147483648,"title":"$r(app.string.tab)","selected":"","normal":"normal.svg","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0023', 0, (): void => {
      const identifier: number = -2147483648;
      const originalTitle: string = "$r(app.string.tab)";
      const selectedIcon: string = "";
      const defaultIcon: string = "normal.svg";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0024
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0024
    // @tc.desc Verify model {"id":2147483647,"title":"$r(app.string.tab)","selected":"","normal":"normal.svg","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0024', 0, (): void => {
      const identifier: number = 2147483647;
      const originalTitle: string = "$r(app.string.tab)";
      const selectedIcon: string = "";
      const defaultIcon: string = "normal.svg";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0025
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0025
    // @tc.desc Verify model {"id":-1,"title":"tab://home?x=1&y=2","selected":"","normal":"normal.svg","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0025', 0, (): void => {
      const identifier: number = -1;
      const originalTitle: string = "tab://home?x=1&y=2";
      const selectedIcon: string = "";
      const defaultIcon: string = "normal.svg";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0026
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0026
    // @tc.desc Verify model {"id":-2,"title":"tab://home?x=1&y=2","selected":"","normal":"normal.svg","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0026', 0, (): void => {
      const identifier: number = -2;
      const originalTitle: string = "tab://home?x=1&y=2";
      const selectedIcon: string = "";
      const defaultIcon: string = "normal.svg";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0027
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0027
    // @tc.desc Verify model {"id":-2147483648,"title":"tab://home?x=1&y=2","selected":"","normal":"normal.svg","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0027', 0, (): void => {
      const identifier: number = -2147483648;
      const originalTitle: string = "tab://home?x=1&y=2";
      const selectedIcon: string = "";
      const defaultIcon: string = "normal.svg";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0028
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0028
    // @tc.desc Verify model {"id":2147483647,"title":"tab://home?x=1&y=2","selected":"","normal":"normal.svg","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0028', 0, (): void => {
      const identifier: number = 2147483647;
      const originalTitle: string = "tab://home?x=1&y=2";
      const selectedIcon: string = "";
      const defaultIcon: string = "normal.svg";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0029
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0029
    // @tc.desc Verify model {"id":-1,"title":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","selected":"","normal":"normal.svg","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0029', 0, (): void => {
      const identifier: number = -1;
      const originalTitle: string = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
      const selectedIcon: string = "";
      const defaultIcon: string = "normal.svg";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALTITLEROUNDTRIP_0030
    // @tc.name AdaptTabSignedLiteralTitleRoundTrip_0030
    // @tc.desc Verify model {"id":-2,"title":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","selected":"","normal":"normal.svg","operation":"TitleRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralTitleRoundTrip_0030', 0, (): void => {
      const identifier: number = -2;
      const originalTitle: string = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
      const selectedIcon: string = "";
      const defaultIcon: string = "normal.svg";
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
