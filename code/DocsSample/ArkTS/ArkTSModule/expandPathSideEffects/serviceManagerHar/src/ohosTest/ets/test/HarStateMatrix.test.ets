/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { serviceManager as viaBarrel } from '../../../../Index';
import { serviceManager as viaPath } from '../../../main/ets/ServiceManager';
import { serviceManager as opPath } from '../../../main/ets/OpServiceManager';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandPathSideEffects_Har]';

export default function harStateMatrixTest(): void {
  describe('HarStateMatrixTest', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_STATE_0100
     * @tc.name      testBarrelResetThenInitRecovers0001
     * @tc.desc      Resetting the shared flag through the barrel export and calling init() recovers the state
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBarrelResetThenInitRecovers0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelResetThenInitRecovers0001 begin');
      viaBarrel.inited = false;
      try {
        expect(viaBarrel.inited).assertFalse();
        viaBarrel.init();
        expect(viaBarrel.inited).assertTrue();
      } finally {
        viaBarrel.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelResetThenInitRecovers0001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_STATE_0200
     * @tc.name      testBarrelAndPathShareState0002
     * @tc.desc      A state change made through one specifier is immediately visible through the other
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBarrelAndPathShareState0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelAndPathShareState0002 begin');
      viaPath.inited = false;
      try {
        expect(viaBarrel.inited).assertFalse();
        viaPath.init();
        expect(viaBarrel.inited).assertTrue();
      } finally {
        viaBarrel.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelAndPathShareState0002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_STATE_0300
     * @tc.name      testOpStateIndependentFromBarrel0003
     * @tc.desc      Resetting the barrel instance does not affect the OpServiceManager instance
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testOpStateIndependentFromBarrel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpStateIndependentFromBarrel0003 begin');
      viaBarrel.inited = false;
      opPath.inited = true;
      try {
        opPath.init();
        expect(opPath.inited).assertTrue();
        expect(viaBarrel.inited).assertFalse();
      } finally {
        viaBarrel.inited = true;
        opPath.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpStateIndependentFromBarrel0003 end');
    })

  })
}
