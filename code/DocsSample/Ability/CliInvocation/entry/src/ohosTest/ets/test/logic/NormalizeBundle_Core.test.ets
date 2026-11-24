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

import { describe, expect, it, beforeAll, afterAll, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CliModel } from '../Shared/CliFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_cliinvocation]';
const BUNDLE: string = 'CliInvocation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for normalizeBundle (50 cases). */
export default function normalizeBundleCoreTest(): void {
  describe('NormalizeBundleCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}NormalizeBundleCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}NormalizeBundleCoreTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0001
     * @tc.name      CliInvocation_normalizeBundle_Core_0001
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  abc  ) returns abc.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_normalizeBundle_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: WhitespaceString; expected: abc
      const actual: string = CliModel.normalizeBundle('  abc  ');
      expect(actual).assertEqual('abc');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0002
     * @tc.name      CliInvocation_normalizeBundle_Core_0002
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(\\tabc\\n) returns abc.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: abc
      const actual: string = CliModel.normalizeBundle('\tabc\n');
      expect(actual).assertEqual('abc');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0003
     * @tc.name      CliInvocation_normalizeBundle_Core_0003
     * @tc.desc      [ShortString] Verify normalizeBundle(abc) returns abc.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: abc
      const actual: string = CliModel.normalizeBundle('abc');
      expect(actual).assertEqual('abc');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0004
     * @tc.name      CliInvocation_normalizeBundle_Core_0004
     * @tc.desc      [ShortString] Verify normalizeBundle( a ) returns a.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: a
      const actual: string = CliModel.normalizeBundle(' a ');
      expect(actual).assertEqual('a');
      expect(actual.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0005
     * @tc.name      CliInvocation_normalizeBundle_Core_0005
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(a b ) returns a b.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: a b
      const actual: string = CliModel.normalizeBundle('a b ');
      expect(actual).assertEqual('a b');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0006
     * @tc.name      CliInvocation_normalizeBundle_Core_0006
     * @tc.desc      [ShortString] Verify normalizeBundle(  ) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: (empty)
      const actual: string = CliModel.normalizeBundle('  ');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0007
     * @tc.name      CliInvocation_normalizeBundle_Core_0007
     * @tc.desc      [ShortString] Verify normalizeBundle(x) returns x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: x
      const actual: string = CliModel.normalizeBundle('x');
      expect(actual).assertEqual('x');
      expect(actual.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0008
     * @tc.name      CliInvocation_normalizeBundle_Core_0008
     * @tc.desc      [ShortString] Verify normalizeBundle(\\n\\n) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: (empty)
      const actual: string = CliModel.normalizeBundle('\n\n');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0009
     * @tc.name      CliInvocation_normalizeBundle_Core_0009
     * @tc.desc      [ShortString] Verify normalizeBundle(\\t\\t) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: (empty)
      const actual: string = CliModel.normalizeBundle('\t\t');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0010
     * @tc.name      CliInvocation_normalizeBundle_Core_0010
     * @tc.desc      [WhitespaceString] Verify normalizeBundle( lead) returns lead.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: lead
      const actual: string = CliModel.normalizeBundle(' lead');
      expect(actual).assertEqual('lead');
      expect(actual.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0011
     * @tc.name      CliInvocation_normalizeBundle_Core_0011
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(trail ) returns trail.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: trail
      const actual: string = CliModel.normalizeBundle('trail ');
      expect(actual).assertEqual('trail');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0012
     * @tc.name      CliInvocation_normalizeBundle_Core_0012
     * @tc.desc      [ShortString] Verify normalizeBundle(s0) returns s0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s0
      const actual: string = CliModel.normalizeBundle('s0');
      expect(actual).assertEqual('s0');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0013
     * @tc.name      CliInvocation_normalizeBundle_Core_0013
     * @tc.desc      [ShortString] Verify normalizeBundle(s1) returns s1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s1
      const actual: string = CliModel.normalizeBundle('s1');
      expect(actual).assertEqual('s1');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0014
     * @tc.name      CliInvocation_normalizeBundle_Core_0014
     * @tc.desc      [ShortString] Verify normalizeBundle(s2) returns s2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s2
      const actual: string = CliModel.normalizeBundle('s2');
      expect(actual).assertEqual('s2');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0015
     * @tc.name      CliInvocation_normalizeBundle_Core_0015
     * @tc.desc      [ShortString] Verify normalizeBundle(s3) returns s3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s3
      const actual: string = CliModel.normalizeBundle('s3');
      expect(actual).assertEqual('s3');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0016
     * @tc.name      CliInvocation_normalizeBundle_Core_0016
     * @tc.desc      [ShortString] Verify normalizeBundle(s4) returns s4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s4
      const actual: string = CliModel.normalizeBundle('s4');
      expect(actual).assertEqual('s4');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0017
     * @tc.name      CliInvocation_normalizeBundle_Core_0017
     * @tc.desc      [ShortString] Verify normalizeBundle(s5) returns s5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s5
      const actual: string = CliModel.normalizeBundle('s5');
      expect(actual).assertEqual('s5');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0018
     * @tc.name      CliInvocation_normalizeBundle_Core_0018
     * @tc.desc      [ShortString] Verify normalizeBundle(s6) returns s6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s6
      const actual: string = CliModel.normalizeBundle('s6');
      expect(actual).assertEqual('s6');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0019
     * @tc.name      CliInvocation_normalizeBundle_Core_0019
     * @tc.desc      [ShortString] Verify normalizeBundle(s7) returns s7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s7
      const actual: string = CliModel.normalizeBundle('s7');
      expect(actual).assertEqual('s7');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0020
     * @tc.name      CliInvocation_normalizeBundle_Core_0020
     * @tc.desc      [ShortString] Verify normalizeBundle(s8) returns s8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s8
      const actual: string = CliModel.normalizeBundle('s8');
      expect(actual).assertEqual('s8');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0021
     * @tc.name      CliInvocation_normalizeBundle_Core_0021
     * @tc.desc      [ShortString] Verify normalizeBundle(s9) returns s9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s9
      const actual: string = CliModel.normalizeBundle('s9');
      expect(actual).assertEqual('s9');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0022
     * @tc.name      CliInvocation_normalizeBundle_Core_0022
     * @tc.desc      [ShortString] Verify normalizeBundle(s10) returns s10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s10
      const actual: string = CliModel.normalizeBundle('s10');
      expect(actual).assertEqual('s10');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0023
     * @tc.name      CliInvocation_normalizeBundle_Core_0023
     * @tc.desc      [ShortString] Verify normalizeBundle(s11) returns s11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s11
      const actual: string = CliModel.normalizeBundle('s11');
      expect(actual).assertEqual('s11');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0024
     * @tc.name      CliInvocation_normalizeBundle_Core_0024
     * @tc.desc      [ShortString] Verify normalizeBundle(s12) returns s12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s12
      const actual: string = CliModel.normalizeBundle('s12');
      expect(actual).assertEqual('s12');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0025
     * @tc.name      CliInvocation_normalizeBundle_Core_0025
     * @tc.desc      [ShortString] Verify normalizeBundle(s13) returns s13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s13
      const actual: string = CliModel.normalizeBundle('s13');
      expect(actual).assertEqual('s13');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0026
     * @tc.name      CliInvocation_normalizeBundle_Core_0026
     * @tc.desc      [ShortString] Verify normalizeBundle(s14) returns s14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s14
      const actual: string = CliModel.normalizeBundle('s14');
      expect(actual).assertEqual('s14');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0027
     * @tc.name      CliInvocation_normalizeBundle_Core_0027
     * @tc.desc      [ShortString] Verify normalizeBundle(s15) returns s15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s15
      const actual: string = CliModel.normalizeBundle('s15');
      expect(actual).assertEqual('s15');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0028
     * @tc.name      CliInvocation_normalizeBundle_Core_0028
     * @tc.desc      [ShortString] Verify normalizeBundle(s16) returns s16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s16
      const actual: string = CliModel.normalizeBundle('s16');
      expect(actual).assertEqual('s16');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0029
     * @tc.name      CliInvocation_normalizeBundle_Core_0029
     * @tc.desc      [ShortString] Verify normalizeBundle(s17) returns s17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s17
      const actual: string = CliModel.normalizeBundle('s17');
      expect(actual).assertEqual('s17');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0030
     * @tc.name      CliInvocation_normalizeBundle_Core_0030
     * @tc.desc      [ShortString] Verify normalizeBundle(s18) returns s18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s18
      const actual: string = CliModel.normalizeBundle('s18');
      expect(actual).assertEqual('s18');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0031
     * @tc.name      CliInvocation_normalizeBundle_Core_0031
     * @tc.desc      [ShortString] Verify normalizeBundle(s19) returns s19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s19
      const actual: string = CliModel.normalizeBundle('s19');
      expect(actual).assertEqual('s19');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0032
     * @tc.name      CliInvocation_normalizeBundle_Core_0032
     * @tc.desc      [ShortString] Verify normalizeBundle(s20) returns s20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s20
      const actual: string = CliModel.normalizeBundle('s20');
      expect(actual).assertEqual('s20');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0033
     * @tc.name      CliInvocation_normalizeBundle_Core_0033
     * @tc.desc      [ShortString] Verify normalizeBundle(s21) returns s21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s21
      const actual: string = CliModel.normalizeBundle('s21');
      expect(actual).assertEqual('s21');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0034
     * @tc.name      CliInvocation_normalizeBundle_Core_0034
     * @tc.desc      [ShortString] Verify normalizeBundle(s22) returns s22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s22
      const actual: string = CliModel.normalizeBundle('s22');
      expect(actual).assertEqual('s22');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0035
     * @tc.name      CliInvocation_normalizeBundle_Core_0035
     * @tc.desc      [ShortString] Verify normalizeBundle(s23) returns s23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s23
      const actual: string = CliModel.normalizeBundle('s23');
      expect(actual).assertEqual('s23');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0036
     * @tc.name      CliInvocation_normalizeBundle_Core_0036
     * @tc.desc      [ShortString] Verify normalizeBundle(s24) returns s24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s24
      const actual: string = CliModel.normalizeBundle('s24');
      expect(actual).assertEqual('s24');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0037
     * @tc.name      CliInvocation_normalizeBundle_Core_0037
     * @tc.desc      [ShortString] Verify normalizeBundle(s25) returns s25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s25
      const actual: string = CliModel.normalizeBundle('s25');
      expect(actual).assertEqual('s25');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0038
     * @tc.name      CliInvocation_normalizeBundle_Core_0038
     * @tc.desc      [ShortString] Verify normalizeBundle(s26) returns s26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s26
      const actual: string = CliModel.normalizeBundle('s26');
      expect(actual).assertEqual('s26');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0039
     * @tc.name      CliInvocation_normalizeBundle_Core_0039
     * @tc.desc      [ShortString] Verify normalizeBundle(s27) returns s27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s27
      const actual: string = CliModel.normalizeBundle('s27');
      expect(actual).assertEqual('s27');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0040
     * @tc.name      CliInvocation_normalizeBundle_Core_0040
     * @tc.desc      [ShortString] Verify normalizeBundle(s28) returns s28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s28
      const actual: string = CliModel.normalizeBundle('s28');
      expect(actual).assertEqual('s28');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0041
     * @tc.name      CliInvocation_normalizeBundle_Core_0041
     * @tc.desc      [ShortString] Verify normalizeBundle(s29) returns s29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s29
      const actual: string = CliModel.normalizeBundle('s29');
      expect(actual).assertEqual('s29');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0042
     * @tc.name      CliInvocation_normalizeBundle_Core_0042
     * @tc.desc      [ShortString] Verify normalizeBundle(s30) returns s30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s30
      const actual: string = CliModel.normalizeBundle('s30');
      expect(actual).assertEqual('s30');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0043
     * @tc.name      CliInvocation_normalizeBundle_Core_0043
     * @tc.desc      [ShortString] Verify normalizeBundle(s31) returns s31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s31
      const actual: string = CliModel.normalizeBundle('s31');
      expect(actual).assertEqual('s31');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0044
     * @tc.name      CliInvocation_normalizeBundle_Core_0044
     * @tc.desc      [ShortString] Verify normalizeBundle(s32) returns s32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s32
      const actual: string = CliModel.normalizeBundle('s32');
      expect(actual).assertEqual('s32');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0045
     * @tc.name      CliInvocation_normalizeBundle_Core_0045
     * @tc.desc      [ShortString] Verify normalizeBundle(s33) returns s33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s33
      const actual: string = CliModel.normalizeBundle('s33');
      expect(actual).assertEqual('s33');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0046
     * @tc.name      CliInvocation_normalizeBundle_Core_0046
     * @tc.desc      [ShortString] Verify normalizeBundle(s34) returns s34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s34
      const actual: string = CliModel.normalizeBundle('s34');
      expect(actual).assertEqual('s34');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0047
     * @tc.name      CliInvocation_normalizeBundle_Core_0047
     * @tc.desc      [ShortString] Verify normalizeBundle(s35) returns s35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s35
      const actual: string = CliModel.normalizeBundle('s35');
      expect(actual).assertEqual('s35');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0048
     * @tc.name      CliInvocation_normalizeBundle_Core_0048
     * @tc.desc      [ShortString] Verify normalizeBundle(s36) returns s36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s36
      const actual: string = CliModel.normalizeBundle('s36');
      expect(actual).assertEqual('s36');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0049
     * @tc.name      CliInvocation_normalizeBundle_Core_0049
     * @tc.desc      [ShortString] Verify normalizeBundle(s37) returns s37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s37
      const actual: string = CliModel.normalizeBundle('s37');
      expect(actual).assertEqual('s37');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_CORE_0050
     * @tc.name      CliInvocation_normalizeBundle_Core_0050
     * @tc.desc      [ShortString] Verify normalizeBundle(s38) returns s38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s38
      const actual: string = CliModel.normalizeBundle('s38');
      expect(actual).assertEqual('s38');
      expect(actual.length).assertEqual(3);
    });

  });
}
