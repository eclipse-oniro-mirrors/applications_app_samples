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

// Reference: ets/test/Interaction/DataBinding.test.ets (408 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptTabSignedPlainIconRolesTests(): void {
  describe('AdaptTabSignedPlainIconRolesTest', (): void => {
    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDPLAINICONROLES_0001
    // @tc.name AdaptTabSignedPlainIconRoles_0001
    // @tc.desc Verify model {"id":-1,"title":"Home","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedPlainIconRoles_0001', 0, (): void => {
      const identifier: number = -1;
      const originalTitle: string = "Home";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDPLAINICONROLES_0002
    // @tc.name AdaptTabSignedPlainIconRoles_0002
    // @tc.desc Verify model {"id":-2,"title":"Home","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedPlainIconRoles_0002', 0, (): void => {
      const identifier: number = -2;
      const originalTitle: string = "Home";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDPLAINICONROLES_0003
    // @tc.name AdaptTabSignedPlainIconRoles_0003
    // @tc.desc Verify model {"id":-2147483648,"title":"Home","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedPlainIconRoles_0003', 0, (): void => {
      const identifier: number = -2147483648;
      const originalTitle: string = "Home";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDPLAINICONROLES_0004
    // @tc.name AdaptTabSignedPlainIconRoles_0004
    // @tc.desc Verify model {"id":2147483647,"title":"Home","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedPlainIconRoles_0004', 0, (): void => {
      const identifier: number = 2147483647;
      const originalTitle: string = "Home";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDPLAINICONROLES_0005
    // @tc.name AdaptTabSignedPlainIconRoles_0005
    // @tc.desc Verify model {"id":-1,"title":"Discover","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedPlainIconRoles_0005', 0, (): void => {
      const identifier: number = -1;
      const originalTitle: string = "Discover";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDPLAINICONROLES_0006
    // @tc.name AdaptTabSignedPlainIconRoles_0006
    // @tc.desc Verify model {"id":-2,"title":"Discover","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedPlainIconRoles_0006', 0, (): void => {
      const identifier: number = -2;
      const originalTitle: string = "Discover";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDPLAINICONROLES_0007
    // @tc.name AdaptTabSignedPlainIconRoles_0007
    // @tc.desc Verify model {"id":-2147483648,"title":"Discover","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedPlainIconRoles_0007', 0, (): void => {
      const identifier: number = -2147483648;
      const originalTitle: string = "Discover";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDPLAINICONROLES_0008
    // @tc.name AdaptTabSignedPlainIconRoles_0008
    // @tc.desc Verify model {"id":2147483647,"title":"Discover","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedPlainIconRoles_0008', 0, (): void => {
      const identifier: number = 2147483647;
      const originalTitle: string = "Discover";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDPLAINICONROLES_0009
    // @tc.name AdaptTabSignedPlainIconRoles_0009
    // @tc.desc Verify model {"id":-1,"title":"Account","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedPlainIconRoles_0009', 0, (): void => {
      const identifier: number = -1;
      const originalTitle: string = "Account";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDPLAINICONROLES_0010
    // @tc.name AdaptTabSignedPlainIconRoles_0010
    // @tc.desc Verify model {"id":-2,"title":"Account","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedPlainIconRoles_0010', 0, (): void => {
      const identifier: number = -2;
      const originalTitle: string = "Account";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDPLAINICONROLES_0011
    // @tc.name AdaptTabSignedPlainIconRoles_0011
    // @tc.desc Verify model {"id":-2147483648,"title":"Account","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedPlainIconRoles_0011', 0, (): void => {
      const identifier: number = -2147483648;
      const originalTitle: string = "Account";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDPLAINICONROLES_0012
    // @tc.name AdaptTabSignedPlainIconRoles_0012
    // @tc.desc Verify model {"id":2147483647,"title":"Account","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedPlainIconRoles_0012', 0, (): void => {
      const identifier: number = 2147483647;
      const originalTitle: string = "Account";
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

    // @tc.number SUB_SAMPLE_ADAPTTABSIGNEDPLAINICONROLES_0013
    // @tc.name AdaptTabSignedPlainIconRoles_0013
    // @tc.desc Verify model {"id":-1,"title":"0123456789","selected":"selected.png","normal":"normal.png","operation":"IconRoles"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabSignedPlainIconRoles_0013', 0, (): void => {
      const identifier: number = -1;
      const originalTitle: string = "0123456789";
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
  });
}
