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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'ActsAbilityTest beforeAll');
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    it('assertContain', 0, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      let a = 'TabsSample';
      let b = 'Tabs';
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
    })
    it('assertTabsLabelsContain', 0, () => {
      let labels = ['首页', '新闻', '视频', '朋友圈', '我的'];
      expect(labels.length).assertEqual(5);
      expect(labels[0]).assertEqual('首页');
      expect(labels[4]).assertEqual('我的');
    })
    it('assertTabsLabelsUnique', 0, () => {
      let labels = ['首页', '新闻', '视频', '朋友圈', '我的'];
      let uniqueLabels = new Set<string>(labels);
      expect(uniqueLabels.size).assertEqual(labels.length);
      hilog.info(0x0000, 'testTag', '%{public}s', 'TabsSample tab labels are unique');
    })
    it('assertStyleConfigurationSize', 0, () => {
      let configurationSize = 18;
      expect(configurationSize).assertEqual(18);
    })
  })
}
