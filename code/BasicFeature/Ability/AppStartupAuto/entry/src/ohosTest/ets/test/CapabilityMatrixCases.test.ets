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

import { describe, expect } from '@ohos/hypium';
import { traceParameter, loggedIt as it } from '../support/TestLog';
import { configureTestText } from '../support/TestTextResources';
import {
  CAPABILITY_RULES, CapabilityQuery, CapabilityVerdict, DeviceForm, SystemFlavor, canSetInApp,
  evaluateCapability, isDefinitelyUnsupported, needsSettingsGuidance, ruleSummaries, verdictSeries
} from '../../../main/ets/autostart/rules/CapabilityMatrix';

function queryOf(api: number, form: DeviceForm, flavor: SystemFlavor, granted: boolean = true,
  entry: boolean = true): CapabilityQuery {
  return new CapabilityQuery(api, form, flavor, granted, entry);
}

export default function capabilityMatrixCasesTest(): void {
  configureTestText();
  describe('CapabilityMatrixApiBoundaryCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_0100
     * @tc.name      testCapabilityMatrixApiBoundaryCases0001
     * @tc.desc      Verify api8 phone open harmony needs system update
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0001', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(8, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0001|CapabilityMatrixCases.test.ets|assert0001|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0001|CapabilityMatrixCases.test.ets|assert0001|assertEqual|expected', CapabilityVerdict.NEED_SYSTEM_UPDATE));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0001|CapabilityMatrixCases.test.ets|assert0002|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0001|CapabilityMatrixCases.test.ets|assert0002|assertEqual|expected', 'CM-0001'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0001|CapabilityMatrixCases.test.ets|assert0003|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0001|CapabilityMatrixCases.test.ets|assert0004|assertTrue|actual|expected=true', needsSettingsGuidance(evaluation))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0001|CapabilityMatrixCases.test.ets|assert0005|assertTrue|actual|expected=true', isDefinitelyUnsupported(evaluation.verdict))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0001|CapabilityMatrixCases.test.ets|assert0006|assertFalse|actual|expected=false', evaluation.downgradedByEntry)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0001|CapabilityMatrixCases.test.ets|assert0007|assertFalse|actual|expected=false', evaluation.downgradedByPermission)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0001|CapabilityMatrixCases.test.ets|assert0008|assertTrue|actual|expected=true', evaluation.summary().indexOf('CM-0001') > 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0001|CapabilityMatrixCases.test.ets|assert0009|assertTrue|actual|expected=true', evaluation.developerHint().length > 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0001|CapabilityMatrixCases.test.ets|assert0010|assertTrue|actual|expected=true', evaluation.userHint().length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_0200
     * @tc.name      testCapabilityMatrixApiBoundaryCases0002
     * @tc.desc      Verify api0 wearable still hits version rule first
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0002', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(0, DeviceForm.WEARABLE, SystemFlavor.COMMERCIAL));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0002|CapabilityMatrixCases.test.ets|assert0011|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0002|CapabilityMatrixCases.test.ets|assert0011|assertEqual|expected', CapabilityVerdict.NEED_SYSTEM_UPDATE));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0002|CapabilityMatrixCases.test.ets|assert0012|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0002|CapabilityMatrixCases.test.ets|assert0012|assertEqual|expected', 'CM-0001'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0002|CapabilityMatrixCases.test.ets|assert0013|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0002|CapabilityMatrixCases.test.ets|assert0014|assertTrue|actual|expected=true', isDefinitelyUnsupported(evaluation.verdict))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0002|CapabilityMatrixCases.test.ets|assert0015|assertTrue|actual|expected=true', needsSettingsGuidance(evaluation))).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_0300
     * @tc.name      testCapabilityMatrixApiBoundaryCases0003
     * @tc.desc      Verify api8 tv and tablet share the version rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0003', 0, (): void => {
      configureTestText();
      const tv = evaluateCapability(queryOf(8, DeviceForm.TV, SystemFlavor.COMMERCIAL));
      const tablet = evaluateCapability(queryOf(8, DeviceForm.TABLET, SystemFlavor.UNKNOWN));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0003|CapabilityMatrixCases.test.ets|assert0016|assertEqual|actual', tv.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0003|CapabilityMatrixCases.test.ets|assert0016|assertEqual|expected', 'CM-0001'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0003|CapabilityMatrixCases.test.ets|assert0017|assertEqual|actual', tablet.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0003|CapabilityMatrixCases.test.ets|assert0017|assertEqual|expected', 'CM-0001'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0003|CapabilityMatrixCases.test.ets|assert0018|assertEqual|actual', tv.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0003|CapabilityMatrixCases.test.ets|assert0018|assertEqual|expected', CapabilityVerdict.NEED_SYSTEM_UPDATE));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0003|CapabilityMatrixCases.test.ets|assert0019|assertEqual|actual', tablet.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0003|CapabilityMatrixCases.test.ets|assert0019|assertEqual|expected', CapabilityVerdict.NEED_SYSTEM_UPDATE));
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_0400
     * @tc.name      testCapabilityMatrixApiBoundaryCases0004
     * @tc.desc      Verify api9 wearable is excluded not failed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0004', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(9, DeviceForm.WEARABLE, SystemFlavor.OPEN_HARMONY));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0004|CapabilityMatrixCases.test.ets|assert0020|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0004|CapabilityMatrixCases.test.ets|assert0020|assertEqual|expected', CapabilityVerdict.DEVICE_EXCLUDED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0004|CapabilityMatrixCases.test.ets|assert0021|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0004|CapabilityMatrixCases.test.ets|assert0021|assertEqual|expected', 'CM-0002'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0004|CapabilityMatrixCases.test.ets|assert0022|assertTrue|actual|expected=true', isDefinitelyUnsupported(evaluation.verdict))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0004|CapabilityMatrixCases.test.ets|assert0023|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0004|CapabilityMatrixCases.test.ets|assert0024|assertTrue|actual|expected=true', needsSettingsGuidance(evaluation))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0004|CapabilityMatrixCases.test.ets|assert0025|assertTrue|actual|expected=true', evaluation.summary().indexOf('deviceExcluded') === 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_0500
     * @tc.name      testCapabilityMatrixApiBoundaryCases0005
     * @tc.desc      Verify api11 wearable still excluded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0005', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(11, DeviceForm.WEARABLE,
        SystemFlavor.COMMERCIAL, false, false));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0005|CapabilityMatrixCases.test.ets|assert0026|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0005|CapabilityMatrixCases.test.ets|assert0026|assertEqual|expected', CapabilityVerdict.DEVICE_EXCLUDED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0005|CapabilityMatrixCases.test.ets|assert0027|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0005|CapabilityMatrixCases.test.ets|assert0027|assertEqual|expected', 'CM-0002'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0005|CapabilityMatrixCases.test.ets|assert0028|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0005|CapabilityMatrixCases.test.ets|assert0029|assertFalse|actual|expected=false', evaluation.downgradedByPermission)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_0600
     * @tc.name      testCapabilityMatrixApiBoundaryCases0006
     * @tc.desc      Verify api9 tv is excluded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0006', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(9, DeviceForm.TV, SystemFlavor.OPEN_HARMONY));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0006|CapabilityMatrixCases.test.ets|assert0030|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0006|CapabilityMatrixCases.test.ets|assert0030|assertEqual|expected', CapabilityVerdict.DEVICE_EXCLUDED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0006|CapabilityMatrixCases.test.ets|assert0031|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0006|CapabilityMatrixCases.test.ets|assert0031|assertEqual|expected', 'CM-0003'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0006|CapabilityMatrixCases.test.ets|assert0032|assertTrue|actual|expected=true', isDefinitelyUnsupported(evaluation.verdict))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0006|CapabilityMatrixCases.test.ets|assert0033|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_0700
     * @tc.name      testCapabilityMatrixApiBoundaryCases0007
     * @tc.desc      Verify api11 tv is still excluded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0007', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(11, DeviceForm.TV, SystemFlavor.COMMERCIAL));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0007|CapabilityMatrixCases.test.ets|assert0034|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0007|CapabilityMatrixCases.test.ets|assert0034|assertEqual|expected', CapabilityVerdict.DEVICE_EXCLUDED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0007|CapabilityMatrixCases.test.ets|assert0035|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0007|CapabilityMatrixCases.test.ets|assert0035|assertEqual|expected', 'CM-0003'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0007|CapabilityMatrixCases.test.ets|assert0036|assertTrue|actual|expected=true', needsSettingsGuidance(evaluation))).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_0800
     * @tc.name      testCapabilityMatrixApiBoundaryCases0008
     * @tc.desc      Verify api9 phone open harmony with entry supports
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0008', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(9, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY,
        false, true));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0008|CapabilityMatrixCases.test.ets|assert0037|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0008|CapabilityMatrixCases.test.ets|assert0037|assertEqual|expected', CapabilityVerdict.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0008|CapabilityMatrixCases.test.ets|assert0038|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0008|CapabilityMatrixCases.test.ets|assert0038|assertEqual|expected', 'CM-0004'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0008|CapabilityMatrixCases.test.ets|assert0039|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0008|CapabilityMatrixCases.test.ets|assert0040|assertTrue|actual|expected=true', needsSettingsGuidance(evaluation))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0008|CapabilityMatrixCases.test.ets|assert0041|assertFalse|actual|expected=false', evaluation.downgradedByEntry)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0008|CapabilityMatrixCases.test.ets|assert0042|assertFalse|actual|expected=false', isDefinitelyUnsupported(evaluation.verdict))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_0900
     * @tc.name      testCapabilityMatrixApiBoundaryCases0009
     * @tc.desc      Verify api9 phone open harmony without entry downgrades
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0009', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(9, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY,
        true, false));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0009|CapabilityMatrixCases.test.ets|assert0043|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0009|CapabilityMatrixCases.test.ets|assert0043|assertEqual|expected', CapabilityVerdict.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0009|CapabilityMatrixCases.test.ets|assert0044|assertTrue|actual|expected=true', evaluation.downgradedByEntry)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0009|CapabilityMatrixCases.test.ets|assert0045|assertTrue|actual|expected=true', needsSettingsGuidance(evaluation))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0009|CapabilityMatrixCases.test.ets|assert0046|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0009|CapabilityMatrixCases.test.ets|assert0047|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0009|CapabilityMatrixCases.test.ets|assert0047|assertEqual|expected', 'CM-0004'));
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_1000
     * @tc.name      testCapabilityMatrixApiBoundaryCases0010
     * @tc.desc      Verify api11 tablet open harmony supports
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0010', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(11, DeviceForm.TABLET,
        SystemFlavor.OPEN_HARMONY, false, true));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0010|CapabilityMatrixCases.test.ets|assert0048|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0010|CapabilityMatrixCases.test.ets|assert0048|assertEqual|expected', CapabilityVerdict.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0010|CapabilityMatrixCases.test.ets|assert0049|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0010|CapabilityMatrixCases.test.ets|assert0049|assertEqual|expected', 'CM-0004'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0010|CapabilityMatrixCases.test.ets|assert0050|assertFalse|actual|expected=false', evaluation.downgradedByEntry)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0010|CapabilityMatrixCases.test.ets|assert0051|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_1100
     * @tc.name      testCapabilityMatrixApiBoundaryCases0011
     * @tc.desc      Verify api9 phone commercial distribution without permission needs permission
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0011', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(9, DeviceForm.PHONE, SystemFlavor.COMMERCIAL,
        false, true));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0011|CapabilityMatrixCases.test.ets|assert0052|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0011|CapabilityMatrixCases.test.ets|assert0052|assertEqual|expected', CapabilityVerdict.NEED_PERMISSION));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0011|CapabilityMatrixCases.test.ets|assert0053|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0011|CapabilityMatrixCases.test.ets|assert0053|assertEqual|expected', 'CM-0005'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0011|CapabilityMatrixCases.test.ets|assert0054|assertTrue|actual|expected=true', evaluation.downgradedByPermission)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0011|CapabilityMatrixCases.test.ets|assert0055|assertTrue|actual|expected=true', needsSettingsGuidance(evaluation))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0011|CapabilityMatrixCases.test.ets|assert0056|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0011|CapabilityMatrixCases.test.ets|assert0057|assertFalse|actual|expected=false', isDefinitelyUnsupported(evaluation.verdict))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_1200
     * @tc.name      testCapabilityMatrixApiBoundaryCases0012
     * @tc.desc      Verify api9 phone commercial distribution with permission keeps verdict
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0012', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(9, DeviceForm.PHONE, SystemFlavor.COMMERCIAL,
        true, true));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0012|CapabilityMatrixCases.test.ets|assert0058|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0012|CapabilityMatrixCases.test.ets|assert0058|assertEqual|expected', CapabilityVerdict.NEED_PERMISSION));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0012|CapabilityMatrixCases.test.ets|assert0059|assertFalse|actual|expected=false', evaluation.downgradedByPermission)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0012|CapabilityMatrixCases.test.ets|assert0060|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0012|CapabilityMatrixCases.test.ets|assert0060|assertEqual|expected', 'CM-0005'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0012|CapabilityMatrixCases.test.ets|assert0061|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0012|CapabilityMatrixCases.test.ets|assert0062|assertTrue|actual|expected=true', needsSettingsGuidance(evaluation))).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_1300
     * @tc.name      testCapabilityMatrixApiBoundaryCases0013
     * @tc.desc      Verify api10 phone unknown flavor is unknown
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0013', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(10, DeviceForm.PHONE, SystemFlavor.UNKNOWN));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0013|CapabilityMatrixCases.test.ets|assert0063|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0013|CapabilityMatrixCases.test.ets|assert0063|assertEqual|expected', CapabilityVerdict.UNKNOWN));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0013|CapabilityMatrixCases.test.ets|assert0064|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0013|CapabilityMatrixCases.test.ets|assert0064|assertEqual|expected', 'CM-0016'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0013|CapabilityMatrixCases.test.ets|assert0065|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0013|CapabilityMatrixCases.test.ets|assert0066|assertFalse|actual|expected=false', isDefinitelyUnsupported(evaluation.verdict))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0013|CapabilityMatrixCases.test.ets|assert0067|assertTrue|actual|expected=true', needsSettingsGuidance(evaluation))).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_1400
     * @tc.name      testCapabilityMatrixApiBoundaryCases0014
     * @tc.desc      Verify api12 wearable excluded again
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0014', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(12, DeviceForm.WEARABLE,
        SystemFlavor.OPEN_HARMONY));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0014|CapabilityMatrixCases.test.ets|assert0068|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0014|CapabilityMatrixCases.test.ets|assert0068|assertEqual|expected', CapabilityVerdict.DEVICE_EXCLUDED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0014|CapabilityMatrixCases.test.ets|assert0069|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0014|CapabilityMatrixCases.test.ets|assert0069|assertEqual|expected', 'CM-0006'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0014|CapabilityMatrixCases.test.ets|assert0070|assertTrue|actual|expected=true', isDefinitelyUnsupported(evaluation.verdict))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0014|CapabilityMatrixCases.test.ets|assert0071|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_1500
     * @tc.name      testCapabilityMatrixApiBoundaryCases0015
     * @tc.desc      Verify api13 wearable still excluded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0015', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(13, DeviceForm.WEARABLE,
        SystemFlavor.COMMERCIAL, true, true));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0015|CapabilityMatrixCases.test.ets|assert0072|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0015|CapabilityMatrixCases.test.ets|assert0072|assertEqual|expected', CapabilityVerdict.DEVICE_EXCLUDED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0015|CapabilityMatrixCases.test.ets|assert0073|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0015|CapabilityMatrixCases.test.ets|assert0073|assertEqual|expected', 'CM-0006'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0015|CapabilityMatrixCases.test.ets|assert0074|assertFalse|actual|expected=false', needsSettingsGuidance(evaluation))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_1600
     * @tc.name      testCapabilityMatrixApiBoundaryCases0016
     * @tc.desc      Verify api12 tv open harmony supports and sets
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0016', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(12, DeviceForm.TV, SystemFlavor.OPEN_HARMONY));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0016|CapabilityMatrixCases.test.ets|assert0075|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0016|CapabilityMatrixCases.test.ets|assert0075|assertEqual|expected', CapabilityVerdict.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0016|CapabilityMatrixCases.test.ets|assert0076|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0016|CapabilityMatrixCases.test.ets|assert0076|assertEqual|expected', 'CM-0007'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0016|CapabilityMatrixCases.test.ets|assert0077|assertTrue|actual|expected=true', canSetInApp(evaluation))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0016|CapabilityMatrixCases.test.ets|assert0078|assertFalse|actual|expected=false', needsSettingsGuidance(evaluation))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0016|CapabilityMatrixCases.test.ets|assert0079|assertFalse|actual|expected=false', evaluation.downgradedByPermission)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0016|CapabilityMatrixCases.test.ets|assert0080|assertFalse|actual|expected=false', evaluation.downgradedByEntry)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_1700
     * @tc.name      testCapabilityMatrixApiBoundaryCases0017
     * @tc.desc      Verify api12 tv commercial distribution without permission needs permission
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0017', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(12, DeviceForm.TV, SystemFlavor.COMMERCIAL,
        false, true));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0017|CapabilityMatrixCases.test.ets|assert0081|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0017|CapabilityMatrixCases.test.ets|assert0081|assertEqual|expected', CapabilityVerdict.NEED_PERMISSION));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0017|CapabilityMatrixCases.test.ets|assert0082|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0017|CapabilityMatrixCases.test.ets|assert0082|assertEqual|expected', 'CM-0008'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0017|CapabilityMatrixCases.test.ets|assert0083|assertTrue|actual|expected=true', evaluation.downgradedByPermission)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0017|CapabilityMatrixCases.test.ets|assert0084|assertTrue|actual|expected=true', needsSettingsGuidance(evaluation))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0017|CapabilityMatrixCases.test.ets|assert0085|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_1800
     * @tc.name      testCapabilityMatrixApiBoundaryCases0018
     * @tc.desc      Verify api13 phone open harmony supports and sets
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0018', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(13, DeviceForm.PHONE,
        SystemFlavor.OPEN_HARMONY));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0018|CapabilityMatrixCases.test.ets|assert0086|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0018|CapabilityMatrixCases.test.ets|assert0086|assertEqual|expected', CapabilityVerdict.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0018|CapabilityMatrixCases.test.ets|assert0087|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0018|CapabilityMatrixCases.test.ets|assert0087|assertEqual|expected', 'CM-0009'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0018|CapabilityMatrixCases.test.ets|assert0088|assertTrue|actual|expected=true', canSetInApp(evaluation))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0018|CapabilityMatrixCases.test.ets|assert0089|assertFalse|actual|expected=false', needsSettingsGuidance(evaluation))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_1900
     * @tc.name      testCapabilityMatrixApiBoundaryCases0019
     * @tc.desc      Verify api12 tablet commercial distribution with permission needs permission
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0019', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(12, DeviceForm.TABLET, SystemFlavor.COMMERCIAL,
        true, true));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0019|CapabilityMatrixCases.test.ets|assert0090|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0019|CapabilityMatrixCases.test.ets|assert0090|assertEqual|expected', CapabilityVerdict.NEED_PERMISSION));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0019|CapabilityMatrixCases.test.ets|assert0091|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0019|CapabilityMatrixCases.test.ets|assert0091|assertEqual|expected', 'CM-0010'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0019|CapabilityMatrixCases.test.ets|assert0092|assertFalse|actual|expected=false', evaluation.downgradedByPermission)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0019|CapabilityMatrixCases.test.ets|assert0093|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0019|CapabilityMatrixCases.test.ets|assert0094|assertTrue|actual|expected=true', needsSettingsGuidance(evaluation))).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_2000
     * @tc.name      testCapabilityMatrixApiBoundaryCases0020
     * @tc.desc      Verify api14 wearable excluded until api18
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0020', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(14, DeviceForm.WEARABLE,
        SystemFlavor.OPEN_HARMONY));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0020|CapabilityMatrixCases.test.ets|assert0095|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0020|CapabilityMatrixCases.test.ets|assert0095|assertEqual|expected', CapabilityVerdict.DEVICE_EXCLUDED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0020|CapabilityMatrixCases.test.ets|assert0096|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0020|CapabilityMatrixCases.test.ets|assert0096|assertEqual|expected', 'CM-0011'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0020|CapabilityMatrixCases.test.ets|assert0097|assertTrue|actual|expected=true', isDefinitelyUnsupported(evaluation.verdict))).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_2100
     * @tc.name      testCapabilityMatrixApiBoundaryCases0021
     * @tc.desc      Verify api17 wearable still excluded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0021', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(17, DeviceForm.WEARABLE,
        SystemFlavor.COMMERCIAL, false, false));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0021|CapabilityMatrixCases.test.ets|assert0098|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0021|CapabilityMatrixCases.test.ets|assert0098|assertEqual|expected', CapabilityVerdict.DEVICE_EXCLUDED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0021|CapabilityMatrixCases.test.ets|assert0099|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0021|CapabilityMatrixCases.test.ets|assert0099|assertEqual|expected', 'CM-0011'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0021|CapabilityMatrixCases.test.ets|assert0100|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0021|CapabilityMatrixCases.test.ets|assert0101|assertFalse|actual|expected=false', needsSettingsGuidance(evaluation))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_2200
     * @tc.name      testCapabilityMatrixApiBoundaryCases0022
     * @tc.desc      Verify api14 tv supports for both flavors
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0022', 0, (): void => {
      configureTestText();
      const openHarmony = evaluateCapability(queryOf(14, DeviceForm.TV,
        SystemFlavor.OPEN_HARMONY));
      const commercial = evaluateCapability(queryOf(14, DeviceForm.TV, SystemFlavor.COMMERCIAL));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0022|CapabilityMatrixCases.test.ets|assert0102|assertEqual|actual', openHarmony.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0022|CapabilityMatrixCases.test.ets|assert0102|assertEqual|expected', CapabilityVerdict.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0022|CapabilityMatrixCases.test.ets|assert0103|assertEqual|actual', commercial.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0022|CapabilityMatrixCases.test.ets|assert0103|assertEqual|expected', CapabilityVerdict.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0022|CapabilityMatrixCases.test.ets|assert0104|assertEqual|actual', openHarmony.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0022|CapabilityMatrixCases.test.ets|assert0104|assertEqual|expected', 'CM-0012'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0022|CapabilityMatrixCases.test.ets|assert0105|assertEqual|actual', commercial.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0022|CapabilityMatrixCases.test.ets|assert0105|assertEqual|expected', 'CM-0012'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0022|CapabilityMatrixCases.test.ets|assert0106|assertTrue|actual|expected=true', canSetInApp(openHarmony))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0022|CapabilityMatrixCases.test.ets|assert0107|assertTrue|actual|expected=true', canSetInApp(commercial))).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_2300
     * @tc.name      testCapabilityMatrixApiBoundaryCases0023
     * @tc.desc      Verify api15 phone supports regardless of flavor
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0023', 0, (): void => {
      configureTestText();
      const openHarmony = evaluateCapability(queryOf(15, DeviceForm.PHONE,
        SystemFlavor.OPEN_HARMONY));
      const commercial = evaluateCapability(queryOf(15, DeviceForm.PHONE, SystemFlavor.COMMERCIAL));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0023|CapabilityMatrixCases.test.ets|assert0108|assertEqual|actual', openHarmony.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0023|CapabilityMatrixCases.test.ets|assert0108|assertEqual|expected', 'CM-0013'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0023|CapabilityMatrixCases.test.ets|assert0109|assertEqual|actual', commercial.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0023|CapabilityMatrixCases.test.ets|assert0109|assertEqual|expected', 'CM-0013'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0023|CapabilityMatrixCases.test.ets|assert0110|assertEqual|actual', openHarmony.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0023|CapabilityMatrixCases.test.ets|assert0110|assertEqual|expected', CapabilityVerdict.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0023|CapabilityMatrixCases.test.ets|assert0111|assertEqual|actual', commercial.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0023|CapabilityMatrixCases.test.ets|assert0111|assertEqual|expected', CapabilityVerdict.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0023|CapabilityMatrixCases.test.ets|assert0112|assertFalse|actual|expected=false', openHarmony.downgradedByEntry)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_2400
     * @tc.name      testCapabilityMatrixApiBoundaryCases0024
     * @tc.desc      Verify api17 tablet supports
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0024', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(17, DeviceForm.TABLET,
        SystemFlavor.COMMERCIAL, false, false));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0024|CapabilityMatrixCases.test.ets|assert0113|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0024|CapabilityMatrixCases.test.ets|assert0113|assertEqual|expected', CapabilityVerdict.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0024|CapabilityMatrixCases.test.ets|assert0114|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0024|CapabilityMatrixCases.test.ets|assert0114|assertEqual|expected', 'CM-0013'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0024|CapabilityMatrixCases.test.ets|assert0115|assertTrue|actual|expected=true', canSetInApp(evaluation))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0024|CapabilityMatrixCases.test.ets|assert0116|assertFalse|actual|expected=false', evaluation.downgradedByEntry)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0024|CapabilityMatrixCases.test.ets|assert0117|assertFalse|actual|expected=false', isDefinitelyUnsupported(evaluation.verdict))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_2500
     * @tc.name      testCapabilityMatrixApiBoundaryCases0025
     * @tc.desc      Verify api18 opens every known form
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0025', 0, (): void => {
      configureTestText();
      const forms: DeviceForm[] = [DeviceForm.PHONE, DeviceForm.TABLET, DeviceForm.TV,
        DeviceForm.WEARABLE];
      forms.forEach((form: DeviceForm): void => {
        const evaluation = evaluateCapability(queryOf(18, form, SystemFlavor.OPEN_HARMONY));
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0025|CapabilityMatrixCases.test.ets|assert0118|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0025|CapabilityMatrixCases.test.ets|assert0118|assertEqual|expected', CapabilityVerdict.SUPPORTED));
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0025|CapabilityMatrixCases.test.ets|assert0119|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0025|CapabilityMatrixCases.test.ets|assert0119|assertEqual|expected', 'CM-0014'));
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0025|CapabilityMatrixCases.test.ets|assert0120|assertTrue|actual|expected=true', canSetInApp(evaluation))).assertTrue();
      });
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0025|CapabilityMatrixCases.test.ets|assert0121|assertEqual|actual', forms.length)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0025|CapabilityMatrixCases.test.ets|assert0121|assertEqual|expected', 4));
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_2600
     * @tc.name      testCapabilityMatrixApiBoundaryCases0026
     * @tc.desc      Verify api26 wearable supports
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0026', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(26, DeviceForm.WEARABLE,
        SystemFlavor.COMMERCIAL, false, false));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0026|CapabilityMatrixCases.test.ets|assert0122|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0026|CapabilityMatrixCases.test.ets|assert0122|assertEqual|expected', CapabilityVerdict.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0026|CapabilityMatrixCases.test.ets|assert0123|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0026|CapabilityMatrixCases.test.ets|assert0123|assertEqual|expected', 'CM-0014'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0026|CapabilityMatrixCases.test.ets|assert0124|assertTrue|actual|expected=true', canSetInApp(evaluation))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0026|CapabilityMatrixCases.test.ets|assert0125|assertFalse|actual|expected=false', needsSettingsGuidance(evaluation))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_2700
     * @tc.name      testCapabilityMatrixApiBoundaryCases0027
     * @tc.desc      Verify api27 becomes unknown not supported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0027', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(27, DeviceForm.PHONE,
        SystemFlavor.OPEN_HARMONY));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0027|CapabilityMatrixCases.test.ets|assert0126|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0027|CapabilityMatrixCases.test.ets|assert0126|assertEqual|expected', CapabilityVerdict.UNKNOWN));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0027|CapabilityMatrixCases.test.ets|assert0127|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0027|CapabilityMatrixCases.test.ets|assert0127|assertEqual|expected', 'CM-0015'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0027|CapabilityMatrixCases.test.ets|assert0128|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0027|CapabilityMatrixCases.test.ets|assert0129|assertFalse|actual|expected=false', isDefinitelyUnsupported(evaluation.verdict))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0027|CapabilityMatrixCases.test.ets|assert0130|assertFalse|actual|expected=false', needsSettingsGuidance(evaluation))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0027|CapabilityMatrixCases.test.ets|assert0131|assertTrue|actual|expected=true', evaluation.summary().indexOf('CM-0015') > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_2800
     * @tc.name      testCapabilityMatrixApiBoundaryCases0028
     * @tc.desc      Verify api30 tablet stays unknown
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0028', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(30, DeviceForm.TABLET,
        SystemFlavor.COMMERCIAL));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0028|CapabilityMatrixCases.test.ets|assert0132|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0028|CapabilityMatrixCases.test.ets|assert0132|assertEqual|expected', CapabilityVerdict.UNKNOWN));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0028|CapabilityMatrixCases.test.ets|assert0133|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0028|CapabilityMatrixCases.test.ets|assert0133|assertEqual|expected', 'CM-0015'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0028|CapabilityMatrixCases.test.ets|assert0134|assertTrue|actual|expected=true', evaluation.developerHint().indexOf('API 26') > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_2900
     * @tc.name      testCapabilityMatrixApiBoundaryCases0029
     * @tc.desc      Verify api13 phone unknown flavor is unknown
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0029', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(13, DeviceForm.PHONE, SystemFlavor.UNKNOWN));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0029|CapabilityMatrixCases.test.ets|assert0135|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0029|CapabilityMatrixCases.test.ets|assert0135|assertEqual|expected', CapabilityVerdict.UNKNOWN));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0029|CapabilityMatrixCases.test.ets|assert0136|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0029|CapabilityMatrixCases.test.ets|assert0136|assertEqual|expected', 'CM-0017'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0029|CapabilityMatrixCases.test.ets|assert0137|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0029|CapabilityMatrixCases.test.ets|assert0138|assertFalse|actual|expected=false', isDefinitelyUnsupported(evaluation.verdict))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_3000
     * @tc.name      testCapabilityMatrixApiBoundaryCases0030
     * @tc.desc      Verify api12 tv unknown flavor is unknown
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0030', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(12, DeviceForm.TV, SystemFlavor.UNKNOWN));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0030|CapabilityMatrixCases.test.ets|assert0139|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0030|CapabilityMatrixCases.test.ets|assert0139|assertEqual|expected', CapabilityVerdict.UNKNOWN));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0030|CapabilityMatrixCases.test.ets|assert0140|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0030|CapabilityMatrixCases.test.ets|assert0140|assertEqual|expected', 'CM-0017'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0030|CapabilityMatrixCases.test.ets|assert0141|assertTrue|actual|expected=true', evaluation.userHint().length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_3100
     * @tc.name      testCapabilityMatrixApiBoundaryCases0031
     * @tc.desc      Verify api10 unknown form falls back to form rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0031', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(10, DeviceForm.UNKNOWN,
        SystemFlavor.OPEN_HARMONY));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0031|CapabilityMatrixCases.test.ets|assert0142|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0031|CapabilityMatrixCases.test.ets|assert0142|assertEqual|expected', CapabilityVerdict.UNKNOWN));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0031|CapabilityMatrixCases.test.ets|assert0143|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0031|CapabilityMatrixCases.test.ets|assert0143|assertEqual|expected', 'CM-0018'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0031|CapabilityMatrixCases.test.ets|assert0144|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0031|CapabilityMatrixCases.test.ets|assert0145|assertFalse|actual|expected=false', isDefinitelyUnsupported(evaluation.verdict))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0031|CapabilityMatrixCases.test.ets|assert0146|assertTrue|actual|expected=true', needsSettingsGuidance(evaluation))).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_3200
     * @tc.name      testCapabilityMatrixApiBoundaryCases0032
     * @tc.desc      Verify api20 unknown form is covered by general rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0032', 0, (): void => {
      configureTestText();
      const evaluation = evaluateCapability(queryOf(20, DeviceForm.UNKNOWN,
        SystemFlavor.OPEN_HARMONY));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0032|CapabilityMatrixCases.test.ets|assert0147|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0032|CapabilityMatrixCases.test.ets|assert0147|assertEqual|expected', CapabilityVerdict.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0032|CapabilityMatrixCases.test.ets|assert0148|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0032|CapabilityMatrixCases.test.ets|assert0148|assertEqual|expected', 'CM-0014'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0032|CapabilityMatrixCases.test.ets|assert0149|assertTrue|actual|expected=true', canSetInApp(evaluation))).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_3300
     * @tc.name      testCapabilityMatrixApiBoundaryCases0033
     * @tc.desc      Verify every rule is reachable with its own query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0033', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0033|CapabilityMatrixCases.test.ets|assert0150|assertEqual|actual', CAPABILITY_RULES.length)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0033|CapabilityMatrixCases.test.ets|assert0150|assertEqual|expected', 18));
      const probes: CapabilityQuery[] = [
        queryOf(5, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY),
        queryOf(10, DeviceForm.WEARABLE, SystemFlavor.OPEN_HARMONY),
        queryOf(10, DeviceForm.TV, SystemFlavor.OPEN_HARMONY),
        queryOf(10, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY),
        queryOf(10, DeviceForm.PHONE, SystemFlavor.COMMERCIAL),
        queryOf(12, DeviceForm.WEARABLE, SystemFlavor.OPEN_HARMONY),
        queryOf(12, DeviceForm.TV, SystemFlavor.OPEN_HARMONY),
        queryOf(12, DeviceForm.TV, SystemFlavor.COMMERCIAL),
        queryOf(12, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY),
        queryOf(12, DeviceForm.PHONE, SystemFlavor.COMMERCIAL),
        queryOf(15, DeviceForm.WEARABLE, SystemFlavor.OPEN_HARMONY),
        queryOf(15, DeviceForm.TV, SystemFlavor.OPEN_HARMONY),
        queryOf(15, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY),
        queryOf(20, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY),
        queryOf(28, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY),
        queryOf(10, DeviceForm.TABLET, SystemFlavor.UNKNOWN),
        queryOf(12, DeviceForm.TABLET, SystemFlavor.UNKNOWN),
        queryOf(10, DeviceForm.UNKNOWN, SystemFlavor.OPEN_HARMONY)
      ];
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0033|CapabilityMatrixCases.test.ets|assert0151|assertEqual|actual', probes.length)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0033|CapabilityMatrixCases.test.ets|assert0151|assertEqual|expected', CAPABILITY_RULES.length));
      probes.forEach((probe: CapabilityQuery, index: number): void => {
        const evaluation = evaluateCapability(probe);
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0033|CapabilityMatrixCases.test.ets|assert0152|assertEqual|actual', evaluation.rule?.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0033|CapabilityMatrixCases.test.ets|assert0152|assertEqual|expected', CAPABILITY_RULES[index].ruleId));
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0033|CapabilityMatrixCases.test.ets|assert0153|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0033|CapabilityMatrixCases.test.ets|assert0153|assertEqual|expected', CAPABILITY_RULES[index].verdict));
      });
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_3400
     * @tc.name      testCapabilityMatrixApiBoundaryCases0034
     * @tc.desc      Verify series and summaries cover full range
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0034', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0034|CapabilityMatrixCases.test.ets|assert0154|assertEqual|actual', ruleSummaries().length)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0034|CapabilityMatrixCases.test.ets|assert0154|assertEqual|expected', 18));
      const series = verdictSeries(DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY, true, true);
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0034|CapabilityMatrixCases.test.ets|assert0155|assertEqual|actual', series.length)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0034|CapabilityMatrixCases.test.ets|assert0155|assertEqual|expected', 21));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0034|CapabilityMatrixCases.test.ets|assert0156|assertEqual|actual', series[0])).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0034|CapabilityMatrixCases.test.ets|assert0156|assertEqual|expected', CapabilityVerdict.NEED_SYSTEM_UPDATE));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0034|CapabilityMatrixCases.test.ets|assert0157|assertEqual|actual', series[1])).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0034|CapabilityMatrixCases.test.ets|assert0157|assertEqual|expected', CapabilityVerdict.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0034|CapabilityMatrixCases.test.ets|assert0158|assertEqual|actual', series[series.length - 1])).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0034|CapabilityMatrixCases.test.ets|assert0158|assertEqual|expected', CapabilityVerdict.UNKNOWN));
      const wearable = verdictSeries(DeviceForm.WEARABLE, SystemFlavor.OPEN_HARMONY, true, true);
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0034|CapabilityMatrixCases.test.ets|assert0159|assertEqual|actual', wearable.length)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0034|CapabilityMatrixCases.test.ets|assert0159|assertEqual|expected', 21));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0034|CapabilityMatrixCases.test.ets|assert0160|assertEqual|actual', wearable[1])).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0034|CapabilityMatrixCases.test.ets|assert0160|assertEqual|expected', CapabilityVerdict.DEVICE_EXCLUDED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0034|CapabilityMatrixCases.test.ets|assert0161|assertEqual|actual', wearable[10])).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0034|CapabilityMatrixCases.test.ets|assert0161|assertEqual|expected', CapabilityVerdict.SUPPORTED));
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_3500
     * @tc.name      testCapabilityMatrixApiBoundaryCases0035
     * @tc.desc      Verify query key changes with every field
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0035', 0, (): void => {
      configureTestText();
      const base: CapabilityQuery = queryOf(18, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY,
        true, true);
      const clone: CapabilityQuery = base.clone();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0035|CapabilityMatrixCases.test.ets|assert0162|assertEqual|actual', clone.key())).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0035|CapabilityMatrixCases.test.ets|assert0162|assertEqual|expected', base.key()));
      clone.apiLevel = 19;
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0035|CapabilityMatrixCases.test.ets|assert0163|assertFalse|actual|expected=false', clone.key() === base.key())).assertFalse();
      clone.apiLevel = 18;
      clone.deviceForm = DeviceForm.TABLET;
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0035|CapabilityMatrixCases.test.ets|assert0164|assertFalse|actual|expected=false', clone.key() === base.key())).assertFalse();
      clone.deviceForm = DeviceForm.PHONE;
      clone.flavor = SystemFlavor.COMMERCIAL;
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0035|CapabilityMatrixCases.test.ets|assert0165|assertFalse|actual|expected=false', clone.key() === base.key())).assertFalse();
      clone.flavor = SystemFlavor.OPEN_HARMONY;
      clone.permissionGranted = false;
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0035|CapabilityMatrixCases.test.ets|assert0166|assertFalse|actual|expected=false', clone.key() === base.key())).assertFalse();
      clone.permissionGranted = true;
      clone.settingsEntryAvailable = false;
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0035|CapabilityMatrixCases.test.ets|assert0167|assertFalse|actual|expected=false', clone.key() === base.key())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0035|CapabilityMatrixCases.test.ets|assert0168|assertEqual|actual', base.apiLevel)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0035|CapabilityMatrixCases.test.ets|assert0168|assertEqual|expected', 18));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixApiBoundaryCases_0035|CapabilityMatrixCases.test.ets|assert0169|assertTrue|actual|expected=true', base.settingsEntryAvailable)).assertTrue();
    });
  });
}
