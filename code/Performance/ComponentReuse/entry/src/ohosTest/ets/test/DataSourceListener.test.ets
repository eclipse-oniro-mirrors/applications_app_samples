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
const TAG: string = '[Sample_ComponentReuse_DataSourceListener]';

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

export default function dataSourceListenerTest() {
  describe('dataSourceListenerTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0001
     * @tc.name testDataSourceListener0001
     * @tc.desc Verify DataSourceListener behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0001 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (0 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 0 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0001 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0002
     * @tc.name testDataSourceListener0002
     * @tc.desc Verify DataSourceListener behavior for matrix index 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0002 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (1 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 1 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0002 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0003
     * @tc.name testDataSourceListener0003
     * @tc.desc Verify DataSourceListener behavior for matrix index 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0003 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (2 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 2 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0003 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0004
     * @tc.name testDataSourceListener0004
     * @tc.desc Verify DataSourceListener behavior for matrix index 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0004 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (3 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 3 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0004 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0005
     * @tc.name testDataSourceListener0005
     * @tc.desc Verify DataSourceListener behavior for matrix index 4
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0005 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (4 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 4 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0005 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0006
     * @tc.name testDataSourceListener0006
     * @tc.desc Verify DataSourceListener behavior for matrix index 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0006 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (5 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 5 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0006 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0007
     * @tc.name testDataSourceListener0007
     * @tc.desc Verify DataSourceListener behavior for matrix index 6
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0007 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (6 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 6 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0007 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0008
     * @tc.name testDataSourceListener0008
     * @tc.desc Verify DataSourceListener behavior for matrix index 7
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0008 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (7 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 7 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0008 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0009
     * @tc.name testDataSourceListener0009
     * @tc.desc Verify DataSourceListener behavior for matrix index 8
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0009 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (8 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 8 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0009 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0010
     * @tc.name testDataSourceListener0010
     * @tc.desc Verify DataSourceListener behavior for matrix index 9
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0010 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (9 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 9 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0010 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0011
     * @tc.name testDataSourceListener0011
     * @tc.desc Verify DataSourceListener behavior for matrix index 10
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0011 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (10 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 10 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0011 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0012
     * @tc.name testDataSourceListener0012
     * @tc.desc Verify DataSourceListener behavior for matrix index 11
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0012 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (11 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 11 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0012 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0013
     * @tc.name testDataSourceListener0013
     * @tc.desc Verify DataSourceListener behavior for matrix index 12
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0013 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (12 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 12 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0013 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0014
     * @tc.name testDataSourceListener0014
     * @tc.desc Verify DataSourceListener behavior for matrix index 13
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0014 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (13 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 13 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0014 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0015
     * @tc.name testDataSourceListener0015
     * @tc.desc Verify DataSourceListener behavior for matrix index 14
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0015 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (14 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 14 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0015 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0016
     * @tc.name testDataSourceListener0016
     * @tc.desc Verify DataSourceListener behavior for matrix index 15
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0016 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (15 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 15 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0016 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0019
     * @tc.name testDataSourceListener0019
     * @tc.desc Verify DataSourceListener behavior for matrix index 18
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0019 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (18 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 18 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0019 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0020
     * @tc.name testDataSourceListener0020
     * @tc.desc Verify DataSourceListener behavior for matrix index 19
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0020 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (19 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 19 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0020 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0021
     * @tc.name testDataSourceListener0021
     * @tc.desc Verify DataSourceListener behavior for matrix index 20
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0021 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (20 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 20 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0021 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0026
     * @tc.name testDataSourceListener0026
     * @tc.desc Verify DataSourceListener behavior for matrix index 25
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0026 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (25 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 25 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0026 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0032
     * @tc.name testDataSourceListener0032
     * @tc.desc Verify DataSourceListener behavior for matrix index 31
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0032 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (31 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 31 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0032 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0040
     * @tc.name testDataSourceListener0040
     * @tc.desc Verify DataSourceListener behavior for matrix index 39
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0040 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (39 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 39 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0040 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0064
     * @tc.name testDataSourceListener0064
     * @tc.desc Verify DataSourceListener behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0064 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (63 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 63 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0064 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0065
     * @tc.name testDataSourceListener0065
     * @tc.desc Verify DataSourceListener behavior for matrix index 64
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0065 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (64 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 64 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0065 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0128
     * @tc.name testDataSourceListener0128
     * @tc.desc Verify DataSourceListener behavior for matrix index 127
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0128 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (127 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 127 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0128 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0129
     * @tc.name testDataSourceListener0129
     * @tc.desc Verify DataSourceListener behavior for matrix index 128
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0129 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (128 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 128 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0129 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0192
     * @tc.name testDataSourceListener0192
     * @tc.desc Verify DataSourceListener behavior for matrix index 191
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0192 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (191 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 191 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0192 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0255
     * @tc.name testDataSourceListener0255
     * @tc.desc Verify DataSourceListener behavior for matrix index 254
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0255 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (254 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 254 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0255 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_LISTENER_0256
     * @tc.name testDataSourceListener0256
     * @tc.desc Verify DataSourceListener behavior for matrix index 255
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDataSourceListener0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0256 begin`);
      const source: ProbeSource = new ProbeSource();
      const listenerCount: number = (255 % 7) + 2;
      const listeners: CountingListener[] = [];
      for (let n: number = 0; n < listenerCount; n++) {
        const listener: CountingListener = new CountingListener();
        source.registerDataChangeListener(listener);
        listeners.push(listener);
      }
      const notifyIndex: number = 255 % 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', `testDataSourceListener0256 end`);
    });
  })
}
