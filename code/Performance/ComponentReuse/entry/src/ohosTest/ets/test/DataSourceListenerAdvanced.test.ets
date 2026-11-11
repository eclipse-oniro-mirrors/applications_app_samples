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
import { BasicDataSource } from '../../../main/ets/model/BasicDataSource';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentReuse_DataSourceListenerAdvanced]';

class ProbeSource extends BasicDataSource<number> {
  private items: number[] = [];

  public totalCount(): number {
    return this.items.length;
  }

  public getData(index: number): number {
    return this.items[index];
  }
}

class CountingListener implements DataChangeListener {
  public addCount: number = 0;
  public lastIndex: number = -1;
  public reloadCount: number = 0;

  onDataReloaded(): void {
    this.reloadCount++;
  }

  onDataAdded(index: number): void {
  }

  onDataAdd(index: number): void {
    this.addCount++;
    this.lastIndex = index;
  }

  onDataChange(index: number): void {
  }

  onDataChanged(index: number): void {
  }

  onDataDelete(index: number): void {
  }

  onDataDeleted(index: number): void {
  }

  onDataMove(from: number, to: number): void {
  }

  onDataMoved(from: number, to: number): void {
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
  }
}

export default function dataSourceListenerAdvancedTest() {
  describe('dataSourceListenerAdvancedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0129
     * @tc.name      testDataSourceListener0129
     * @tc.desc      Verify dataSourceListener behavior for matrix index 128.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0129 begin');
      const index: number = 128;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0129 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0130
     * @tc.name      testDataSourceListener0130
     * @tc.desc      Verify dataSourceListener behavior for matrix index 129.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0130 begin');
      const index: number = 129;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0130 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0131
     * @tc.name      testDataSourceListener0131
     * @tc.desc      Verify dataSourceListener behavior for matrix index 130.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0131 begin');
      const index: number = 130;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0131 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0132
     * @tc.name      testDataSourceListener0132
     * @tc.desc      Verify dataSourceListener behavior for matrix index 131.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0132 begin');
      const index: number = 131;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0132 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0133
     * @tc.name      testDataSourceListener0133
     * @tc.desc      Verify dataSourceListener behavior for matrix index 132.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0133 begin');
      const index: number = 132;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0133 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0134
     * @tc.name      testDataSourceListener0134
     * @tc.desc      Verify dataSourceListener behavior for matrix index 133.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0134 begin');
      const index: number = 133;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0134 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0135
     * @tc.name      testDataSourceListener0135
     * @tc.desc      Verify dataSourceListener behavior for matrix index 134.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0135 begin');
      const index: number = 134;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0135 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0136
     * @tc.name      testDataSourceListener0136
     * @tc.desc      Verify dataSourceListener behavior for matrix index 135.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0136 begin');
      const index: number = 135;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0136 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0137
     * @tc.name      testDataSourceListener0137
     * @tc.desc      Verify dataSourceListener behavior for matrix index 136.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0137 begin');
      const index: number = 136;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0137 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0138
     * @tc.name      testDataSourceListener0138
     * @tc.desc      Verify dataSourceListener behavior for matrix index 137.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0138 begin');
      const index: number = 137;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0138 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0139
     * @tc.name      testDataSourceListener0139
     * @tc.desc      Verify dataSourceListener behavior for matrix index 138.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0139 begin');
      const index: number = 138;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0139 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0140
     * @tc.name      testDataSourceListener0140
     * @tc.desc      Verify dataSourceListener behavior for matrix index 139.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0140 begin');
      const index: number = 139;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0140 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0141
     * @tc.name      testDataSourceListener0141
     * @tc.desc      Verify dataSourceListener behavior for matrix index 140.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0141 begin');
      const index: number = 140;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0141 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0142
     * @tc.name      testDataSourceListener0142
     * @tc.desc      Verify dataSourceListener behavior for matrix index 141.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0142 begin');
      const index: number = 141;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0142 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0143
     * @tc.name      testDataSourceListener0143
     * @tc.desc      Verify dataSourceListener behavior for matrix index 142.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0143 begin');
      const index: number = 142;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0143 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0144
     * @tc.name      testDataSourceListener0144
     * @tc.desc      Verify dataSourceListener behavior for matrix index 143.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0144 begin');
      const index: number = 143;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0144 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0145
     * @tc.name      testDataSourceListener0145
     * @tc.desc      Verify dataSourceListener behavior for matrix index 144.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0145 begin');
      const index: number = 144;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0145 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0146
     * @tc.name      testDataSourceListener0146
     * @tc.desc      Verify dataSourceListener behavior for matrix index 145.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0146 begin');
      const index: number = 145;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0146 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0147
     * @tc.name      testDataSourceListener0147
     * @tc.desc      Verify dataSourceListener behavior for matrix index 146.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0147 begin');
      const index: number = 146;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0147 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0148
     * @tc.name      testDataSourceListener0148
     * @tc.desc      Verify dataSourceListener behavior for matrix index 147.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0148 begin');
      const index: number = 147;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0148 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0149
     * @tc.name      testDataSourceListener0149
     * @tc.desc      Verify dataSourceListener behavior for matrix index 148.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0149 begin');
      const index: number = 148;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0149 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0150
     * @tc.name      testDataSourceListener0150
     * @tc.desc      Verify dataSourceListener behavior for matrix index 149.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0150 begin');
      const index: number = 149;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0150 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0151
     * @tc.name      testDataSourceListener0151
     * @tc.desc      Verify dataSourceListener behavior for matrix index 150.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0151 begin');
      const index: number = 150;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0151 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0152
     * @tc.name      testDataSourceListener0152
     * @tc.desc      Verify dataSourceListener behavior for matrix index 151.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0152 begin');
      const index: number = 151;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0152 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0153
     * @tc.name      testDataSourceListener0153
     * @tc.desc      Verify dataSourceListener behavior for matrix index 152.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0153 begin');
      const index: number = 152;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0153 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0154
     * @tc.name      testDataSourceListener0154
     * @tc.desc      Verify dataSourceListener behavior for matrix index 153.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0154 begin');
      const index: number = 153;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0154 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0155
     * @tc.name      testDataSourceListener0155
     * @tc.desc      Verify dataSourceListener behavior for matrix index 154.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0155 begin');
      const index: number = 154;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0155 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0156
     * @tc.name      testDataSourceListener0156
     * @tc.desc      Verify dataSourceListener behavior for matrix index 155.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0156 begin');
      const index: number = 155;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0156 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0157
     * @tc.name      testDataSourceListener0157
     * @tc.desc      Verify dataSourceListener behavior for matrix index 156.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0157 begin');
      const index: number = 156;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0157 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0158
     * @tc.name      testDataSourceListener0158
     * @tc.desc      Verify dataSourceListener behavior for matrix index 157.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0158 begin');
      const index: number = 157;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0158 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0159
     * @tc.name      testDataSourceListener0159
     * @tc.desc      Verify dataSourceListener behavior for matrix index 158.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0159 begin');
      const index: number = 158;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0159 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0160
     * @tc.name      testDataSourceListener0160
     * @tc.desc      Verify dataSourceListener behavior for matrix index 159.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0160 begin');
      const index: number = 159;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0160 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0161
     * @tc.name      testDataSourceListener0161
     * @tc.desc      Verify dataSourceListener behavior for matrix index 160.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0161 begin');
      const index: number = 160;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0161 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0162
     * @tc.name      testDataSourceListener0162
     * @tc.desc      Verify dataSourceListener behavior for matrix index 161.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0162 begin');
      const index: number = 161;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0162 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0163
     * @tc.name      testDataSourceListener0163
     * @tc.desc      Verify dataSourceListener behavior for matrix index 162.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0163 begin');
      const index: number = 162;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0163 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0164
     * @tc.name      testDataSourceListener0164
     * @tc.desc      Verify dataSourceListener behavior for matrix index 163.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0164 begin');
      const index: number = 163;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0164 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0165
     * @tc.name      testDataSourceListener0165
     * @tc.desc      Verify dataSourceListener behavior for matrix index 164.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0165 begin');
      const index: number = 164;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0165 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0166
     * @tc.name      testDataSourceListener0166
     * @tc.desc      Verify dataSourceListener behavior for matrix index 165.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0166 begin');
      const index: number = 165;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0166 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0167
     * @tc.name      testDataSourceListener0167
     * @tc.desc      Verify dataSourceListener behavior for matrix index 166.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0167 begin');
      const index: number = 166;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0167 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0168
     * @tc.name      testDataSourceListener0168
     * @tc.desc      Verify dataSourceListener behavior for matrix index 167.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0168 begin');
      const index: number = 167;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0168 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0169
     * @tc.name      testDataSourceListener0169
     * @tc.desc      Verify dataSourceListener behavior for matrix index 168.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0169 begin');
      const index: number = 168;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0169 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0170
     * @tc.name      testDataSourceListener0170
     * @tc.desc      Verify dataSourceListener behavior for matrix index 169.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0170 begin');
      const index: number = 169;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0170 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0171
     * @tc.name      testDataSourceListener0171
     * @tc.desc      Verify dataSourceListener behavior for matrix index 170.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0171 begin');
      const index: number = 170;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0171 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0172
     * @tc.name      testDataSourceListener0172
     * @tc.desc      Verify dataSourceListener behavior for matrix index 171.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0172 begin');
      const index: number = 171;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0172 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0173
     * @tc.name      testDataSourceListener0173
     * @tc.desc      Verify dataSourceListener behavior for matrix index 172.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0173 begin');
      const index: number = 172;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0173 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0174
     * @tc.name      testDataSourceListener0174
     * @tc.desc      Verify dataSourceListener behavior for matrix index 173.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0174 begin');
      const index: number = 173;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0174 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0175
     * @tc.name      testDataSourceListener0175
     * @tc.desc      Verify dataSourceListener behavior for matrix index 174.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0175 begin');
      const index: number = 174;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0175 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0176
     * @tc.name      testDataSourceListener0176
     * @tc.desc      Verify dataSourceListener behavior for matrix index 175.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0176 begin');
      const index: number = 175;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0176 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0177
     * @tc.name      testDataSourceListener0177
     * @tc.desc      Verify dataSourceListener behavior for matrix index 176.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0177 begin');
      const index: number = 176;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0177 end');
    })


    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0192
     * @tc.name      testDataSourceListener0192
     * @tc.desc      Verify dataSourceListener behavior for matrix index 191.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0192 begin');
      const index: number = 191;
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (index % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = index % 16;
      source.notifyDataAdd(notifyIndex);
      for (let n: number = 0; n < listeners.length; n++) {
        expect(listeners[n].addCount).assertEqual(1);
        expect(listeners[n].lastIndex).assertEqual(notifyIndex);
      }
      source.registerDataChangeListener(listeners[0]);
      source.notifyDataAdd(notifyIndex + 1);
      expect(listeners[0].addCount).assertEqual(2);
      expect(listeners[1].addCount).assertEqual(2);
      source.unregisterDataChangeListener(listeners[listenerCount - 1]);
      source.notifyDataAdd(notifyIndex + 2);
      expect(listeners[listenerCount - 1].addCount).assertEqual(2);
      expect(listeners[0].addCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0192 end');
    })

  })
}
