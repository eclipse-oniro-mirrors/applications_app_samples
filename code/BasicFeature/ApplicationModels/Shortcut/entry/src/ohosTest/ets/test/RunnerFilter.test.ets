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

import { abilityDelegatorRegistry } from '@kit.TestKit';
import { describe } from '@ohos/hypium';
import { normalizeLegacyCaseSelector, normalizeLegacyFilters } from '../support/LegacyCaseFilter';
import { caseName, expect, it } from '../support/TestCase';

export default function runnerFilterTests(): void {
  describe('RunnerFilter', (): void => {
    /** @tc.number SUB_SHORTCUT_RUNNERFILTER_0100
     * @tc.name testRunnerFilter0001
     * @tc.desc Only the exact known legacy case leaf is replaced; its suite qualifier stays unchanged.
     */
    it(caseName('RunnerFilter', '0001'), 0, (): void => {
      expect(normalizeLegacyCaseSelector('ProductionAppNavigation#testProductionAppNavigation0001'), caseName('RunnerFilter', '0001'))
        .assertEqual('ProductionAppNavigation#com.samples.shortcut_ProductionAppNavigation_0001');
    });

    /** @tc.number SUB_SHORTCUT_RUNNERFILTER_0200
     * @tc.name testRunnerFilter0002
     * @tc.desc Comma lists, bare known leaves and surrounding spaces retain their selection boundaries.
     */
    it(caseName('RunnerFilter', '0002'), 0, (): void => {
      expect(normalizeLegacyCaseSelector('SearchIndexDeep#testSearchIndexDeep0004,BusinessStore#testBusinessStore0001'), caseName('RunnerFilter', '0002'))
        .assertEqual('SearchIndexDeep#com.samples.shortcut_SearchIndexDeep_0004,BusinessStore#com.samples.shortcut_BusinessStore_0001');
      expect(normalizeLegacyCaseSelector('testBusinessStore0001'), caseName('RunnerFilter', '0002')).assertEqual('com.samples.shortcut_BusinessStore_0001');
      expect(normalizeLegacyCaseSelector('  BusinessStore#testBusinessStore0001  '), caseName('RunnerFilter', '0002'))
        .assertEqual('  BusinessStore#com.samples.shortcut_BusinessStore_0001  ');
    });

    /** @tc.number SUB_SHORTCUT_RUNNERFILTER_0300
     * @tc.name testRunnerFilter0003
     * @tc.desc Unknown, similar, already-normalized and malformed selectors are not broadened or reinterpreted.
     */
    it(caseName('RunnerFilter', '0003'), 0, (): void => {
      expect(normalizeLegacyCaseSelector('BusinessStore#testBusinessStore9999'), caseName('RunnerFilter', '0003')).assertEqual('BusinessStore#testBusinessStore9999');
      expect(normalizeLegacyCaseSelector('BusinessStore'), caseName('RunnerFilter', '0003')).assertEqual('BusinessStore');
      expect(normalizeLegacyCaseSelector('BusinessStore#com.samples.shortcut_BusinessStore_0001'), caseName('RunnerFilter', '0003'))
        .assertEqual('BusinessStore#com.samples.shortcut_BusinessStore_0001');
      expect(normalizeLegacyCaseSelector('BusinessStore#testBusinessStore0001#extra,testBusinessStore0001_extra,testconstructor0001'), caseName('RunnerFilter', '0003'))
        .assertEqual('BusinessStore#testBusinessStore0001#extra,testBusinessStore0001_extra,testconstructor0001');
    });

    /** @tc.number SUB_SHORTCUT_RUNNERFILTER_0400
     * @tc.name testRunnerFilter0004
     * @tc.desc Only class and testCaseNames leaves change; timeout, flags, application and runner identity remain intact.
     */
    it(caseName('RunnerFilter', '0004'), 0, (): void => {
      const args: abilityDelegatorRegistry.AbilityDelegatorArgs = {
        bundleName: 'com.samples.shortcut',
        parameters: { 'class': 'BusinessStore#testBusinessStore0001', 'timeout': '65000', 'level': '2' },
        testCaseNames: 'testBusinessStore0001',
        testRunnerClassName: 'OpenHarmonyTestRunner'
      };
      normalizeLegacyFilters(args);
      expect(args.parameters['class'], caseName('RunnerFilter', '0004')).assertEqual('BusinessStore#com.samples.shortcut_BusinessStore_0001');
      expect(args.testCaseNames, caseName('RunnerFilter', '0004')).assertEqual('com.samples.shortcut_BusinessStore_0001');
      expect(args.parameters['timeout'], caseName('RunnerFilter', '0004')).assertEqual('65000');
      expect(args.parameters['level'], caseName('RunnerFilter', '0004')).assertEqual('2');
      expect(args.bundleName, caseName('RunnerFilter', '0004')).assertEqual('com.samples.shortcut');
      expect(args.testRunnerClassName, caseName('RunnerFilter', '0004')).assertEqual('OpenHarmonyTestRunner');
    });
  });
}
