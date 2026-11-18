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
import { serviceManager as viaBarrelAgain } from '../../../../Index';
import { serviceManager as viaPath } from '../../../main/ets/ServiceManager';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandPathSideEffects_Har]';
const BARREL_INITED_AT_LOAD: boolean = viaBarrel.inited;

export default function harEntryTest(): void {
  describe('HarEntrySideEffectTest', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_0100
     * @tc.name      testBarrelImportRunsEntryInit0001
     * @tc.desc      Importing the HAR entry executes its init() side effect, so the exported service is initialized
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBarrelImportRunsEntryInit0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelImportRunsEntryInit0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', 'inited captured at load: ' + String(BARREL_INITED_AT_LOAD));
      expect(BARREL_INITED_AT_LOAD).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelImportRunsEntryInit0001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_0200
     * @tc.name      testBarrelExportsSameInstanceAsPath0002
     * @tc.desc      The entry re-exports the same singleton instance as the direct ServiceManager path
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBarrelExportsSameInstanceAsPath0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelExportsSameInstanceAsPath0002 begin');
      expect(viaBarrel === viaPath).assertTrue();
      expect(viaBarrel !== viaPath).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelExportsSameInstanceAsPath0002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_0300
     * @tc.name      testBarrelRepeatedImportIsCached0003
     * @tc.desc      Importing the HAR entry twice resolves to the same cached module instance
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBarrelRepeatedImportIsCached0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelRepeatedImportIsCached0003 begin');
      expect(viaBarrel === viaBarrelAgain).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelRepeatedImportIsCached0003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_0400
     * @tc.name      testBarrelInstanceApiShape0004
     * @tc.desc      The barrel-exported service exposes init/print functions and a boolean inited field
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBarrelInstanceApiShape0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelInstanceApiShape0004 begin');
      expect(typeof viaBarrel).assertEqual('object');
      expect(typeof viaBarrel.init).assertEqual('function');
      expect(typeof viaBarrel.print).assertEqual('function');
      expect(typeof viaBarrel.inited).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelInstanceApiShape0004 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_0500
     * @tc.name      testPathViewObservesBarrelInit0005
     * @tc.desc      Because both specifiers share one instance, the path view also observes the initialized state
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPathViewObservesBarrelInit0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPathViewObservesBarrelInit0005 begin');
      expect(viaPath.inited).assertTrue();
      expect(viaPath.inited).assertEqual(viaBarrel.inited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPathViewObservesBarrelInit0005 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_0600
     * @tc.name      testBarrelInitIsIdempotent0006
     * @tc.desc      Re-initializing via the barrel-exported instance keeps the state true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBarrelInitIsIdempotent0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelInitIsIdempotent0006 begin');
      viaBarrel.init();
      viaBarrel.init();
      expect(viaBarrel.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelInitIsIdempotent0006 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_0700
     * @tc.name      testBarrelPrintDoesNotThrow0007
     * @tc.desc      print() on the barrel-exported service completes without throwing and keeps state
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBarrelPrintDoesNotThrow0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelPrintDoesNotThrow0007 begin');
      let threw: boolean = false;
      try {
        viaBarrel.print();
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      expect(viaBarrel.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelPrintDoesNotThrow0007 end');
    })

  })
}