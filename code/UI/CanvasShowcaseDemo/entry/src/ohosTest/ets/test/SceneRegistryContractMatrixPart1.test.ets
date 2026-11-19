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
import { delayTick } from './shared/AsyncYield';
import { SceneRegistry } from '../../../main/ets/model/utils/SceneRegistry';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF817;
const TAG: string = '[Sample_Canvas]';

export default function SceneRegistryContractMatrixPart1Test(): void {
  describe('SceneRegistryContractMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_SRCP1_0100
     * @tc.name      testCount0001
     * @tc.desc      Verify registry count is 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCount0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCount0001 begin');
      await delayTick();
      expect(SceneRegistry.count()).assertEqual(23);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCount0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRCP1_0200
     * @tc.name      testGetAllLength0002
     * @tc.desc      Verify getAll returns all scenes.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGetAllLength0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetAllLength0002 begin');
      await delayTick();
      expect(SceneRegistry.getAll().length).assertEqual(SceneRegistry.count());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetAllLength0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRCP1_0300
     * @tc.name      testFirstId0003
     * @tc.desc      Verify first scene id is 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFirstId0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFirstId0003 begin');
      await delayTick();
      expect(SceneRegistry.getAll()[0].id).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFirstId0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRCP1_0400
     * @tc.name      testLastId0004
     * @tc.desc      Verify last scene id is 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLastId0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLastId0004 begin');
      await delayTick();
      expect(SceneRegistry.getAll()[SceneRegistry.count() - 1].id).assertEqual(23);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLastId0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRCP1_0500
     * @tc.name      testInvalidZero0005
     * @tc.desc      Verify getById(0) returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInvalidZero0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvalidZero0005 begin');
      await delayTick();
      expect(SceneRegistry.getById(0) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvalidZero0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRCP1_0600
     * @tc.name      testInvalidAbove0006
     * @tc.desc      Verify getById(24) returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInvalidAbove0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvalidAbove0006 begin');
      await delayTick();
      expect(SceneRegistry.getById(24) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvalidAbove0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRCP1_0700
     * @tc.name      testInvalidNegative0007
     * @tc.desc      Verify getById(-1) returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInvalidNegative0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvalidNegative0007 begin');
      await delayTick();
      expect(SceneRegistry.getById(-1) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvalidNegative0007 end');
    })

  })
}
