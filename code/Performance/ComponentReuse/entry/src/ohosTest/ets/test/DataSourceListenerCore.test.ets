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
const TAG: string = '[Sample_ComponentReuse_DataSourceListenerCore]';

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

export default function dataSourceListenerCoreTest() {
  describe('dataSourceListenerCoreTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0001
     * @tc.name      testDataSourceListener0001
     * @tc.desc      Verify dataSourceListener behavior for matrix index 0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0001 begin');
      const index: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0001 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0002
     * @tc.name      testDataSourceListener0002
     * @tc.desc      Verify dataSourceListener behavior for matrix index 1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0002 begin');
      const index: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0002 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0003
     * @tc.name      testDataSourceListener0003
     * @tc.desc      Verify dataSourceListener behavior for matrix index 2.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0003 begin');
      const index: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0003 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0004
     * @tc.name      testDataSourceListener0004
     * @tc.desc      Verify dataSourceListener behavior for matrix index 3.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0004 begin');
      const index: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0004 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0005
     * @tc.name      testDataSourceListener0005
     * @tc.desc      Verify dataSourceListener behavior for matrix index 4.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0005 begin');
      const index: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0005 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0006
     * @tc.name      testDataSourceListener0006
     * @tc.desc      Verify dataSourceListener behavior for matrix index 5.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0006 begin');
      const index: number = 5;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0006 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0007
     * @tc.name      testDataSourceListener0007
     * @tc.desc      Verify dataSourceListener behavior for matrix index 6.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0007 begin');
      const index: number = 6;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0007 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0008
     * @tc.name      testDataSourceListener0008
     * @tc.desc      Verify dataSourceListener behavior for matrix index 7.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0008 begin');
      const index: number = 7;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0008 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0009
     * @tc.name      testDataSourceListener0009
     * @tc.desc      Verify dataSourceListener behavior for matrix index 8.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0009 begin');
      const index: number = 8;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0009 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0010
     * @tc.name      testDataSourceListener0010
     * @tc.desc      Verify dataSourceListener behavior for matrix index 9.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0010 begin');
      const index: number = 9;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0010 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0011
     * @tc.name      testDataSourceListener0011
     * @tc.desc      Verify dataSourceListener behavior for matrix index 10.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0011 begin');
      const index: number = 10;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0011 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0012
     * @tc.name      testDataSourceListener0012
     * @tc.desc      Verify dataSourceListener behavior for matrix index 11.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0012 begin');
      const index: number = 11;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0012 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0013
     * @tc.name      testDataSourceListener0013
     * @tc.desc      Verify dataSourceListener behavior for matrix index 12.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0013 begin');
      const index: number = 12;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0013 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0014
     * @tc.name      testDataSourceListener0014
     * @tc.desc      Verify dataSourceListener behavior for matrix index 13.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0014 begin');
      const index: number = 13;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0014 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0015
     * @tc.name      testDataSourceListener0015
     * @tc.desc      Verify dataSourceListener behavior for matrix index 14.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0015 begin');
      const index: number = 14;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0015 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0016
     * @tc.name      testDataSourceListener0016
     * @tc.desc      Verify dataSourceListener behavior for matrix index 15.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0016 begin');
      const index: number = 15;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0016 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0017
     * @tc.name      testDataSourceListener0017
     * @tc.desc      Verify dataSourceListener behavior for matrix index 16.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0017 begin');
      const index: number = 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0017 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0018
     * @tc.name      testDataSourceListener0018
     * @tc.desc      Verify dataSourceListener behavior for matrix index 17.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0018 begin');
      const index: number = 17;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0018 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0019
     * @tc.name      testDataSourceListener0019
     * @tc.desc      Verify dataSourceListener behavior for matrix index 18.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0019 begin');
      const index: number = 18;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0019 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0020
     * @tc.name      testDataSourceListener0020
     * @tc.desc      Verify dataSourceListener behavior for matrix index 19.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0020 begin');
      const index: number = 19;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0020 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0021
     * @tc.name      testDataSourceListener0021
     * @tc.desc      Verify dataSourceListener behavior for matrix index 20.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0021 begin');
      const index: number = 20;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0021 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0022
     * @tc.name      testDataSourceListener0022
     * @tc.desc      Verify dataSourceListener behavior for matrix index 21.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0022 begin');
      const index: number = 21;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0022 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0023
     * @tc.name      testDataSourceListener0023
     * @tc.desc      Verify dataSourceListener behavior for matrix index 22.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0023 begin');
      const index: number = 22;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0023 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0024
     * @tc.name      testDataSourceListener0024
     * @tc.desc      Verify dataSourceListener behavior for matrix index 23.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0024 begin');
      const index: number = 23;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0024 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0025
     * @tc.name      testDataSourceListener0025
     * @tc.desc      Verify dataSourceListener behavior for matrix index 24.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0025 begin');
      const index: number = 24;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0025 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0026
     * @tc.name      testDataSourceListener0026
     * @tc.desc      Verify dataSourceListener behavior for matrix index 25.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0026 begin');
      const index: number = 25;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0026 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0027
     * @tc.name      testDataSourceListener0027
     * @tc.desc      Verify dataSourceListener behavior for matrix index 26.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0027 begin');
      const index: number = 26;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0027 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0028
     * @tc.name      testDataSourceListener0028
     * @tc.desc      Verify dataSourceListener behavior for matrix index 27.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0028 begin');
      const index: number = 27;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0028 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0029
     * @tc.name      testDataSourceListener0029
     * @tc.desc      Verify dataSourceListener behavior for matrix index 28.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0029 begin');
      const index: number = 28;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0029 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0030
     * @tc.name      testDataSourceListener0030
     * @tc.desc      Verify dataSourceListener behavior for matrix index 29.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0030 begin');
      const index: number = 29;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0030 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0031
     * @tc.name      testDataSourceListener0031
     * @tc.desc      Verify dataSourceListener behavior for matrix index 30.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0031 begin');
      const index: number = 30;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0031 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0032
     * @tc.name      testDataSourceListener0032
     * @tc.desc      Verify dataSourceListener behavior for matrix index 31.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0032 begin');
      const index: number = 31;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0032 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0033
     * @tc.name      testDataSourceListener0033
     * @tc.desc      Verify dataSourceListener behavior for matrix index 32.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0033 begin');
      const index: number = 32;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0033 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0034
     * @tc.name      testDataSourceListener0034
     * @tc.desc      Verify dataSourceListener behavior for matrix index 33.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0034 begin');
      const index: number = 33;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0034 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0035
     * @tc.name      testDataSourceListener0035
     * @tc.desc      Verify dataSourceListener behavior for matrix index 34.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0035 begin');
      const index: number = 34;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0035 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0036
     * @tc.name      testDataSourceListener0036
     * @tc.desc      Verify dataSourceListener behavior for matrix index 35.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0036 begin');
      const index: number = 35;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0036 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0037
     * @tc.name      testDataSourceListener0037
     * @tc.desc      Verify dataSourceListener behavior for matrix index 36.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0037 begin');
      const index: number = 36;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0037 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0038
     * @tc.name      testDataSourceListener0038
     * @tc.desc      Verify dataSourceListener behavior for matrix index 37.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0038 begin');
      const index: number = 37;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0038 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0039
     * @tc.name      testDataSourceListener0039
     * @tc.desc      Verify dataSourceListener behavior for matrix index 38.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0039 begin');
      const index: number = 38;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0039 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0040
     * @tc.name      testDataSourceListener0040
     * @tc.desc      Verify dataSourceListener behavior for matrix index 39.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0040 begin');
      const index: number = 39;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0040 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0041
     * @tc.name      testDataSourceListener0041
     * @tc.desc      Verify dataSourceListener behavior for matrix index 40.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0041 begin');
      const index: number = 40;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0041 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0042
     * @tc.name      testDataSourceListener0042
     * @tc.desc      Verify dataSourceListener behavior for matrix index 41.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0042 begin');
      const index: number = 41;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0042 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0043
     * @tc.name      testDataSourceListener0043
     * @tc.desc      Verify dataSourceListener behavior for matrix index 42.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0043 begin');
      const index: number = 42;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0043 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0044
     * @tc.name      testDataSourceListener0044
     * @tc.desc      Verify dataSourceListener behavior for matrix index 43.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0044 begin');
      const index: number = 43;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0044 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0045
     * @tc.name      testDataSourceListener0045
     * @tc.desc      Verify dataSourceListener behavior for matrix index 44.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0045 begin');
      const index: number = 44;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0045 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0046
     * @tc.name      testDataSourceListener0046
     * @tc.desc      Verify dataSourceListener behavior for matrix index 45.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0046 begin');
      const index: number = 45;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0046 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0047
     * @tc.name      testDataSourceListener0047
     * @tc.desc      Verify dataSourceListener behavior for matrix index 46.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0047 begin');
      const index: number = 46;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0047 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0048
     * @tc.name      testDataSourceListener0048
     * @tc.desc      Verify dataSourceListener behavior for matrix index 47.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0048 begin');
      const index: number = 47;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0048 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0049
     * @tc.name      testDataSourceListener0049
     * @tc.desc      Verify dataSourceListener behavior for matrix index 48.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0049 begin');
      const index: number = 48;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0049 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0050
     * @tc.name      testDataSourceListener0050
     * @tc.desc      Verify dataSourceListener behavior for matrix index 49.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0050 begin');
      const index: number = 49;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0050 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0051
     * @tc.name      testDataSourceListener0051
     * @tc.desc      Verify dataSourceListener behavior for matrix index 50.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0051 begin');
      const index: number = 50;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0051 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0052
     * @tc.name      testDataSourceListener0052
     * @tc.desc      Verify dataSourceListener behavior for matrix index 51.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0052 begin');
      const index: number = 51;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0052 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0053
     * @tc.name      testDataSourceListener0053
     * @tc.desc      Verify dataSourceListener behavior for matrix index 52.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0053 begin');
      const index: number = 52;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0053 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0054
     * @tc.name      testDataSourceListener0054
     * @tc.desc      Verify dataSourceListener behavior for matrix index 53.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0054 begin');
      const index: number = 53;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0054 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0055
     * @tc.name      testDataSourceListener0055
     * @tc.desc      Verify dataSourceListener behavior for matrix index 54.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0055 begin');
      const index: number = 54;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0055 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0056
     * @tc.name      testDataSourceListener0056
     * @tc.desc      Verify dataSourceListener behavior for matrix index 55.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0056 begin');
      const index: number = 55;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0056 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0057
     * @tc.name      testDataSourceListener0057
     * @tc.desc      Verify dataSourceListener behavior for matrix index 56.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0057 begin');
      const index: number = 56;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0057 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0058
     * @tc.name      testDataSourceListener0058
     * @tc.desc      Verify dataSourceListener behavior for matrix index 57.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0058 begin');
      const index: number = 57;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0058 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0059
     * @tc.name      testDataSourceListener0059
     * @tc.desc      Verify dataSourceListener behavior for matrix index 58.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0059 begin');
      const index: number = 58;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0059 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0060
     * @tc.name      testDataSourceListener0060
     * @tc.desc      Verify dataSourceListener behavior for matrix index 59.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0060 begin');
      const index: number = 59;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0060 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0061
     * @tc.name      testDataSourceListener0061
     * @tc.desc      Verify dataSourceListener behavior for matrix index 60.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0061 begin');
      const index: number = 60;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0061 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0062
     * @tc.name      testDataSourceListener0062
     * @tc.desc      Verify dataSourceListener behavior for matrix index 61.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0062 begin');
      const index: number = 61;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0062 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0063
     * @tc.name      testDataSourceListener0063
     * @tc.desc      Verify dataSourceListener behavior for matrix index 62.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0063 begin');
      const index: number = 62;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0063 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0064
     * @tc.name      testDataSourceListener0064
     * @tc.desc      Verify dataSourceListener behavior for matrix index 63.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0064 begin');
      const index: number = 63;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0064 end');
    })

  })
}
