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
import { DemoItem, DEMO_ITEMS, filterDemos, canSwitchTab, canPopNavStack } from '../../../main/ets/model/DemoLogic';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function DemoFilterGridMatrixCombinedPart1Test(): void {
  describe('DemoFlt1', () => {
    /**
     * @tc.number    SUB_ATOMIC_DFGP1_0100
     * @tc.name      testFilterGrid0001
     * @tc.desc      Verify filterDemos keyword '' category 'All'. Plus Verify filterDemos keyword '' category 'Container'. Plus Verify filterDemos keyword '' category 'Interaction'. Plus Verify filterDemos keyword '' category 'Capability'. Plus Verify filterDemos keyword '' category ''. Plus Verify filterDemos keyword '' category 'Unknown'. Plus Verify filterDemos keyword 'search' category 'All'. Plus Verify filterDemos keyword 'search' category 'Container'. Plus Verify filterDemos keyword 'search' category 'Interaction'. Plus Verify filterDemos keyword 'search' category 'Capability'. Plus Verify filterDemos keyword 'search' category ''. Plus Verify filterDemos keyword 'search' category 'Unknown'. Plus Verify filterDemos keyword 'TABS' category 'All'. Plus Verify filterDemos keyword 'TABS' category 'Container'. Plus Verify filterDemos keyword 'TABS' category 'Interaction'. Plus Verify filterDemos keyword 'TABS' category 'Capability'. Plus Verify filterDemos keyword 'TABS' category ''. Plus Verify filterDemos keyword 'TABS' category 'Unknown'. Plus Verify filterDemos keyword 'download' category 'All'. Plus Verify filterDemos keyword 'download' category 'Container'. Plus Verify filterDemos keyword 'download' category 'Interaction'. Plus Verify filterDemos keyword 'download' category 'Capability'. Plus Verify filterDemos keyword 'download' category ''. Plus Verify filterDemos keyword 'download' category 'Unknown'. Plus Verify filterDemos keyword 'sheet' category 'All'. Plus Verify filterDemos keyword 'sheet' category 'Container'. Plus Verify filterDemos keyword 'sheet' category 'Interaction'. Plus Verify filterDemos keyword 'sheet' category 'Capability'. Plus Verify filterDemos keyword 'sheet' category ''. Plus Verify filterDemos keyword 'sheet' category 'Unknown'. Plus Verify filterDemos keyword 'preferences' category 'All'. Plus Verify filterDemos keyword 'preferences' category 'Container'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0001 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, '', 'All');
      expect(result.length).assertEqual(9);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('navigation,search,tabs,web,download,halfScreen,jump,sheet,prefs');
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, '', 'Container');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('navigation');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, '', 'Interaction');
      expect(result.length).assertEqual(3);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('search,tabs,sheet');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, '', 'Capability');
      expect(result.length).assertEqual(5);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('web,download,halfScreen,jump,prefs');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, '', '');
      expect(result.length).assertEqual(9);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('navigation,search,tabs,web,download,halfScreen,jump,sheet,prefs');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, '', 'Unknown');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'search', 'All');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('search');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'search', 'Container');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'search', 'Interaction');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('search');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'search', 'Capability');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'search', '');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('search');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'search', 'Unknown');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'TABS', 'All');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('tabs');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'TABS', 'Container');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'TABS', 'Interaction');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('tabs');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'TABS', 'Capability');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'TABS', '');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('tabs');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'TABS', 'Unknown');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'download', 'All');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('download');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'download', 'Container');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'download', 'Interaction');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'download', 'Capability');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('download');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'download', '');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('download');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'download', 'Unknown');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'sheet', 'All');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('sheet');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'sheet', 'Container');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'sheet', 'Interaction');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('sheet');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'sheet', 'Capability');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'sheet', '');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('sheet');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'sheet', 'Unknown');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'preferences', 'All');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('prefs');
      }
      {
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'preferences', 'Container');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0001 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP1_3300
     * @tc.name      testFilterGrid0033
     * @tc.desc      Verify filterDemos keyword 'preferences' category 'Interaction'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0033 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'preferences', 'Interaction');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0033 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP1_3400
     * @tc.name      testFilterGrid0034
     * @tc.desc      Verify filterDemos keyword 'preferences' category 'Capability'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0034 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'preferences', 'Capability');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('prefs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0034 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP1_3500
     * @tc.name      testFilterGrid0035
     * @tc.desc      Verify filterDemos keyword 'preferences' category ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0035 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'preferences', '');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('prefs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0035 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP1_3600
     * @tc.name      testFilterGrid0036
     * @tc.desc      Verify filterDemos keyword 'preferences' category 'Unknown'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0036 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'preferences', 'Unknown');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0036 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP1_3700
     * @tc.name      testFilterGrid0037
     * @tc.desc      Verify filterDemos keyword 'cross-app' category 'All'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0037 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'cross-app', 'All');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('jump');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0037 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP1_3800
     * @tc.name      testFilterGrid0038
     * @tc.desc      Verify filterDemos keyword 'cross-app' category 'Container'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0038 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'cross-app', 'Container');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0038 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP1_3900
     * @tc.name      testFilterGrid0039
     * @tc.desc      Verify filterDemos keyword 'cross-app' category 'Interaction'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0039 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'cross-app', 'Interaction');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0039 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP1_4000
     * @tc.name      testFilterGrid0040
     * @tc.desc      Verify filterDemos keyword 'cross-app' category 'Capability'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0040 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'cross-app', 'Capability');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('jump');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0040 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_4100
     * @tc.name      testFilterGrid0041
     * @tc.desc      Verify filterDemos keyword 'cross-app' category ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0041 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'cross-app', '');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('jump');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0041 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_4200
     * @tc.name      testFilterGrid0042
     * @tc.desc      Verify filterDemos keyword 'cross-app' category 'Unknown'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0042 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'cross-app', 'Unknown');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0042 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_4300
     * @tc.name      testFilterGrid0043
     * @tc.desc      Verify filterDemos keyword 'local h5' category 'All'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0043 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'local h5', 'All');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('web');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0043 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_4400
     * @tc.name      testFilterGrid0044
     * @tc.desc      Verify filterDemos keyword 'local h5' category 'Container'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0044 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'local h5', 'Container');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0044 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_4500
     * @tc.name      testFilterGrid0045
     * @tc.desc      Verify filterDemos keyword 'local h5' category 'Interaction'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0045 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'local h5', 'Interaction');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0045 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_4600
     * @tc.name      testFilterGrid0046
     * @tc.desc      Verify filterDemos keyword 'local h5' category 'Capability'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0046 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'local h5', 'Capability');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('web');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0046 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_4700
     * @tc.name      testFilterGrid0047
     * @tc.desc      Verify filterDemos keyword 'local h5' category ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0047 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'local h5', '');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('web');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0047 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_4800
     * @tc.name      testFilterGrid0048
     * @tc.desc      Verify filterDemos keyword 'local h5' category 'Unknown'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0048 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'local h5', 'Unknown');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0048 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_4900
     * @tc.name      testFilterGrid0049
     * @tc.desc      Verify filterDemos keyword 'capability' category 'All'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0049 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'capability', 'All');
      expect(result.length).assertEqual(5);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('web,download,halfScreen,jump,prefs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0049 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_5000
     * @tc.name      testFilterGrid0050
     * @tc.desc      Verify filterDemos keyword 'capability' category 'Container'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0050 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'capability', 'Container');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0050 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_5100
     * @tc.name      testFilterGrid0051
     * @tc.desc      Verify filterDemos keyword 'capability' category 'Interaction'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0051 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'capability', 'Interaction');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0051 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_5200
     * @tc.name      testFilterGrid0052
     * @tc.desc      Verify filterDemos keyword 'capability' category 'Capability'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0052 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'capability', 'Capability');
      expect(result.length).assertEqual(5);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('web,download,halfScreen,jump,prefs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0052 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_5300
     * @tc.name      testFilterGrid0053
     * @tc.desc      Verify filterDemos keyword 'capability' category ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0053 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'capability', '');
      expect(result.length).assertEqual(5);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('web,download,halfScreen,jump,prefs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0053 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_5400
     * @tc.name      testFilterGrid0054
     * @tc.desc      Verify filterDemos keyword 'capability' category 'Unknown'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0054 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'capability', 'Unknown');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0054 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_5500
     * @tc.name      testFilterGrid0055
     * @tc.desc      Verify filterDemos keyword 'zzz' category 'All'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0055 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'zzz', 'All');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0055 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_5600
     * @tc.name      testFilterGrid0056
     * @tc.desc      Verify filterDemos keyword 'zzz' category 'Container'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0056 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'zzz', 'Container');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0056 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_5700
     * @tc.name      testFilterGrid0057
     * @tc.desc      Verify filterDemos keyword 'zzz' category 'Interaction'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0057 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'zzz', 'Interaction');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0057 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_5800
     * @tc.name      testFilterGrid0058
     * @tc.desc      Verify filterDemos keyword 'zzz' category 'Capability'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0058 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'zzz', 'Capability');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0058 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_5900
     * @tc.name      testFilterGrid0059
     * @tc.desc      Verify filterDemos keyword 'zzz' category ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0059 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'zzz', '');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0059 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_6000
     * @tc.name      testFilterGrid0060
     * @tc.desc      Verify filterDemos keyword 'zzz' category 'Unknown'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0060 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'zzz', 'Unknown');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0060 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_6100
     * @tc.name      testFilterGrid0061
     * @tc.desc      Verify filterDemos keyword '  web  ' category 'All'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0061 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, '  web  ', 'All');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('web');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0061 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_6200
     * @tc.name      testFilterGrid0062
     * @tc.desc      Verify filterDemos keyword '  web  ' category 'Container'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0062 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, '  web  ', 'Container');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0062 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_6300
     * @tc.name      testFilterGrid0063
     * @tc.desc      Verify filterDemos keyword '  web  ' category 'Interaction'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0063 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, '  web  ', 'Interaction');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0063 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_6400
     * @tc.name      testFilterGrid0064
     * @tc.desc      Verify filterDemos keyword '  web  ' category 'Capability'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0064 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, '  web  ', 'Capability');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('web');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0064 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_6500
     * @tc.name      testFilterGrid0065
     * @tc.desc      Verify filterDemos keyword '  web  ' category ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0065 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, '  web  ', '');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('web');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0065 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_6600
     * @tc.name      testFilterGrid0066
     * @tc.desc      Verify filterDemos keyword '  web  ' category 'Unknown'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0066 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, '  web  ', 'Unknown');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0066 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_6700
     * @tc.name      testFilterGrid0067
     * @tc.desc      Verify filterDemos keyword 'function areas' category 'All'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0067 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'function areas', 'All');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('search');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0067 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_6800
     * @tc.name      testFilterGrid0068
     * @tc.desc      Verify filterDemos keyword 'function areas' category 'Container'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0068 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'function areas', 'Container');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0068 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_6900
     * @tc.name      testFilterGrid0069
     * @tc.desc      Verify filterDemos keyword 'function areas' category 'Interaction'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0069 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'function areas', 'Interaction');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('search');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0069 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_7000
     * @tc.name      testFilterGrid0070
     * @tc.desc      Verify filterDemos keyword 'function areas' category 'Capability'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0070 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'function areas', 'Capability');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0070 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_7100
     * @tc.name      testFilterGrid0071
     * @tc.desc      Verify filterDemos keyword 'function areas' category ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0071 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'function areas', '');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('search');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0071 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_7200
     * @tc.name      testFilterGrid0072
     * @tc.desc      Verify filterDemos keyword 'function areas' category 'Unknown'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0072 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'function areas', 'Unknown');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0072 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_7300
     * @tc.name      testFilterGrid0073
     * @tc.desc      Verify filterDemos keyword 'restart' category 'All'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0073 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'restart', 'All');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('prefs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0073 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_7400
     * @tc.name      testFilterGrid0074
     * @tc.desc      Verify filterDemos keyword 'restart' category 'Container'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0074 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'restart', 'Container');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0074 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_7500
     * @tc.name      testFilterGrid0075
     * @tc.desc      Verify filterDemos keyword 'restart' category 'Interaction'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0075 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'restart', 'Interaction');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0075 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_7600
     * @tc.name      testFilterGrid0076
     * @tc.desc      Verify filterDemos keyword 'restart' category 'Capability'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0076 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'restart', 'Capability');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('prefs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0076 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_7700
     * @tc.name      testFilterGrid0077
     * @tc.desc      Verify filterDemos keyword 'restart' category ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0077 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'restart', '');
      expect(result.length).assertEqual(1);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('prefs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0077 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_7800
     * @tc.name      testFilterGrid0078
     * @tc.desc      Verify filterDemos keyword 'restart' category 'Unknown'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterGrid0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0078 begin');
      await delayTick();
      const result: DemoItem[] = filterDemos(DEMO_ITEMS, 'restart', 'Unknown');
      expect(result.length).assertEqual(0);
      expect(result.map((item: DemoItem) => item.key).join(",")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterGrid0078 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_7900
     * @tc.name      testSwitchTabGrid0079
     * @tc.desc      Verify canSwitchTab(-1, 2, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0079 begin');
      await delayTick();
      expect(canSwitchTab(-1, 2, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0079 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP2_8000
     * @tc.name      testSwitchTabGrid0080
     * @tc.desc      Verify canSwitchTab(-1, 2, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0080 begin');
      await delayTick();
      expect(canSwitchTab(-1, 2, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0080 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_8100
     * @tc.name      testSwitchTabGrid0081
     * @tc.desc      Verify canSwitchTab(-1, 4, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0081 begin');
      await delayTick();
      expect(canSwitchTab(-1, 4, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0081 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_8200
     * @tc.name      testSwitchTabGrid0082
     * @tc.desc      Verify canSwitchTab(-1, 4, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0082 begin');
      await delayTick();
      expect(canSwitchTab(-1, 4, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0082 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_8300
     * @tc.name      testSwitchTabGrid0083
     * @tc.desc      Verify canSwitchTab(-1, 5, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0083 begin');
      await delayTick();
      expect(canSwitchTab(-1, 5, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0083 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_8400
     * @tc.name      testSwitchTabGrid0084
     * @tc.desc      Verify canSwitchTab(-1, 5, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0084 begin');
      await delayTick();
      expect(canSwitchTab(-1, 5, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0084 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_8500
     * @tc.name      testSwitchTabGrid0085
     * @tc.desc      Verify canSwitchTab(0, 2, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0085 begin');
      await delayTick();
      expect(canSwitchTab(0, 2, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0085 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_8600
     * @tc.name      testSwitchTabGrid0086
     * @tc.desc      Verify canSwitchTab(0, 2, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0086 begin');
      await delayTick();
      expect(canSwitchTab(0, 2, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0086 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_8700
     * @tc.name      testSwitchTabGrid0087
     * @tc.desc      Verify canSwitchTab(0, 4, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0087 begin');
      await delayTick();
      expect(canSwitchTab(0, 4, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0087 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_8800
     * @tc.name      testSwitchTabGrid0088
     * @tc.desc      Verify canSwitchTab(0, 4, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0088 begin');
      await delayTick();
      expect(canSwitchTab(0, 4, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0088 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_8900
     * @tc.name      testSwitchTabGrid0089
     * @tc.desc      Verify canSwitchTab(0, 5, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0089 begin');
      await delayTick();
      expect(canSwitchTab(0, 5, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0089 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_9000
     * @tc.name      testSwitchTabGrid0090
     * @tc.desc      Verify canSwitchTab(0, 5, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0090 begin');
      await delayTick();
      expect(canSwitchTab(0, 5, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0090 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_9100
     * @tc.name      testSwitchTabGrid0091
     * @tc.desc      Verify canSwitchTab(1, -1, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0091 begin');
      await delayTick();
      expect(canSwitchTab(1, -1, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0091 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_9200
     * @tc.name      testSwitchTabGrid0092
     * @tc.desc      Verify canSwitchTab(1, -1, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0092 begin');
      await delayTick();
      expect(canSwitchTab(1, -1, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0092 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_9300
     * @tc.name      testSwitchTabGrid0093
     * @tc.desc      Verify canSwitchTab(1, 0, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0093 begin');
      await delayTick();
      expect(canSwitchTab(1, 0, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0093 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_9400
     * @tc.name      testSwitchTabGrid0094
     * @tc.desc      Verify canSwitchTab(1, 0, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0094 begin');
      await delayTick();
      expect(canSwitchTab(1, 0, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0094 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_9500
     * @tc.name      testSwitchTabGrid0095
     * @tc.desc      Verify canSwitchTab(1, 1, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0095 begin');
      await delayTick();
      expect(canSwitchTab(1, 1, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0095 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_9600
     * @tc.name      testSwitchTabGrid0096
     * @tc.desc      Verify canSwitchTab(1, 1, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0096 begin');
      await delayTick();
      expect(canSwitchTab(1, 1, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0096 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_9700
     * @tc.name      testSwitchTabGrid0097
     * @tc.desc      Verify canSwitchTab(1, 2, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0097 begin');
      await delayTick();
      expect(canSwitchTab(1, 2, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0097 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_9800
     * @tc.name      testSwitchTabGrid0098
     * @tc.desc      Verify canSwitchTab(1, 2, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0098 begin');
      await delayTick();
      expect(canSwitchTab(1, 2, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0098 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_9900
     * @tc.name      testSwitchTabGrid0099
     * @tc.desc      Verify canSwitchTab(1, 4, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0099 begin');
      await delayTick();
      expect(canSwitchTab(1, 4, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0099 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_10000
     * @tc.name      testSwitchTabGrid0100
     * @tc.desc      Verify canSwitchTab(1, 4, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0100 begin');
      await delayTick();
      expect(canSwitchTab(1, 4, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0100 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_10100
     * @tc.name      testSwitchTabGrid0101
     * @tc.desc      Verify canSwitchTab(1, 5, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0101 begin');
      await delayTick();
      expect(canSwitchTab(1, 5, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0101 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_10200
     * @tc.name      testSwitchTabGrid0102
     * @tc.desc      Verify canSwitchTab(1, 5, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0102 begin');
      await delayTick();
      expect(canSwitchTab(1, 5, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0102 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_10300
     * @tc.name      testSwitchTabGrid0103
     * @tc.desc      Verify canSwitchTab(2, 2, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0103 begin');
      await delayTick();
      expect(canSwitchTab(2, 2, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0103 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_10400
     * @tc.name      testSwitchTabGrid0104
     * @tc.desc      Verify canSwitchTab(2, 2, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0104 begin');
      await delayTick();
      expect(canSwitchTab(2, 2, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0104 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_10500
     * @tc.name      testSwitchTabGrid0105
     * @tc.desc      Verify canSwitchTab(2, 4, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0105 begin');
      await delayTick();
      expect(canSwitchTab(2, 4, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0105 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_10600
     * @tc.name      testSwitchTabGrid0106
     * @tc.desc      Verify canSwitchTab(2, 4, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0106 begin');
      await delayTick();
      expect(canSwitchTab(2, 4, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0106 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_10700
     * @tc.name      testSwitchTabGrid0107
     * @tc.desc      Verify canSwitchTab(2, 5, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0107 begin');
      await delayTick();
      expect(canSwitchTab(2, 5, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0107 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_10800
     * @tc.name      testSwitchTabGrid0108
     * @tc.desc      Verify canSwitchTab(2, 5, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0108 begin');
      await delayTick();
      expect(canSwitchTab(2, 5, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0108 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_10900
     * @tc.name      testSwitchTabGrid0109
     * @tc.desc      Verify canSwitchTab(4, -1, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0109 begin');
      await delayTick();
      expect(canSwitchTab(4, -1, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0109 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_11000
     * @tc.name      testSwitchTabGrid0110
     * @tc.desc      Verify canSwitchTab(4, -1, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0110 begin');
      await delayTick();
      expect(canSwitchTab(4, -1, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0110 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_11100
     * @tc.name      testSwitchTabGrid0111
     * @tc.desc      Verify canSwitchTab(4, 0, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0111 begin');
      await delayTick();
      expect(canSwitchTab(4, 0, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0111 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_11200
     * @tc.name      testSwitchTabGrid0112
     * @tc.desc      Verify canSwitchTab(4, 0, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0112 begin');
      await delayTick();
      expect(canSwitchTab(4, 0, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0112 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_11300
     * @tc.name      testSwitchTabGrid0113
     * @tc.desc      Verify canSwitchTab(4, 1, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0113 begin');
      await delayTick();
      expect(canSwitchTab(4, 1, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0113 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_11400
     * @tc.name      testSwitchTabGrid0114
     * @tc.desc      Verify canSwitchTab(4, 1, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0114 begin');
      await delayTick();
      expect(canSwitchTab(4, 1, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0114 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_11500
     * @tc.name      testSwitchTabGrid0115
     * @tc.desc      Verify canSwitchTab(4, 2, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0115 begin');
      await delayTick();
      expect(canSwitchTab(4, 2, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0115 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_11600
     * @tc.name      testSwitchTabGrid0116
     * @tc.desc      Verify canSwitchTab(4, 2, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0116 begin');
      await delayTick();
      expect(canSwitchTab(4, 2, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0116 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_11700
     * @tc.name      testSwitchTabGrid0117
     * @tc.desc      Verify canSwitchTab(4, 4, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0117 begin');
      await delayTick();
      expect(canSwitchTab(4, 4, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0117 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_11800
     * @tc.name      testSwitchTabGrid0118
     * @tc.desc      Verify canSwitchTab(4, 4, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0118 begin');
      await delayTick();
      expect(canSwitchTab(4, 4, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0118 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_11900
     * @tc.name      testSwitchTabGrid0119
     * @tc.desc      Verify canSwitchTab(4, 5, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0119 begin');
      await delayTick();
      expect(canSwitchTab(4, 5, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0119 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP3_12000
     * @tc.name      testSwitchTabGrid0120
     * @tc.desc      Verify canSwitchTab(4, 5, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0120 begin');
      await delayTick();
      expect(canSwitchTab(4, 5, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0120 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP4_12100
     * @tc.name      testSwitchTabGrid0121
     * @tc.desc      Verify canSwitchTab(5, -1, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0121 begin');
      await delayTick();
      expect(canSwitchTab(5, -1, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0121 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP4_12200
     * @tc.name      testSwitchTabGrid0122
     * @tc.desc      Verify canSwitchTab(5, -1, false, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0122 begin');
      await delayTick();
      expect(canSwitchTab(5, -1, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0122 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP4_12300
     * @tc.name      testSwitchTabGrid0123
     * @tc.desc      Verify canSwitchTab(5, 0, true, 0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0123 begin');
      await delayTick();
      expect(canSwitchTab(5, 0, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0123 end');
    })

  })
}
