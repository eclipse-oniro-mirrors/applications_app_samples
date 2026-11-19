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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  WaterFlowDataSource
} from '../../../main/ets/pages/components/listAndGrid/waterFlowSample/WaterFlowDataSource';

const DOMAIN: number = 0xF814;
const TAG: string = 'WfdsExtTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function createFreshSource(): WaterFlowDataSource {
  return new WaterFlowDataSource();
}

export default function waterFlowDataSourceExtendedTest(): void {
  describe('WaterFlowDataSourceExtendedTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0141
     * @tc.name      testWfds0141
     * @tc.desc      Verify notifyDataReload notifies all registered listeners.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0141 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      log('testWfds0141 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0142
     * @tc.name      testWfds0142
     * @tc.desc      Verify notifyDataAdd forwards the given index to listeners.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0142 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[0]=${listener.addedIndexes[0]}`);
      expect(listener.addedIndexes[0]).assertEqual(7);
      log('testWfds0142 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0143
     * @tc.name      testWfds0143
     * @tc.desc      Verify notifyDataChange forwards the changed index to listeners.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0143 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changedIndexes.length}, expected=1`);
      expect(listener.changedIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedIndexes[0]=${listener.changedIndexes[0]}`);
      expect(listener.changedIndexes[0]).assertEqual(5);
      log('testWfds0143 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0144
     * @tc.name      testWfds0144
     * @tc.desc      Verify notifyDataDelete forwards the deleted index to listeners.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0144 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deletedIndexes.length}, expected=1`);
      expect(listener.deletedIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedIndexes[0]=${listener.deletedIndexes[0]}`);
      expect(listener.deletedIndexes[0]).assertEqual(3);
      log('testWfds0144 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0145
     * @tc.name      testWfds0145
     * @tc.desc      Verify notifyDataMove forwards from and to indexes to listeners.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0145 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(2, 9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.movedCount=${listener.movedCount}, expected=1`);
      expect(listener.movedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFrom=${listener.moveFrom}, expected=2`);
      expect(listener.moveFrom).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTo=${listener.moveTo}, expected=9`);
      expect(listener.moveTo).assertEqual(9);
      log('testWfds0145 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0146
     * @tc.name      testWfds0146
     * @tc.desc      Verify notifyDataMove with equal from and to still notifies once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0146 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(4, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.movedCount=${listener.movedCount}, expected=1`);
      expect(listener.movedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFrom=${listener.moveFrom}, expected=4`);
      expect(listener.moveFrom).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTo=${listener.moveTo}, expected=4`);
      expect(listener.moveTo).assertEqual(4);
      log('testWfds0146 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0147
     * @tc.name      testWfds0147
     * @tc.desc      Verify add1stItem notifies with index 0 and value equals old length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0147 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[0]=${listener.addedIndexes[0]}`);
      expect(listener.addedIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=28`);
      expect(source.getData(0)).assertEqual(28);
      log('testWfds0147 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0148
     * @tc.name      testWfds0148
     * @tc.desc      Verify addLastItem notifies with the new tail index 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0148 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.addLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[0]=${listener.addedIndexes[0]}`);
      expect(listener.addedIndexes[0]).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(28)=${source.getData(28)}, expected=28`);
      expect(source.getData(28)).assertEqual(28);
      log('testWfds0148 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0149
     * @tc.name      testWfds0149
     * @tc.desc      Verify addItem at a middle position notifies with that position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0149 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.addItem(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[0]=${listener.addedIndexes[0]}`);
      expect(listener.addedIndexes[0]).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(10)=${source.getData(10)}, expected=28`);
      expect(source.getData(10)).assertEqual(28);
      log('testWfds0149 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0150
     * @tc.name      testWfds0150
     * @tc.desc      Verify delete1stItem notifies listeners with index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0150 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.delete1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedIndexes[0]=${listener.deletedIndexes[0]}`);
      expect(listener.deletedIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=27`);
      expect(source.totalCount()).assertEqual(27);
      log('testWfds0150 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0151
     * @tc.name      testWfds0151
     * @tc.desc      Verify delete2ndItem notifies listeners with index 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0151 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.delete2ndItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedIndexes[0]=${listener.deletedIndexes[0]}`);
      expect(listener.deletedIndexes[0]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=27`);
      expect(source.totalCount()).assertEqual(27);
      log('testWfds0151 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0152
     * @tc.name      testWfds0152
     * @tc.desc      Verify deleteLastItem notifies listeners with the removed index 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0152 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.deleteLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedIndexes[0]=${listener.deletedIndexes[0]}`);
      expect(listener.deletedIndexes[0]).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=27`);
      expect(source.totalCount()).assertEqual(27);
      log('testWfds0152 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0153
     * @tc.name      testWfds0153
     * @tc.desc      Verify reload notifies reload exactly once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0153 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=25`);
      expect(source.totalCount()).assertEqual(25);
      log('testWfds0153 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0154
     * @tc.name      testWfds0154
     * @tc.desc      Verify listener registered after notify receives no retroactive callback.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0154 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.add1stItem();
      const lateListener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(lateListener);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${lateListener.addedIndexes.length}, expected=0`);
      expect(lateListener.addedIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=29`);
      expect(source.totalCount()).assertEqual(29);
      log('testWfds0154 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0155
     * @tc.name      testWfds0155
     * @tc.desc      Verify unregistering one of two listeners keeps the other notified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0155 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const first: WfdsExtMockListener = new WfdsExtMockListener();
      const second: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.addLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.addedIndexes.length=${first.addedIndexes.length}`);
      expect(first.addedIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.addedIndexes.length=${second.addedIndexes.length}`);
      expect(second.addedIndexes.length).assertEqual(1);
      log('testWfds0155 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0156
     * @tc.name      testWfds0156
     * @tc.desc      Verify unregister twice does not throw or affect other listeners.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0156 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      const keeper: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(keeper);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual keeper.addedIndexes.length=${keeper.addedIndexes.length}`);
      expect(keeper.addedIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(0);
      log('testWfds0156 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0157
     * @tc.name      testWfds0157
     * @tc.desc      Verify three add1stItem calls stack values 30 29 28 at the front.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0157 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.add1stItem();
      source.add1stItem();
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=31`);
      expect(source.totalCount()).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=30`);
      expect(source.getData(0)).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=29`);
      expect(source.getData(1)).assertEqual(29);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected=28`);
      expect(source.getData(2)).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3)=${source.getData(3)}, expected=0`);
      expect(source.getData(3)).assertEqual(0);
      log('testWfds0157 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0158
     * @tc.name      testWfds0158
     * @tc.desc      Verify three addLastItem calls append values 28 29 30 at the tail.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0158 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.addLastItem();
      source.addLastItem();
      source.addLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=31`);
      expect(source.totalCount()).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(28)=${source.getData(28)}, expected=28`);
      expect(source.getData(28)).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(29)=${source.getData(29)}, expected=29`);
      expect(source.getData(29)).assertEqual(29);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(30)=${source.getData(30)}, expected=30`);
      expect(source.getData(30)).assertEqual(30);
      log('testWfds0158 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0159
     * @tc.name      testWfds0159
     * @tc.desc      Verify add then delete chain keeps total count consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0159 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.add1stItem();
      source.addLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=30`);
      expect(source.totalCount()).assertEqual(30);
      source.delete1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=29`);
      expect(source.totalCount()).assertEqual(29);
      source.deleteLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=28`);
      expect(source.totalCount()).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=0`);
      expect(source.getData(0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(27)=${source.getData(27)}, expected=27`);
      expect(source.getData(27)).assertEqual(27);
      log('testWfds0159 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0160
     * @tc.name      testWfds0160
     * @tc.desc      Verify reload applied twice reduces total count to 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0160 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.reload();
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=22`);
      expect(source.totalCount()).assertEqual(22);
      log('testWfds0160 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0161
     * @tc.name      testWfds0161
     * @tc.desc      Verify deleteLastItem three times reduces count to 25 and drops 27 26 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0161 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.deleteLastItem();
      source.deleteLastItem();
      source.deleteLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=25`);
      expect(source.totalCount()).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(24)=${source.getData(24)}, expected=24`);
      expect(source.getData(24)).assertEqual(24);
      log('testWfds0161 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0162
     * @tc.name      testWfds0162
     * @tc.desc      Verify 28 delete1stItem calls empty the data source completely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0162 begin');
      const source: WaterFlowDataSource = createFreshSource();
      for (let i: number = 0; i < 28; i++) {
        source.delete1stItem();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=undefined`);
      expect(source.getData(0)).assertEqual(undefined);
      log('testWfds0162 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0163
     * @tc.name      testWfds0163
     * @tc.desc      Verify add1stItem on an emptied source restarts numbering at 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0163 begin');
      const source: WaterFlowDataSource = createFreshSource();
      for (let i: number = 0; i < 28; i++) {
        source.delete1stItem();
      }
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=0`);
      expect(source.getData(0)).assertEqual(0);
      log('testWfds0163 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0164
     * @tc.name      testWfds0164
     * @tc.desc      Verify deleteLastItem on an emptied source keeps count zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0164 begin');
      const source: WaterFlowDataSource = createFreshSource();
      for (let i: number = 0; i < 28; i++) {
        source.delete1stItem();
      }
      source.deleteLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testWfds0164 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0165
     * @tc.name      testWfds0165
     * @tc.desc      Verify reload on an emptied source keeps count zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0165 begin');
      const source: WaterFlowDataSource = createFreshSource();
      for (let i: number = 0; i < 28; i++) {
        source.delete1stItem();
      }
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testWfds0165 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0166
     * @tc.name      testWfds0166
     * @tc.desc      Verify addItem at the tail boundary behaves like addLastItem.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0166 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.addItem(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=29`);
      expect(source.totalCount()).assertEqual(29);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(28)=${source.getData(28)}, expected=28`);
      expect(source.getData(28)).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(27)=${source.getData(27)}, expected=27`);
      expect(source.getData(27)).assertEqual(27);
      log('testWfds0166 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0167
     * @tc.name      testWfds0167
     * @tc.desc      Verify addItem at index 0 shifts original first value to index 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0167 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.addItem(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=28`);
      expect(source.getData(0)).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=0`);
      expect(source.getData(1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected=1`);
      expect(source.getData(2)).assertEqual(1);
      log('testWfds0167 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0168
     * @tc.name      testWfds0168
     * @tc.desc      Verify getData keeps returning numbers after several mutations.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0168 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.add1stItem();
      source.delete2ndItem();
      const head: number = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof head=${typeof head}, expected='number'`);
      expect(typeof head).assertEqual('number');
      log('testWfds0168 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0169
     * @tc.name      testWfds0169
     * @tc.desc      Verify totalCount keeps returning a number after mutations.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0169 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.addLastItem();
      const count: number = source.totalCount();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof count=${typeof count}, expected='number'`);
      expect(typeof count).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual count=${count}, expected=29`);
      expect(count).assertEqual(29);
      log('testWfds0169 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0170
     * @tc.name      testWfds0170
     * @tc.desc      Verify the initial first five values are 0 1 2 3 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0170 begin');
      const source: WaterFlowDataSource = createFreshSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=0`);
      expect(source.getData(0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=1`);
      expect(source.getData(1)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected=2`);
      expect(source.getData(2)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3)=${source.getData(3)}, expected=3`);
      expect(source.getData(3)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(4)=${source.getData(4)}, expected=4`);
      expect(source.getData(4)).assertEqual(4);
      log('testWfds0170 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0171
     * @tc.name      testWfds0171
     * @tc.desc      Verify the initial last five values are 23 24 25 26 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0171 begin');
      const source: WaterFlowDataSource = createFreshSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(23)=${source.getData(23)}, expected=23`);
      expect(source.getData(23)).assertEqual(23);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(24)=${source.getData(24)}, expected=24`);
      expect(source.getData(24)).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(25)=${source.getData(25)}, expected=25`);
      expect(source.getData(25)).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(26)=${source.getData(26)}, expected=26`);
      expect(source.getData(26)).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(27)=${source.getData(27)}, expected=27`);
      expect(source.getData(27)).assertEqual(27);
      log('testWfds0171 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0172
     * @tc.name      testWfds0172
     * @tc.desc      Verify two independent sources do not share state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0172 begin');
      const first: WaterFlowDataSource = createFreshSource();
      const second: WaterFlowDataSource = createFreshSource();
      first.addLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.totalCount()=${first.totalCount()}, expected=29`);
      expect(first.totalCount()).assertEqual(29);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.totalCount()=${second.totalCount()}, expected=28`);
      expect(second.totalCount()).assertEqual(28);
      log('testWfds0172 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0173
     * @tc.name      testWfds0173
     * @tc.desc      Verify add1stItem twice fires two add callbacks with indexes 0 and 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0173 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.add1stItem();
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[0]=${listener.addedIndexes[0]}`);
      expect(listener.addedIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[1]=${listener.addedIndexes[1]}`);
      expect(listener.addedIndexes[1]).assertEqual(0);
      log('testWfds0173 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0174
     * @tc.name      testWfds0174
     * @tc.desc      Verify delete1stItem twice fires two delete callbacks with index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0174 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.delete1stItem();
      source.delete1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deletedIndexes.length}, expected=2`);
      expect(listener.deletedIndexes.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedIndexes[0]=${listener.deletedIndexes[0]}`);
      expect(listener.deletedIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedIndexes[1]=${listener.deletedIndexes[1]}`);
      expect(listener.deletedIndexes[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=2`);
      expect(source.getData(0)).assertEqual(2);
      log('testWfds0174 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0175
     * @tc.name      testWfds0175
     * @tc.desc      Verify addLastItem then delete1stItem keeps original sequence intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0175 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.addLastItem();
      source.delete1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=28`);
      expect(source.totalCount()).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=1`);
      expect(source.getData(0)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(26)=${source.getData(26)}, expected=27`);
      expect(source.getData(26)).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(27)=${source.getData(27)}, expected=28`);
      expect(source.getData(27)).assertEqual(28);
      log('testWfds0175 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0176
     * @tc.name      testWfds0176
     * @tc.desc      Verify reload preserves the first value 0 at index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0176 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=0`);
      expect(source.getData(0)).assertEqual(0);
      log('testWfds0176 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0177
     * @tc.name      testWfds0177
     * @tc.desc      Verify reload removes the second value 1 from the array.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0177 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=2`);
      expect(source.getData(1)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected=3`);
      expect(source.getData(2)).assertEqual(3);
      log('testWfds0177 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0178
     * @tc.name      testWfds0178
     * @tc.desc      Verify reload removes values 4 and 5 after removing value 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0178 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.reload();
      log('assertEqual source.getData(3)=' + source.getData(3) + ', expected=6');
      expect(source.getData(3)).assertEqual(6);
      log('assertEqual source.getData(4)=' + source.getData(4) + ', expected=7');
      expect(source.getData(4)).assertEqual(7);
      log('testWfds0178 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0179
     * @tc.name      testWfds0179
     * @tc.desc      Verify reload keeps the tail value 27 at the new last index 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0179 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(24)=${source.getData(24)}, expected=27`);
      expect(source.getData(24)).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(25)=${source.getData(25)}, expected=undefined`);
      expect(source.getData(25)).assertEqual(undefined);
      log('testWfds0179 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0180
     * @tc.name      testWfds0180
     * @tc.desc      Verify one reload notifies listeners once while array shrinks to 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0180 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=25`);
      expect(source.totalCount()).assertEqual(25);
      log('testWfds0180 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0181
     * @tc.name      testWfds0181
     * @tc.desc      Verify two reload notifications are both received by the listener.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0181 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=2`);
      expect(listener.reloadedCount).assertEqual(2);
      log('testWfds0181 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0182
     * @tc.name      testWfds0182
     * @tc.desc      Verify add and reload notifications are delivered in call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0182 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.add1stItem();
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      log('assertEqual source.totalCount()=' + source.totalCount() + ', expected=26');
      expect(source.totalCount()).assertEqual(26);
      log('testWfds0182 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0183
     * @tc.name      testWfds0183
     * @tc.desc      Verify three separate listeners all receive independent notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0183 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const first: WfdsExtMockListener = new WfdsExtMockListener();
      const second: WfdsExtMockListener = new WfdsExtMockListener();
      const third: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.addItem(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.addedIndexes.length=${first.addedIndexes.length}`);
      expect(first.addedIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.addedIndexes.length=${second.addedIndexes.length}`);
      expect(second.addedIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual third.addedIndexes.length=${third.addedIndexes.length}`);
      expect(third.addedIndexes.length).assertEqual(1);
      log('testWfds0183 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0184
     * @tc.name      testWfds0184
     * @tc.desc      Verify unregistering one listener stops only its notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0184 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const first: WfdsExtMockListener = new WfdsExtMockListener();
      const second: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataDelete(2);
      source.unregisterDataChangeListener(second);
      source.notifyDataDelete(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.deletedIndexes.length=${first.deletedIndexes.length}`);
      expect(first.deletedIndexes.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.deletedIndexes.length=${second.deletedIndexes.length}`);
      expect(second.deletedIndexes.length).assertEqual(1);
      log('testWfds0184 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0185
     * @tc.name      testWfds0185
     * @tc.desc      Verify addItem notifications repeat for each call with same index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0185 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      source.registerDataChangeListener(listener);
      source.addItem(3);
      source.addItem(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[0]=${listener.addedIndexes[0]}`);
      expect(listener.addedIndexes[0]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[1]=${listener.addedIndexes[1]}`);
      expect(listener.addedIndexes[1]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=30`);
      expect(source.totalCount()).assertEqual(30);
      log('testWfds0185 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0186
     * @tc.name      testWfds0186
     * @tc.desc      Verify mixed operations keep the head value consistent after reload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0186 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.add1stItem();
      source.add1stItem();
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=27`);
      expect(source.totalCount()).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=29`);
      expect(source.getData(0)).assertEqual(29);
      log('testWfds0186 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0187
     * @tc.name      testWfds0187
     * @tc.desc      Verify getData at the last index equals totalCount minus one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0187 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.addLastItem();
      source.delete1stItem();
      const last: number = source.totalCount() - 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(last)=${source.getData(last)}, expected=28`);
      expect(source.getData(last)).assertEqual(28);
      log('testWfds0187 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0188
     * @tc.name      testWfds0188
     * @tc.desc      Verify delete2ndItem after add1stItem removes the original first value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0188 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.add1stItem();
      source.delete2ndItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=28`);
      expect(source.totalCount()).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=28`);
      expect(source.getData(0)).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=1`);
      expect(source.getData(1)).assertEqual(1);
      log('testWfds0188 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0189
     * @tc.name      testWfds0189
     * @tc.desc      Verify listener counts stay independent between two data sources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0189 begin');
      const first: WaterFlowDataSource = createFreshSource();
      const second: WaterFlowDataSource = createFreshSource();
      const listener: WfdsExtMockListener = new WfdsExtMockListener();
      first.registerDataChangeListener(listener);
      second.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(0);
      first.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(1);
      log('testWfds0189 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0190
     * @tc.name      testWfds0190
     * @tc.desc      Verify the operation chain leaves 25 items.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0190 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.addLastItem();
      source.add1stItem();
      source.delete2ndItem();
      source.deleteLastItem();
      source.reload();
      log('assertEqual source.totalCount()=' + source.totalCount() + ', expected=25');
      expect(source.totalCount()).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=29`);
      expect(source.getData(0)).assertEqual(29);
      log('testWfds0190 end');
    })
  })
}

/**
 * Mock DataChangeListener used by WaterFlowDataSource extended test cases.
 */
class WfdsExtMockListener implements DataChangeListener {
  reloadedCount: number = 0;
  addedIndexes: number[] = [];
  deletedIndexes: number[] = [];
  changedIndexes: number[] = [];
  movedCount: number = 0;
  moveFrom: number = -1;
  moveTo: number = -1;

  onDataReloaded(): void {
    this.reloadedCount++;
  }

  onDataAdded(index: number): void {
    this.addedIndexes.push(index);
  }

  onDataAdd(index: number): void {
    this.addedIndexes.push(index);
  }

  onDataMoved(from: number, to: number): void {
    this.moveFrom = from;
    this.moveTo = to;
    this.movedCount++;
  }

  onDataMove(from: number, to: number): void {
    this.moveFrom = from;
    this.moveTo = to;
    this.movedCount++;
  }

  onDataDeleted(index: number): void {
    this.deletedIndexes.push(index);
  }

  onDataDelete(index: number): void {
    this.deletedIndexes.push(index);
  }

  onDataChanged(index: number): void {
    this.changedIndexes.push(index);
  }

  onDataChange(index: number): void {
    this.changedIndexes.push(index);
  }

  onDatasetChange(operations: Object[]): void {
    this.reloadedCount++;
  }
}
