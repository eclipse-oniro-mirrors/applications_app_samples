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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { DEMO_ITEMS, filterDemos, canSwitchTab } from '../../../main/ets/model/DemoLogic';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function DemoSwitchTabMatrixPart3Test(): void {
  describe('DemoSwitchTabMatrixPart3', () => {

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_8100
     * @tc.name      testFilterDemos0081
     * @tc.desc      Verify filter('All', 'tabs') returns 1 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0081 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'tabs', 'All');
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('tabs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0081 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_8200
     * @tc.name      testFilterDemos0082
     * @tc.desc      Verify filter('All', 'DOWNLOAD') returns 1 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0082 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'DOWNLOAD', 'All');
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('download');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0082 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_8300
     * @tc.name      testFilterDemos0083
     * @tc.desc      Verify filter('All', ' ') returns 9 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0083 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, ' ', 'All');
      expect(result.length).assertEqual(9);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('navigation,search,tabs,web,download,halfScreen,jump,sheet,prefs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0083 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_8400
     * @tc.name      testFilterDemos0084
     * @tc.desc      Verify filter('All', 'xyz') returns 0 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0084 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'xyz', 'All');
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0084 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_8500
     * @tc.name      testFilterDemos0085
     * @tc.desc      Verify filter('Container', '') returns 1 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0085 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, '', 'Container');
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('navigation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0085 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_8600
     * @tc.name      testFilterDemos0086
     * @tc.desc      Verify filter('Container', 'atomic') returns 1 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0086 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'atomic', 'Container');
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('navigation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0086 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_8700
     * @tc.name      testFilterDemos0087
     * @tc.desc      Verify filter('Container', 'tabs') returns 0 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0087 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'tabs', 'Container');
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0087 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_8800
     * @tc.name      testFilterDemos0088
     * @tc.desc      Verify filter('Container', 'DOWNLOAD') returns 0 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0088 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'DOWNLOAD', 'Container');
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0088 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_8900
     * @tc.name      testFilterDemos0089
     * @tc.desc      Verify filter('Container', ' ') returns 1 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0089 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, ' ', 'Container');
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('navigation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0089 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_9000
     * @tc.name      testFilterDemos0090
     * @tc.desc      Verify filter('Container', 'xyz') returns 0 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0090 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'xyz', 'Container');
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0090 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_9100
     * @tc.name      testFilterDemos0091
     * @tc.desc      Verify filter('Interaction', '') returns 3 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0091 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, '', 'Interaction');
      expect(result.length).assertEqual(3);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('search,tabs,sheet');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0091 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_9200
     * @tc.name      testFilterDemos0092
     * @tc.desc      Verify filter('Interaction', 'atomic') returns 2 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0092 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'atomic', 'Interaction');
      expect(result.length).assertEqual(2);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('search,tabs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0092 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_9300
     * @tc.name      testFilterDemos0093
     * @tc.desc      Verify filter('Interaction', 'tabs') returns 1 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0093 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'tabs', 'Interaction');
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('tabs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0093 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_9400
     * @tc.name      testFilterDemos0094
     * @tc.desc      Verify filter('Interaction', 'DOWNLOAD') returns 0 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0094 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'DOWNLOAD', 'Interaction');
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0094 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_9500
     * @tc.name      testFilterDemos0095
     * @tc.desc      Verify filter('Interaction', ' ') returns 3 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0095 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, ' ', 'Interaction');
      expect(result.length).assertEqual(3);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('search,tabs,sheet');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0095 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_9600
     * @tc.name      testFilterDemos0096
     * @tc.desc      Verify filter('Interaction', 'xyz') returns 0 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0096 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'xyz', 'Interaction');
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0096 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_9700
     * @tc.name      testFilterDemos0097
     * @tc.desc      Verify filter('Capability', '') returns 5 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0097 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, '', 'Capability');
      expect(result.length).assertEqual(5);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('web,download,halfScreen,jump,prefs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0097 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_9800
     * @tc.name      testFilterDemos0098
     * @tc.desc      Verify filter('Capability', 'atomic') returns 2 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0098 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'atomic', 'Capability');
      expect(result.length).assertEqual(2);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('web,halfScreen');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0098 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_9900
     * @tc.name      testFilterDemos0099
     * @tc.desc      Verify filter('Capability', 'tabs') returns 0 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0099 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'tabs', 'Capability');
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0099 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_10000
     * @tc.name      testFilterDemos0100
     * @tc.desc      Verify filter('Capability', 'DOWNLOAD') returns 1 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0100 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'DOWNLOAD', 'Capability');
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('download');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0100 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_10100
     * @tc.name      testFilterDemos0101
     * @tc.desc      Verify filter('Capability', ' ') returns 5 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0101 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, ' ', 'Capability');
      expect(result.length).assertEqual(5);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('web,download,halfScreen,jump,prefs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0101 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_10200
     * @tc.name      testFilterDemos0102
     * @tc.desc      Verify filter('Capability', 'xyz') returns 0 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0102 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'xyz', 'Capability');
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0102 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_10300
     * @tc.name      testFilterDemos0103
     * @tc.desc      Verify filter('Unknown', '') returns 0 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0103 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, '', 'Unknown');
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0103 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_10400
     * @tc.name      testFilterDemos0104
     * @tc.desc      Verify filter('Unknown', 'atomic') returns 0 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0104 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'atomic', 'Unknown');
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0104 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_10500
     * @tc.name      testFilterDemos0105
     * @tc.desc      Verify filter('Unknown', 'tabs') returns 0 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0105 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'tabs', 'Unknown');
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0105 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_10600
     * @tc.name      testFilterDemos0106
     * @tc.desc      Verify filter('Unknown', 'DOWNLOAD') returns 0 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0106 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'DOWNLOAD', 'Unknown');
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0106 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_10700
     * @tc.name      testFilterDemos0107
     * @tc.desc      Verify filter('Unknown', ' ') returns 0 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0107 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, ' ', 'Unknown');
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0107 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP3_10800
     * @tc.name      testFilterDemos0108
     * @tc.desc      Verify filter('Unknown', 'xyz') returns 0 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0108 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'xyz', 'Unknown');
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0108 end');
    })

  })
}
