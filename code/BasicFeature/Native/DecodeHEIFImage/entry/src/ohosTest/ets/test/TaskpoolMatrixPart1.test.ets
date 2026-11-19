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
import { WaterFlowDataSource } from 'decodeheifimage/src/main/ets/model/WaterFlowData';
import { getTasks, executeTasks } from 'decodeheifimage/src/main/ets/model/Taskpool';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_DecodeHEIF]';

export default function TaskpoolMatrixPart1Test(): void {
  describe('TaskpoolMatrixPart1', () => {

    /**
     * @tc.number    SUB_HEIF_TPLP1_0100
     * @tc.name      testTasksEmpty0001
     * @tc.desc      Verify an empty URL list produces no tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testTasksEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksEmpty0001 begin');
      expect(getTasks([]).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksEmpty0001 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPLP1_0200
     * @tc.name      testTasksCount0002
     * @tc.desc      Verify 1 URLs produce 1 tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testTasksCount0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksCount0002 begin');
      const urls: string[] = ["u0"];
      expect(getTasks(urls).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksCount0002 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPLP1_0300
     * @tc.name      testTasksCount0003
     * @tc.desc      Verify 2 URLs produce 2 tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testTasksCount0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksCount0003 begin');
      const urls: string[] = ["u0", "u1"];
      expect(getTasks(urls).length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksCount0003 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPLP1_0400
     * @tc.name      testTasksCount0004
     * @tc.desc      Verify 3 URLs produce 3 tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testTasksCount0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksCount0004 begin');
      const urls: string[] = ["u0", "u1", "u2"];
      expect(getTasks(urls).length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksCount0004 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPLP1_0500
     * @tc.name      testTasksCount0005
     * @tc.desc      Verify 6 URLs produce 6 tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testTasksCount0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksCount0005 begin');
      const urls: string[] = ["u0", "u1", "u2", "u3", "u4", "u5"];
      expect(getTasks(urls).length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksCount0005 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPLP1_0600
     * @tc.name      testTasksCount0006
     * @tc.desc      Verify 10 URLs produce 10 tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testTasksCount0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksCount0006 begin');
      const urls: string[] = ["u0", "u1", "u2", "u3", "u4", "u5", "u6", "u7", "u8", "u9"];
      expect(getTasks(urls).length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksCount0006 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPLP1_0700
     * @tc.name      testTasksDistinct0007
     * @tc.desc      Verify two URLs produce distinct task objects.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTasksDistinct0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksDistinct0007 begin');
      const tasks = getTasks(['a', 'b']);
      expect(tasks[0] === tasks[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksDistinct0007 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPLP1_0800
     * @tc.name      testTasksNewArray0008
     * @tc.desc      Verify two calls return different task arrays.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTasksNewArray0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksNewArray0008 begin');
      const first = getTasks(['a']);
      const second = getTasks(['a']);
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksNewArray0008 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPLP1_0900
     * @tc.name      testTasksInputUnchanged0009
     * @tc.desc      Verify building tasks does not alter the URL list.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTasksInputUnchanged0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksInputUnchanged0009 begin');
      const urls: string[] = ['a', 'b', 'c'];
      const before: number = urls.length;
      getTasks(urls);
      expect(urls.length).assertEqual(before);
      expect(urls[0]).assertEqual('a');
      expect(urls[2]).assertEqual('c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksInputUnchanged0009 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPLP1_1000
     * @tc.name      testTasksEmptyStringUrl0010
     * @tc.desc      Verify an empty URL still yields one task.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTasksEmptyStringUrl0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksEmptyStringUrl0010 begin');
      expect(getTasks(['']).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksEmptyStringUrl0010 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPLP1_1100
     * @tc.name      testTasksDuplicateUrls0011
     * @tc.desc      Verify duplicate URLs still produce separate tasks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTasksDuplicateUrls0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksDuplicateUrls0011 begin');
      const tasks = getTasks(['same', 'same']);
      expect(tasks.length).assertEqual(2);
      expect(tasks[0] === tasks[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTasksDuplicateUrls0011 end');
    })

    /**
     * @tc.number    SUB_HEIF_TPLP1_1200
     * @tc.name      testExecuteEmpty0012
     * @tc.desc      Verify executing an empty URL list leaves the data source empty.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExecuteEmpty0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExecuteEmpty0012 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      executeTasks([], ds);
      expect(ds.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExecuteEmpty0012 end');
    })

  })
}
