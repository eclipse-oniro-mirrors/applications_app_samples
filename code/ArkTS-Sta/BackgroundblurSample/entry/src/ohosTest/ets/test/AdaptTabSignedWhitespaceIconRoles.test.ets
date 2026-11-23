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

// Reference: ets/test/Interaction/EventPropagation.test.ets (839 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptTabSignedWhitespaceIconRolesTests(): void {
  describe('AdaptTabSignedWhitespaceIconRolesTest', (): void => {
    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0001
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0001
    // @tc.desc Verify model {"id":-1,"title":"","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0001', 0, (): void => {
      const identifier: number = -1;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0002
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0002
    // @tc.desc Verify model {"id":-2,"title":"","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0002', 0, (): void => {
      const identifier: number = -2;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0003
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0003
    // @tc.desc Verify model {"id":-2147483648,"title":"","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0003', 0, (): void => {
      const identifier: number = -2147483648;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0004
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0004
    // @tc.desc Verify model {"id":2147483647,"title":"","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0004', 0, (): void => {
      const identifier: number = 2147483647;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0005
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0005
    // @tc.desc Verify model {"id":-1,"title":" ","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0005', 0, (): void => {
      const identifier: number = -1;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0006
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0006
    // @tc.desc Verify model {"id":-2,"title":" ","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0006', 0, (): void => {
      const identifier: number = -2;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0007
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0007
    // @tc.desc Verify model {"id":-2147483648,"title":" ","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0007', 0, (): void => {
      const identifier: number = -2147483648;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0008
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0008
    // @tc.desc Verify model {"id":2147483647,"title":" ","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0008', 0, (): void => {
      const identifier: number = 2147483647;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0009
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0009
    // @tc.desc Verify model {"id":-1,"title":"  Home  ","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0009', 0, (): void => {
      const identifier: number = -1;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0010
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0010
    // @tc.desc Verify model {"id":-2,"title":"  Home  ","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0010', 0, (): void => {
      const identifier: number = -2;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0011
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0011
    // @tc.desc Verify model {"id":-2147483648,"title":"  Home  ","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0011', 0, (): void => {
      const identifier: number = -2147483648;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0012
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0012
    // @tc.desc Verify model {"id":2147483647,"title":"  Home  ","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0012', 0, (): void => {
      const identifier: number = 2147483647;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0013
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0013
    // @tc.desc Verify model {"id":-1,"title":"Line one\nLine two","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0013', 0, (): void => {
      const identifier: number = -1;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0014
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0014
    // @tc.desc Verify model {"id":-2,"title":"Line one\nLine two","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0014', 0, (): void => {
      const identifier: number = -2;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0015
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0015
    // @tc.desc Verify model {"id":-2147483648,"title":"Line one\nLine two","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0015', 0, (): void => {
      const identifier: number = -2147483648;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0016
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0016
    // @tc.desc Verify model {"id":2147483647,"title":"Line one\nLine two","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0016', 0, (): void => {
      const identifier: number = 2147483647;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0017
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0017
    // @tc.desc Verify model {"id":-1,"title":"","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0017', 0, (): void => {
      const identifier: number = -1;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0018
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0018
    // @tc.desc Verify model {"id":-2,"title":"","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0018', 0, (): void => {
      const identifier: number = -2;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0019
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0019
    // @tc.desc Verify model {"id":-2147483648,"title":"","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0019', 0, (): void => {
      const identifier: number = -2147483648;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0020
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0020
    // @tc.desc Verify model {"id":2147483647,"title":"","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0020', 0, (): void => {
      const identifier: number = 2147483647;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0021
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0021
    // @tc.desc Verify model {"id":-1,"title":" ","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0021', 0, (): void => {
      const identifier: number = -1;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0022
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0022
    // @tc.desc Verify model {"id":-2,"title":" ","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0022', 0, (): void => {
      const identifier: number = -2;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0023
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0023
    // @tc.desc Verify model {"id":-2147483648,"title":" ","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0023', 0, (): void => {
      const identifier: number = -2147483648;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0024
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0024
    // @tc.desc Verify model {"id":2147483647,"title":" ","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0024', 0, (): void => {
      const identifier: number = 2147483647;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0025
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0025
    // @tc.desc Verify model {"id":-1,"title":"  Home  ","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0025', 0, (): void => {
      const identifier: number = -1;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0026
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0026
    // @tc.desc Verify model {"id":-2,"title":"  Home  ","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0026', 0, (): void => {
      const identifier: number = -2;
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDWHITESPACEICONROLES_0027
    // @tc.name AdaptTabSignedWhitespaceIconRoles_0027
    // @tc.desc Verify model {"id":-2147483648,"title":"  Home  ","selected":"","normal":"normal.svg","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedWhitespaceIconRoles_0027', 0, (): void => {
      const identifier: number = -2147483648;
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
