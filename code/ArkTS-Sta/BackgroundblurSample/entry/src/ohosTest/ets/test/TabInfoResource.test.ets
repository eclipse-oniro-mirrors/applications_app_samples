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
import { TabResourceFixture } from '../fixtures/TabInfoFixture';

export default function tabInfoResourceTests(): void {
  describe('TabInfoResourceTest', () => {
    it('TabInfoResourceTest_constructorRetainsActualResourceDescriptors', 0, () => {
      const tab = new TabResourceFixture();
      expect(tab.id).assertEqual(0);
      expect(tab.titleKeepsResource).assertTrue();
      expect(tab.selectedKeepsResource).assertTrue();
      expect(tab.defaultKeepsResource).assertTrue();
      expect(tab.iconResourcesAreDistinct).assertTrue();
    });

    it('TabInfoResourceTest_resourceTitleCanBeClearedAndRestored', 0, () => {
      const tab = new TabResourceFixture();
      tab.setLiteralTitle('');
      expect(tab.literalTitle).assertEqual('');
      expect(tab.titleKeepsResource).assertFalse();
      expect(tab.selectedKeepsResource).assertTrue();
      expect(tab.defaultKeepsResource).assertTrue();
      tab.restoreResourceTitle();
      expect(tab.titleKeepsResource).assertTrue();
      expect(tab.id).assertEqual(0);
    });

    it('TabInfoResourceTest_mixedIconRepresentationsRemainIndependent', 0, () => {
      const tab = new TabResourceFixture();
      tab.setLiteralSelectedIcon('file://selected.png');
      expect(tab.literalSelectedIcon).assertEqual('file://selected.png');
      expect(tab.selectedKeepsResource).assertFalse();
      expect(tab.defaultKeepsResource).assertTrue();
      tab.restoreSelectedResource();
      tab.setLiteralDefaultIcon('file://normal.png');
      expect(tab.selectedKeepsResource).assertTrue();
      expect(tab.literalDefaultIcon).assertEqual('file://normal.png');
      expect(tab.defaultKeepsResource).assertFalse();
      tab.restoreDefaultResource();
      expect(tab.defaultKeepsResource).assertTrue();
      expect(tab.titleKeepsResource).assertTrue();
    });
  });
}
