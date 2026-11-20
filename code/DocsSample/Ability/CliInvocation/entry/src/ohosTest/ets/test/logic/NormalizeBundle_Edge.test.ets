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
export default function normalizeBundleEdgeTest(): void {
  describe('NormalizeBundleEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}NormalizeBundleEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}NormalizeBundleEdgeTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0001
     * @tc.name      CliInvocation_normalizeBundle_Edge_0001
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item0  ) returns item0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_normalizeBundle_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: WhitespaceString; expected: item0
      const actual: string = CliModel.normalizeBundle('  item0  ');
      expect(actual).assertEqual('item0');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0002
     * @tc.name      CliInvocation_normalizeBundle_Edge_0002
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item1  ) returns item1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: item1
      const actual: string = CliModel.normalizeBundle('  item1  ');
      expect(actual).assertEqual('item1');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0003
     * @tc.name      CliInvocation_normalizeBundle_Edge_0003
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item2  ) returns item2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: item2
      const actual: string = CliModel.normalizeBundle('  item2  ');
      expect(actual).assertEqual('item2');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0004
     * @tc.name      CliInvocation_normalizeBundle_Edge_0004
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item3  ) returns item3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: item3
      const actual: string = CliModel.normalizeBundle('  item3  ');
      expect(actual).assertEqual('item3');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0005
     * @tc.name      CliInvocation_normalizeBundle_Edge_0005
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item4  ) returns item4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: item4
      const actual: string = CliModel.normalizeBundle('  item4  ');
      expect(actual).assertEqual('item4');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0006
     * @tc.name      CliInvocation_normalizeBundle_Edge_0006
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item5  ) returns item5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: item5
      const actual: string = CliModel.normalizeBundle('  item5  ');
      expect(actual).assertEqual('item5');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0007
     * @tc.name      CliInvocation_normalizeBundle_Edge_0007
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item6  ) returns item6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: item6
      const actual: string = CliModel.normalizeBundle('  item6  ');
      expect(actual).assertEqual('item6');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0008
     * @tc.name      CliInvocation_normalizeBundle_Edge_0008
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item7  ) returns item7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: item7
      const actual: string = CliModel.normalizeBundle('  item7  ');
      expect(actual).assertEqual('item7');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0009
     * @tc.name      CliInvocation_normalizeBundle_Edge_0009
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item8  ) returns item8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: item8
      const actual: string = CliModel.normalizeBundle('  item8  ');
      expect(actual).assertEqual('item8');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0010
     * @tc.name      CliInvocation_normalizeBundle_Edge_0010
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item9  ) returns item9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_normalizeBundle_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: item9
      const actual: string = CliModel.normalizeBundle('  item9  ');
      expect(actual).assertEqual('item9');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0011
     * @tc.name      CliInvocation_normalizeBundle_Edge_0011
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item10  ) returns item10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item10
      const actual: string = CliModel.normalizeBundle('  item10  ');
      expect(actual).assertEqual('item10');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0012
     * @tc.name      CliInvocation_normalizeBundle_Edge_0012
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item11  ) returns item11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item11
      const actual: string = CliModel.normalizeBundle('  item11  ');
      expect(actual).assertEqual('item11');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0013
     * @tc.name      CliInvocation_normalizeBundle_Edge_0013
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item12  ) returns item12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item12
      const actual: string = CliModel.normalizeBundle('  item12  ');
      expect(actual).assertEqual('item12');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0014
     * @tc.name      CliInvocation_normalizeBundle_Edge_0014
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item13  ) returns item13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item13
      const actual: string = CliModel.normalizeBundle('  item13  ');
      expect(actual).assertEqual('item13');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0015
     * @tc.name      CliInvocation_normalizeBundle_Edge_0015
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item14  ) returns item14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item14
      const actual: string = CliModel.normalizeBundle('  item14  ');
      expect(actual).assertEqual('item14');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0016
     * @tc.name      CliInvocation_normalizeBundle_Edge_0016
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item15  ) returns item15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item15
      const actual: string = CliModel.normalizeBundle('  item15  ');
      expect(actual).assertEqual('item15');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0017
     * @tc.name      CliInvocation_normalizeBundle_Edge_0017
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item16  ) returns item16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item16
      const actual: string = CliModel.normalizeBundle('  item16  ');
      expect(actual).assertEqual('item16');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0018
     * @tc.name      CliInvocation_normalizeBundle_Edge_0018
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item17  ) returns item17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item17
      const actual: string = CliModel.normalizeBundle('  item17  ');
      expect(actual).assertEqual('item17');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0019
     * @tc.name      CliInvocation_normalizeBundle_Edge_0019
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item18  ) returns item18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item18
      const actual: string = CliModel.normalizeBundle('  item18  ');
      expect(actual).assertEqual('item18');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0020
     * @tc.name      CliInvocation_normalizeBundle_Edge_0020
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item19  ) returns item19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item19
      const actual: string = CliModel.normalizeBundle('  item19  ');
      expect(actual).assertEqual('item19');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0021
     * @tc.name      CliInvocation_normalizeBundle_Edge_0021
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item20  ) returns item20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item20
      const actual: string = CliModel.normalizeBundle('  item20  ');
      expect(actual).assertEqual('item20');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0022
     * @tc.name      CliInvocation_normalizeBundle_Edge_0022
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item21  ) returns item21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item21
      const actual: string = CliModel.normalizeBundle('  item21  ');
      expect(actual).assertEqual('item21');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0023
     * @tc.name      CliInvocation_normalizeBundle_Edge_0023
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item22  ) returns item22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item22
      const actual: string = CliModel.normalizeBundle('  item22  ');
      expect(actual).assertEqual('item22');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0024
     * @tc.name      CliInvocation_normalizeBundle_Edge_0024
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item23  ) returns item23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item23
      const actual: string = CliModel.normalizeBundle('  item23  ');
      expect(actual).assertEqual('item23');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0025
     * @tc.name      CliInvocation_normalizeBundle_Edge_0025
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item24  ) returns item24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item24
      const actual: string = CliModel.normalizeBundle('  item24  ');
      expect(actual).assertEqual('item24');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0026
     * @tc.name      CliInvocation_normalizeBundle_Edge_0026
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item25  ) returns item25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item25
      const actual: string = CliModel.normalizeBundle('  item25  ');
      expect(actual).assertEqual('item25');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0027
     * @tc.name      CliInvocation_normalizeBundle_Edge_0027
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item26  ) returns item26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item26
      const actual: string = CliModel.normalizeBundle('  item26  ');
      expect(actual).assertEqual('item26');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0028
     * @tc.name      CliInvocation_normalizeBundle_Edge_0028
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item27  ) returns item27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item27
      const actual: string = CliModel.normalizeBundle('  item27  ');
      expect(actual).assertEqual('item27');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0029
     * @tc.name      CliInvocation_normalizeBundle_Edge_0029
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item28  ) returns item28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item28
      const actual: string = CliModel.normalizeBundle('  item28  ');
      expect(actual).assertEqual('item28');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0030
     * @tc.name      CliInvocation_normalizeBundle_Edge_0030
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item29  ) returns item29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_normalizeBundle_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: item29
      const actual: string = CliModel.normalizeBundle('  item29  ');
      expect(actual).assertEqual('item29');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0031
     * @tc.name      CliInvocation_normalizeBundle_Edge_0031
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item30  ) returns item30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item30
      const actual: string = CliModel.normalizeBundle('  item30  ');
      expect(actual).assertEqual('item30');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0032
     * @tc.name      CliInvocation_normalizeBundle_Edge_0032
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item31  ) returns item31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item31
      const actual: string = CliModel.normalizeBundle('  item31  ');
      expect(actual).assertEqual('item31');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0033
     * @tc.name      CliInvocation_normalizeBundle_Edge_0033
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item32  ) returns item32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item32
      const actual: string = CliModel.normalizeBundle('  item32  ');
      expect(actual).assertEqual('item32');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0034
     * @tc.name      CliInvocation_normalizeBundle_Edge_0034
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item33  ) returns item33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item33
      const actual: string = CliModel.normalizeBundle('  item33  ');
      expect(actual).assertEqual('item33');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0035
     * @tc.name      CliInvocation_normalizeBundle_Edge_0035
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item34  ) returns item34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item34
      const actual: string = CliModel.normalizeBundle('  item34  ');
      expect(actual).assertEqual('item34');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0036
     * @tc.name      CliInvocation_normalizeBundle_Edge_0036
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item35  ) returns item35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item35
      const actual: string = CliModel.normalizeBundle('  item35  ');
      expect(actual).assertEqual('item35');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0037
     * @tc.name      CliInvocation_normalizeBundle_Edge_0037
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item36  ) returns item36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item36
      const actual: string = CliModel.normalizeBundle('  item36  ');
      expect(actual).assertEqual('item36');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0038
     * @tc.name      CliInvocation_normalizeBundle_Edge_0038
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item37  ) returns item37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item37
      const actual: string = CliModel.normalizeBundle('  item37  ');
      expect(actual).assertEqual('item37');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0039
     * @tc.name      CliInvocation_normalizeBundle_Edge_0039
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item38  ) returns item38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item38
      const actual: string = CliModel.normalizeBundle('  item38  ');
      expect(actual).assertEqual('item38');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0040
     * @tc.name      CliInvocation_normalizeBundle_Edge_0040
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item39  ) returns item39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item39
      const actual: string = CliModel.normalizeBundle('  item39  ');
      expect(actual).assertEqual('item39');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0041
     * @tc.name      CliInvocation_normalizeBundle_Edge_0041
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item40  ) returns item40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item40
      const actual: string = CliModel.normalizeBundle('  item40  ');
      expect(actual).assertEqual('item40');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0042
     * @tc.name      CliInvocation_normalizeBundle_Edge_0042
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item41  ) returns item41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item41
      const actual: string = CliModel.normalizeBundle('  item41  ');
      expect(actual).assertEqual('item41');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0043
     * @tc.name      CliInvocation_normalizeBundle_Edge_0043
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item42  ) returns item42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item42
      const actual: string = CliModel.normalizeBundle('  item42  ');
      expect(actual).assertEqual('item42');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0044
     * @tc.name      CliInvocation_normalizeBundle_Edge_0044
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item43  ) returns item43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item43
      const actual: string = CliModel.normalizeBundle('  item43  ');
      expect(actual).assertEqual('item43');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0045
     * @tc.name      CliInvocation_normalizeBundle_Edge_0045
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item44  ) returns item44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item44
      const actual: string = CliModel.normalizeBundle('  item44  ');
      expect(actual).assertEqual('item44');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0046
     * @tc.name      CliInvocation_normalizeBundle_Edge_0046
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item45  ) returns item45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item45
      const actual: string = CliModel.normalizeBundle('  item45  ');
      expect(actual).assertEqual('item45');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0047
     * @tc.name      CliInvocation_normalizeBundle_Edge_0047
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item46  ) returns item46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item46
      const actual: string = CliModel.normalizeBundle('  item46  ');
      expect(actual).assertEqual('item46');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0048
     * @tc.name      CliInvocation_normalizeBundle_Edge_0048
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item47  ) returns item47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item47
      const actual: string = CliModel.normalizeBundle('  item47  ');
      expect(actual).assertEqual('item47');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0049
     * @tc.name      CliInvocation_normalizeBundle_Edge_0049
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item48  ) returns item48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item48
      const actual: string = CliModel.normalizeBundle('  item48  ');
      expect(actual).assertEqual('item48');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_NORMALIZE_BUNDLE_EDGE_0050
     * @tc.name      CliInvocation_normalizeBundle_Edge_0050
     * @tc.desc      [WhitespaceString] Verify normalizeBundle(  item49  ) returns item49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_normalizeBundle_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: item49
      const actual: string = CliModel.normalizeBundle('  item49  ');
      expect(actual).assertEqual('item49');
      expect(actual.length).assertEqual(6);
    });

  });
}
