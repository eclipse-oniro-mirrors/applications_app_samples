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

// Reference: ets/test/PowerDialog/PowerDialogConcurrency.test.ets (522 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptTabWideWhitespaceInstanceIsolationTests(): void {
  describe('AdaptTabWideWhitespaceInstanceIsolationTest', (): void => {
    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEINSTANCEISOLATION_0001
    // @tc.name AdaptTabWideWhitespaceInstanceIsolation_0001
    // @tc.desc Verify model {"id":4,"title":"","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceInstanceIsolation_0001', 0, (): void => {
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEINSTANCEISOLATION_0002
    // @tc.name AdaptTabWideWhitespaceInstanceIsolation_0002
    // @tc.desc Verify model {"id":65536,"title":"","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceInstanceIsolation_0002', 0, (): void => {
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEINSTANCEISOLATION_0003
    // @tc.name AdaptTabWideWhitespaceInstanceIsolation_0003
    // @tc.desc Verify model {"id":2147483648,"title":"","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceInstanceIsolation_0003', 0, (): void => {
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEINSTANCEISOLATION_0004
    // @tc.name AdaptTabWideWhitespaceInstanceIsolation_0004
    // @tc.desc Verify model {"id":9007199254740991,"title":"","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceInstanceIsolation_0004', 0, (): void => {
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEINSTANCEISOLATION_0005
    // @tc.name AdaptTabWideWhitespaceInstanceIsolation_0005
    // @tc.desc Verify model {"id":4,"title":" ","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceInstanceIsolation_0005', 0, (): void => {
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEINSTANCEISOLATION_0006
    // @tc.name AdaptTabWideWhitespaceInstanceIsolation_0006
    // @tc.desc Verify model {"id":65536,"title":" ","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceInstanceIsolation_0006', 0, (): void => {
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEINSTANCEISOLATION_0007
    // @tc.name AdaptTabWideWhitespaceInstanceIsolation_0007
    // @tc.desc Verify model {"id":2147483648,"title":" ","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceInstanceIsolation_0007', 0, (): void => {
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEINSTANCEISOLATION_0008
    // @tc.name AdaptTabWideWhitespaceInstanceIsolation_0008
    // @tc.desc Verify model {"id":9007199254740991,"title":" ","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceInstanceIsolation_0008', 0, (): void => {
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEINSTANCEISOLATION_0009
    // @tc.name AdaptTabWideWhitespaceInstanceIsolation_0009
    // @tc.desc Verify model {"id":4,"title":"  Home  ","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceInstanceIsolation_0009', 0, (): void => {
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEINSTANCEISOLATION_0010
    // @tc.name AdaptTabWideWhitespaceInstanceIsolation_0010
    // @tc.desc Verify model {"id":65536,"title":"  Home  ","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceInstanceIsolation_0010', 0, (): void => {
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEINSTANCEISOLATION_0011
    // @tc.name AdaptTabWideWhitespaceInstanceIsolation_0011
    // @tc.desc Verify model {"id":2147483648,"title":"  Home  ","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceInstanceIsolation_0011', 0, (): void => {
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEINSTANCEISOLATION_0012
    // @tc.name AdaptTabWideWhitespaceInstanceIsolation_0012
    // @tc.desc Verify model {"id":9007199254740991,"title":"  Home  ","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceInstanceIsolation_0012', 0, (): void => {
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEINSTANCEISOLATION_0013
    // @tc.name AdaptTabWideWhitespaceInstanceIsolation_0013
    // @tc.desc Verify model {"id":4,"title":"Line one\nLine two","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceInstanceIsolation_0013', 0, (): void => {
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

    // @tc.number SUB_SAMPLE_ADAPTTABWIDEWHITESPACEINSTANCEISOLATION_0014
    // @tc.name AdaptTabWideWhitespaceInstanceIsolation_0014
    // @tc.desc Verify model {"id":65536,"title":"Line one\nLine two","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabWideWhitespaceInstanceIsolation_0014', 0, (): void => {
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
