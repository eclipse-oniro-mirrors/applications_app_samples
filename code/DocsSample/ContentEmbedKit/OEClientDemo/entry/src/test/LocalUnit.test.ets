/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { getCEErrMsg, getCEErrMsgResName } from '../main/ets/common/CEErrorMap';

const BUNDLE = 'OEClientDemo_LocalUnit_';

export default function localUnitTest() {
  describe('localUnitTest', () => {
    beforeAll(() => {});
    beforeEach(() => {});
    afterEach(() => {});
    afterAll(() => {});

    /**
     * Verify that getCEErrMsgResName returns the mapped resource name for a known error code.
     */
    it(BUNDLE + 'ErrorMap_001', 0, () => {
      const expectedName: string = 'ce_err_msg_401';
      const actualName: string = getCEErrMsgResName(401);
      expect(actualName).assertEqual(expectedName);
    });

    /**
     * Verify that getCEErrMsgResName returns the mapped resource name for a large native error code.
     */
    it(BUNDLE + 'ErrorMap_002', 0, () => {
      const expectedName: string = 'ce_err_msg_35300008';
      const actualName: string = getCEErrMsgResName(35300008);
      expect(actualName).assertEqual(expectedName);
    });

    /**
     * Verify that getCEErrMsg falls back to `Error: ${code}` for unknown codes.
     */
    it(BUNDLE + 'ErrorMap_003', 0, () => {
      const unknownCode: number = 99999999;
      const actualMsg: string = getCEErrMsg(unknownCode);
      expect(actualMsg).assertEqual(`Error: ${unknownCode}`);
    });

    /**
     * Verify that getCEErrMsg falls back to `Error: ${code}` without a context
     * (local unit tests have no resource manager), and that the mapped name
     * for a known code follows the ce_err_msg_* convention.
     */
    it(BUNDLE + 'ErrorMap_004', 0, () => {
      const actualMsg: string = getCEErrMsg(201);
      expect(actualMsg).assertEqual('Error: 201');
      expect(getCEErrMsgResName(201).length > 0).assertTrue();
    });
  });
}
