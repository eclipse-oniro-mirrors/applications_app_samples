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
import { describe, expect, it } from '@ohos/hypium';
import { TabInfoFixture as TabInfo } from '../fixtures/TabInfoFixture';

export default function tabInfoTests(): void {
  describe('TabInfoTest', () => {
    it('TabInfoTest_constructorCapturesPopulatedAndEmptyFields', 0, () => {
      const tab = new TabInfo(3, 'Account', 'selected.png', 'normal.png');
      expect(tab.id).assertEqual(3);
      expect(tab.title).assertEqual('Account');
      expect(tab.selectedIcon).assertEqual('selected.png');
      expect(tab.defaultIcon).assertEqual('normal.png');
      const empty = new TabInfo(0, '', '', '');
      expect(empty.id).assertEqual(0);
      expect(empty.title).assertEqual('');
      expect(empty.selectedIcon).assertEqual('');
      expect(empty.defaultIcon).assertEqual('');
    });

    it('TabInfoTest_titleKeepsUnicodeAndWhitespace', 0, () => {
      const title = ' \u6211\u7684\u6807\u7b7e\nTab ';
      const tab = new TabInfo(2, title, 'selected', 'default');
      expect(tab.title).assertEqual(title);
    });

    it('TabInfoTest_titleMutationDoesNotChangeIcons', 0, () => {
      const tab = new TabInfo(1, 'Old', 'a', 'b');
      tab.title = 'New';
      expect(tab.title).assertEqual('New');
      expect(tab.id).assertEqual(1);
      expect(tab.selectedIcon).assertEqual('a');
      expect(tab.defaultIcon).assertEqual('b');
    });

    it('TabInfoTest_iconsCanBeUpdatedIndependently', 0, () => {
      const tab = new TabInfo(0, 'Home', 'selected', 'default');
      tab.selectedIcon = 'replacement-selected';
      expect(tab.defaultIcon).assertEqual('default');
      tab.defaultIcon = 'replacement-default';
      expect(tab.selectedIcon).assertEqual('replacement-selected');
      expect(tab.defaultIcon).assertEqual('replacement-default');
      expect(tab.title).assertEqual('Home');
    });

    it('TabInfoTest_instancesDoNotShareMutableFields', 0, () => {
      const first = new TabInfo(0, 'First', 's1', 'n1');
      const second = new TabInfo(0, 'First', 's1', 'n1');
      first.id = 8;
      first.title = 'Changed';
      first.selectedIcon = 's2';
      expect(second.id).assertEqual(0);
      expect(second.title).assertEqual('First');
      expect(second.selectedIcon).assertEqual('s1');
    });

    it('TabInfoTest_identifierIsStoredWithoutCoercion', 0, () => {
      const tab = new TabInfo(-1.5, 'Custom', 's', 'n');
      expect(tab.id).assertEqual(-1.5);
      tab.id = 65536;
      expect(tab.id).assertEqual(65536);
      expect(tab.title).assertEqual('Custom');
    });
  });
}
