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

// Reference: ets/test/Integration/SystemIntegration.test.ets (374 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptTabPositionalUnicodeInstanceIsolationTests(): void {
  describe('AdaptTabPositionalUnicodeInstanceIsolationTest', (): void => {
    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALUNICODEINSTANCEISOLATION_0001
    // @tc.name AdaptTabPositionalUnicodeInstanceIsolation_0001
    // @tc.desc Verify model {"id":0,"title":"\u80cc\u666f\u6a21\u7cca","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalUnicodeInstanceIsolation_0001', 0, (): void => {
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
      const alias = primary;
      const replacementId: number = identifier === 0 ? -8 : 0;
      const replacementTitle: string = 'Isolated:' + originalTitle;
      alias.id = replacementId;
      expect(primary.id).assertEqual(replacementId);
      expect(sibling.id).assertEqual(identifier);
      primary.title = replacementTitle;
      expect(alias.title).assertEqual(replacementTitle);
      expect(sibling.title).assertEqual(originalTitle);
      alias.selectedIcon = 'changed-selected';
      expect(primary.selectedIcon).assertEqual('changed-selected');
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      primary.defaultIcon = 'changed-default';
      expect(alias.defaultIcon).assertEqual('changed-default');
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
      primary.id = identifier;
      primary.title = originalTitle;
      primary.selectedIcon = selectedIcon;
      primary.defaultIcon = defaultIcon;
      expect(alias === primary).assertTrue();
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALUNICODEINSTANCEISOLATION_0002
    // @tc.name AdaptTabPositionalUnicodeInstanceIsolation_0002
    // @tc.desc Verify model {"id":1,"title":"\u80cc\u666f\u6a21\u7cca","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalUnicodeInstanceIsolation_0002', 0, (): void => {
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
      const alias = primary;
      const replacementId: number = identifier === 0 ? -8 : 0;
      const replacementTitle: string = 'Isolated:' + originalTitle;
      alias.id = replacementId;
      expect(primary.id).assertEqual(replacementId);
      expect(sibling.id).assertEqual(identifier);
      primary.title = replacementTitle;
      expect(alias.title).assertEqual(replacementTitle);
      expect(sibling.title).assertEqual(originalTitle);
      alias.selectedIcon = 'changed-selected';
      expect(primary.selectedIcon).assertEqual('changed-selected');
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      primary.defaultIcon = 'changed-default';
      expect(alias.defaultIcon).assertEqual('changed-default');
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
      primary.id = identifier;
      primary.title = originalTitle;
      primary.selectedIcon = selectedIcon;
      primary.defaultIcon = defaultIcon;
      expect(alias === primary).assertTrue();
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALUNICODEINSTANCEISOLATION_0003
    // @tc.name AdaptTabPositionalUnicodeInstanceIsolation_0003
    // @tc.desc Verify model {"id":2,"title":"\u80cc\u666f\u6a21\u7cca","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalUnicodeInstanceIsolation_0003', 0, (): void => {
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
      const alias = primary;
      const replacementId: number = identifier === 0 ? -8 : 0;
      const replacementTitle: string = 'Isolated:' + originalTitle;
      alias.id = replacementId;
      expect(primary.id).assertEqual(replacementId);
      expect(sibling.id).assertEqual(identifier);
      primary.title = replacementTitle;
      expect(alias.title).assertEqual(replacementTitle);
      expect(sibling.title).assertEqual(originalTitle);
      alias.selectedIcon = 'changed-selected';
      expect(primary.selectedIcon).assertEqual('changed-selected');
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      primary.defaultIcon = 'changed-default';
      expect(alias.defaultIcon).assertEqual('changed-default');
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
      primary.id = identifier;
      primary.title = originalTitle;
      primary.selectedIcon = selectedIcon;
      primary.defaultIcon = defaultIcon;
      expect(alias === primary).assertTrue();
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALUNICODEINSTANCEISOLATION_0004
    // @tc.name AdaptTabPositionalUnicodeInstanceIsolation_0004
    // @tc.desc Verify model {"id":3,"title":"\u80cc\u666f\u6a21\u7cca","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalUnicodeInstanceIsolation_0004', 0, (): void => {
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
      const alias = primary;
      const replacementId: number = identifier === 0 ? -8 : 0;
      const replacementTitle: string = 'Isolated:' + originalTitle;
      alias.id = replacementId;
      expect(primary.id).assertEqual(replacementId);
      expect(sibling.id).assertEqual(identifier);
      primary.title = replacementTitle;
      expect(alias.title).assertEqual(replacementTitle);
      expect(sibling.title).assertEqual(originalTitle);
      alias.selectedIcon = 'changed-selected';
      expect(primary.selectedIcon).assertEqual('changed-selected');
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      primary.defaultIcon = 'changed-default';
      expect(alias.defaultIcon).assertEqual('changed-default');
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
      primary.id = identifier;
      primary.title = originalTitle;
      primary.selectedIcon = selectedIcon;
      primary.defaultIcon = defaultIcon;
      expect(alias === primary).assertTrue();
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALUNICODEINSTANCEISOLATION_0005
    // @tc.name AdaptTabPositionalUnicodeInstanceIsolation_0005
    // @tc.desc Verify model {"id":0,"title":"\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalUnicodeInstanceIsolation_0005', 0, (): void => {
      const identifier: number = 0;
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
      const alias = primary;
      const replacementId: number = identifier === 0 ? -8 : 0;
      const replacementTitle: string = 'Isolated:' + originalTitle;
      alias.id = replacementId;
      expect(primary.id).assertEqual(replacementId);
      expect(sibling.id).assertEqual(identifier);
      primary.title = replacementTitle;
      expect(alias.title).assertEqual(replacementTitle);
      expect(sibling.title).assertEqual(originalTitle);
      alias.selectedIcon = 'changed-selected';
      expect(primary.selectedIcon).assertEqual('changed-selected');
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      primary.defaultIcon = 'changed-default';
      expect(alias.defaultIcon).assertEqual('changed-default');
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
      primary.id = identifier;
      primary.title = originalTitle;
      primary.selectedIcon = selectedIcon;
      primary.defaultIcon = defaultIcon;
      expect(alias === primary).assertTrue();
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALUNICODEINSTANCEISOLATION_0006
    // @tc.name AdaptTabPositionalUnicodeInstanceIsolation_0006
    // @tc.desc Verify model {"id":1,"title":"\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalUnicodeInstanceIsolation_0006', 0, (): void => {
      const identifier: number = 1;
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
      const alias = primary;
      const replacementId: number = identifier === 0 ? -8 : 0;
      const replacementTitle: string = 'Isolated:' + originalTitle;
      alias.id = replacementId;
      expect(primary.id).assertEqual(replacementId);
      expect(sibling.id).assertEqual(identifier);
      primary.title = replacementTitle;
      expect(alias.title).assertEqual(replacementTitle);
      expect(sibling.title).assertEqual(originalTitle);
      alias.selectedIcon = 'changed-selected';
      expect(primary.selectedIcon).assertEqual('changed-selected');
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      primary.defaultIcon = 'changed-default';
      expect(alias.defaultIcon).assertEqual('changed-default');
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
      primary.id = identifier;
      primary.title = originalTitle;
      primary.selectedIcon = selectedIcon;
      primary.defaultIcon = defaultIcon;
      expect(alias === primary).assertTrue();
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALUNICODEINSTANCEISOLATION_0007
    // @tc.name AdaptTabPositionalUnicodeInstanceIsolation_0007
    // @tc.desc Verify model {"id":2,"title":"\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalUnicodeInstanceIsolation_0007', 0, (): void => {
      const identifier: number = 2;
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
      const alias = primary;
      const replacementId: number = identifier === 0 ? -8 : 0;
      const replacementTitle: string = 'Isolated:' + originalTitle;
      alias.id = replacementId;
      expect(primary.id).assertEqual(replacementId);
      expect(sibling.id).assertEqual(identifier);
      primary.title = replacementTitle;
      expect(alias.title).assertEqual(replacementTitle);
      expect(sibling.title).assertEqual(originalTitle);
      alias.selectedIcon = 'changed-selected';
      expect(primary.selectedIcon).assertEqual('changed-selected');
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      primary.defaultIcon = 'changed-default';
      expect(alias.defaultIcon).assertEqual('changed-default');
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
      primary.id = identifier;
      primary.title = originalTitle;
      primary.selectedIcon = selectedIcon;
      primary.defaultIcon = defaultIcon;
      expect(alias === primary).assertTrue();
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALUNICODEINSTANCEISOLATION_0008
    // @tc.name AdaptTabPositionalUnicodeInstanceIsolation_0008
    // @tc.desc Verify model {"id":3,"title":"\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalUnicodeInstanceIsolation_0008', 0, (): void => {
      const identifier: number = 3;
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
      const alias = primary;
      const replacementId: number = identifier === 0 ? -8 : 0;
      const replacementTitle: string = 'Isolated:' + originalTitle;
      alias.id = replacementId;
      expect(primary.id).assertEqual(replacementId);
      expect(sibling.id).assertEqual(identifier);
      primary.title = replacementTitle;
      expect(alias.title).assertEqual(replacementTitle);
      expect(sibling.title).assertEqual(originalTitle);
      alias.selectedIcon = 'changed-selected';
      expect(primary.selectedIcon).assertEqual('changed-selected');
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      primary.defaultIcon = 'changed-default';
      expect(alias.defaultIcon).assertEqual('changed-default');
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
      primary.id = identifier;
      primary.title = originalTitle;
      primary.selectedIcon = selectedIcon;
      primary.defaultIcon = defaultIcon;
      expect(alias === primary).assertTrue();
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALUNICODEINSTANCEISOLATION_0009
    // @tc.name AdaptTabPositionalUnicodeInstanceIsolation_0009
    // @tc.desc Verify model {"id":0,"title":"e\u0301","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalUnicodeInstanceIsolation_0009', 0, (): void => {
      const identifier: number = 0;
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
      const alias = primary;
      const replacementId: number = identifier === 0 ? -8 : 0;
      const replacementTitle: string = 'Isolated:' + originalTitle;
      alias.id = replacementId;
      expect(primary.id).assertEqual(replacementId);
      expect(sibling.id).assertEqual(identifier);
      primary.title = replacementTitle;
      expect(alias.title).assertEqual(replacementTitle);
      expect(sibling.title).assertEqual(originalTitle);
      alias.selectedIcon = 'changed-selected';
      expect(primary.selectedIcon).assertEqual('changed-selected');
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      primary.defaultIcon = 'changed-default';
      expect(alias.defaultIcon).assertEqual('changed-default');
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
      primary.id = identifier;
      primary.title = originalTitle;
      primary.selectedIcon = selectedIcon;
      primary.defaultIcon = defaultIcon;
      expect(alias === primary).assertTrue();
      expect(primary.id).assertEqual(identifier);
      expect(primary.title).assertEqual(originalTitle);
      expect(primary.selectedIcon).assertEqual(selectedIcon);
      expect(primary.defaultIcon).assertEqual(defaultIcon);
      expect(sibling.id).assertEqual(identifier);
      expect(sibling.title).assertEqual(originalTitle);
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABPOSITIONALUNICODEINSTANCEISOLATION_0010
    // @tc.name AdaptTabPositionalUnicodeInstanceIsolation_0010
    // @tc.desc Verify model {"id":1,"title":"e\u0301","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabPositionalUnicodeInstanceIsolation_0010', 0, (): void => {
      const identifier: number = 1;
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
      const alias = primary;
      const replacementId: number = identifier === 0 ? -8 : 0;
      const replacementTitle: string = 'Isolated:' + originalTitle;
      alias.id = replacementId;
      expect(primary.id).assertEqual(replacementId);
      expect(sibling.id).assertEqual(identifier);
      primary.title = replacementTitle;
      expect(alias.title).assertEqual(replacementTitle);
      expect(sibling.title).assertEqual(originalTitle);
      alias.selectedIcon = 'changed-selected';
      expect(primary.selectedIcon).assertEqual('changed-selected');
      expect(sibling.selectedIcon).assertEqual(selectedIcon);
      primary.defaultIcon = 'changed-default';
      expect(alias.defaultIcon).assertEqual('changed-default');
      expect(sibling.defaultIcon).assertEqual(defaultIcon);
      primary.id = identifier;
      primary.title = originalTitle;
      primary.selectedIcon = selectedIcon;
      primary.defaultIcon = defaultIcon;
      expect(alias === primary).assertTrue();
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
