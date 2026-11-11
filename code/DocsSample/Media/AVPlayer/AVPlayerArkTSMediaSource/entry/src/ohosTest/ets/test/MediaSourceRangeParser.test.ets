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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_MediaSourceRangeParser]';
const DOMAIN: number = 0xF812;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceRangeParserTest(): void {
  describe('mediaSourceRangeParserTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0001
     * @tc.name      testExtRangeParser0000
     * @tc.desc      Range header bytes=0-511 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-511';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(0);
      expect(end).assertEqual(511);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0002
     * @tc.name      testExtRangeParser0001
     * @tc.desc      Range header bytes=1024-1536 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=1024-1536';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(1024);
      expect(end).assertEqual(1536);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0003
     * @tc.name      testExtRangeParser0002
     * @tc.desc      Range header bytes=0-0 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-0';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(0);
      expect(end).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0004
     * @tc.name      testExtRangeParser0003
     * @tc.desc      Range header bytes=1-1 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=1-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(1);
      expect(end).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0005
     * @tc.name      testExtRangeParser0004
     * @tc.desc      Range header bytes=0- is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0006
     * @tc.name      testExtRangeParser0005
     * @tc.desc      Range header bytes=-100 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=-100';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0007
     * @tc.name      testExtRangeParser0006
     * @tc.desc      Range header bytes=abc-def is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=abc-def';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0008
     * @tc.name      testExtRangeParser0007
     * @tc.desc      Range header bytes=0-1-2 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-1-2';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0009
     * @tc.name      testExtRangeParser0008
     * @tc.desc      Range header  is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = '';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(false);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0010
     * @tc.name      testExtRangeParser0009
     * @tc.desc      Range header Bytes=0-1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'Bytes=0-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(false);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0011
     * @tc.name      testExtRangeParser0010
     * @tc.desc      Range header bytes= 0-1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes= 0-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0012
     * @tc.name      testExtRangeParser0011
     * @tc.desc      Range header bytes=5-4 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=5-4';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(5);
      expect(end).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0013
     * @tc.name      testExtRangeParser0012
     * @tc.desc      Range header bytes=0-511 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-511';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(0);
      expect(end).assertEqual(511);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0014
     * @tc.name      testExtRangeParser0013
     * @tc.desc      Range header bytes=1024-1536 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=1024-1536';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(1024);
      expect(end).assertEqual(1536);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0015
     * @tc.name      testExtRangeParser0014
     * @tc.desc      Range header bytes=0-0 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-0';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(0);
      expect(end).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0016
     * @tc.name      testExtRangeParser0015
     * @tc.desc      Range header bytes=1-1 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=1-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(1);
      expect(end).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0017
     * @tc.name      testExtRangeParser0016
     * @tc.desc      Range header bytes=0- is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0018
     * @tc.name      testExtRangeParser0017
     * @tc.desc      Range header bytes=-100 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=-100';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0019
     * @tc.name      testExtRangeParser0018
     * @tc.desc      Range header bytes=abc-def is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=abc-def';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0020
     * @tc.name      testExtRangeParser0019
     * @tc.desc      Range header bytes=0-1-2 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-1-2';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0021
     * @tc.name      testExtRangeParser0020
     * @tc.desc      Range header  is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = '';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(false);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0022
     * @tc.name      testExtRangeParser0021
     * @tc.desc      Range header Bytes=0-1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'Bytes=0-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(false);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0023
     * @tc.name      testExtRangeParser0022
     * @tc.desc      Range header bytes= 0-1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes= 0-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0024
     * @tc.name      testExtRangeParser0023
     * @tc.desc      Range header bytes=5-4 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=5-4';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(5);
      expect(end).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0025
     * @tc.name      testExtRangeParser0024
     * @tc.desc      Range header bytes=0-511 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-511';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(0);
      expect(end).assertEqual(511);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0026
     * @tc.name      testExtRangeParser0025
     * @tc.desc      Range header bytes=1024-1536 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=1024-1536';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(1024);
      expect(end).assertEqual(1536);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0027
     * @tc.name      testExtRangeParser0026
     * @tc.desc      Range header bytes=0-0 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-0';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(0);
      expect(end).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0028
     * @tc.name      testExtRangeParser0027
     * @tc.desc      Range header bytes=1-1 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=1-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(1);
      expect(end).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0029
     * @tc.name      testExtRangeParser0028
     * @tc.desc      Range header bytes=0- is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0030
     * @tc.name      testExtRangeParser0029
     * @tc.desc      Range header bytes=-100 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=-100';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0031
     * @tc.name      testExtRangeParser0030
     * @tc.desc      Range header bytes=abc-def is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=abc-def';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0032
     * @tc.name      testExtRangeParser0031
     * @tc.desc      Range header bytes=0-1-2 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-1-2';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0033
     * @tc.name      testExtRangeParser0032
     * @tc.desc      Range header  is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = '';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(false);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0034
     * @tc.name      testExtRangeParser0033
     * @tc.desc      Range header Bytes=0-1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'Bytes=0-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(false);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0035
     * @tc.name      testExtRangeParser0034
     * @tc.desc      Range header bytes= 0-1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes= 0-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0036
     * @tc.name      testExtRangeParser0035
     * @tc.desc      Range header bytes=5-4 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=5-4';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(5);
      expect(end).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0037
     * @tc.name      testExtRangeParser0036
     * @tc.desc      Range header bytes=0-511 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-511';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(0);
      expect(end).assertEqual(511);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0038
     * @tc.name      testExtRangeParser0037
     * @tc.desc      Range header bytes=1024-1536 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=1024-1536';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(1024);
      expect(end).assertEqual(1536);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0039
     * @tc.name      testExtRangeParser0038
     * @tc.desc      Range header bytes=0-0 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-0';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(0);
      expect(end).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0040
     * @tc.name      testExtRangeParser0039
     * @tc.desc      Range header bytes=1-1 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=1-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(1);
      expect(end).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0041
     * @tc.name      testExtRangeParser0040
     * @tc.desc      Range header bytes=0- is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0042
     * @tc.name      testExtRangeParser0041
     * @tc.desc      Range header bytes=-100 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=-100';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0043
     * @tc.name      testExtRangeParser0042
     * @tc.desc      Range header bytes=abc-def is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=abc-def';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0044
     * @tc.name      testExtRangeParser0043
     * @tc.desc      Range header bytes=0-1-2 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-1-2';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0045
     * @tc.name      testExtRangeParser0044
     * @tc.desc      Range header  is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = '';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(false);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0046
     * @tc.name      testExtRangeParser0045
     * @tc.desc      Range header Bytes=0-1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'Bytes=0-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(false);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0047
     * @tc.name      testExtRangeParser0046
     * @tc.desc      Range header bytes= 0-1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes= 0-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0048
     * @tc.name      testExtRangeParser0047
     * @tc.desc      Range header bytes=5-4 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=5-4';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(5);
      expect(end).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0049
     * @tc.name      testExtRangeParser0048
     * @tc.desc      Range header bytes=0-511 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-511';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(0);
      expect(end).assertEqual(511);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0050
     * @tc.name      testExtRangeParser0049
     * @tc.desc      Range header bytes=1024-1536 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=1024-1536';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(1024);
      expect(end).assertEqual(1536);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0051
     * @tc.name      testExtRangeParser0050
     * @tc.desc      Range header bytes=0-0 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-0';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(0);
      expect(end).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0052
     * @tc.name      testExtRangeParser0051
     * @tc.desc      Range header bytes=1-1 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=1-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(1);
      expect(end).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0053
     * @tc.name      testExtRangeParser0052
     * @tc.desc      Range header bytes=0- is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0054
     * @tc.name      testExtRangeParser0053
     * @tc.desc      Range header bytes=-100 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=-100';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0055
     * @tc.name      testExtRangeParser0054
     * @tc.desc      Range header bytes=abc-def is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=abc-def';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0056
     * @tc.name      testExtRangeParser0055
     * @tc.desc      Range header bytes=0-1-2 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-1-2';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0057
     * @tc.name      testExtRangeParser0056
     * @tc.desc      Range header  is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = '';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(false);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0058
     * @tc.name      testExtRangeParser0057
     * @tc.desc      Range header Bytes=0-1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'Bytes=0-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(false);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0059
     * @tc.name      testExtRangeParser0058
     * @tc.desc      Range header bytes= 0-1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes= 0-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0060
     * @tc.name      testExtRangeParser0059
     * @tc.desc      Range header bytes=5-4 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=5-4';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(5);
      expect(end).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0061
     * @tc.name      testExtRangeParser0060
     * @tc.desc      Range header bytes=0-511 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-511';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(0);
      expect(end).assertEqual(511);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0062
     * @tc.name      testExtRangeParser0061
     * @tc.desc      Range header bytes=1024-1536 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=1024-1536';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(1024);
      expect(end).assertEqual(1536);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0063
     * @tc.name      testExtRangeParser0062
     * @tc.desc      Range header bytes=0-0 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-0';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(0);
      expect(end).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0064
     * @tc.name      testExtRangeParser0063
     * @tc.desc      Range header bytes=1-1 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=1-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(1);
      expect(end).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0065
     * @tc.name      testExtRangeParser0064
     * @tc.desc      Range header bytes=0- is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0066
     * @tc.name      testExtRangeParser0065
     * @tc.desc      Range header bytes=-100 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=-100';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0067
     * @tc.name      testExtRangeParser0066
     * @tc.desc      Range header bytes=abc-def is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=abc-def';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0068
     * @tc.name      testExtRangeParser0067
     * @tc.desc      Range header bytes=0-1-2 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-1-2';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0069
     * @tc.name      testExtRangeParser0068
     * @tc.desc      Range header  is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = '';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(false);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0070
     * @tc.name      testExtRangeParser0069
     * @tc.desc      Range header Bytes=0-1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'Bytes=0-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(false);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0071
     * @tc.name      testExtRangeParser0070
     * @tc.desc      Range header bytes= 0-1 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes= 0-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0072
     * @tc.name      testExtRangeParser0071
     * @tc.desc      Range header bytes=5-4 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=5-4';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(5);
      expect(end).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0073
     * @tc.name      testExtRangeParser0072
     * @tc.desc      Range header bytes=0-511 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-511';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(0);
      expect(end).assertEqual(511);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0074
     * @tc.name      testExtRangeParser0073
     * @tc.desc      Range header bytes=1024-1536 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=1024-1536';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(1024);
      expect(end).assertEqual(1536);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0075
     * @tc.name      testExtRangeParser0074
     * @tc.desc      Range header bytes=0-0 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-0';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(0);
      expect(end).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0076
     * @tc.name      testExtRangeParser0075
     * @tc.desc      Range header bytes=1-1 is parsed.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=1-1';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(true);
      expect(start).assertEqual(1);
      expect(end).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0077
     * @tc.name      testExtRangeParser0076
     * @tc.desc      Range header bytes=0- is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0078
     * @tc.name      testExtRangeParser0077
     * @tc.desc      Range header bytes=-100 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=-100';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0079
     * @tc.name      testExtRangeParser0078
     * @tc.desc      Range header bytes=abc-def is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=abc-def';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RANGEP_0080
     * @tc.name      testExtRangeParser0079
     * @tc.desc      Range header bytes=0-1-2 is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRangeParser0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const header: string = 'bytes=0-1-2';
      const prefix: string = 'bytes=';
      const prefixed: boolean = header.startsWith(prefix);
      const body: string = prefixed ? header.substring(prefix.length) : '';
      const parts: string[] = prefixed ? body.split('-') : [];
      const shapeValid: boolean = prefixed && parts.length === 2;
      const start: number = shapeValid ? Number.parseInt(parts[0]) : -1;
      const end: number = shapeValid ? Number.parseInt(parts[1]) : -1;
      const valid: boolean = shapeValid && !Number.isNaN(start) && !Number.isNaN(end);
      expect(prefixed).assertEqual(true);
      expect(valid).assertEqual(false);
      expect(start).assertEqual(-1);
      expect(end).assertEqual(-1);
    })
  });
}
