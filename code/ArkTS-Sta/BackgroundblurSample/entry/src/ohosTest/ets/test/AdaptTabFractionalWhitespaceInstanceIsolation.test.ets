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

// Reference: ets/test/LifecycleState/ExtensionLifecycle.test.ets (700 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptTabFractionalWhitespaceInstanceIsolationTests(): void {
  describe('AdaptTabFractionalWhitespaceInstanceIsolationTest', (): void => {
    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0001
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0001
    // @tc.desc Verify model {"id":-0.5,"title":"","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0001', 0, (): void => {
      const identifier: number = -0.5;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0002
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0002
    // @tc.desc Verify model {"id":0.5,"title":"","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0002', 0, (): void => {
      const identifier: number = 0.5;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0003
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0003
    // @tc.desc Verify model {"id":1.25,"title":"","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0003', 0, (): void => {
      const identifier: number = 1.25;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0004
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0004
    // @tc.desc Verify model {"id":3.75,"title":"","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0004', 0, (): void => {
      const identifier: number = 3.75;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0005
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0005
    // @tc.desc Verify model {"id":-0.5,"title":" ","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0005', 0, (): void => {
      const identifier: number = -0.5;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0006
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0006
    // @tc.desc Verify model {"id":0.5,"title":" ","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0006', 0, (): void => {
      const identifier: number = 0.5;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0007
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0007
    // @tc.desc Verify model {"id":1.25,"title":" ","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0007', 0, (): void => {
      const identifier: number = 1.25;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0008
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0008
    // @tc.desc Verify model {"id":3.75,"title":" ","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0008', 0, (): void => {
      const identifier: number = 3.75;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0009
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0009
    // @tc.desc Verify model {"id":-0.5,"title":"  Home  ","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0009', 0, (): void => {
      const identifier: number = -0.5;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0010
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0010
    // @tc.desc Verify model {"id":0.5,"title":"  Home  ","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0010', 0, (): void => {
      const identifier: number = 0.5;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0011
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0011
    // @tc.desc Verify model {"id":1.25,"title":"  Home  ","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0011', 0, (): void => {
      const identifier: number = 1.25;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0012
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0012
    // @tc.desc Verify model {"id":3.75,"title":"  Home  ","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0012', 0, (): void => {
      const identifier: number = 3.75;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0013
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0013
    // @tc.desc Verify model {"id":-0.5,"title":"Line one\nLine two","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0013', 0, (): void => {
      const identifier: number = -0.5;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0014
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0014
    // @tc.desc Verify model {"id":0.5,"title":"Line one\nLine two","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0014', 0, (): void => {
      const identifier: number = 0.5;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0015
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0015
    // @tc.desc Verify model {"id":1.25,"title":"Line one\nLine two","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0015', 0, (): void => {
      const identifier: number = 1.25;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0016
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0016
    // @tc.desc Verify model {"id":3.75,"title":"Line one\nLine two","selected":"selected.png","normal":"normal.png","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0016', 0, (): void => {
      const identifier: number = 3.75;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0017
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0017
    // @tc.desc Verify model {"id":-0.5,"title":"","selected":"","normal":"normal.svg","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0017', 0, (): void => {
      const identifier: number = -0.5;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0018
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0018
    // @tc.desc Verify model {"id":0.5,"title":"","selected":"","normal":"normal.svg","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0018', 0, (): void => {
      const identifier: number = 0.5;
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

    // @tc.number SUB_SAMPLE_ADAPTTABFRACTIONALWHITESPACEINSTANCEISOLATION_0019
    // @tc.name AdaptTabFractionalWhitespaceInstanceIsolation_0019
    // @tc.desc Verify model {"id":1.25,"title":"","selected":"","normal":"normal.svg","operation":"InstanceIsolation"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabFractionalWhitespaceInstanceIsolation_0019', 0, (): void => {
      const identifier: number = 1.25;
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
