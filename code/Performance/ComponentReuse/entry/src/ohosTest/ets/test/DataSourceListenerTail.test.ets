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
const TAG: string = '[Sample_ComponentReuse_DataSourceListenerTail]';

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

export default function dataSourceListenerTailTest() {
  describe('dataSourceListenerTailTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0193
     * @tc.name      testDataSourceListener0193
     * @tc.desc      Verify dataSourceListener behavior for matrix index 192.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0193 begin');
      const index: number = 192;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0193 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0194
     * @tc.name      testDataSourceListener0194
     * @tc.desc      Verify dataSourceListener behavior for matrix index 193.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0194 begin');
      const index: number = 193;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0194 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0195
     * @tc.name      testDataSourceListener0195
     * @tc.desc      Verify dataSourceListener behavior for matrix index 194.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0195 begin');
      const index: number = 194;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0195 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0196
     * @tc.name      testDataSourceListener0196
     * @tc.desc      Verify dataSourceListener behavior for matrix index 195.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0196 begin');
      const index: number = 195;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0196 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0197
     * @tc.name      testDataSourceListener0197
     * @tc.desc      Verify dataSourceListener behavior for matrix index 196.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0197 begin');
      const index: number = 196;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0197 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0198
     * @tc.name      testDataSourceListener0198
     * @tc.desc      Verify dataSourceListener behavior for matrix index 197.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0198 begin');
      const index: number = 197;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0198 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0199
     * @tc.name      testDataSourceListener0199
     * @tc.desc      Verify dataSourceListener behavior for matrix index 198.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0199 begin');
      const index: number = 198;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0199 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0200
     * @tc.name      testDataSourceListener0200
     * @tc.desc      Verify dataSourceListener behavior for matrix index 199.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0200 begin');
      const index: number = 199;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0200 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0201
     * @tc.name      testDataSourceListener0201
     * @tc.desc      Verify dataSourceListener behavior for matrix index 200.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0201 begin');
      const index: number = 200;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0201 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0202
     * @tc.name      testDataSourceListener0202
     * @tc.desc      Verify dataSourceListener behavior for matrix index 201.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0202 begin');
      const index: number = 201;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0202 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0203
     * @tc.name      testDataSourceListener0203
     * @tc.desc      Verify dataSourceListener behavior for matrix index 202.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0203 begin');
      const index: number = 202;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0203 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0204
     * @tc.name      testDataSourceListener0204
     * @tc.desc      Verify dataSourceListener behavior for matrix index 203.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0204 begin');
      const index: number = 203;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0204 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0205
     * @tc.name      testDataSourceListener0205
     * @tc.desc      Verify dataSourceListener behavior for matrix index 204.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0205 begin');
      const index: number = 204;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0205 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0206
     * @tc.name      testDataSourceListener0206
     * @tc.desc      Verify dataSourceListener behavior for matrix index 205.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0206 begin');
      const index: number = 205;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0206 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0207
     * @tc.name      testDataSourceListener0207
     * @tc.desc      Verify dataSourceListener behavior for matrix index 206.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0207 begin');
      const index: number = 206;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0207 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0208
     * @tc.name      testDataSourceListener0208
     * @tc.desc      Verify dataSourceListener behavior for matrix index 207.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0208 begin');
      const index: number = 207;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0208 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0209
     * @tc.name      testDataSourceListener0209
     * @tc.desc      Verify dataSourceListener behavior for matrix index 208.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0209 begin');
      const index: number = 208;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0209 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0210
     * @tc.name      testDataSourceListener0210
     * @tc.desc      Verify dataSourceListener behavior for matrix index 209.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0210 begin');
      const index: number = 209;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0210 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0211
     * @tc.name      testDataSourceListener0211
     * @tc.desc      Verify dataSourceListener behavior for matrix index 210.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0211 begin');
      const index: number = 210;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0211 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0212
     * @tc.name      testDataSourceListener0212
     * @tc.desc      Verify dataSourceListener behavior for matrix index 211.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0212 begin');
      const index: number = 211;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0212 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0213
     * @tc.name      testDataSourceListener0213
     * @tc.desc      Verify dataSourceListener behavior for matrix index 212.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0213 begin');
      const index: number = 212;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0213 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0214
     * @tc.name      testDataSourceListener0214
     * @tc.desc      Verify dataSourceListener behavior for matrix index 213.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0214 begin');
      const index: number = 213;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0214 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0215
     * @tc.name      testDataSourceListener0215
     * @tc.desc      Verify dataSourceListener behavior for matrix index 214.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0215 begin');
      const index: number = 214;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0215 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0216
     * @tc.name      testDataSourceListener0216
     * @tc.desc      Verify dataSourceListener behavior for matrix index 215.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0216 begin');
      const index: number = 215;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0216 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0217
     * @tc.name      testDataSourceListener0217
     * @tc.desc      Verify dataSourceListener behavior for matrix index 216.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0217 begin');
      const index: number = 216;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0217 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0218
     * @tc.name      testDataSourceListener0218
     * @tc.desc      Verify dataSourceListener behavior for matrix index 217.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0218 begin');
      const index: number = 217;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0218 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0219
     * @tc.name      testDataSourceListener0219
     * @tc.desc      Verify dataSourceListener behavior for matrix index 218.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0219 begin');
      const index: number = 218;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0219 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0220
     * @tc.name      testDataSourceListener0220
     * @tc.desc      Verify dataSourceListener behavior for matrix index 219.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0220 begin');
      const index: number = 219;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0220 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0221
     * @tc.name      testDataSourceListener0221
     * @tc.desc      Verify dataSourceListener behavior for matrix index 220.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0221 begin');
      const index: number = 220;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0221 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0222
     * @tc.name      testDataSourceListener0222
     * @tc.desc      Verify dataSourceListener behavior for matrix index 221.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0222 begin');
      const index: number = 221;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0222 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0223
     * @tc.name      testDataSourceListener0223
     * @tc.desc      Verify dataSourceListener behavior for matrix index 222.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0223 begin');
      const index: number = 222;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0223 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0224
     * @tc.name      testDataSourceListener0224
     * @tc.desc      Verify dataSourceListener behavior for matrix index 223.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0224 begin');
      const index: number = 223;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0224 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0225
     * @tc.name      testDataSourceListener0225
     * @tc.desc      Verify dataSourceListener behavior for matrix index 224.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0225 begin');
      const index: number = 224;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0225 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0226
     * @tc.name      testDataSourceListener0226
     * @tc.desc      Verify dataSourceListener behavior for matrix index 225.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0226 begin');
      const index: number = 225;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0226 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0227
     * @tc.name      testDataSourceListener0227
     * @tc.desc      Verify dataSourceListener behavior for matrix index 226.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0227 begin');
      const index: number = 226;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0227 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0228
     * @tc.name      testDataSourceListener0228
     * @tc.desc      Verify dataSourceListener behavior for matrix index 227.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0228 begin');
      const index: number = 227;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0228 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0229
     * @tc.name      testDataSourceListener0229
     * @tc.desc      Verify dataSourceListener behavior for matrix index 228.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0229 begin');
      const index: number = 228;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0229 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0230
     * @tc.name      testDataSourceListener0230
     * @tc.desc      Verify dataSourceListener behavior for matrix index 229.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0230 begin');
      const index: number = 229;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0230 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0231
     * @tc.name      testDataSourceListener0231
     * @tc.desc      Verify dataSourceListener behavior for matrix index 230.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0231 begin');
      const index: number = 230;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0231 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0232
     * @tc.name      testDataSourceListener0232
     * @tc.desc      Verify dataSourceListener behavior for matrix index 231.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0232 begin');
      const index: number = 231;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0232 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0233
     * @tc.name      testDataSourceListener0233
     * @tc.desc      Verify dataSourceListener behavior for matrix index 232.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0233 begin');
      const index: number = 232;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0233 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0234
     * @tc.name      testDataSourceListener0234
     * @tc.desc      Verify dataSourceListener behavior for matrix index 233.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0234 begin');
      const index: number = 233;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0234 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0235
     * @tc.name      testDataSourceListener0235
     * @tc.desc      Verify dataSourceListener behavior for matrix index 234.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0235 begin');
      const index: number = 234;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0235 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0236
     * @tc.name      testDataSourceListener0236
     * @tc.desc      Verify dataSourceListener behavior for matrix index 235.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0236 begin');
      const index: number = 235;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0236 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0237
     * @tc.name      testDataSourceListener0237
     * @tc.desc      Verify dataSourceListener behavior for matrix index 236.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0237 begin');
      const index: number = 236;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0237 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0238
     * @tc.name      testDataSourceListener0238
     * @tc.desc      Verify dataSourceListener behavior for matrix index 237.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0238 begin');
      const index: number = 237;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0238 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0239
     * @tc.name      testDataSourceListener0239
     * @tc.desc      Verify dataSourceListener behavior for matrix index 238.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0239 begin');
      const index: number = 238;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0239 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0240
     * @tc.name      testDataSourceListener0240
     * @tc.desc      Verify dataSourceListener behavior for matrix index 239.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0240 begin');
      const index: number = 239;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0240 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_DATASOURCE_0241
     * @tc.name      testDataSourceListener0241
     * @tc.desc      Verify dataSourceListener behavior for matrix index 240.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testDataSourceListener0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0241 begin');
      const index: number = 240;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataSourceListener0241 end');
    })


  })
}
