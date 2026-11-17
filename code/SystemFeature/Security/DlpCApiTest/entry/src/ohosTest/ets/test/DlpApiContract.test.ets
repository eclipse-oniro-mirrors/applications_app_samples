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
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function dlpApiContractTest() {
  describe('DlpApiContractTest', () => {
    /**
     * @tc.name   testDlpContract0001
     * @tc.number SUB_DLP_C_API_CONTRACT_0001
     * @tc.desc   Verify GetDlpPermissionInfo stable across 2 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0001 begin');
      const first: number = testNapi.GetDlpPermissionInfo();
      for (let i: number = 0; i < 2; i++) {
        const current: number = testNapi.GetDlpPermissionInfo();
        expect(current).assertEqual(first);
      }
      expect(first).assertEqual(19100006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0001 end');
    })

    /**
     * @tc.name   testDlpContract0002
     * @tc.number SUB_DLP_C_API_CONTRACT_0002
     * @tc.desc   Verify GetDlpPermissionInfo stable across 3 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0002 begin');
      const first: number = testNapi.GetDlpPermissionInfo();
      for (let i: number = 0; i < 3; i++) {
        const current: number = testNapi.GetDlpPermissionInfo();
        expect(current).assertEqual(first);
      }
      expect(first).assertEqual(19100006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0002 end');
    })

    /**
     * @tc.name   testDlpContract0003
     * @tc.number SUB_DLP_C_API_CONTRACT_0003
     * @tc.desc   Verify GetDlpPermissionInfo stable across 4 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0003 begin');
      const first: number = testNapi.GetDlpPermissionInfo();
      for (let i: number = 0; i < 4; i++) {
        const current: number = testNapi.GetDlpPermissionInfo();
        expect(current).assertEqual(first);
      }
      expect(first).assertEqual(19100006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0003 end');
    })

    /**
     * @tc.name   testDlpContract0004
     * @tc.number SUB_DLP_C_API_CONTRACT_0004
     * @tc.desc   Verify GetDlpPermissionInfo stable across 5 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0004 begin');
      const first: number = testNapi.GetDlpPermissionInfo();
      for (let i: number = 0; i < 5; i++) {
        const current: number = testNapi.GetDlpPermissionInfo();
        expect(current).assertEqual(first);
      }
      expect(first).assertEqual(19100006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0004 end');
    })

    /**
     * @tc.name   testDlpContract0005
     * @tc.number SUB_DLP_C_API_CONTRACT_0005
     * @tc.desc   Verify GetDlpPermissionInfo stable across 6 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0005 begin');
      const first: number = testNapi.GetDlpPermissionInfo();
      for (let i: number = 0; i < 6; i++) {
        const current: number = testNapi.GetDlpPermissionInfo();
        expect(current).assertEqual(first);
      }
      expect(first).assertEqual(19100006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0005 end');
    })

    /**
     * @tc.name   testDlpContract0006
     * @tc.number SUB_DLP_C_API_CONTRACT_0006
     * @tc.desc   Verify GetDlpPermissionInfo stable across 7 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0006 begin');
      const first: number = testNapi.GetDlpPermissionInfo();
      for (let i: number = 0; i < 7; i++) {
        const current: number = testNapi.GetDlpPermissionInfo();
        expect(current).assertEqual(first);
      }
      expect(first).assertEqual(19100006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0006 end');
    })

    /**
     * @tc.name   testDlpContract0007
     * @tc.number SUB_DLP_C_API_CONTRACT_0007
     * @tc.desc   Verify GetDlpPermissionInfo stable across 8 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0007 begin');
      const first: number = testNapi.GetDlpPermissionInfo();
      for (let i: number = 0; i < 8; i++) {
        const current: number = testNapi.GetDlpPermissionInfo();
        expect(current).assertEqual(first);
      }
      expect(first).assertEqual(19100006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0007 end');
    })

    /**
     * @tc.name   testDlpContract0008
     * @tc.number SUB_DLP_C_API_CONTRACT_0008
     * @tc.desc   Verify GetDlpPermissionInfo stable across 9 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0008 begin');
      const first: number = testNapi.GetDlpPermissionInfo();
      for (let i: number = 0; i < 9; i++) {
        const current: number = testNapi.GetDlpPermissionInfo();
        expect(current).assertEqual(first);
      }
      expect(first).assertEqual(19100006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0008 end');
    })

    /**
     * @tc.name   testDlpContract0009
     * @tc.number SUB_DLP_C_API_CONTRACT_0009
     * @tc.desc   Verify GetDlpPermissionInfo stable across 10 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0009 begin');
      const first: number = testNapi.GetDlpPermissionInfo();
      for (let i: number = 0; i < 10; i++) {
        const current: number = testNapi.GetDlpPermissionInfo();
        expect(current).assertEqual(first);
      }
      expect(first).assertEqual(19100006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0009 end');
    })

    /**
     * @tc.name   testDlpContract0010
     * @tc.number SUB_DLP_C_API_CONTRACT_0010
     * @tc.desc   Verify GetDlpPermissionInfo stable across 11 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0010 begin');
      const first: number = testNapi.GetDlpPermissionInfo();
      for (let i: number = 0; i < 11; i++) {
        const current: number = testNapi.GetDlpPermissionInfo();
        expect(current).assertEqual(first);
      }
      expect(first).assertEqual(19100006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0010 end');
    })

    /**
     * @tc.name   testDlpContract0011
     * @tc.number SUB_DLP_C_API_CONTRACT_0011
     * @tc.desc   Verify GetDlpPermissionInfo stable across 12 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0011 begin');
      const first: number = testNapi.GetDlpPermissionInfo();
      for (let i: number = 0; i < 12; i++) {
        const current: number = testNapi.GetDlpPermissionInfo();
        expect(current).assertEqual(first);
      }
      expect(first).assertEqual(19100006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0011 end');
    })

    /**
     * @tc.name   testDlpContract0012
     * @tc.number SUB_DLP_C_API_CONTRACT_0012
     * @tc.desc   Verify GetDlpPermissionInfo stable across 13 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0012 begin');
      const first: number = testNapi.GetDlpPermissionInfo();
      for (let i: number = 0; i < 13; i++) {
        const current: number = testNapi.GetDlpPermissionInfo();
        expect(current).assertEqual(first);
      }
      expect(first).assertEqual(19100006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0012 end');
    })

    /**
     * @tc.name   testDlpContract0013
     * @tc.number SUB_DLP_C_API_CONTRACT_0013
     * @tc.desc   Verify GetDlpPermissionInfo stable across 14 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0013 begin');
      const first: number = testNapi.GetDlpPermissionInfo();
      for (let i: number = 0; i < 14; i++) {
        const current: number = testNapi.GetDlpPermissionInfo();
        expect(current).assertEqual(first);
      }
      expect(first).assertEqual(19100006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0013 end');
    })

    /**
     * @tc.name   testDlpContract0014
     * @tc.number SUB_DLP_C_API_CONTRACT_0014
     * @tc.desc   Verify GetDlpPermissionInfo stable across 15 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0014 begin');
      const first: number = testNapi.GetDlpPermissionInfo();
      for (let i: number = 0; i < 15; i++) {
        const current: number = testNapi.GetDlpPermissionInfo();
        expect(current).assertEqual(first);
      }
      expect(first).assertEqual(19100006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0014 end');
    })

    /**
     * @tc.name   testDlpContract0015
     * @tc.number SUB_DLP_C_API_CONTRACT_0015
     * @tc.desc   Verify GetDlpPermissionInfo stable across 16 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0015 begin');
      const first: number = testNapi.GetDlpPermissionInfo();
      for (let i: number = 0; i < 16; i++) {
        const current: number = testNapi.GetDlpPermissionInfo();
        expect(current).assertEqual(first);
      }
      expect(first).assertEqual(19100006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0015 end');
    })

    /**
     * @tc.name   testDlpContract0016
     * @tc.number SUB_DLP_C_API_CONTRACT_0016
     * @tc.desc   Verify GetOriginalFileName stable across 2 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0016 begin');
      const first: string | number = testNapi.GetOriginalFileName();
      for (let i: number = 0; i < 2; i++) {
        const current: string | number = testNapi.GetOriginalFileName();
        expect(current).assertEqual(first);
      }
      expect(first === 'test.txt').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0016 end');
    })

    /**
     * @tc.name   testDlpContract0017
     * @tc.number SUB_DLP_C_API_CONTRACT_0017
     * @tc.desc   Verify GetOriginalFileName stable across 3 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0017 begin');
      const first: string | number = testNapi.GetOriginalFileName();
      for (let i: number = 0; i < 3; i++) {
        const current: string | number = testNapi.GetOriginalFileName();
        expect(current).assertEqual(first);
      }
      expect(first === 'test.txt').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0017 end');
    })

    /**
     * @tc.name   testDlpContract0018
     * @tc.number SUB_DLP_C_API_CONTRACT_0018
     * @tc.desc   Verify GetOriginalFileName stable across 4 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0018 begin');
      const first: string | number = testNapi.GetOriginalFileName();
      for (let i: number = 0; i < 4; i++) {
        const current: string | number = testNapi.GetOriginalFileName();
        expect(current).assertEqual(first);
      }
      expect(first === 'test.txt').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0018 end');
    })

    /**
     * @tc.name   testDlpContract0019
     * @tc.number SUB_DLP_C_API_CONTRACT_0019
     * @tc.desc   Verify GetOriginalFileName stable across 5 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0019 begin');
      const first: string | number = testNapi.GetOriginalFileName();
      for (let i: number = 0; i < 5; i++) {
        const current: string | number = testNapi.GetOriginalFileName();
        expect(current).assertEqual(first);
      }
      expect(first === 'test.txt').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0019 end');
    })

    /**
     * @tc.name   testDlpContract0020
     * @tc.number SUB_DLP_C_API_CONTRACT_0020
     * @tc.desc   Verify GetOriginalFileName stable across 6 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0020 begin');
      const first: string | number = testNapi.GetOriginalFileName();
      for (let i: number = 0; i < 6; i++) {
        const current: string | number = testNapi.GetOriginalFileName();
        expect(current).assertEqual(first);
      }
      expect(first === 'test.txt').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0020 end');
    })

    /**
     * @tc.name   testDlpContract0021
     * @tc.number SUB_DLP_C_API_CONTRACT_0021
     * @tc.desc   Verify GetOriginalFileName stable across 7 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0021 begin');
      const first: string | number = testNapi.GetOriginalFileName();
      for (let i: number = 0; i < 7; i++) {
        const current: string | number = testNapi.GetOriginalFileName();
        expect(current).assertEqual(first);
      }
      expect(first === 'test.txt').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0021 end');
    })

    /**
     * @tc.name   testDlpContract0022
     * @tc.number SUB_DLP_C_API_CONTRACT_0022
     * @tc.desc   Verify GetOriginalFileName stable across 8 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0022 begin');
      const first: string | number = testNapi.GetOriginalFileName();
      for (let i: number = 0; i < 8; i++) {
        const current: string | number = testNapi.GetOriginalFileName();
        expect(current).assertEqual(first);
      }
      expect(first === 'test.txt').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0022 end');
    })

    /**
     * @tc.name   testDlpContract0023
     * @tc.number SUB_DLP_C_API_CONTRACT_0023
     * @tc.desc   Verify GetOriginalFileName stable across 9 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0023 begin');
      const first: string | number = testNapi.GetOriginalFileName();
      for (let i: number = 0; i < 9; i++) {
        const current: string | number = testNapi.GetOriginalFileName();
        expect(current).assertEqual(first);
      }
      expect(first === 'test.txt').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0023 end');
    })

    /**
     * @tc.name   testDlpContract0024
     * @tc.number SUB_DLP_C_API_CONTRACT_0024
     * @tc.desc   Verify GetOriginalFileName stable across 10 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0024 begin');
      const first: string | number = testNapi.GetOriginalFileName();
      for (let i: number = 0; i < 10; i++) {
        const current: string | number = testNapi.GetOriginalFileName();
        expect(current).assertEqual(first);
      }
      expect(first === 'test.txt').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0024 end');
    })

    /**
     * @tc.name   testDlpContract0025
     * @tc.number SUB_DLP_C_API_CONTRACT_0025
     * @tc.desc   Verify GetOriginalFileName stable across 11 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0025 begin');
      const first: string | number = testNapi.GetOriginalFileName();
      for (let i: number = 0; i < 11; i++) {
        const current: string | number = testNapi.GetOriginalFileName();
        expect(current).assertEqual(first);
      }
      expect(first === 'test.txt').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0025 end');
    })

    /**
     * @tc.name   testDlpContract0026
     * @tc.number SUB_DLP_C_API_CONTRACT_0026
     * @tc.desc   Verify GetOriginalFileName stable across 12 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0026 begin');
      const first: string | number = testNapi.GetOriginalFileName();
      for (let i: number = 0; i < 12; i++) {
        const current: string | number = testNapi.GetOriginalFileName();
        expect(current).assertEqual(first);
      }
      expect(first === 'test.txt').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0026 end');
    })

    /**
     * @tc.name   testDlpContract0027
     * @tc.number SUB_DLP_C_API_CONTRACT_0027
     * @tc.desc   Verify GetOriginalFileName stable across 13 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0027 begin');
      const first: string | number = testNapi.GetOriginalFileName();
      for (let i: number = 0; i < 13; i++) {
        const current: string | number = testNapi.GetOriginalFileName();
        expect(current).assertEqual(first);
      }
      expect(first === 'test.txt').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0027 end');
    })

    /**
     * @tc.name   testDlpContract0028
     * @tc.number SUB_DLP_C_API_CONTRACT_0028
     * @tc.desc   Verify GetOriginalFileName stable across 14 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0028 begin');
      const first: string | number = testNapi.GetOriginalFileName();
      for (let i: number = 0; i < 14; i++) {
        const current: string | number = testNapi.GetOriginalFileName();
        expect(current).assertEqual(first);
      }
      expect(first === 'test.txt').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0028 end');
    })

    /**
     * @tc.name   testDlpContract0029
     * @tc.number SUB_DLP_C_API_CONTRACT_0029
     * @tc.desc   Verify GetOriginalFileName stable across 15 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0029 begin');
      const first: string | number = testNapi.GetOriginalFileName();
      for (let i: number = 0; i < 15; i++) {
        const current: string | number = testNapi.GetOriginalFileName();
        expect(current).assertEqual(first);
      }
      expect(first === 'test.txt').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0029 end');
    })

    /**
     * @tc.name   testDlpContract0030
     * @tc.number SUB_DLP_C_API_CONTRACT_0030
     * @tc.desc   Verify GetOriginalFileName stable across 16 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0030 begin');
      const first: string | number = testNapi.GetOriginalFileName();
      for (let i: number = 0; i < 16; i++) {
        const current: string | number = testNapi.GetOriginalFileName();
        expect(current).assertEqual(first);
      }
      expect(first === 'test.txt').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0030 end');
    })

    /**
     * @tc.name   testDlpContract0031
     * @tc.number SUB_DLP_C_API_CONTRACT_0031
     * @tc.desc   Verify IsInSandbox stable across 2 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0031 begin');
      const first: boolean | number = testNapi.IsInSandbox();
      for (let i: number = 0; i < 2; i++) {
        const current: boolean | number = testNapi.IsInSandbox();
        expect(current === first).assertTrue();
      }
      expect(first === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0031 end');
    })

    /**
     * @tc.name   testDlpContract0032
     * @tc.number SUB_DLP_C_API_CONTRACT_0032
     * @tc.desc   Verify IsInSandbox stable across 3 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0032 begin');
      const first: boolean | number = testNapi.IsInSandbox();
      for (let i: number = 0; i < 3; i++) {
        const current: boolean | number = testNapi.IsInSandbox();
        expect(current === first).assertTrue();
      }
      expect(first === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0032 end');
    })

    /**
     * @tc.name   testDlpContract0033
     * @tc.number SUB_DLP_C_API_CONTRACT_0033
     * @tc.desc   Verify IsInSandbox stable across 4 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0033 begin');
      const first: boolean | number = testNapi.IsInSandbox();
      for (let i: number = 0; i < 4; i++) {
        const current: boolean | number = testNapi.IsInSandbox();
        expect(current === first).assertTrue();
      }
      expect(first === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0033 end');
    })

    /**
     * @tc.name   testDlpContract0034
     * @tc.number SUB_DLP_C_API_CONTRACT_0034
     * @tc.desc   Verify IsInSandbox stable across 5 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0034 begin');
      const first: boolean | number = testNapi.IsInSandbox();
      for (let i: number = 0; i < 5; i++) {
        const current: boolean | number = testNapi.IsInSandbox();
        expect(current === first).assertTrue();
      }
      expect(first === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0034 end');
    })

    /**
     * @tc.name   testDlpContract0035
     * @tc.number SUB_DLP_C_API_CONTRACT_0035
     * @tc.desc   Verify IsInSandbox stable across 6 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0035 begin');
      const first: boolean | number = testNapi.IsInSandbox();
      for (let i: number = 0; i < 6; i++) {
        const current: boolean | number = testNapi.IsInSandbox();
        expect(current === first).assertTrue();
      }
      expect(first === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0035 end');
    })

    /**
     * @tc.name   testDlpContract0036
     * @tc.number SUB_DLP_C_API_CONTRACT_0036
     * @tc.desc   Verify IsInSandbox stable across 7 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0036 begin');
      const first: boolean | number = testNapi.IsInSandbox();
      for (let i: number = 0; i < 7; i++) {
        const current: boolean | number = testNapi.IsInSandbox();
        expect(current === first).assertTrue();
      }
      expect(first === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0036 end');
    })

    /**
     * @tc.name   testDlpContract0037
     * @tc.number SUB_DLP_C_API_CONTRACT_0037
     * @tc.desc   Verify IsInSandbox stable across 8 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0037 begin');
      const first: boolean | number = testNapi.IsInSandbox();
      for (let i: number = 0; i < 8; i++) {
        const current: boolean | number = testNapi.IsInSandbox();
        expect(current === first).assertTrue();
      }
      expect(first === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0037 end');
    })

    /**
     * @tc.name   testDlpContract0038
     * @tc.number SUB_DLP_C_API_CONTRACT_0038
     * @tc.desc   Verify IsInSandbox stable across 9 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0038 begin');
      const first: boolean | number = testNapi.IsInSandbox();
      for (let i: number = 0; i < 9; i++) {
        const current: boolean | number = testNapi.IsInSandbox();
        expect(current === first).assertTrue();
      }
      expect(first === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0038 end');
    })

    /**
     * @tc.name   testDlpContract0039
     * @tc.number SUB_DLP_C_API_CONTRACT_0039
     * @tc.desc   Verify IsInSandbox stable across 10 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0039 begin');
      const first: boolean | number = testNapi.IsInSandbox();
      for (let i: number = 0; i < 10; i++) {
        const current: boolean | number = testNapi.IsInSandbox();
        expect(current === first).assertTrue();
      }
      expect(first === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0039 end');
    })

    /**
     * @tc.name   testDlpContract0040
     * @tc.number SUB_DLP_C_API_CONTRACT_0040
     * @tc.desc   Verify IsInSandbox stable across 11 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0040 begin');
      const first: boolean | number = testNapi.IsInSandbox();
      for (let i: number = 0; i < 11; i++) {
        const current: boolean | number = testNapi.IsInSandbox();
        expect(current === first).assertTrue();
      }
      expect(first === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0040 end');
    })

    /**
     * @tc.name   testDlpContract0041
     * @tc.number SUB_DLP_C_API_CONTRACT_0041
     * @tc.desc   Verify IsInSandbox stable across 12 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0041 begin');
      const first: boolean | number = testNapi.IsInSandbox();
      for (let i: number = 0; i < 12; i++) {
        const current: boolean | number = testNapi.IsInSandbox();
        expect(current === first).assertTrue();
      }
      expect(first === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0041 end');
    })

    /**
     * @tc.name   testDlpContract0042
     * @tc.number SUB_DLP_C_API_CONTRACT_0042
     * @tc.desc   Verify IsInSandbox stable across 13 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0042 begin');
      const first: boolean | number = testNapi.IsInSandbox();
      for (let i: number = 0; i < 13; i++) {
        const current: boolean | number = testNapi.IsInSandbox();
        expect(current === first).assertTrue();
      }
      expect(first === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0042 end');
    })

    /**
     * @tc.name   testDlpContract0043
     * @tc.number SUB_DLP_C_API_CONTRACT_0043
     * @tc.desc   Verify IsInSandbox stable across 14 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0043 begin');
      const first: boolean | number = testNapi.IsInSandbox();
      for (let i: number = 0; i < 14; i++) {
        const current: boolean | number = testNapi.IsInSandbox();
        expect(current === first).assertTrue();
      }
      expect(first === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0043 end');
    })

    /**
     * @tc.name   testDlpContract0044
     * @tc.number SUB_DLP_C_API_CONTRACT_0044
     * @tc.desc   Verify IsInSandbox stable across 15 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0044 begin');
      const first: boolean | number = testNapi.IsInSandbox();
      for (let i: number = 0; i < 15; i++) {
        const current: boolean | number = testNapi.IsInSandbox();
        expect(current === first).assertTrue();
      }
      expect(first === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0044 end');
    })

    /**
     * @tc.name   testDlpContract0045
     * @tc.number SUB_DLP_C_API_CONTRACT_0045
     * @tc.desc   Verify IsInSandbox stable across 16 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0045 begin');
      const first: boolean | number = testNapi.IsInSandbox();
      for (let i: number = 0; i < 16; i++) {
        const current: boolean | number = testNapi.IsInSandbox();
        expect(current === first).assertTrue();
      }
      expect(first === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0045 end');
    })

    /**
     * @tc.name   testDlpContract0046
     * @tc.number SUB_DLP_C_API_CONTRACT_0046
     * @tc.desc   Verify SetSandboxAppConfig stable across 2 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0046 begin');
      const first: number = testNapi.SetSandboxAppConfig();
      for (let i: number = 0; i < 2; i++) {
        expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0046 end');
    })

    /**
     * @tc.name   testDlpContract0047
     * @tc.number SUB_DLP_C_API_CONTRACT_0047
     * @tc.desc   Verify SetSandboxAppConfig stable across 3 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0047 begin');
      const first: number = testNapi.SetSandboxAppConfig();
      for (let i: number = 0; i < 3; i++) {
        expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0047 end');
    })

    /**
     * @tc.name   testDlpContract0048
     * @tc.number SUB_DLP_C_API_CONTRACT_0048
     * @tc.desc   Verify SetSandboxAppConfig stable across 4 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0048 begin');
      const first: number = testNapi.SetSandboxAppConfig();
      for (let i: number = 0; i < 4; i++) {
        expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0048 end');
    })

    /**
     * @tc.name   testDlpContract0049
     * @tc.number SUB_DLP_C_API_CONTRACT_0049
     * @tc.desc   Verify SetSandboxAppConfig stable across 5 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0049 begin');
      const first: number = testNapi.SetSandboxAppConfig();
      for (let i: number = 0; i < 5; i++) {
        expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0049 end');
    })

    /**
     * @tc.name   testDlpContract0050
     * @tc.number SUB_DLP_C_API_CONTRACT_0050
     * @tc.desc   Verify SetSandboxAppConfig stable across 6 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0050 begin');
      const first: number = testNapi.SetSandboxAppConfig();
      for (let i: number = 0; i < 6; i++) {
        expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0050 end');
    })

    /**
     * @tc.name   testDlpContract0051
     * @tc.number SUB_DLP_C_API_CONTRACT_0051
     * @tc.desc   Verify SetSandboxAppConfig stable across 7 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0051 begin');
      const first: number = testNapi.SetSandboxAppConfig();
      for (let i: number = 0; i < 7; i++) {
        expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0051 end');
    })

    /**
     * @tc.name   testDlpContract0052
     * @tc.number SUB_DLP_C_API_CONTRACT_0052
     * @tc.desc   Verify SetSandboxAppConfig stable across 8 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0052 begin');
      const first: number = testNapi.SetSandboxAppConfig();
      for (let i: number = 0; i < 8; i++) {
        expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0052 end');
    })

    /**
     * @tc.name   testDlpContract0053
     * @tc.number SUB_DLP_C_API_CONTRACT_0053
     * @tc.desc   Verify SetSandboxAppConfig stable across 9 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0053 begin');
      const first: number = testNapi.SetSandboxAppConfig();
      for (let i: number = 0; i < 9; i++) {
        expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0053 end');
    })

    /**
     * @tc.name   testDlpContract0054
     * @tc.number SUB_DLP_C_API_CONTRACT_0054
     * @tc.desc   Verify SetSandboxAppConfig stable across 10 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0054 begin');
      const first: number = testNapi.SetSandboxAppConfig();
      for (let i: number = 0; i < 10; i++) {
        expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0054 end');
    })

    /**
     * @tc.name   testDlpContract0055
     * @tc.number SUB_DLP_C_API_CONTRACT_0055
     * @tc.desc   Verify SetSandboxAppConfig stable across 11 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0055 begin');
      const first: number = testNapi.SetSandboxAppConfig();
      for (let i: number = 0; i < 11; i++) {
        expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0055 end');
    })

    /**
     * @tc.name   testDlpContract0056
     * @tc.number SUB_DLP_C_API_CONTRACT_0056
     * @tc.desc   Verify SetSandboxAppConfig stable across 12 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0056 begin');
      const first: number = testNapi.SetSandboxAppConfig();
      for (let i: number = 0; i < 12; i++) {
        expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0056 end');
    })

    /**
     * @tc.name   testDlpContract0057
     * @tc.number SUB_DLP_C_API_CONTRACT_0057
     * @tc.desc   Verify SetSandboxAppConfig stable across 13 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0057 begin');
      const first: number = testNapi.SetSandboxAppConfig();
      for (let i: number = 0; i < 13; i++) {
        expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0057 end');
    })

    /**
     * @tc.name   testDlpContract0058
     * @tc.number SUB_DLP_C_API_CONTRACT_0058
     * @tc.desc   Verify SetSandboxAppConfig stable across 14 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0058 begin');
      const first: number = testNapi.SetSandboxAppConfig();
      for (let i: number = 0; i < 14; i++) {
        expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0058 end');
    })

    /**
     * @tc.name   testDlpContract0059
     * @tc.number SUB_DLP_C_API_CONTRACT_0059
     * @tc.desc   Verify SetSandboxAppConfig stable across 15 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0059 begin');
      const first: number = testNapi.SetSandboxAppConfig();
      for (let i: number = 0; i < 15; i++) {
        expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0059 end');
    })

    /**
     * @tc.name   testDlpContract0060
     * @tc.number SUB_DLP_C_API_CONTRACT_0060
     * @tc.desc   Verify SetSandboxAppConfig stable across 16 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0060 begin');
      const first: number = testNapi.SetSandboxAppConfig();
      for (let i: number = 0; i < 16; i++) {
        expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0060 end');
    })

    /**
     * @tc.name   testDlpContract0061
     * @tc.number SUB_DLP_C_API_CONTRACT_0061
     * @tc.desc   Verify CleanSandboxAppConfig stable across 2 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0061 begin');
      const first: number = testNapi.CleanSandboxAppConfig();
      for (let i: number = 0; i < 2; i++) {
        expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0061 end');
    })

    /**
     * @tc.name   testDlpContract0062
     * @tc.number SUB_DLP_C_API_CONTRACT_0062
     * @tc.desc   Verify CleanSandboxAppConfig stable across 3 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0062 begin');
      const first: number = testNapi.CleanSandboxAppConfig();
      for (let i: number = 0; i < 3; i++) {
        expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0062 end');
    })

    /**
     * @tc.name   testDlpContract0063
     * @tc.number SUB_DLP_C_API_CONTRACT_0063
     * @tc.desc   Verify CleanSandboxAppConfig stable across 4 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0063 begin');
      const first: number = testNapi.CleanSandboxAppConfig();
      for (let i: number = 0; i < 4; i++) {
        expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0063 end');
    })

    /**
     * @tc.name   testDlpContract0064
     * @tc.number SUB_DLP_C_API_CONTRACT_0064
     * @tc.desc   Verify CleanSandboxAppConfig stable across 5 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0064 begin');
      const first: number = testNapi.CleanSandboxAppConfig();
      for (let i: number = 0; i < 5; i++) {
        expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0064 end');
    })

    /**
     * @tc.name   testDlpContract0065
     * @tc.number SUB_DLP_C_API_CONTRACT_0065
     * @tc.desc   Verify CleanSandboxAppConfig stable across 6 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0065 begin');
      const first: number = testNapi.CleanSandboxAppConfig();
      for (let i: number = 0; i < 6; i++) {
        expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0065 end');
    })

    /**
     * @tc.name   testDlpContract0066
     * @tc.number SUB_DLP_C_API_CONTRACT_0066
     * @tc.desc   Verify CleanSandboxAppConfig stable across 7 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0066 begin');
      const first: number = testNapi.CleanSandboxAppConfig();
      for (let i: number = 0; i < 7; i++) {
        expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0066 end');
    })

    /**
     * @tc.name   testDlpContract0067
     * @tc.number SUB_DLP_C_API_CONTRACT_0067
     * @tc.desc   Verify CleanSandboxAppConfig stable across 8 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0067 begin');
      const first: number = testNapi.CleanSandboxAppConfig();
      for (let i: number = 0; i < 8; i++) {
        expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0067 end');
    })

    /**
     * @tc.name   testDlpContract0068
     * @tc.number SUB_DLP_C_API_CONTRACT_0068
     * @tc.desc   Verify CleanSandboxAppConfig stable across 9 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0068 begin');
      const first: number = testNapi.CleanSandboxAppConfig();
      for (let i: number = 0; i < 9; i++) {
        expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0068 end');
    })

    /**
     * @tc.name   testDlpContract0069
     * @tc.number SUB_DLP_C_API_CONTRACT_0069
     * @tc.desc   Verify CleanSandboxAppConfig stable across 10 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0069 begin');
      const first: number = testNapi.CleanSandboxAppConfig();
      for (let i: number = 0; i < 10; i++) {
        expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0069 end');
    })

    /**
     * @tc.name   testDlpContract0070
     * @tc.number SUB_DLP_C_API_CONTRACT_0070
     * @tc.desc   Verify CleanSandboxAppConfig stable across 11 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0070 begin');
      const first: number = testNapi.CleanSandboxAppConfig();
      for (let i: number = 0; i < 11; i++) {
        expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0070 end');
    })

    /**
     * @tc.name   testDlpContract0071
     * @tc.number SUB_DLP_C_API_CONTRACT_0071
     * @tc.desc   Verify CleanSandboxAppConfig stable across 12 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0071 begin');
      const first: number = testNapi.CleanSandboxAppConfig();
      for (let i: number = 0; i < 12; i++) {
        expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0071 end');
    })

    /**
     * @tc.name   testDlpContract0072
     * @tc.number SUB_DLP_C_API_CONTRACT_0072
     * @tc.desc   Verify CleanSandboxAppConfig stable across 13 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0072 begin');
      const first: number = testNapi.CleanSandboxAppConfig();
      for (let i: number = 0; i < 13; i++) {
        expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0072 end');
    })

    /**
     * @tc.name   testDlpContract0073
     * @tc.number SUB_DLP_C_API_CONTRACT_0073
     * @tc.desc   Verify CleanSandboxAppConfig stable across 14 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0073 begin');
      const first: number = testNapi.CleanSandboxAppConfig();
      for (let i: number = 0; i < 14; i++) {
        expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0073 end');
    })

    /**
     * @tc.name   testDlpContract0074
     * @tc.number SUB_DLP_C_API_CONTRACT_0074
     * @tc.desc   Verify CleanSandboxAppConfig stable across 15 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0074 begin');
      const first: number = testNapi.CleanSandboxAppConfig();
      for (let i: number = 0; i < 15; i++) {
        expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0074 end');
    })

    /**
     * @tc.name   testDlpContract0075
     * @tc.number SUB_DLP_C_API_CONTRACT_0075
     * @tc.desc   Verify CleanSandboxAppConfig stable across 16 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0075 begin');
      const first: number = testNapi.CleanSandboxAppConfig();
      for (let i: number = 0; i < 16; i++) {
        expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      }
      expect(first).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0075 end');
    })







































































    /**
     * @tc.name   testDlpContract0146
     * @tc.number SUB_DLP_C_API_CONTRACT_0146
     * @tc.desc   Verify GetOriginalFileName return type 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0146 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(typeof result === 'string' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0146 end');
    })

    /**
     * @tc.name   testDlpContract0147
     * @tc.number SUB_DLP_C_API_CONTRACT_0147
     * @tc.desc   Verify IsInSandbox return type 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0147 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(typeof result === 'boolean' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0147 end');
    })

    /**
     * @tc.name   testDlpContract0148
     * @tc.number SUB_DLP_C_API_CONTRACT_0148
     * @tc.desc   Verify SetSandboxAppConfig return type 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0148 begin');
      const result: number = testNapi.SetSandboxAppConfig();
      expect(typeof result === 'number' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0148 end');
    })

    /**
     * @tc.name   testDlpContract0149
     * @tc.number SUB_DLP_C_API_CONTRACT_0149
     * @tc.desc   Verify CleanSandboxAppConfig return type 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0149 begin');
      const result: number = testNapi.CleanSandboxAppConfig();
      expect(typeof result === 'number' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0149 end');
    })

    /**
     * @tc.name   testDlpContract0150
     * @tc.number SUB_DLP_C_API_CONTRACT_0150
     * @tc.desc   Verify GetSandboxAppConfig return type 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0150 begin');
      const result: string | number = testNapi.GetSandboxAppConfig();
      expect(typeof result === 'string' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0150 end');
    })

    /**
     * @tc.name   testDlpContract0151
     * @tc.number SUB_DLP_C_API_CONTRACT_0151
     * @tc.desc   Verify GetDlpPermissionInfo return type 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0151 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(typeof result === 'number' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0151 end');
    })

    /**
     * @tc.name   testDlpContract0152
     * @tc.number SUB_DLP_C_API_CONTRACT_0152
     * @tc.desc   Verify GetOriginalFileName return type 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0152 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(typeof result === 'string' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0152 end');
    })

    /**
     * @tc.name   testDlpContract0153
     * @tc.number SUB_DLP_C_API_CONTRACT_0153
     * @tc.desc   Verify IsInSandbox return type 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0153 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(typeof result === 'boolean' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0153 end');
    })

    /**
     * @tc.name   testDlpContract0154
     * @tc.number SUB_DLP_C_API_CONTRACT_0154
     * @tc.desc   Verify SetSandboxAppConfig return type 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0154 begin');
      const result: number = testNapi.SetSandboxAppConfig();
      expect(typeof result === 'number' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0154 end');
    })

    /**
     * @tc.name   testDlpContract0155
     * @tc.number SUB_DLP_C_API_CONTRACT_0155
     * @tc.desc   Verify CleanSandboxAppConfig return type 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0155 begin');
      const result: number = testNapi.CleanSandboxAppConfig();
      expect(typeof result === 'number' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0155 end');
    })

    /**
     * @tc.name   testDlpContract0156
     * @tc.number SUB_DLP_C_API_CONTRACT_0156
     * @tc.desc   Verify GetSandboxAppConfig return type 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0156 begin');
      const result: string | number = testNapi.GetSandboxAppConfig();
      expect(typeof result === 'string' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0156 end');
    })

    /**
     * @tc.name   testDlpContract0157
     * @tc.number SUB_DLP_C_API_CONTRACT_0157
     * @tc.desc   Verify GetDlpPermissionInfo return type 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0157 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(typeof result === 'number' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0157 end');
    })

    /**
     * @tc.name   testDlpContract0158
     * @tc.number SUB_DLP_C_API_CONTRACT_0158
     * @tc.desc   Verify GetOriginalFileName return type 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0158 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(typeof result === 'string' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0158 end');
    })

    /**
     * @tc.name   testDlpContract0159
     * @tc.number SUB_DLP_C_API_CONTRACT_0159
     * @tc.desc   Verify IsInSandbox return type 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0159 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(typeof result === 'boolean' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0159 end');
    })

    /**
     * @tc.name   testDlpContract0160
     * @tc.number SUB_DLP_C_API_CONTRACT_0160
     * @tc.desc   Verify SetSandboxAppConfig return type 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0160 begin');
      const result: number = testNapi.SetSandboxAppConfig();
      expect(typeof result === 'number' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0160 end');
    })

    /**
     * @tc.name   testDlpContract0161
     * @tc.number SUB_DLP_C_API_CONTRACT_0161
     * @tc.desc   Verify CleanSandboxAppConfig return type 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0161 begin');
      const result: number = testNapi.CleanSandboxAppConfig();
      expect(typeof result === 'number' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0161 end');
    })

    /**
     * @tc.name   testDlpContract0162
     * @tc.number SUB_DLP_C_API_CONTRACT_0162
     * @tc.desc   Verify GetSandboxAppConfig return type 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0162 begin');
      const result: string | number = testNapi.GetSandboxAppConfig();
      expect(typeof result === 'string' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0162 end');
    })

    /**
     * @tc.name   testDlpContract0163
     * @tc.number SUB_DLP_C_API_CONTRACT_0163
     * @tc.desc   Verify GetDlpPermissionInfo return type 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0163 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(typeof result === 'number' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0163 end');
    })

    /**
     * @tc.name   testDlpContract0164
     * @tc.number SUB_DLP_C_API_CONTRACT_0164
     * @tc.desc   Verify GetOriginalFileName return type 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0164 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(typeof result === 'string' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0164 end');
    })

    /**
     * @tc.name   testDlpContract0165
     * @tc.number SUB_DLP_C_API_CONTRACT_0165
     * @tc.desc   Verify IsInSandbox return type 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpContract0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0165 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(typeof result === 'boolean' || typeof result === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpContract0165 end');
    })
  })
}
