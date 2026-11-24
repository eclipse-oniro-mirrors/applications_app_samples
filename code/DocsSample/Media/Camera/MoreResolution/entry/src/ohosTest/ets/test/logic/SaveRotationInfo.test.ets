/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/ResolutionTestSupport';
import {
  saveRotationInfo,
} from '../model/ResolutionLogic';

/** SaveRotationInfoTest logic checks (8 cases). */
export default function saveRotationInfoTest(): void {
  describe('SaveRotationInfoTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_SAVE_ROTATION_0001
     * @tc.name      Resolution_SaveRotation_0001
     * @tc.desc      saveRotationInfo(0, 0, 0) returns "0|false".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_SaveRotation_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SaveRotation_0001 begin`);
      logInfo("saveRotationInfo(0, 0, 0)");
      const actual: string = saveRotationInfo(0, 0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0|false");
      expect(actual).assertEqual("0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SaveRotation_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SAVE_ROTATION_0002
     * @tc.name      Resolution_SaveRotation_0002
     * @tc.desc      saveRotationInfo(1, 45, 1) returns "45|false".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SaveRotation_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SaveRotation_0002 begin`);
      logInfo("saveRotationInfo(1, 45, 1)");
      const actual: string = saveRotationInfo(1, 45, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "45|false");
      expect(actual).assertEqual("45|false");
      logInfo(`${BUNDLE}SaveRotation_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SAVE_ROTATION_0003
     * @tc.name      Resolution_SaveRotation_0003
     * @tc.desc      saveRotationInfo(2, 90, 2) returns "90|true".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SaveRotation_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SaveRotation_0003 begin`);
      logInfo("saveRotationInfo(2, 90, 2)");
      const actual: string = saveRotationInfo(2, 90, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "90|true");
      expect(actual).assertEqual("90|true");
      logInfo(`${BUNDLE}SaveRotation_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SAVE_ROTATION_0004
     * @tc.name      Resolution_SaveRotation_0004
     * @tc.desc      saveRotationInfo(3, 135, 3) returns "135|false".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SaveRotation_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SaveRotation_0004 begin`);
      logInfo("saveRotationInfo(3, 135, 3)");
      const actual: string = saveRotationInfo(3, 135, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "135|false");
      expect(actual).assertEqual("135|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SaveRotation_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SAVE_ROTATION_0005
     * @tc.name      Resolution_SaveRotation_0005
     * @tc.desc      saveRotationInfo(0, 180, 0) returns "180|false".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SaveRotation_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SaveRotation_0005 begin`);
      logInfo("saveRotationInfo(0, 180, 0)");
      const actual: string = saveRotationInfo(0, 180, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "180|false");
      expect(actual).assertEqual("180|false");
      logInfo(`${BUNDLE}SaveRotation_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SAVE_ROTATION_0006
     * @tc.name      Resolution_SaveRotation_0006
     * @tc.desc      saveRotationInfo(1, 225, 1) returns "225|false".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SaveRotation_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SaveRotation_0006 begin`);
      logInfo("saveRotationInfo(1, 225, 1)");
      const actual: string = saveRotationInfo(1, 225, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "225|false");
      expect(actual).assertEqual("225|false");
      logInfo(`${BUNDLE}SaveRotation_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SAVE_ROTATION_0007
     * @tc.name      Resolution_SaveRotation_0007
     * @tc.desc      saveRotationInfo(2, 270, 2) returns "270|true".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SaveRotation_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SaveRotation_0007 begin`);
      logInfo("saveRotationInfo(2, 270, 2)");
      const actual: string = saveRotationInfo(2, 270, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "270|true");
      expect(actual).assertEqual("270|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SaveRotation_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SAVE_ROTATION_0008
     * @tc.name      Resolution_SaveRotation_0008
     * @tc.desc      saveRotationInfo(3, 315, 3) returns "315|false".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SaveRotation_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SaveRotation_0008 begin`);
      logInfo("saveRotationInfo(3, 315, 3)");
      const actual: string = saveRotationInfo(3, 315, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "315|false");
      expect(actual).assertEqual("315|false");
      logInfo(`${BUNDLE}SaveRotation_0008 end`);
    });
  });
}
