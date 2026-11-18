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
import { serviceManager as opServiceManager } from 'servicemanagerhar/src/main/ets/OpServiceManager';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandPathSideEffects]';
const OP_INITED_AT_LOAD: boolean = opServiceManager.inited;

export default function opServiceManagerPathTest(): void {
  describe('OpServiceManagerPathTest', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_OP_PATH_0100
     * @tc.name      testOpPathImportRunsInit0001
     * @tc.desc      OpServiceManager performs init() inside its own module, so the singleton is initialized at load
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOpPathImportRunsInit0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpPathImportRunsInit0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', 'inited captured at load: ' + String(OP_INITED_AT_LOAD));
      expect(OP_INITED_AT_LOAD).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpPathImportRunsInit0001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_OP_PATH_0200
     * @tc.name      testOpLiveStateIsInitialized0002
     * @tc.desc      The live singleton state matches the captured load state
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOpLiveStateIsInitialized0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpLiveStateIsInitialized0002 begin');
      expect(opServiceManager.inited).assertTrue();
      expect(opServiceManager.inited).assertEqual(OP_INITED_AT_LOAD);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpLiveStateIsInitialized0002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_OP_PATH_0300
     * @tc.name      testOpApiShape0003
     * @tc.desc      The OpServiceManager singleton exposes init/print functions and a boolean inited field
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOpApiShape0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpApiShape0003 begin');
      expect(opServiceManager !== undefined).assertTrue();
      expect(typeof opServiceManager).assertEqual('object');
      expect(typeof opServiceManager.init).assertEqual('function');
      expect(typeof opServiceManager.print).assertEqual('function');
      expect(typeof opServiceManager.inited).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpApiShape0003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_OP_PATH_0400
     * @tc.name      testOpPrintDoesNotThrow0004
     * @tc.desc      print() on an initialized OpServiceManager completes without throwing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testOpPrintDoesNotThrow0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpPrintDoesNotThrow0004 begin');
      let threw: boolean = false;
      try {
        opServiceManager.print();
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      expect(opServiceManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpPrintDoesNotThrow0004 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_OP_PATH_0500
     * @tc.name      testOpInitIsIdempotent0005
     * @tc.desc      Re-initializing the OpServiceManager keeps the state true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testOpInitIsIdempotent0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpInitIsIdempotent0005 begin');
      opServiceManager.init();
      opServiceManager.init();
      expect(opServiceManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpInitIsIdempotent0005 end');
    })

  })
}
