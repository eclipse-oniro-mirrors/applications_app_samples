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

// Reference: ets/test/Interaction/UIComponentRendering.test.ets (760 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptTabSignedLiteralIconRolesTests(): void {
  describe('AdaptTabSignedLiteralIconRolesTest', (): void => {
    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0001
    // @tc.name AdaptTabSignedLiteralIconRoles_0001
    // @tc.desc Verify model {"id":-1,"title":"<b>Tab</b>","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0001', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0002
    // @tc.name AdaptTabSignedLiteralIconRoles_0002
    // @tc.desc Verify model {"id":-2,"title":"<b>Tab</b>","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0002', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0003
    // @tc.name AdaptTabSignedLiteralIconRoles_0003
    // @tc.desc Verify model {"id":-2147483648,"title":"<b>Tab</b>","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0003', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0004
    // @tc.name AdaptTabSignedLiteralIconRoles_0004
    // @tc.desc Verify model {"id":2147483647,"title":"<b>Tab</b>","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0004', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0005
    // @tc.name AdaptTabSignedLiteralIconRoles_0005
    // @tc.desc Verify model {"id":-1,"title":"$r(app.string.tab)","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0005', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0006
    // @tc.name AdaptTabSignedLiteralIconRoles_0006
    // @tc.desc Verify model {"id":-2,"title":"$r(app.string.tab)","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0006', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0007
    // @tc.name AdaptTabSignedLiteralIconRoles_0007
    // @tc.desc Verify model {"id":-2147483648,"title":"$r(app.string.tab)","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0007', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0008
    // @tc.name AdaptTabSignedLiteralIconRoles_0008
    // @tc.desc Verify model {"id":2147483647,"title":"$r(app.string.tab)","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0008', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0009
    // @tc.name AdaptTabSignedLiteralIconRoles_0009
    // @tc.desc Verify model {"id":-1,"title":"tab://home?x=1&y=2","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0009', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0010
    // @tc.name AdaptTabSignedLiteralIconRoles_0010
    // @tc.desc Verify model {"id":-2,"title":"tab://home?x=1&y=2","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0010', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0011
    // @tc.name AdaptTabSignedLiteralIconRoles_0011
    // @tc.desc Verify model {"id":-2147483648,"title":"tab://home?x=1&y=2","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0011', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0012
    // @tc.name AdaptTabSignedLiteralIconRoles_0012
    // @tc.desc Verify model {"id":2147483647,"title":"tab://home?x=1&y=2","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0012', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0013
    // @tc.name AdaptTabSignedLiteralIconRoles_0013
    // @tc.desc Verify model {"id":-1,"title":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0013', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0014
    // @tc.name AdaptTabSignedLiteralIconRoles_0014
    // @tc.desc Verify model {"id":-2,"title":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0014', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0015
    // @tc.name AdaptTabSignedLiteralIconRoles_0015
    // @tc.desc Verify model {"id":-2147483648,"title":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0015', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0016
    // @tc.name AdaptTabSignedLiteralIconRoles_0016
    // @tc.desc Verify model {"id":2147483647,"title":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0016', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0017
    // @tc.name AdaptTabSignedLiteralIconRoles_0017
    // @tc.desc Verify model {"id":-1,"title":"<b>Tab</b>","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0017', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0018
    // @tc.name AdaptTabSignedLiteralIconRoles_0018
    // @tc.desc Verify model {"id":-2,"title":"<b>Tab</b>","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0018', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0019
    // @tc.name AdaptTabSignedLiteralIconRoles_0019
    // @tc.desc Verify model {"id":-2147483648,"title":"<b>Tab</b>","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0019', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0020
    // @tc.name AdaptTabSignedLiteralIconRoles_0020
    // @tc.desc Verify model {"id":2147483647,"title":"<b>Tab</b>","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0020', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0021
    // @tc.name AdaptTabSignedLiteralIconRoles_0021
    // @tc.desc Verify model {"id":-1,"title":"$r(app.string.tab)","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0021', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0022
    // @tc.name AdaptTabSignedLiteralIconRoles_0022
    // @tc.desc Verify model {"id":-2,"title":"$r(app.string.tab)","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0022', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0023
    // @tc.name AdaptTabSignedLiteralIconRoles_0023
    // @tc.desc Verify model {"id":-2147483648,"title":"$r(app.string.tab)","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0023', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDLITERALICONROLES_0024
    // @tc.name AdaptTabSignedLiteralIconRoles_0024
    // @tc.desc Verify model {"id":2147483647,"title":"$r(app.string.tab)","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedLiteralIconRoles_0024', 0, (): void => {
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
      const nextSelected: string = 'selected-next:' + selectedIcon;
      const nextDefault: string = 'default-next:' + defaultIcon;
      primary.selectedIcon = nextSelected;
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(primary.title).assertEqual(originalTitle);
      primary.defaultIcon = nextDefault;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      expect(primary.selectedIcon).assertEqual(nextSelected);
      expect(primary.id).assertEqual(identifier);
      primary.selectedIcon = selectedIcon;
      expect(primary.defaultIcon).assertEqual(nextDefault);
      primary.defaultIcon = defaultIcon;
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
