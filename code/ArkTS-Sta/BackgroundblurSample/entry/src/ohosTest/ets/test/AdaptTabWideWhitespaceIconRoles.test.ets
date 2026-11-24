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

// Reference: ets/test/PerformanceStability/PowerPerformance.test.ets (794 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptTabWideWhitespaceIconRolesTests(): void {
  describe('AdaptTabWideWhitespaceIconRolesTest', (): void => {
    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0001
    // @tc.name AdaptTabWideWhitespaceIconRoles_0001
    // @tc.desc Verify model {"id":4,"title":"","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0001', 0, (): void => {
      const identifier: number = 4;
      const originalTitle: string = "";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0002
    // @tc.name AdaptTabWideWhitespaceIconRoles_0002
    // @tc.desc Verify model {"id":65536,"title":"","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0002', 0, (): void => {
      const identifier: number = 65536;
      const originalTitle: string = "";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0003
    // @tc.name AdaptTabWideWhitespaceIconRoles_0003
    // @tc.desc Verify model {"id":2147483648,"title":"","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0003', 0, (): void => {
      const identifier: number = 2147483648;
      const originalTitle: string = "";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0004
    // @tc.name AdaptTabWideWhitespaceIconRoles_0004
    // @tc.desc Verify model {"id":9007199254740991,"title":"","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0004', 0, (): void => {
      const identifier: number = 9007199254740991;
      const originalTitle: string = "";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0005
    // @tc.name AdaptTabWideWhitespaceIconRoles_0005
    // @tc.desc Verify model {"id":4,"title":" ","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0005', 0, (): void => {
      const identifier: number = 4;
      const originalTitle: string = " ";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0006
    // @tc.name AdaptTabWideWhitespaceIconRoles_0006
    // @tc.desc Verify model {"id":65536,"title":" ","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0006', 0, (): void => {
      const identifier: number = 65536;
      const originalTitle: string = " ";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0007
    // @tc.name AdaptTabWideWhitespaceIconRoles_0007
    // @tc.desc Verify model {"id":2147483648,"title":" ","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0007', 0, (): void => {
      const identifier: number = 2147483648;
      const originalTitle: string = " ";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0008
    // @tc.name AdaptTabWideWhitespaceIconRoles_0008
    // @tc.desc Verify model {"id":9007199254740991,"title":" ","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0008', 0, (): void => {
      const identifier: number = 9007199254740991;
      const originalTitle: string = " ";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0009
    // @tc.name AdaptTabWideWhitespaceIconRoles_0009
    // @tc.desc Verify model {"id":4,"title":"  Home  ","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0009', 0, (): void => {
      const identifier: number = 4;
      const originalTitle: string = "  Home  ";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0010
    // @tc.name AdaptTabWideWhitespaceIconRoles_0010
    // @tc.desc Verify model {"id":65536,"title":"  Home  ","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0010', 0, (): void => {
      const identifier: number = 65536;
      const originalTitle: string = "  Home  ";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0011
    // @tc.name AdaptTabWideWhitespaceIconRoles_0011
    // @tc.desc Verify model {"id":2147483648,"title":"  Home  ","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0011', 0, (): void => {
      const identifier: number = 2147483648;
      const originalTitle: string = "  Home  ";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0012
    // @tc.name AdaptTabWideWhitespaceIconRoles_0012
    // @tc.desc Verify model {"id":9007199254740991,"title":"  Home  ","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0012', 0, (): void => {
      const identifier: number = 9007199254740991;
      const originalTitle: string = "  Home  ";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0013
    // @tc.name AdaptTabWideWhitespaceIconRoles_0013
    // @tc.desc Verify model {"id":4,"title":"Line one\nLine two","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0013', 0, (): void => {
      const identifier: number = 4;
      const originalTitle: string = "Line one\nLine two";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0014
    // @tc.name AdaptTabWideWhitespaceIconRoles_0014
    // @tc.desc Verify model {"id":65536,"title":"Line one\nLine two","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0014', 0, (): void => {
      const identifier: number = 65536;
      const originalTitle: string = "Line one\nLine two";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0015
    // @tc.name AdaptTabWideWhitespaceIconRoles_0015
    // @tc.desc Verify model {"id":2147483648,"title":"Line one\nLine two","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0015', 0, (): void => {
      const identifier: number = 2147483648;
      const originalTitle: string = "Line one\nLine two";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0016
    // @tc.name AdaptTabWideWhitespaceIconRoles_0016
    // @tc.desc Verify model {"id":9007199254740991,"title":"Line one\nLine two","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0016', 0, (): void => {
      const identifier: number = 9007199254740991;
      const originalTitle: string = "Line one\nLine two";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0017
    // @tc.name AdaptTabWideWhitespaceIconRoles_0017
    // @tc.desc Verify model {"id":4,"title":"","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0017', 0, (): void => {
      const identifier: number = 4;
      const originalTitle: string = "";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0018
    // @tc.name AdaptTabWideWhitespaceIconRoles_0018
    // @tc.desc Verify model {"id":65536,"title":"","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0018', 0, (): void => {
      const identifier: number = 65536;
      const originalTitle: string = "";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0019
    // @tc.name AdaptTabWideWhitespaceIconRoles_0019
    // @tc.desc Verify model {"id":2147483648,"title":"","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0019', 0, (): void => {
      const identifier: number = 2147483648;
      const originalTitle: string = "";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0020
    // @tc.name AdaptTabWideWhitespaceIconRoles_0020
    // @tc.desc Verify model {"id":9007199254740991,"title":"","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0020', 0, (): void => {
      const identifier: number = 9007199254740991;
      const originalTitle: string = "";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0021
    // @tc.name AdaptTabWideWhitespaceIconRoles_0021
    // @tc.desc Verify model {"id":4,"title":" ","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0021', 0, (): void => {
      const identifier: number = 4;
      const originalTitle: string = " ";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0022
    // @tc.name AdaptTabWideWhitespaceIconRoles_0022
    // @tc.desc Verify model {"id":65536,"title":" ","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0022', 0, (): void => {
      const identifier: number = 65536;
      const originalTitle: string = " ";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0023
    // @tc.name AdaptTabWideWhitespaceIconRoles_0023
    // @tc.desc Verify model {"id":2147483648,"title":" ","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0023', 0, (): void => {
      const identifier: number = 2147483648;
      const originalTitle: string = " ";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0024
    // @tc.name AdaptTabWideWhitespaceIconRoles_0024
    // @tc.desc Verify model {"id":9007199254740991,"title":" ","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0024', 0, (): void => {
      const identifier: number = 9007199254740991;
      const originalTitle: string = " ";
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEICONROLES_0025
    // @tc.name AdaptTabWideWhitespaceIconRoles_0025
    // @tc.desc Verify model {"id":4,"title":"  Home  ","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceIconRoles_0025', 0, (): void => {
      const identifier: number = 4;
      const originalTitle: string = "  Home  ";
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
