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
import { getTasks, executeTasks } from 'decodeheifimage/src/main/ets/model/Taskpool';
import { RecordingListener } from './shared/HeifTestSupport';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_DecodeHEIF]';

export default function FlowSpliceMatrixPart1Test(): void {
  describe('FlowSpliceMatrixPart1', () => {

    /**
     * @tc.number    SUB_HEIF_FSPP1_0100
     * @tc.name      testSplice0001
     * @tc.desc      Verify addData(-7) on size 0 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0001 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.addData(-7, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0001 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_0200
     * @tc.name      testSplice0002
     * @tc.desc      Verify addData(-3) on size 0 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0002 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.addData(-3, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0002 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_0300
     * @tc.name      testSplice0003
     * @tc.desc      Verify addData(-1) on size 0 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0003 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.addData(-1, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0003 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_0400
     * @tc.name      testSplice0004
     * @tc.desc      Verify addData(0) on size 0 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0004 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.addData(0, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0004 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_0500
     * @tc.name      testSplice0005
     * @tc.desc      Verify addData(1) on size 0 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0005 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.addData(1, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0005 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_0600
     * @tc.name      testSplice0006
     * @tc.desc      Verify addData(99) on size 0 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0006 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.addData(99, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0006 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_0700
     * @tc.name      testSplice0007
     * @tc.desc      Verify addData(-7) on size 1 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0007 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.addData(-7, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('x');
      expect(ds.getData(1).description).assertEqual('v0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0007 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_0800
     * @tc.name      testSplice0008
     * @tc.desc      Verify addData(-3) on size 1 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0008 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.addData(-3, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('x');
      expect(ds.getData(1).description).assertEqual('v0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0008 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_0900
     * @tc.name      testSplice0009
     * @tc.desc      Verify addData(-1) on size 1 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0009 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.addData(-1, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('x');
      expect(ds.getData(1).description).assertEqual('v0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0009 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_1000
     * @tc.name      testSplice0010
     * @tc.desc      Verify addData(0) on size 1 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0010 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.addData(0, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('x');
      expect(ds.getData(1).description).assertEqual('v0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0010 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_1100
     * @tc.name      testSplice0011
     * @tc.desc      Verify addData(1) on size 1 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0011 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.addData(1, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0011 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_1200
     * @tc.name      testSplice0012
     * @tc.desc      Verify addData(2) on size 1 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0012 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.addData(2, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0012 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_1300
     * @tc.name      testSplice0013
     * @tc.desc      Verify addData(99) on size 1 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0013 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.addData(99, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0013 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_1400
     * @tc.name      testSplice0014
     * @tc.desc      Verify addData(-7) on size 2 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0014 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.addData(-7, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('x');
      expect(ds.getData(1).description).assertEqual('v0');
      expect(ds.getData(2).description).assertEqual('v1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0014 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_1500
     * @tc.name      testSplice0015
     * @tc.desc      Verify addData(-3) on size 2 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0015 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.addData(-3, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('x');
      expect(ds.getData(1).description).assertEqual('v0');
      expect(ds.getData(2).description).assertEqual('v1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0015 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_1600
     * @tc.name      testSplice0016
     * @tc.desc      Verify addData(-1) on size 2 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0016 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.addData(-1, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('x');
      expect(ds.getData(2).description).assertEqual('v1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0016 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_1700
     * @tc.name      testSplice0017
     * @tc.desc      Verify addData(0) on size 2 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0017 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.addData(0, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('x');
      expect(ds.getData(1).description).assertEqual('v0');
      expect(ds.getData(2).description).assertEqual('v1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0017 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_1800
     * @tc.name      testSplice0018
     * @tc.desc      Verify addData(1) on size 2 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0018 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.addData(1, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('x');
      expect(ds.getData(2).description).assertEqual('v1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0018 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_1900
     * @tc.name      testSplice0019
     * @tc.desc      Verify addData(2) on size 2 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0019 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.addData(2, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0019 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_2000
     * @tc.name      testSplice0020
     * @tc.desc      Verify addData(3) on size 2 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0020 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.addData(3, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0020 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_2100
     * @tc.name      testSplice0021
     * @tc.desc      Verify addData(99) on size 2 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0021 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.addData(99, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0021 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_2200
     * @tc.name      testSplice0022
     * @tc.desc      Verify addData(-7) on size 3 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0022 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.addData(-7, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('x');
      expect(ds.getData(1).description).assertEqual('v0');
      expect(ds.getData(2).description).assertEqual('v1');
      expect(ds.getData(3).description).assertEqual('v2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0022 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_2300
     * @tc.name      testSplice0023
     * @tc.desc      Verify addData(-3) on size 3 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0023 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.addData(-3, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('x');
      expect(ds.getData(1).description).assertEqual('v0');
      expect(ds.getData(2).description).assertEqual('v1');
      expect(ds.getData(3).description).assertEqual('v2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0023 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_2400
     * @tc.name      testSplice0024
     * @tc.desc      Verify addData(-1) on size 3 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0024 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.addData(-1, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('x');
      expect(ds.getData(3).description).assertEqual('v2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0024 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_2500
     * @tc.name      testSplice0025
     * @tc.desc      Verify addData(0) on size 3 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0025 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.addData(0, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('x');
      expect(ds.getData(1).description).assertEqual('v0');
      expect(ds.getData(2).description).assertEqual('v1');
      expect(ds.getData(3).description).assertEqual('v2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0025 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_2600
     * @tc.name      testSplice0026
     * @tc.desc      Verify addData(1) on size 3 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0026 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.addData(1, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('x');
      expect(ds.getData(2).description).assertEqual('v1');
      expect(ds.getData(3).description).assertEqual('v2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0026 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_2700
     * @tc.name      testSplice0027
     * @tc.desc      Verify addData(2) on size 3 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0027 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.addData(2, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('x');
      expect(ds.getData(3).description).assertEqual('v2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0027 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_2800
     * @tc.name      testSplice0028
     * @tc.desc      Verify addData(3) on size 3 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0028 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.addData(3, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('v2');
      expect(ds.getData(3).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0028 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_2900
     * @tc.name      testSplice0029
     * @tc.desc      Verify addData(4) on size 3 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0029 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.addData(4, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('v2');
      expect(ds.getData(3).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0029 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_3000
     * @tc.name      testSplice0030
     * @tc.desc      Verify addData(99) on size 3 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0030 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.addData(99, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('v2');
      expect(ds.getData(3).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0030 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_3100
     * @tc.name      testSplice0031
     * @tc.desc      Verify addData(-7) on size 4 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0031 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.addData(-7, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(5);
      expect(ds.getData(0).description).assertEqual('x');
      expect(ds.getData(1).description).assertEqual('v0');
      expect(ds.getData(2).description).assertEqual('v1');
      expect(ds.getData(3).description).assertEqual('v2');
      expect(ds.getData(4).description).assertEqual('v3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0031 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_3200
     * @tc.name      testSplice0032
     * @tc.desc      Verify addData(-3) on size 4 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0032 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.addData(-3, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(5);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('x');
      expect(ds.getData(2).description).assertEqual('v1');
      expect(ds.getData(3).description).assertEqual('v2');
      expect(ds.getData(4).description).assertEqual('v3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0032 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_3300
     * @tc.name      testSplice0033
     * @tc.desc      Verify addData(-1) on size 4 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0033 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.addData(-1, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(5);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('v2');
      expect(ds.getData(3).description).assertEqual('x');
      expect(ds.getData(4).description).assertEqual('v3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0033 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_3400
     * @tc.name      testSplice0034
     * @tc.desc      Verify addData(0) on size 4 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0034 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.addData(0, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(5);
      expect(ds.getData(0).description).assertEqual('x');
      expect(ds.getData(1).description).assertEqual('v0');
      expect(ds.getData(2).description).assertEqual('v1');
      expect(ds.getData(3).description).assertEqual('v2');
      expect(ds.getData(4).description).assertEqual('v3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0034 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_3500
     * @tc.name      testSplice0035
     * @tc.desc      Verify addData(1) on size 4 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0035 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.addData(1, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(5);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('x');
      expect(ds.getData(2).description).assertEqual('v1');
      expect(ds.getData(3).description).assertEqual('v2');
      expect(ds.getData(4).description).assertEqual('v3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0035 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_3600
     * @tc.name      testSplice0036
     * @tc.desc      Verify addData(3) on size 4 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0036 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.addData(3, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(5);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('v2');
      expect(ds.getData(3).description).assertEqual('x');
      expect(ds.getData(4).description).assertEqual('v3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0036 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_3700
     * @tc.name      testSplice0037
     * @tc.desc      Verify addData(4) on size 4 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0037 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.addData(4, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(5);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('v2');
      expect(ds.getData(3).description).assertEqual('v3');
      expect(ds.getData(4).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0037 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_3800
     * @tc.name      testSplice0038
     * @tc.desc      Verify addData(5) on size 4 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0038 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.addData(5, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(5);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('v2');
      expect(ds.getData(3).description).assertEqual('v3');
      expect(ds.getData(4).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0038 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_3900
     * @tc.name      testSplice0039
     * @tc.desc      Verify addData(99) on size 4 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0039 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.addData(99, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(5);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('v2');
      expect(ds.getData(3).description).assertEqual('v3');
      expect(ds.getData(4).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0039 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP1_4000
     * @tc.name      testSplice0040
     * @tc.desc      Verify addData(-7) on size 5 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0040 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.pushData(new ImageInfo(null, 4, 4, 'v4'));
      ds.addData(-7, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(6);
      expect(ds.getData(0).description).assertEqual('x');
      expect(ds.getData(1).description).assertEqual('v0');
      expect(ds.getData(2).description).assertEqual('v1');
      expect(ds.getData(3).description).assertEqual('v2');
      expect(ds.getData(4).description).assertEqual('v3');
      expect(ds.getData(5).description).assertEqual('v4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0040 end');
    })

  })
}
