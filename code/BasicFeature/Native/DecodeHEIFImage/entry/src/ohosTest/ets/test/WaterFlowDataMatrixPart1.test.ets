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
import { ImageInfo, WaterFlowDataSource } from 'decodeheifimage/src/main/ets/model/WaterFlowData';
import { RecordingListener } from './shared/HeifTestSupport';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_DecodeHEIF]';

export default function WaterFlowDataMatrixPart1Test(): void {
  describe('WaterFlowDataMatrixPart1', () => {

    /**
     * @tc.number    SUB_HEIF_WFDP1_0100
     * @tc.name      testInfoDefaults0001
     * @tc.desc      Verify ImageInfo defaults to null data and zero size.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInfoDefaults0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoDefaults0001 begin');
      const info: ImageInfo = new ImageInfo(null, 0, 0);
      expect(info.data === null).assertTrue();
      expect(info.width).assertEqual(0);
      expect(info.height).assertEqual(0);
      expect(info.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoDefaults0001 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_0200
     * @tc.name      testInfoValues0002
     * @tc.desc      Verify ImageInfo stores width height and description.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInfoValues0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoValues0002 begin');
      const info: ImageInfo = new ImageInfo(null, 100, 200, 'image1.heic');
      expect(info.width).assertEqual(100);
      expect(info.height).assertEqual(200);
      expect(info.description).assertEqual('image1.heic');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoValues0002 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_0300
     * @tc.name      testInfoEmptyDescription0003
     * @tc.desc      Verify an empty description is kept as an empty string.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInfoEmptyDescription0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoEmptyDescription0003 begin');
      const info: ImageInfo = new ImageInfo(null, 1, 2, '');
      expect(info.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoEmptyDescription0003 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_0400
     * @tc.name      testInfoNegativeSize0004
     * @tc.desc      Verify negative dimensions are stored unchanged.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoNegativeSize0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoNegativeSize0004 begin');
      const info: ImageInfo = new ImageInfo(null, -1, -2);
      expect(info.width).assertEqual(-1);
      expect(info.height).assertEqual(-2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoNegativeSize0004 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_0500
     * @tc.name      testInfoLargeSize0005
     * @tc.desc      Verify large 4K dimensions are stored unchanged.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoLargeSize0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoLargeSize0005 begin');
      const info: ImageInfo = new ImageInfo(null, 4096, 2160);
      expect(info.width).assertEqual(4096);
      expect(info.height).assertEqual(2160);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoLargeSize0005 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_0600
     * @tc.name      testInfoOmittedDescription0006
     * @tc.desc      Verify omitted description stays undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInfoOmittedDescription0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoOmittedDescription0006 begin');
      const info: ImageInfo = new ImageInfo(null, 10, 10);
      expect(info.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoOmittedDescription0006 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_0700
     * @tc.name      testInfoDescriptionWithSpaces0007
     * @tc.desc      Verify descriptions keep leading and trailing spaces.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoDescriptionWithSpaces0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoDescriptionWithSpaces0007 begin');
      const info: ImageInfo = new ImageInfo(null, 5, 5, '  spaced  ');
      expect(info.description).assertEqual('  spaced  ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoDescriptionWithSpaces0007 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_0800
     * @tc.name      testEmptyCount0008
     * @tc.desc      Verify a new data source has zero items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEmptyCount0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyCount0008 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      expect(ds.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyCount0008 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_0900
     * @tc.name      testPushOne0009
     * @tc.desc      Verify pushData appends one item and keeps its identity.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPushOne0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPushOne0009 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const info: ImageInfo = new ImageInfo(null, 10, 20, 'a.heic');
      ds.pushData(info);
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0) === info).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPushOne0009 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_1000
     * @tc.name      testPushSameObjectTwice0010
     * @tc.desc      Verify pushing the same object twice keeps two entries.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPushSameObjectTwice0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPushSameObjectTwice0010 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const info: ImageInfo = new ImageInfo(null, 3, 4, 'same.heic');
      ds.pushData(info);
      ds.pushData(info);
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0) === ds.getData(1)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPushSameObjectTwice0010 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_1100
     * @tc.name      testPushThreeOrder0011
     * @tc.desc      Verify three pushes preserve insertion order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPushThreeOrder0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPushThreeOrder0011 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 1, 1, 'one'));
      ds.pushData(new ImageInfo(null, 2, 2, 'two'));
      ds.pushData(new ImageInfo(null, 3, 3, 'three'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('one');
      expect(ds.getData(1).description).assertEqual('two');
      expect(ds.getData(2).description).assertEqual('three');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPushThreeOrder0011 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_1200
     * @tc.name      testPushTen0012
     * @tc.desc      Verify ten pushes end with the last item at index nine.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPushTen0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPushTen0012 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      for (let i: number = 0; i < 10; i++) {
        ds.pushData(new ImageInfo(null, i, i * 2, 'img' + i));
      }
      expect(ds.totalCount()).assertEqual(10);
      expect(ds.getData(9).description).assertEqual('img9');
      expect(ds.getData(9).height).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPushTen0012 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_1300
     * @tc.name      testAddAtIndexZero0013
     * @tc.desc      Verify addData at index zero becomes the first item.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAddAtIndexZero0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddAtIndexZero0013 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 1, 1, 'second'));
      ds.addData(0, new ImageInfo(null, 2, 2, 'first'));
      expect(ds.getData(0).description).assertEqual('first');
      expect(ds.getData(1).description).assertEqual('second');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddAtIndexZero0013 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_1400
     * @tc.name      testAddAtIndexOne0014
     * @tc.desc      Verify addData at index one inserts between neighbours.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAddAtIndexOne0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddAtIndexOne0014 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 1, 1, 'a'));
      ds.pushData(new ImageInfo(null, 2, 2, 'c'));
      ds.addData(1, new ImageInfo(null, 3, 3, 'b'));
      expect(ds.getData(0).description).assertEqual('a');
      expect(ds.getData(1).description).assertEqual('b');
      expect(ds.getData(2).description).assertEqual('c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddAtIndexOne0014 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_1500
     * @tc.name      testAddAtMiddle0015
     * @tc.desc      Verify addData in the middle of five items keeps order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAddAtMiddle0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddAtMiddle0015 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      for (let i: number = 0; i < 5; i++) {
        ds.pushData(new ImageInfo(null, i, i, 'v' + i));
      }
      ds.addData(3, new ImageInfo(null, 9, 9, 'inserted'));
      expect(ds.getData(2).description).assertEqual('v2');
      expect(ds.getData(3).description).assertEqual('inserted');
      expect(ds.getData(4).description).assertEqual('v3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddAtMiddle0015 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_1600
     * @tc.name      testAddToEmpty0016
     * @tc.desc      Verify addData zero on an empty source yields one item.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAddToEmpty0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddToEmpty0016 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.addData(0, new ImageInfo(null, 7, 8, 'only'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('only');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddToEmpty0016 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_1700
     * @tc.name      testAddAtEnd0017
     * @tc.desc      Verify addData at the current length appends the item.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAddAtEnd0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddAtEnd0017 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 1, 1, 'a'));
      ds.pushData(new ImageInfo(null, 2, 2, 'b'));
      ds.addData(2, new ImageInfo(null, 3, 3, 'c'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(2).description).assertEqual('c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddAtEnd0017 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_1800
     * @tc.name      testClearEmpties0018
     * @tc.desc      Verify clearData removes all items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testClearEmpties0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearEmpties0018 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearEmpties0018 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_1900
     * @tc.name      testPushAfterClear0019
     * @tc.desc      Verify pushing after clear starts again at index zero.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPushAfterClear0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPushAfterClear0019 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 1, 1, 'before'));
      ds.clearData();
      ds.pushData(new ImageInfo(null, 2, 2, 'after'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('after');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPushAfterClear0019 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_2000
     * @tc.name      testMixedCount0020
     * @tc.desc      Verify mixed add and push operations keep an exact count.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMixedCount0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMixedCount0020 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.addData(0, new ImageInfo(null, 1, 1, 'a'));
      ds.pushData(new ImageInfo(null, 2, 2, 'b'));
      ds.addData(1, new ImageInfo(null, 3, 3, 'c'));
      ds.pushData(new ImageInfo(null, 4, 4, 'd'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(1).description).assertEqual('c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMixedCount0020 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_2100
     * @tc.name      testListenerPushAddIndex0021
     * @tc.desc      Verify pushData notifies onDataAdd with index zero.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testListenerPushAddIndex0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerPushAddIndex0021 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.addIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerPushAddIndex0021 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_2200
     * @tc.name      testListenerPushLastIndex0022
     * @tc.desc      Verify the third push notifies index two.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerPushLastIndex0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerPushLastIndex0022 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 1, 'a'));
      ds.pushData(new ImageInfo(null, 2, 2, 'b'));
      ds.pushData(new ImageInfo(null, 3, 3, 'c'));
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[2]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerPushLastIndex0022 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_2300
     * @tc.name      testListenerAddIndex0023
     * @tc.desc      Verify addData notifies the insertion index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerAddIndex0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerAddIndex0023 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 1, 'a'));
      ds.pushData(new ImageInfo(null, 2, 2, 'b'));
      ds.addData(1, new ImageInfo(null, 3, 3, 'c'));
      expect(listener.addIndexes[listener.addIndexes.length - 1]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerAddIndex0023 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_2400
     * @tc.name      testListenerClearReload0024
     * @tc.desc      Verify clearData notifies onDataReloaded once.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testListenerClearReload0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerClearReload0024 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 1, 'a'));
      ds.clearData();
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerClearReload0024 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_2500
     * @tc.name      testListenerPushAfterClear0025
     * @tc.desc      Verify the push after clear notifies index zero again.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerPushAfterClear0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerPushAfterClear0025 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 1, 'a'));
      ds.clearData();
      ds.pushData(new ImageInfo(null, 2, 2, 'b'));
      expect(listener.addIndexes[listener.addIndexes.length - 1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerPushAfterClear0025 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_2600
     * @tc.name      testDuplicateRegister0026
     * @tc.desc      Verify registering the same listener twice still notifies once.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDuplicateRegister0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuplicateRegister0026 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 1, 'a'));
      expect(listener.addIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuplicateRegister0026 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_2700
     * @tc.name      testUnregisterStops0027
     * @tc.desc      Verify an unregistered listener receives no further events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnregisterStops0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnregisterStops0027 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.unregisterDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 1, 'a'));
      expect(listener.addIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnregisterStops0027 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_2800
     * @tc.name      testUnregisterUnknown0028
     * @tc.desc      Verify unregistering an unknown listener is a no-op.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnregisterUnknown0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnregisterUnknown0028 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.unregisterDataChangeListener(new RecordingListener());
      ds.pushData(new ImageInfo(null, 1, 1, 'a'));
      expect(listener.addIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnregisterUnknown0028 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_2900
     * @tc.name      testTwoListenersAdd0029
     * @tc.desc      Verify two listeners both receive an add event.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTwoListenersAdd0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTwoListenersAdd0029 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const first: RecordingListener = new RecordingListener();
      const second: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(first);
      ds.registerDataChangeListener(second);
      ds.pushData(new ImageInfo(null, 1, 1, 'a'));
      expect(first.addIndexes.length).assertEqual(1);
      expect(second.addIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTwoListenersAdd0029 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP1_3000
     * @tc.name      testTwoListenersReload0030
     * @tc.desc      Verify two listeners both receive reload events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTwoListenersReload0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTwoListenersReload0030 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const first: RecordingListener = new RecordingListener();
      const second: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(first);
      ds.registerDataChangeListener(second);
      ds.clearData();
      expect(first.reloadCount).assertEqual(1);
      expect(second.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTwoListenersReload0030 end');
    })

  })
}
