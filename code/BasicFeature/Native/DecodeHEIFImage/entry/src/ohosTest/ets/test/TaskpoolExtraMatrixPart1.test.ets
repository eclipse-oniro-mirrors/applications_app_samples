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

export default function TaskpoolExtraMatrixPart1Test(): void {
  describe('TaskpoolExtraMatrixPart1', () => {

    /**
     * @tc.number    SUB_HEIF_TPXP1_0100
     * @tc.name      testTaskCount0001
     * @tc.desc      Verify 4 URLs produce 4 tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskCount0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0001 begin');
      const urls: string[] = ["u0", "u1", "u2", "u3"];
      expect(getTasks(urls).length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0001 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_0200
     * @tc.name      testTaskCount0002
     * @tc.desc      Verify 5 URLs produce 5 tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskCount0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0002 begin');
      const urls: string[] = ["u0", "u1", "u2", "u3", "u4"];
      expect(getTasks(urls).length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0002 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_0300
     * @tc.name      testTaskCount0003
     * @tc.desc      Verify 7 URLs produce 7 tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskCount0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0003 begin');
      const urls: string[] = ["u0", "u1", "u2", "u3", "u4", "u5", "u6"];
      expect(getTasks(urls).length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0003 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_0400
     * @tc.name      testTaskCount0004
     * @tc.desc      Verify 8 URLs produce 8 tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskCount0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0004 begin');
      const urls: string[] = ["u0", "u1", "u2", "u3", "u4", "u5", "u6", "u7"];
      expect(getTasks(urls).length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0004 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_0500
     * @tc.name      testTaskCount0005
     * @tc.desc      Verify 9 URLs produce 9 tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskCount0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0005 begin');
      const urls: string[] = ["u0", "u1", "u2", "u3", "u4", "u5", "u6", "u7", "u8"];
      expect(getTasks(urls).length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0005 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_0600
     * @tc.name      testTaskCount0006
     * @tc.desc      Verify 11 URLs produce 11 tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskCount0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0006 begin');
      const urls: string[] = ["u0", "u1", "u2", "u3", "u4", "u5", "u6", "u7", "u8", "u9", "u10"];
      expect(getTasks(urls).length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0006 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_0700
     * @tc.name      testTaskCount0007
     * @tc.desc      Verify 12 URLs produce 12 tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskCount0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0007 begin');
      const urls: string[] = ["u0", "u1", "u2", "u3", "u4", "u5", "u6", "u7", "u8", "u9", "u10", "u11"];
      expect(getTasks(urls).length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0007 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_0800
     * @tc.name      testTaskCount0008
     * @tc.desc      Verify 15 URLs produce 15 tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskCount0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0008 begin');
      const urls: string[] = ["u0", "u1", "u2", "u3", "u4", "u5", "u6", "u7", "u8", "u9", "u10", "u11", "u12", "u13", "u14"];
      expect(getTasks(urls).length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0008 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_0900
     * @tc.name      testTaskCount0009
     * @tc.desc      Verify 20 URLs produce 20 tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskCount0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0009 begin');
      const urls: string[] = ["u0", "u1", "u2", "u3", "u4", "u5", "u6", "u7", "u8", "u9", "u10", "u11", "u12", "u13", "u14", "u15", "u16", "u17", "u18", "u19"];
      expect(getTasks(urls).length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskCount0009 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_1000
     * @tc.name      testTaskUrlVariant0010
     * @tc.desc      Verify URL variant of length 1 yields one task.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskUrlVariant0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskUrlVariant0010 begin');
      expect(getTasks([' ']).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskUrlVariant0010 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_1100
     * @tc.name      testTaskUrlVariant0011
     * @tc.desc      Verify URL variant of length 2 yields one task.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskUrlVariant0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskUrlVariant0011 begin');
      expect(getTasks(['中文']).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskUrlVariant0011 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_1200
     * @tc.name      testTaskUrlVariant0012
     * @tc.desc      Verify URL variant of length 25 yields one task.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskUrlVariant0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskUrlVariant0012 begin');
      expect(getTasks(['http://example.com/a.heic']).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskUrlVariant0012 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_1300
     * @tc.name      testTaskUrlVariant0013
     * @tc.desc      Verify URL variant of length 5 yields one task.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskUrlVariant0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskUrlVariant0013 begin');
      expect(getTasks(['a/b/c']).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskUrlVariant0013 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_1400
     * @tc.name      testTaskUrlVariant0014
     * @tc.desc      Verify URL variant of length 128 yields one task.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskUrlVariant0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskUrlVariant0014 begin');
      expect(getTasks(['xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx']).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskUrlVariant0014 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_1500
     * @tc.name      testTaskUrlVariant0015
     * @tc.desc      Verify URL variant of length 15 yields one task.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskUrlVariant0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskUrlVariant0015 begin');
      expect(getTasks(['https://x/y?z=1']).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskUrlVariant0015 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_1600
     * @tc.name      testTaskHundred0016
     * @tc.desc      Verify one hundred URLs produce one hundred tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskHundred0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskHundred0016 begin');
      const urls: string[] = [];
      for (let i: number = 0; i < 100; i++) {
        urls.push('u' + i);
      }
      expect(getTasks(urls).length).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskHundred0016 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_1700
     * @tc.name      testTaskThreeDistinct0017
     * @tc.desc      Verify adjacent tasks from three URLs are distinct objects.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskThreeDistinct0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskThreeDistinct0017 begin');
      const tasks = getTasks(['a', 'b', 'c']);
      expect(tasks[0] === tasks[1]).assertFalse();
      expect(tasks[1] === tasks[2]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskThreeDistinct0017 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_1800
     * @tc.name      testTaskRepeatArray0018
     * @tc.desc      Verify repeated construction returns a different array.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTaskRepeatArray0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskRepeatArray0018 begin');
      const first = getTasks(['a', 'b', 'c']);
      const second = getTasks(['a', 'b', 'c']);
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTaskRepeatArray0018 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPXP1_1900
     * @tc.name      testExecuteEmptyKeepsData0019
     * @tc.desc      Verify executing no URLs leaves existing data untouched.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExecuteEmptyKeepsData0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExecuteEmptyKeepsData0019 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      ds.pushData(new ImageInfo(null, 1, 1, 'keep1'));
      ds.pushData(new ImageInfo(null, 2, 2, 'keep2'));
      executeTasks([], ds);
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('keep1');
      expect(ds.getData(1).description).assertEqual('keep2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExecuteEmptyKeepsData0019 end');
    })

  })
}
