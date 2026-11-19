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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from './shared/TestPace';
import { CountingListener } from './shared/CountingListener';
import { TitleDataSource } from '@ohos/customreusablepool/src/main/ets/data/TitleDataSource';
import { WaterFlowDataSource } from '@ohos/customreusablepool/src/main/ets/data/WaterFlowDataSource';
import { ViewItem } from '@ohos/customreusablepool/src/main/ets/data/ViewItem';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PrebuildOnIdle_EventListener]';

function item(id: string): ViewItem {
  const v: ViewItem = new ViewItem();
  v.id = id;
  v.name = 'n_' + id;
  v.type = 0;
  return v;
}

export default function eventListenerLifecycleTest() {
  describe('eventListenerLifecycleTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_PREBUILD_EVENT_0100
     * @tc.name testTitleListenerFlow
     * @tc.desc Verify TitleDataSource notify, duplicate-register dedupe and unregister behaviour
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testTitleListenerFlow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTitleListenerFlow begin');
      const source: TitleDataSource = new TitleDataSource();
      const first: CountingListener = new CountingListener();
      const second: CountingListener = new CountingListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.addItem('a');
      source.addItem('b');
      expect(source.totalCount()).assertEqual(2);
      expect(first.addCount).assertEqual(2);
      expect(second.addCount).assertEqual(2);
      expect(first.lastAddIndex).assertEqual(1);

      source.registerDataChangeListener(first);
      source.addItem('c');
      expect(first.addCount).assertEqual(3);
      expect(second.addCount).assertEqual(3);

      source.unregisterDataChangeListener(second);
      source.addItem('d');
      expect(first.addCount).assertEqual(4);
      expect(second.addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTitleListenerFlow end');
    });

    /**
     * @tc.number SUB_PREBUILD_EVENT_0200
     * @tc.name testWaterFlowListenerFlow
     * @tc.desc Verify WaterFlowDataSource dispatch of reload/add/delete/change callbacks
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testWaterFlowListenerFlow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWaterFlowListenerFlow begin');
      const source: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: CountingListener = new CountingListener();
      source.registerDataChangeListener(listener);
      source.addItems([item('0'), item('1')]);
      expect(listener.reloadCount).assertEqual(1);
      expect(source.totalCount()).assertEqual(2);
      source.add1stItem(item('A'));
      expect(listener.addCount).assertEqual(1);
      expect(listener.lastAddIndex).assertEqual(0);
      source.delete1stItem();
      expect(listener.deleteCount).assertEqual(1);
      expect(listener.lastDeleteIndex).assertEqual(0);
      source.notifyDataChange(0);
      expect(listener.changeCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWaterFlowListenerFlow end');
    });
  })
}
