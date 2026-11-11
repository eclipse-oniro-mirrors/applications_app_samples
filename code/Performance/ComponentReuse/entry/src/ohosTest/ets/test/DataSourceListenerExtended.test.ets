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
const TAG: string = '[Sample_ComponentReuse_DataSourceListenerExtended]';

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

export default function dataSourceListenerExtendedTest() {
  describe('dataSourceListenerExtendedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0065
     * @tc.name      testDataSourceListener0065
     * @tc.desc      Verify dataSourceListener behavior for matrix index 64.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0065 begin');
      const index: number = 64;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0065 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0066
     * @tc.name      testDataSourceListener0066
     * @tc.desc      Verify dataSourceListener behavior for matrix index 65.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0066 begin');
      const index: number = 65;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0066 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0067
     * @tc.name      testDataSourceListener0067
     * @tc.desc      Verify dataSourceListener behavior for matrix index 66.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0067 begin');
      const index: number = 66;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0067 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0068
     * @tc.name      testDataSourceListener0068
     * @tc.desc      Verify dataSourceListener behavior for matrix index 67.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0068 begin');
      const index: number = 67;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0068 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0069
     * @tc.name      testDataSourceListener0069
     * @tc.desc      Verify dataSourceListener behavior for matrix index 68.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0069 begin');
      const index: number = 68;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0069 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0070
     * @tc.name      testDataSourceListener0070
     * @tc.desc      Verify dataSourceListener behavior for matrix index 69.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0070 begin');
      const index: number = 69;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0070 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0071
     * @tc.name      testDataSourceListener0071
     * @tc.desc      Verify dataSourceListener behavior for matrix index 70.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0071 begin');
      const index: number = 70;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0071 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0072
     * @tc.name      testDataSourceListener0072
     * @tc.desc      Verify dataSourceListener behavior for matrix index 71.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0072 begin');
      const index: number = 71;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0072 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0073
     * @tc.name      testDataSourceListener0073
     * @tc.desc      Verify dataSourceListener behavior for matrix index 72.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0073 begin');
      const index: number = 72;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0073 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0074
     * @tc.name      testDataSourceListener0074
     * @tc.desc      Verify dataSourceListener behavior for matrix index 73.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0074 begin');
      const index: number = 73;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0074 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0075
     * @tc.name      testDataSourceListener0075
     * @tc.desc      Verify dataSourceListener behavior for matrix index 74.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0075 begin');
      const index: number = 74;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0075 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0076
     * @tc.name      testDataSourceListener0076
     * @tc.desc      Verify dataSourceListener behavior for matrix index 75.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0076 begin');
      const index: number = 75;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0076 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0077
     * @tc.name      testDataSourceListener0077
     * @tc.desc      Verify dataSourceListener behavior for matrix index 76.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0077 begin');
      const index: number = 76;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0077 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0078
     * @tc.name      testDataSourceListener0078
     * @tc.desc      Verify dataSourceListener behavior for matrix index 77.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0078 begin');
      const index: number = 77;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0078 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0079
     * @tc.name      testDataSourceListener0079
     * @tc.desc      Verify dataSourceListener behavior for matrix index 78.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0079 begin');
      const index: number = 78;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0079 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0080
     * @tc.name      testDataSourceListener0080
     * @tc.desc      Verify dataSourceListener behavior for matrix index 79.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0080 begin');
      const index: number = 79;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0080 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0081
     * @tc.name      testDataSourceListener0081
     * @tc.desc      Verify dataSourceListener behavior for matrix index 80.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0081 begin');
      const index: number = 80;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0081 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0082
     * @tc.name      testDataSourceListener0082
     * @tc.desc      Verify dataSourceListener behavior for matrix index 81.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0082 begin');
      const index: number = 81;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0082 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0083
     * @tc.name      testDataSourceListener0083
     * @tc.desc      Verify dataSourceListener behavior for matrix index 82.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0083 begin');
      const index: number = 82;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0083 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0084
     * @tc.name      testDataSourceListener0084
     * @tc.desc      Verify dataSourceListener behavior for matrix index 83.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0084 begin');
      const index: number = 83;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0084 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0085
     * @tc.name      testDataSourceListener0085
     * @tc.desc      Verify dataSourceListener behavior for matrix index 84.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0085 begin');
      const index: number = 84;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0085 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0086
     * @tc.name      testDataSourceListener0086
     * @tc.desc      Verify dataSourceListener behavior for matrix index 85.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0086 begin');
      const index: number = 85;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0086 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0087
     * @tc.name      testDataSourceListener0087
     * @tc.desc      Verify dataSourceListener behavior for matrix index 86.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0087 begin');
      const index: number = 86;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0087 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0088
     * @tc.name      testDataSourceListener0088
     * @tc.desc      Verify dataSourceListener behavior for matrix index 87.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0088 begin');
      const index: number = 87;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0088 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0089
     * @tc.name      testDataSourceListener0089
     * @tc.desc      Verify dataSourceListener behavior for matrix index 88.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0089 begin');
      const index: number = 88;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0089 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0090
     * @tc.name      testDataSourceListener0090
     * @tc.desc      Verify dataSourceListener behavior for matrix index 89.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0090 begin');
      const index: number = 89;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0090 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0091
     * @tc.name      testDataSourceListener0091
     * @tc.desc      Verify dataSourceListener behavior for matrix index 90.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0091 begin');
      const index: number = 90;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0091 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0092
     * @tc.name      testDataSourceListener0092
     * @tc.desc      Verify dataSourceListener behavior for matrix index 91.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0092 begin');
      const index: number = 91;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0092 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0093
     * @tc.name      testDataSourceListener0093
     * @tc.desc      Verify dataSourceListener behavior for matrix index 92.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0093 begin');
      const index: number = 92;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0093 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0094
     * @tc.name      testDataSourceListener0094
     * @tc.desc      Verify dataSourceListener behavior for matrix index 93.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0094 begin');
      const index: number = 93;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0094 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0095
     * @tc.name      testDataSourceListener0095
     * @tc.desc      Verify dataSourceListener behavior for matrix index 94.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0095 begin');
      const index: number = 94;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0095 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0096
     * @tc.name      testDataSourceListener0096
     * @tc.desc      Verify dataSourceListener behavior for matrix index 95.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0096 begin');
      const index: number = 95;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0096 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0097
     * @tc.name      testDataSourceListener0097
     * @tc.desc      Verify dataSourceListener behavior for matrix index 96.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0097 begin');
      const index: number = 96;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0097 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0098
     * @tc.name      testDataSourceListener0098
     * @tc.desc      Verify dataSourceListener behavior for matrix index 97.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0098 begin');
      const index: number = 97;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0098 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0099
     * @tc.name      testDataSourceListener0099
     * @tc.desc      Verify dataSourceListener behavior for matrix index 98.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0099 begin');
      const index: number = 98;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0099 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0100
     * @tc.name      testDataSourceListener0100
     * @tc.desc      Verify dataSourceListener behavior for matrix index 99.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0100 begin');
      const index: number = 99;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0100 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0101
     * @tc.name      testDataSourceListener0101
     * @tc.desc      Verify dataSourceListener behavior for matrix index 100.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0101 begin');
      const index: number = 100;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0101 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0102
     * @tc.name      testDataSourceListener0102
     * @tc.desc      Verify dataSourceListener behavior for matrix index 101.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0102 begin');
      const index: number = 101;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0102 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0103
     * @tc.name      testDataSourceListener0103
     * @tc.desc      Verify dataSourceListener behavior for matrix index 102.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0103 begin');
      const index: number = 102;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0103 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0104
     * @tc.name      testDataSourceListener0104
     * @tc.desc      Verify dataSourceListener behavior for matrix index 103.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0104 begin');
      const index: number = 103;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0104 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0105
     * @tc.name      testDataSourceListener0105
     * @tc.desc      Verify dataSourceListener behavior for matrix index 104.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0105 begin');
      const index: number = 104;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0105 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0106
     * @tc.name      testDataSourceListener0106
     * @tc.desc      Verify dataSourceListener behavior for matrix index 105.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0106 begin');
      const index: number = 105;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0106 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0107
     * @tc.name      testDataSourceListener0107
     * @tc.desc      Verify dataSourceListener behavior for matrix index 106.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0107 begin');
      const index: number = 106;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0107 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0108
     * @tc.name      testDataSourceListener0108
     * @tc.desc      Verify dataSourceListener behavior for matrix index 107.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0108 begin');
      const index: number = 107;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0108 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0109
     * @tc.name      testDataSourceListener0109
     * @tc.desc      Verify dataSourceListener behavior for matrix index 108.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0109 begin');
      const index: number = 108;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0109 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0110
     * @tc.name      testDataSourceListener0110
     * @tc.desc      Verify dataSourceListener behavior for matrix index 109.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0110 begin');
      const index: number = 109;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0110 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0111
     * @tc.name      testDataSourceListener0111
     * @tc.desc      Verify dataSourceListener behavior for matrix index 110.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0111 begin');
      const index: number = 110;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0111 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0112
     * @tc.name      testDataSourceListener0112
     * @tc.desc      Verify dataSourceListener behavior for matrix index 111.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0112 begin');
      const index: number = 111;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0112 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0113
     * @tc.name      testDataSourceListener0113
     * @tc.desc      Verify dataSourceListener behavior for matrix index 112.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0113 begin');
      const index: number = 112;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0113 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0114
     * @tc.name      testDataSourceListener0114
     * @tc.desc      Verify dataSourceListener behavior for matrix index 113.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0114 begin');
      const index: number = 113;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0114 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0115
     * @tc.name      testDataSourceListener0115
     * @tc.desc      Verify dataSourceListener behavior for matrix index 114.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0115 begin');
      const index: number = 114;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0115 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0116
     * @tc.name      testDataSourceListener0116
     * @tc.desc      Verify dataSourceListener behavior for matrix index 115.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0116 begin');
      const index: number = 115;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0116 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0117
     * @tc.name      testDataSourceListener0117
     * @tc.desc      Verify dataSourceListener behavior for matrix index 116.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0117 begin');
      const index: number = 116;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0117 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0118
     * @tc.name      testDataSourceListener0118
     * @tc.desc      Verify dataSourceListener behavior for matrix index 117.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0118 begin');
      const index: number = 117;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0118 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0119
     * @tc.name      testDataSourceListener0119
     * @tc.desc      Verify dataSourceListener behavior for matrix index 118.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0119 begin');
      const index: number = 118;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0119 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0120
     * @tc.name      testDataSourceListener0120
     * @tc.desc      Verify dataSourceListener behavior for matrix index 119.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0120 begin');
      const index: number = 119;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0120 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0121
     * @tc.name      testDataSourceListener0121
     * @tc.desc      Verify dataSourceListener behavior for matrix index 120.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0121 begin');
      const index: number = 120;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0121 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0122
     * @tc.name      testDataSourceListener0122
     * @tc.desc      Verify dataSourceListener behavior for matrix index 121.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0122 begin');
      const index: number = 121;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0122 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0123
     * @tc.name      testDataSourceListener0123
     * @tc.desc      Verify dataSourceListener behavior for matrix index 122.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0123 begin');
      const index: number = 122;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0123 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0124
     * @tc.name      testDataSourceListener0124
     * @tc.desc      Verify dataSourceListener behavior for matrix index 123.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0124 begin');
      const index: number = 123;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0124 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0125
     * @tc.name      testDataSourceListener0125
     * @tc.desc      Verify dataSourceListener behavior for matrix index 124.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0125 begin');
      const index: number = 124;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0125 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0126
     * @tc.name      testDataSourceListener0126
     * @tc.desc      Verify dataSourceListener behavior for matrix index 125.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0126 begin');
      const index: number = 125;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0126 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0127
     * @tc.name      testDataSourceListener0127
     * @tc.desc      Verify dataSourceListener behavior for matrix index 126.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0127 begin');
      const index: number = 126;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0127 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0128
     * @tc.name      testDataSourceListener0128
     * @tc.desc      Verify dataSourceListener behavior for matrix index 127.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0128 begin');
      const index: number = 127;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0128 end');
    })

  })
}
