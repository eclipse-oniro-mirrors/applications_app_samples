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

export default function FlowSpliceMatrixPart2Test(): void {
  describe('FlowSpliceMatrixPart2', () => {

    /**
     * @tc.number    SUB_HEIF_FSPP2_4100
     * @tc.name      testSplice0041
     * @tc.desc      Verify addData(-3) on size 5 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0041 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.pushData(new ImageInfo(null, 4, 4, 'v4'));
      ds.addData(-3, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(6);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('x');
      expect(ds.getData(3).description).assertEqual('v2');
      expect(ds.getData(4).description).assertEqual('v3');
      expect(ds.getData(5).description).assertEqual('v4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0041 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP2_4200
     * @tc.name      testSplice0042
     * @tc.desc      Verify addData(-1) on size 5 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0042 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.pushData(new ImageInfo(null, 4, 4, 'v4'));
      ds.addData(-1, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(6);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('v2');
      expect(ds.getData(3).description).assertEqual('v3');
      expect(ds.getData(4).description).assertEqual('x');
      expect(ds.getData(5).description).assertEqual('v4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0042 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP2_4300
     * @tc.name      testSplice0043
     * @tc.desc      Verify addData(0) on size 5 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0043 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.pushData(new ImageInfo(null, 4, 4, 'v4'));
      ds.addData(0, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(6);
      expect(ds.getData(0).description).assertEqual('x');
      expect(ds.getData(1).description).assertEqual('v0');
      expect(ds.getData(2).description).assertEqual('v1');
      expect(ds.getData(3).description).assertEqual('v2');
      expect(ds.getData(4).description).assertEqual('v3');
      expect(ds.getData(5).description).assertEqual('v4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0043 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP2_4400
     * @tc.name      testSplice0044
     * @tc.desc      Verify addData(1) on size 5 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0044 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.pushData(new ImageInfo(null, 4, 4, 'v4'));
      ds.addData(1, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(6);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('x');
      expect(ds.getData(2).description).assertEqual('v1');
      expect(ds.getData(3).description).assertEqual('v2');
      expect(ds.getData(4).description).assertEqual('v3');
      expect(ds.getData(5).description).assertEqual('v4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0044 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP2_4500
     * @tc.name      testSplice0045
     * @tc.desc      Verify addData(4) on size 5 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0045 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.pushData(new ImageInfo(null, 4, 4, 'v4'));
      ds.addData(4, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(6);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('v2');
      expect(ds.getData(3).description).assertEqual('v3');
      expect(ds.getData(4).description).assertEqual('x');
      expect(ds.getData(5).description).assertEqual('v4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0045 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP2_4600
     * @tc.name      testSplice0046
     * @tc.desc      Verify addData(5) on size 5 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0046 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.pushData(new ImageInfo(null, 4, 4, 'v4'));
      ds.addData(5, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(6);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('v2');
      expect(ds.getData(3).description).assertEqual('v3');
      expect(ds.getData(4).description).assertEqual('v4');
      expect(ds.getData(5).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0046 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP2_4700
     * @tc.name      testSplice0047
     * @tc.desc      Verify addData(6) on size 5 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0047 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.pushData(new ImageInfo(null, 4, 4, 'v4'));
      ds.addData(6, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(6);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('v2');
      expect(ds.getData(3).description).assertEqual('v3');
      expect(ds.getData(4).description).assertEqual('v4');
      expect(ds.getData(5).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0047 end');
    })

    /**
     * @tc.number    SUB_HEIF_FSPP2_4800
     * @tc.name      testSplice0048
     * @tc.desc      Verify addData(99) on size 5 produces the splice order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSplice0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0048 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 0, 0, 'v0'));
      ds.pushData(new ImageInfo(null, 1, 1, 'v1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'v2'));
      ds.pushData(new ImageInfo(null, 3, 3, 'v3'));
      ds.pushData(new ImageInfo(null, 4, 4, 'v4'));
      ds.addData(99, new ImageInfo(null, 9, 9, 'x'));
      expect(ds.totalCount()).assertEqual(6);
      expect(ds.getData(0).description).assertEqual('v0');
      expect(ds.getData(1).description).assertEqual('v1');
      expect(ds.getData(2).description).assertEqual('v2');
      expect(ds.getData(3).description).assertEqual('v3');
      expect(ds.getData(4).description).assertEqual('v4');
      expect(ds.getData(5).description).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSplice0048 end');
    })

  })
}
