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
import { serviceManager } from 'servicemanagerhar/src/main/ets/ServiceManager';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandPathSideEffects]';
const INITED_AT_LOAD: boolean = serviceManager.inited;

export default function serviceManagerPathTest(): void {
  describe('ServiceManagerPathTest', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_SM_PATH_0100
     * @tc.name      testPathImportSkipsEntryInit0001
     * @tc.desc      Path import of ServiceManager bypasses the HAR entry, so init() is not executed at load
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPathImportSkipsEntryInit0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPathImportSkipsEntryInit0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', 'inited captured at load: ' + String(INITED_AT_LOAD));
      expect(INITED_AT_LOAD).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPathImportSkipsEntryInit0001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SM_PATH_0200
     * @tc.name      testPathImportExportsSingleton0002
     * @tc.desc      The path import yields a usable exported singleton object
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPathImportExportsSingleton0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPathImportExportsSingleton0002 begin');
      expect(serviceManager !== null).assertTrue();
      expect(serviceManager !== undefined).assertTrue();
      expect(typeof serviceManager).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPathImportExportsSingleton0002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SM_PATH_0300
     * @tc.name      testPathImportApiShape0003
     * @tc.desc      The singleton exposes init/print functions and a boolean inited field
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPathImportApiShape0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPathImportApiShape0003 begin');
      expect(typeof serviceManager.init).assertEqual('function');
      expect(typeof serviceManager.print).assertEqual('function');
      expect(typeof serviceManager.inited).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPathImportApiShape0003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SM_PATH_0400
     * @tc.name      testLiveStateIsUninitialized0004
     * @tc.desc      Before any explicit init the live flag is still false (no hidden side effect)
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLiveStateIsUninitialized0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLiveStateIsUninitialized0004 begin');
      expect(serviceManager.inited).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLiveStateIsUninitialized0004 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SM_PATH_0500
     * @tc.name      testPrintBeforeInitKeepsState0005
     * @tc.desc      print() before init must not throw and must not turn the service into initialized
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPrintBeforeInitKeepsState0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrintBeforeInitKeepsState0005 begin');
      let threw: boolean = false;
      try {
        serviceManager.print();
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      expect(serviceManager.inited).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrintBeforeInitKeepsState0005 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SM_PATH_0600
     * @tc.name      testInitSetsInited0006
     * @tc.desc      Calling init() flips inited from false to true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInitSetsInited0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInitSetsInited0006 begin');
      serviceManager.init();
      expect(serviceManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInitSetsInited0006 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SM_PATH_0700
     * @tc.name      testInitIsIdempotent0007
     * @tc.desc      A second init() keeps the state true and does not toggle it
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInitIsIdempotent0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInitIsIdempotent0007 begin');
      serviceManager.init();
      serviceManager.init();
      expect(serviceManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInitIsIdempotent0007 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SM_PATH_0800
     * @tc.name      testPrintAfterInitKeepsState0008
     * @tc.desc      print() after init does not throw and keeps the service initialized
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPrintAfterInitKeepsState0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrintAfterInitKeepsState0008 begin');
      let threw: boolean = false;
      try {
        serviceManager.print();
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      expect(serviceManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrintAfterInitKeepsState0008 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SM_PATH_0900
     * @tc.name      testRepeatedInitStaysTrue0009
     * @tc.desc      Repeated init() calls leave the service in the initialized state
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRepeatedInitStaysTrue0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatedInitStaysTrue0009 begin');
      for (let i: number = 0; i < 5; i++) {
        serviceManager.init();
      }
      expect(serviceManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatedInitStaysTrue0009 end');
    })

  })
}
