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

// Reference: ets/test/Interaction/AccessibilityNavigation.test.ets (920 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptTabPositionalLiteralIconRolesTests(): void {
  describe('AdaptTabPositionalLiteralIconRolesTest', (): void => {
    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0001
    // @tc.name AdaptTabPositionalLiteralIconRoles_0001
    // @tc.desc Verify model {"id":0,"title":"<b>Tab</b>","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0001', 0, (): void => {
      const identifier: number = 0;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0002
    // @tc.name AdaptTabPositionalLiteralIconRoles_0002
    // @tc.desc Verify model {"id":1,"title":"<b>Tab</b>","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0002', 0, (): void => {
      const identifier: number = 1;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0003
    // @tc.name AdaptTabPositionalLiteralIconRoles_0003
    // @tc.desc Verify model {"id":2,"title":"<b>Tab</b>","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0003', 0, (): void => {
      const identifier: number = 2;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0004
    // @tc.name AdaptTabPositionalLiteralIconRoles_0004
    // @tc.desc Verify model {"id":3,"title":"<b>Tab</b>","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0004', 0, (): void => {
      const identifier: number = 3;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0005
    // @tc.name AdaptTabPositionalLiteralIconRoles_0005
    // @tc.desc Verify model {"id":0,"title":"$r(app.string.tab)","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0005', 0, (): void => {
      const identifier: number = 0;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0006
    // @tc.name AdaptTabPositionalLiteralIconRoles_0006
    // @tc.desc Verify model {"id":1,"title":"$r(app.string.tab)","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0006', 0, (): void => {
      const identifier: number = 1;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0007
    // @tc.name AdaptTabPositionalLiteralIconRoles_0007
    // @tc.desc Verify model {"id":2,"title":"$r(app.string.tab)","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0007', 0, (): void => {
      const identifier: number = 2;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0008
    // @tc.name AdaptTabPositionalLiteralIconRoles_0008
    // @tc.desc Verify model {"id":3,"title":"$r(app.string.tab)","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0008', 0, (): void => {
      const identifier: number = 3;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0009
    // @tc.name AdaptTabPositionalLiteralIconRoles_0009
    // @tc.desc Verify model {"id":0,"title":"tab://home?x=1&y=2","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0009', 0, (): void => {
      const identifier: number = 0;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0010
    // @tc.name AdaptTabPositionalLiteralIconRoles_0010
    // @tc.desc Verify model {"id":1,"title":"tab://home?x=1&y=2","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0010', 0, (): void => {
      const identifier: number = 1;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0011
    // @tc.name AdaptTabPositionalLiteralIconRoles_0011
    // @tc.desc Verify model {"id":2,"title":"tab://home?x=1&y=2","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0011', 0, (): void => {
      const identifier: number = 2;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0012
    // @tc.name AdaptTabPositionalLiteralIconRoles_0012
    // @tc.desc Verify model {"id":3,"title":"tab://home?x=1&y=2","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0012', 0, (): void => {
      const identifier: number = 3;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0013
    // @tc.name AdaptTabPositionalLiteralIconRoles_0013
    // @tc.desc Verify model {"id":0,"title":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0013', 0, (): void => {
      const identifier: number = 0;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0014
    // @tc.name AdaptTabPositionalLiteralIconRoles_0014
    // @tc.desc Verify model {"id":1,"title":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0014', 0, (): void => {
      const identifier: number = 1;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0015
    // @tc.name AdaptTabPositionalLiteralIconRoles_0015
    // @tc.desc Verify model {"id":2,"title":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0015', 0, (): void => {
      const identifier: number = 2;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0016
    // @tc.name AdaptTabPositionalLiteralIconRoles_0016
    // @tc.desc Verify model {"id":3,"title":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0016', 0, (): void => {
      const identifier: number = 3;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0017
    // @tc.name AdaptTabPositionalLiteralIconRoles_0017
    // @tc.desc Verify model {"id":0,"title":"<b>Tab</b>","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0017', 0, (): void => {
      const identifier: number = 0;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0018
    // @tc.name AdaptTabPositionalLiteralIconRoles_0018
    // @tc.desc Verify model {"id":1,"title":"<b>Tab</b>","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0018', 0, (): void => {
      const identifier: number = 1;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0019
    // @tc.name AdaptTabPositionalLiteralIconRoles_0019
    // @tc.desc Verify model {"id":2,"title":"<b>Tab</b>","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0019', 0, (): void => {
      const identifier: number = 2;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0020
    // @tc.name AdaptTabPositionalLiteralIconRoles_0020
    // @tc.desc Verify model {"id":3,"title":"<b>Tab</b>","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0020', 0, (): void => {
      const identifier: number = 3;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0021
    // @tc.name AdaptTabPositionalLiteralIconRoles_0021
    // @tc.desc Verify model {"id":0,"title":"$r(app.string.tab)","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0021', 0, (): void => {
      const identifier: number = 0;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0022
    // @tc.name AdaptTabPositionalLiteralIconRoles_0022
    // @tc.desc Verify model {"id":1,"title":"$r(app.string.tab)","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0022', 0, (): void => {
      const identifier: number = 1;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0023
    // @tc.name AdaptTabPositionalLiteralIconRoles_0023
    // @tc.desc Verify model {"id":2,"title":"$r(app.string.tab)","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0023', 0, (): void => {
      const identifier: number = 2;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0024
    // @tc.name AdaptTabPositionalLiteralIconRoles_0024
    // @tc.desc Verify model {"id":3,"title":"$r(app.string.tab)","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0024', 0, (): void => {
      const identifier: number = 3;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0025
    // @tc.name AdaptTabPositionalLiteralIconRoles_0025
    // @tc.desc Verify model {"id":0,"title":"tab://home?x=1&y=2","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0025', 0, (): void => {
      const identifier: number = 0;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0026
    // @tc.name AdaptTabPositionalLiteralIconRoles_0026
    // @tc.desc Verify model {"id":1,"title":"tab://home?x=1&y=2","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0026', 0, (): void => {
      const identifier: number = 1;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0027
    // @tc.name AdaptTabPositionalLiteralIconRoles_0027
    // @tc.desc Verify model {"id":2,"title":"tab://home?x=1&y=2","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0027', 0, (): void => {
      const identifier: number = 2;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0028
    // @tc.name AdaptTabPositionalLiteralIconRoles_0028
    // @tc.desc Verify model {"id":3,"title":"tab://home?x=1&y=2","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0028', 0, (): void => {
      const identifier: number = 3;
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

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALLITERALICONROLES_0029
    // @tc.name AdaptTabPositionalLiteralIconRoles_0029
    // @tc.desc Verify model {"id":0,"title":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalLiteralIconRoles_0029', 0, (): void => {
      const identifier: number = 0;
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
