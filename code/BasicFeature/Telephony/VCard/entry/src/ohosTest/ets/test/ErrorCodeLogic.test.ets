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
import { ErrorCodeMap, ErrorExplain } from 'library';

const DOMAIN: number = 0xF811;

/**
 * Codes known to ErrorCodeMap.explain in declaration order plus the severity
 * each entry must carry.
 */
const KNOWN_CODES: number[] = [201, 401, 8300001, 8300003, 8300999, 13900002];
const KNOWN_SEVERITIES: string[] = ['error', 'warning', 'warning', 'error', 'error', 'error'];

/**
 * Near-miss codes that must fall into the unknown branch, each expected to
 * keep the requested code and report the generic error severity.
 */
const UNKNOWN_CODES: number[] = [200, 202, 400, 402, 8300000, 8300002, 8300004, 8300998, 13900000, 13900001, 13900003];

export default function errorCodeLogicTest() {
  describe('ErrorCodeLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_0100
     * @tc.name      testErrorCodeMapPermissionDenied0001
     * @tc.desc      Verify explain(201) maps the permission denied code to an
     *               error explain carrying code and non-empty resource fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testErrorCodeMapPermissionDenied0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testErrorCodeMapPermissionDenied0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const explain: ErrorExplain = ErrorCodeMap.explain(201);
      expect(explain).not().assertNull();
      expect(explain.code).assertEqual(201);
      expect(explain.severity).assertEqual('error');
      expect(explain.title).not().assertNull();
      expect(explain.reason).not().assertNull();
      expect(explain.suggestion).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_0200
     * @tc.name      testErrorCodeMapParameter0001
     * @tc.desc      Verify explain(401) maps the parameter error code to a
     *               warning explain with the original code preserved.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testErrorCodeMapParameter0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testErrorCodeMapParameter0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const explain: ErrorExplain = ErrorCodeMap.explain(401);
      expect(explain).not().assertNull();
      expect(explain.code).assertEqual(401);
      expect(explain.severity).assertEqual('warning');
      expect(explain.title).not().assertNull();
      expect(explain.reason).not().assertNull();
      expect(explain.suggestion).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_0300
     * @tc.name      testErrorCodeMapInvalidParameter0001
     * @tc.desc      Verify explain(8300001) maps the invalid parameter code to
     *               a warning explain and keeps every resource field present.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testErrorCodeMapInvalidParameter0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testErrorCodeMapInvalidParameter0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const explain: ErrorExplain = ErrorCodeMap.explain(8300001);
      expect(explain).not().assertNull();
      expect(explain.code).assertEqual(8300001);
      expect(explain.severity).assertEqual('warning');
      expect(explain.title).not().assertNull();
      expect(explain.reason).not().assertNull();
      expect(explain.suggestion).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_0400
     * @tc.name      testErrorCodeMapSystemError0001
     * @tc.desc      Verify explain(8300003) maps the system error code to an
     *               error explain with all three resource fields available.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testErrorCodeMapSystemError0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testErrorCodeMapSystemError0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const explain: ErrorExplain = ErrorCodeMap.explain(8300003);
      expect(explain).not().assertNull();
      expect(explain.code).assertEqual(8300003);
      expect(explain.severity).assertEqual('error');
      expect(explain.title).not().assertNull();
      expect(explain.reason).not().assertNull();
      expect(explain.suggestion).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_0500
     * @tc.name      testErrorCodeMapUnknownCode0001
     * @tc.desc      Verify explain(8300999) maps the generic unknown code to an
     *               error explain whose code equals the requested one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testErrorCodeMapUnknownCode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testErrorCodeMapUnknownCode0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const explain: ErrorExplain = ErrorCodeMap.explain(8300999);
      expect(explain).not().assertNull();
      expect(explain.code).assertEqual(8300999);
      expect(explain.severity).assertEqual('error');
      expect(explain.title).not().assertNull();
      expect(explain.reason).not().assertNull();
      expect(explain.suggestion).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_0600
     * @tc.name      testErrorCodeMapFileNotFound0001
     * @tc.desc      Verify explain(13900002) maps the file not found code to an
     *               error explain and never returns a null field.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testErrorCodeMapFileNotFound0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testErrorCodeMapFileNotFound0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const explain: ErrorExplain = ErrorCodeMap.explain(13900002);
      expect(explain).not().assertNull();
      expect(explain.code).assertEqual(13900002);
      expect(explain.severity).assertEqual('error');
      expect(explain.title).not().assertNull();
      expect(explain.reason).not().assertNull();
      expect(explain.suggestion).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_0700
     * @tc.name      testErrorCodeMapSeveritySet0001
     * @tc.desc      Verify every known code resolves to its documented severity
     *               in one sweep over the full mapping table.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapSeveritySet0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapSeveritySet0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < KNOWN_CODES.length; i++) {
        const explain: ErrorExplain = ErrorCodeMap.explain(KNOWN_CODES[i]);
        expect(explain).not().assertNull();
        expect(explain.code).assertEqual(KNOWN_CODES[i]);
        expect(explain.severity).assertEqual(KNOWN_SEVERITIES[i]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_0800
     * @tc.name      testErrorCodeMapFallbackNegative0001
     * @tc.desc      Verify a negative code falls into the unknown branch with
     *               the generic error severity and its own code echoed back.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapFallbackNegative0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapFallbackNegative0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const explain: ErrorExplain = ErrorCodeMap.explain(-1);
      expect(explain).not().assertNull();
      expect(explain.code).assertEqual(-1);
      expect(explain.severity).assertEqual('error');
      expect(explain.title).not().assertNull();
      expect(explain.reason).not().assertNull();
      expect(explain.suggestion).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_0900
     * @tc.name      testErrorCodeMapFallbackZero0001
     * @tc.desc      Verify the zero code is treated as unknown and the returned
     *               explain still carries code zero with error severity.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapFallbackZero0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapFallbackZero0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const explain: ErrorExplain = ErrorCodeMap.explain(0);
      expect(explain).not().assertNull();
      expect(explain.code).assertEqual(0);
      expect(explain.severity).assertEqual('error');
      expect(explain.title).not().assertNull();
      expect(explain.suggestion).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_1000
     * @tc.name      testErrorCodeMapFallbackNearMiss0001
     * @tc.desc      Verify near-miss permission and parameter codes stay in the
     *               unknown branch instead of matching their valid neighbors.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapFallbackNearMiss0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapFallbackNearMiss0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < UNKNOWN_CODES.length; i++) {
        const explain: ErrorExplain = ErrorCodeMap.explain(UNKNOWN_CODES[i]);
        expect(explain).not().assertNull();
        expect(explain.code).assertEqual(UNKNOWN_CODES[i]);
        expect(explain.severity).assertEqual('error');
        expect(explain.reason).not().assertNull();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_1100
     * @tc.name      testErrorCodeMapFallbackSystemRange0001
     * @tc.desc      Verify codes adjacent to 8300001, 8300003 and 8300999 fall
     *               through to the unknown explain with error severity.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapFallbackSystemRange0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapFallbackSystemRange0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const codes: number[] = [8300000, 8300002, 8300004, 8300998];
      for (let i = 0; i < codes.length; i++) {
        const explain: ErrorExplain = ErrorCodeMap.explain(codes[i]);
        expect(explain).not().assertNull();
        expect(explain.code).assertEqual(codes[i]);
        expect(explain.severity).assertEqual('error');
        expect(explain.title).not().assertNull();
        expect(explain.suggestion).not().assertNull();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_1200
     * @tc.name      testErrorCodeMapFallbackFileRange0001
     * @tc.desc      Verify file system codes other than 13900002 resolve to the
     *               unknown explain rather than the file-not-found entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapFallbackFileRange0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapFallbackFileRange0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const codes: number[] = [13900000, 13900001, 13900003];
      for (let i = 0; i < codes.length; i++) {
        const explain: ErrorExplain = ErrorCodeMap.explain(codes[i]);
        expect(explain).not().assertNull();
        expect(explain.code).assertEqual(codes[i]);
        expect(explain.severity).assertEqual('error');
        expect(explain.title).not().assertNull();
        expect(explain.reason).not().assertNull();
        expect(explain.suggestion).not().assertNull();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_1300
     * @tc.name      testErrorCodeMapFallbackLarge0001
     * @tc.desc      Verify very large and out-of-range codes still return a
     *               valid unknown explain without throwing or changing code.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapFallbackLarge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapFallbackLarge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const explain: ErrorExplain = ErrorCodeMap.explain(999999999);
      expect(explain).not().assertNull();
      expect(explain.code).assertEqual(999999999);
      expect(explain.severity).assertEqual('error');
      expect(explain.title).not().assertNull();
      const beyond: ErrorExplain = ErrorCodeMap.explain(8301000);
      expect(beyond).not().assertNull();
      expect(beyond.code).assertEqual(8301000);
      expect(beyond.severity).assertEqual('error');
      expect(beyond.suggestion).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_1400
     * @tc.name      testErrorExplainConstructor0001
     * @tc.desc      Verify the ErrorExplain constructor stores code, severity,
     *               title, reason and suggestion exactly as passed in.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testErrorExplainConstructor0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testErrorExplainConstructor0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const explain: ErrorExplain = new ErrorExplain(7, 'warning', 'Short title', 'Why it happened', 'What to do');
      expect(explain).not().assertNull();
      expect(explain.code).assertEqual(7);
      expect(explain.severity).assertEqual('warning');
      expect(explain.title).assertEqual('Short title');
      expect(explain.reason).assertEqual('Why it happened');
      expect(explain.suggestion).assertEqual('What to do');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_1500
     * @tc.name      testErrorExplainFields0001
     * @tc.desc      Verify ErrorExplain keeps independent fields so changing
     *               the reason through a new instance never affects the first.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testErrorExplainFields0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testErrorExplainFields0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: ErrorExplain = new ErrorExplain(1, 'error', 'T1', 'R1', 'S1');
      const second: ErrorExplain = new ErrorExplain(2, 'warning', 'T2', 'R2', 'S2');
      expect(first.code).assertEqual(1);
      expect(first.title).assertEqual('T1');
      expect(first.reason).assertEqual('R1');
      expect(second.code).assertEqual(2);
      expect(second.title).assertEqual('T2');
      expect(second.reason).assertEqual('R2');
      expect(second.suggestion).assertEqual('S2');
      expect(first.severity).assertEqual('error');
      expect(second.severity).assertEqual('warning');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_1600
     * @tc.name      testErrorExplainPassthrough0001
     * @tc.desc      Verify the ErrorExplain constructor passes arbitrary
     *               severity strings through without validation or mutation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorExplainPassthrough0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorExplainPassthrough0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const info: ErrorExplain = new ErrorExplain(8300999, 'info', 't', 'r', 's');
      expect(info.severity).assertEqual('info');
      expect(info.code).assertEqual(8300999);
      expect(info.suggestion).assertEqual('s');
      const custom: ErrorExplain = new ErrorExplain(0, 'fatal', 't2', 'r2', 's2');
      expect(custom.severity).assertEqual('fatal');
      expect(custom.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_1700
     * @tc.name      testErrorCodeMapCompleteness0001
     * @tc.desc      Verify the mapping is complete: every known code returns a
     *               non-null explain whose severity is error or warning only.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapCompleteness0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapCompleteness0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < KNOWN_CODES.length; i++) {
        const explain: ErrorExplain = ErrorCodeMap.explain(KNOWN_CODES[i]);
        expect(explain).not().assertNull();
        expect(explain.code).assertEqual(KNOWN_CODES[i]);
        const known: boolean = explain.severity === 'error' || explain.severity === 'warning';
        expect(known).assertTrue();
        expect(explain.title).not().assertNull();
        expect(explain.reason).not().assertNull();
        expect(explain.suggestion).not().assertNull();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_1800
     * @tc.name      testErrorCodeMapInstances0001
     * @tc.desc      Verify repeated explain calls return usable instances whose
     *               code values differ for different requested codes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapInstances0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapInstances0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: ErrorExplain = ErrorCodeMap.explain(201);
      const second: ErrorExplain = ErrorCodeMap.explain(201);
      const third: ErrorExplain = ErrorCodeMap.explain(401);
      expect(first).not().assertNull();
      expect(second).not().assertNull();
      expect(third).not().assertNull();
      expect(first.code).assertEqual(201);
      expect(second.code).assertEqual(201);
      expect(third.code).assertEqual(401);
      const different: boolean = first.code !== third.code;
      expect(different).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_1900
     * @tc.name      testErrorCodeMapSeverityExact0001
     * @tc.desc      Verify the exact severity spelling for all six known codes
     *               so UI tone styling can rely on stable lowercase strings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testErrorCodeMapSeverityExact0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testErrorCodeMapSeverityExact0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ErrorCodeMap.explain(201).severity).assertEqual('error');
      expect(ErrorCodeMap.explain(401).severity).assertEqual('warning');
      expect(ErrorCodeMap.explain(8300001).severity).assertEqual('warning');
      expect(ErrorCodeMap.explain(8300003).severity).assertEqual('error');
      expect(ErrorCodeMap.explain(8300999).severity).assertEqual('error');
      expect(ErrorCodeMap.explain(13900002).severity).assertEqual('error');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_2000
     * @tc.name      testErrorCodeMapRepeatStable0001
     * @tc.desc      Verify repeated lookups of the same code are stable, always
     *               reporting the same code and severity pair.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapRepeatStable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapRepeatStable0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const one: ErrorExplain = ErrorCodeMap.explain(8300001);
      const two: ErrorExplain = ErrorCodeMap.explain(8300001);
      expect(one.code).assertEqual(8300001);
      expect(two.code).assertEqual(8300001);
      expect(one.severity).assertEqual('warning');
      expect(two.severity).assertEqual('warning');
      const fileOne: ErrorExplain = ErrorCodeMap.explain(13900002);
      const fileTwo: ErrorExplain = ErrorCodeMap.explain(13900002);
      expect(fileOne.code).assertEqual(13900002);
      expect(fileTwo.code).assertEqual(13900002);
      expect(fileOne.severity).assertEqual('error');
      expect(fileTwo.severity).assertEqual('error');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_2100
     * @tc.name      testErrorCodeMapBoundary0001
     * @tc.desc      Verify numeric boundary codes resolve through the unknown
     *               branch while echoing the requested value unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapBoundary0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const max: ErrorExplain = ErrorCodeMap.explain(9007199254740991);
      expect(max).not().assertNull();
      expect(max.code).assertEqual(9007199254740991);
      expect(max.severity).assertEqual('error');
      expect(max.title).not().assertNull();
      const min: ErrorExplain = ErrorCodeMap.explain(-2147483648);
      expect(min).not().assertNull();
      expect(min.code).assertEqual(-2147483648);
      expect(min.severity).assertEqual('error');
      expect(min.suggestion).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_2200
     * @tc.name      testErrorCodeMapMixedBatch0001
     * @tc.desc      Verify a mixed batch of known and unknown codes resolves
     *               each entry to its expected severity in index order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapMixedBatch0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapMixedBatch0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const codes: number[] = [201, 100, 401, 8300002, 8300003, 55, 13900002, 1];
      const severities: string[] = ['error', 'error', 'warning', 'error', 'error', 'error', 'error', 'error'];
      for (let i = 0; i < codes.length; i++) {
        const explain: ErrorExplain = ErrorCodeMap.explain(codes[i]);
        expect(explain).not().assertNull();
        expect(explain.code).assertEqual(codes[i]);
        expect(explain.severity).assertEqual(severities[i]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_2300
     * @tc.name      testErrorCodeMapResourceTypes0001
     * @tc.desc      Verify every known explain exposes non-empty title, reason
     *               and suggestion resources usable by the error dialog.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapResourceTypes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapResourceTypes0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < KNOWN_CODES.length; i++) {
        const explain: ErrorExplain = ErrorCodeMap.explain(KNOWN_CODES[i]);
        expect(explain.title).not().assertNull();
        expect(explain.reason).not().assertNull();
        expect(explain.suggestion).not().assertNull();
        expect(explain).not().assertNull();
      }
      const unknown: ErrorExplain = ErrorCodeMap.explain(12345);
      expect(unknown.title).not().assertNull();
      expect(unknown.reason).not().assertNull();
      expect(unknown.suggestion).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_2400
     * @tc.name      testErrorCodeMapUnknownSeverity0001
     * @tc.desc      Verify the unknown fallback always reports error severity
     *               and never the warning tone used by parameter codes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapUnknownSeverity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapUnknownSeverity0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const samples: number[] = [-7, 3, 999, 8300005, 14000000];
      for (let i = 0; i < samples.length; i++) {
        const explain: ErrorExplain = ErrorCodeMap.explain(samples[i]);
        expect(explain.severity).assertEqual('error');
        expect(explain.code).assertEqual(samples[i]);
        expect(explain).not().assertNull();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_2500
     * @tc.name      testErrorExplainSeverityTypes0001
     * @tc.desc      Verify every known explain carries a positive code and a
     *               non-empty severity string usable for tone selection.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorExplainSeverityTypes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorExplainSeverityTypes0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < KNOWN_CODES.length; i++) {
        const explain: ErrorExplain = ErrorCodeMap.explain(KNOWN_CODES[i]);
        expect(explain.code).assertLarger(0);
        expect(explain.severity.length).assertLarger(0);
        expect(explain.severity).assertEqual(KNOWN_SEVERITIES[i]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_2600
     * @tc.name      testErrorCodeMapFallbackLoop0001
     * @tc.desc      Verify small negative codes all resolve through the
     *               unknown branch and echo their requested value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapFallbackLoop0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapFallbackLoop0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const negatives: number[] = [-10, -5, -1];
      for (let i = 0; i < negatives.length; i++) {
        const explain: ErrorExplain = ErrorCodeMap.explain(negatives[i]);
        expect(explain).not().assertNull();
        expect(explain.code).assertEqual(negatives[i]);
        expect(explain.severity).assertEqual('error');
        expect(explain.title).not().assertNull();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_2700
     * @tc.name      testErrorCodeMapCodeEcho0001
     * @tc.desc      Verify each known code echoes back unchanged in the
     *               explain payload so dialogs can show the raw code.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapCodeEcho0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapCodeEcho0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < KNOWN_CODES.length; i++) {
        const explain: ErrorExplain = ErrorCodeMap.explain(KNOWN_CODES[i]);
        expect(explain.code).assertEqual(KNOWN_CODES[i]);
        expect(explain.code).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_2800
     * @tc.name      testErrorExplainCtorEmpty0001
     * @tc.desc      Verify the ErrorExplain constructor passes through empty
     *               strings and a zero code without inventing defaults.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorExplainCtorEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorExplainCtorEmpty0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: ErrorExplain = new ErrorExplain(0, '', '', '', '');
      expect(empty.code).assertEqual(0);
      expect(empty.severity).assertEqual('');
      expect(empty.title).assertEqual('');
      expect(empty.reason).assertEqual('');
      expect(empty.suggestion).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_2900
     * @tc.name      testErrorCodeMapSeverityContrast0001
     * @tc.desc      Verify error and warning severities differ across codes so
     *               the UI tone can never collapse into one bucket.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapSeverityContrast0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapSeverityContrast0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const denied: ErrorExplain = ErrorCodeMap.explain(201);
      const parameter: ErrorExplain = ErrorCodeMap.explain(401);
      const invalid: ErrorExplain = ErrorCodeMap.explain(8300001);
      expect(denied.severity).assertEqual('error');
      expect(parameter.severity).assertEqual('warning');
      expect(invalid.severity).assertEqual('warning');
      expect(denied.code !== parameter.code).assertTrue();
      expect(denied.code !== invalid.code).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_3000
     * @tc.name      testErrorCodeMapWarningsOnly0001
     * @tc.desc      Verify exactly the two parameter style codes report the
     *               warning tone and every other known code reports error.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapWarningsOnly0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapWarningsOnly0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const errorOnlyIndexes: number[] = [0, 3, 4, 5];
      for (let i = 0; i < errorOnlyIndexes.length; i++) {
        const index: number = errorOnlyIndexes[i];
        const explain: ErrorExplain = ErrorCodeMap.explain(KNOWN_CODES[index]);
        expect(explain.severity).assertEqual('error');
        expect(explain.severity).assertEqual(KNOWN_SEVERITIES[index]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_3100
     * @tc.name      testErrorCodeMapFallbackShape0001
     * @tc.desc      Verify a battery of unknown codes produces the complete
     *               explain shape with non-null fields and error severity.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapFallbackShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapFallbackShape0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const battery: number[] = [-999, 0, 1, 402, 8299999, 8310000, 13900004];
      for (let i = 0; i < battery.length; i++) {
        const explain: ErrorExplain = ErrorCodeMap.explain(battery[i]);
        expect(explain).not().assertNull();
        expect(explain.code).assertEqual(battery[i]);
        expect(explain.severity).assertEqual('error');
        expect(explain.title).not().assertNull();
        expect(explain.reason).not().assertNull();
        expect(explain.suggestion).not().assertNull();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_3200
     * @tc.name      testErrorCodeMapCodeIndependence0001
     * @tc.desc      Verify explains built for different codes never share the
     *               same code field value in a single resolution batch.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapCodeIndependence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapCodeIndependence0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: ErrorExplain = ErrorCodeMap.explain(201);
      const second: ErrorExplain = ErrorCodeMap.explain(8300003);
      const third: ErrorExplain = ErrorCodeMap.explain(13900002);
      expect(first.code).assertEqual(201);
      expect(second.code).assertEqual(8300003);
      expect(third.code).assertEqual(13900002);
      expect(first.code !== second.code).assertTrue();
      expect(second.code !== third.code).assertTrue();
      expect(first.code !== third.code).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_3300
     * @tc.name      testErrorExplainLongStrings0001
     * @tc.desc      Verify the ErrorExplain constructor stores long message
     *               strings with their exact length preserved for rendering.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorExplainLongStrings0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorExplainLongStrings0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let longText: string = '';
      for (let i = 0; i < 200; i++) {
        longText += 'x';
      }
      const explain: ErrorExplain = new ErrorExplain(9, 'error', longText, longText, longText);
      expect(longText.length).assertEqual(200);
      expect(explain.title).assertEqual(longText);
      expect(explain.reason).assertEqual(longText);
      expect(explain.suggestion).assertEqual(longText);
      expect(explain.severity).assertEqual('error');
      expect(explain.code).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_3400
     * @tc.name      testErrorCodeMapSequentialBatch0001
     * @tc.desc      Verify two consecutive passes over all known codes return
     *               identical codes and severities, proving stable resolution.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapSequentialBatch0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapSequentialBatch0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let pass = 0; pass < 2; pass++) {
        for (let i = 0; i < KNOWN_CODES.length; i++) {
          const explain: ErrorExplain = ErrorCodeMap.explain(KNOWN_CODES[i]);
          expect(explain.code).assertEqual(KNOWN_CODES[i]);
          expect(explain.severity).assertEqual(KNOWN_SEVERITIES[i]);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_3500
     * @tc.name      testErrorCodeMapUnknownMixedSign0001
     * @tc.desc      Verify large positive and negative boundary codes outside
     *               the known table resolve through the unknown fallback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorCodeMapUnknownMixedSign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorCodeMapUnknownMixedSign0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const mixed: number[] = [2147483647, -2147483647];
      for (let i = 0; i < mixed.length; i++) {
        const explain: ErrorExplain = ErrorCodeMap.explain(mixed[i]);
        expect(explain).not().assertNull();
        expect(explain.code).assertEqual(mixed[i]);
        expect(explain.severity).assertEqual('error');
        expect(explain.title).not().assertNull();
        expect(explain.reason).not().assertNull();
        expect(explain.suggestion).not().assertNull();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_ECOD_3600
     * @tc.name      testErrorExplainMutableFields0001
     * @tc.desc      Verify ErrorExplain fields stay writable after construction
     *               so callers can annotate the entry before rendering it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorExplainMutableFields0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testErrorExplainMutableFields0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const explain: ErrorExplain = new ErrorExplain(1, 'error', 'old title', 'old reason', 'old fix');
      explain.code = 500;
      explain.severity = 'warning';
      explain.title = 'new title';
      explain.reason = 'new reason';
      explain.suggestion = 'new fix';
      expect(explain.code).assertEqual(500);
      expect(explain.severity).assertEqual('warning');
      expect(explain.title).assertEqual('new title');
      expect(explain.reason).assertEqual('new reason');
      expect(explain.suggestion).assertEqual('new fix');
      const mapped: ErrorExplain = ErrorCodeMap.explain(401);
      expect(mapped.severity).assertEqual('warning');
      expect(mapped.code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
