import { describe, expect, it } from '@ohos/hypium';
import {
  CAPABILITY_RULES, CapabilityQuery, CapabilityVerdict, DeviceForm, SystemFlavor, canSetInApp,
  evaluateCapability, isDefinitelyUnsupported, needsSettingsGuidance, ruleSummaries, verdictSeries
} from '../../../main/ets/autostart/rules/CapabilityMatrix';

function queryOf(api: number, form: DeviceForm, flavor: SystemFlavor, granted: boolean = true,
  entry: boolean = true): CapabilityQuery {
  return new CapabilityQuery(api, form, flavor, granted, entry);
}

export default function capabilityMatrixCasesTest(): void {
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
      const evaluation = evaluateCapability(queryOf(8, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.NEED_SYSTEM_UPDATE);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0001');
      expect(canSetInApp(evaluation)).assertFalse();
      expect(needsSettingsGuidance(evaluation)).assertTrue();
      expect(isDefinitelyUnsupported(evaluation.verdict)).assertTrue();
      expect(evaluation.downgradedByEntry).assertFalse();
      expect(evaluation.downgradedByPermission).assertFalse();
      expect(evaluation.summary().indexOf('CM-0001') > 0).assertTrue();
      expect(evaluation.developerHint().length > 0).assertTrue();
      expect(evaluation.userHint().length > 0).assertTrue();
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
      const evaluation = evaluateCapability(queryOf(0, DeviceForm.WEARABLE, SystemFlavor.HARMONY_OS));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.NEED_SYSTEM_UPDATE);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0001');
      expect(canSetInApp(evaluation)).assertFalse();
      expect(isDefinitelyUnsupported(evaluation.verdict)).assertTrue();
      expect(needsSettingsGuidance(evaluation)).assertTrue();
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
      const tv = evaluateCapability(queryOf(8, DeviceForm.TV, SystemFlavor.HARMONY_OS));
      const tablet = evaluateCapability(queryOf(8, DeviceForm.TABLET, SystemFlavor.UNKNOWN));
      expect(tv.rule?.ruleId).assertEqual('CM-0001');
      expect(tablet.rule?.ruleId).assertEqual('CM-0001');
      expect(tv.verdict).assertEqual(CapabilityVerdict.NEED_SYSTEM_UPDATE);
      expect(tablet.verdict).assertEqual(CapabilityVerdict.NEED_SYSTEM_UPDATE);
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
      const evaluation = evaluateCapability(queryOf(9, DeviceForm.WEARABLE, SystemFlavor.OPEN_HARMONY));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.DEVICE_EXCLUDED);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0002');
      expect(isDefinitelyUnsupported(evaluation.verdict)).assertTrue();
      expect(canSetInApp(evaluation)).assertFalse();
      expect(needsSettingsGuidance(evaluation)).assertTrue();
      expect(evaluation.summary().indexOf('deviceExcluded') === 0).assertTrue();
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
      const evaluation = evaluateCapability(queryOf(11, DeviceForm.WEARABLE,
        SystemFlavor.HARMONY_OS, false, false));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.DEVICE_EXCLUDED);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0002');
      expect(canSetInApp(evaluation)).assertFalse();
      expect(evaluation.downgradedByPermission).assertFalse();
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
      const evaluation = evaluateCapability(queryOf(9, DeviceForm.TV, SystemFlavor.OPEN_HARMONY));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.DEVICE_EXCLUDED);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0003');
      expect(isDefinitelyUnsupported(evaluation.verdict)).assertTrue();
      expect(canSetInApp(evaluation)).assertFalse();
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
      const evaluation = evaluateCapability(queryOf(11, DeviceForm.TV, SystemFlavor.HARMONY_OS));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.DEVICE_EXCLUDED);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0003');
      expect(needsSettingsGuidance(evaluation)).assertTrue();
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
      const evaluation = evaluateCapability(queryOf(9, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY,
        false, true));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0004');
      expect(canSetInApp(evaluation)).assertFalse();
      expect(needsSettingsGuidance(evaluation)).assertTrue();
      expect(evaluation.downgradedByEntry).assertFalse();
      expect(isDefinitelyUnsupported(evaluation.verdict)).assertFalse();
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
      const evaluation = evaluateCapability(queryOf(9, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY,
        true, false));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
      expect(evaluation.downgradedByEntry).assertTrue();
      expect(needsSettingsGuidance(evaluation)).assertTrue();
      expect(canSetInApp(evaluation)).assertFalse();
      expect(evaluation.rule?.ruleId).assertEqual('CM-0004');
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
      const evaluation = evaluateCapability(queryOf(11, DeviceForm.TABLET,
        SystemFlavor.OPEN_HARMONY, false, true));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0004');
      expect(evaluation.downgradedByEntry).assertFalse();
      expect(canSetInApp(evaluation)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_1100
     * @tc.name      testCapabilityMatrixApiBoundaryCases0011
     * @tc.desc      Verify api9 phone harmony os without permission needs permission
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0011', 0, (): void => {
      const evaluation = evaluateCapability(queryOf(9, DeviceForm.PHONE, SystemFlavor.HARMONY_OS,
        false, true));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.NEED_PERMISSION);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0005');
      expect(evaluation.downgradedByPermission).assertTrue();
      expect(needsSettingsGuidance(evaluation)).assertTrue();
      expect(canSetInApp(evaluation)).assertFalse();
      expect(isDefinitelyUnsupported(evaluation.verdict)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_1200
     * @tc.name      testCapabilityMatrixApiBoundaryCases0012
     * @tc.desc      Verify api9 phone harmony os with permission keeps verdict
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0012', 0, (): void => {
      const evaluation = evaluateCapability(queryOf(9, DeviceForm.PHONE, SystemFlavor.HARMONY_OS,
        true, true));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.NEED_PERMISSION);
      expect(evaluation.downgradedByPermission).assertFalse();
      expect(evaluation.rule?.ruleId).assertEqual('CM-0005');
      expect(canSetInApp(evaluation)).assertFalse();
      expect(needsSettingsGuidance(evaluation)).assertTrue();
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
      const evaluation = evaluateCapability(queryOf(10, DeviceForm.PHONE, SystemFlavor.UNKNOWN));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.UNKNOWN);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0016');
      expect(canSetInApp(evaluation)).assertFalse();
      expect(isDefinitelyUnsupported(evaluation.verdict)).assertFalse();
      expect(needsSettingsGuidance(evaluation)).assertTrue();
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
      const evaluation = evaluateCapability(queryOf(12, DeviceForm.WEARABLE,
        SystemFlavor.OPEN_HARMONY));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.DEVICE_EXCLUDED);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0006');
      expect(isDefinitelyUnsupported(evaluation.verdict)).assertTrue();
      expect(canSetInApp(evaluation)).assertFalse();
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
      const evaluation = evaluateCapability(queryOf(13, DeviceForm.WEARABLE,
        SystemFlavor.HARMONY_OS, true, true));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.DEVICE_EXCLUDED);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0006');
      expect(needsSettingsGuidance(evaluation)).assertFalse();
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
      const evaluation = evaluateCapability(queryOf(12, DeviceForm.TV, SystemFlavor.OPEN_HARMONY));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0007');
      expect(canSetInApp(evaluation)).assertTrue();
      expect(needsSettingsGuidance(evaluation)).assertFalse();
      expect(evaluation.downgradedByPermission).assertFalse();
      expect(evaluation.downgradedByEntry).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_1700
     * @tc.name      testCapabilityMatrixApiBoundaryCases0017
     * @tc.desc      Verify api12 tv harmony os without permission needs permission
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0017', 0, (): void => {
      const evaluation = evaluateCapability(queryOf(12, DeviceForm.TV, SystemFlavor.HARMONY_OS,
        false, true));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.NEED_PERMISSION);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0008');
      expect(evaluation.downgradedByPermission).assertTrue();
      expect(needsSettingsGuidance(evaluation)).assertTrue();
      expect(canSetInApp(evaluation)).assertFalse();
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
      const evaluation = evaluateCapability(queryOf(13, DeviceForm.PHONE,
        SystemFlavor.OPEN_HARMONY));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0009');
      expect(canSetInApp(evaluation)).assertTrue();
      expect(needsSettingsGuidance(evaluation)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXAPIBOUNDARYCASES_1900
     * @tc.name      testCapabilityMatrixApiBoundaryCases0019
     * @tc.desc      Verify api12 tablet harmony os with permission needs permission
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixApiBoundaryCases0019', 0, (): void => {
      const evaluation = evaluateCapability(queryOf(12, DeviceForm.TABLET, SystemFlavor.HARMONY_OS,
        true, true));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.NEED_PERMISSION);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0010');
      expect(evaluation.downgradedByPermission).assertFalse();
      expect(canSetInApp(evaluation)).assertFalse();
      expect(needsSettingsGuidance(evaluation)).assertTrue();
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
      const evaluation = evaluateCapability(queryOf(14, DeviceForm.WEARABLE,
        SystemFlavor.OPEN_HARMONY));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.DEVICE_EXCLUDED);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0011');
      expect(isDefinitelyUnsupported(evaluation.verdict)).assertTrue();
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
      const evaluation = evaluateCapability(queryOf(17, DeviceForm.WEARABLE,
        SystemFlavor.HARMONY_OS, false, false));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.DEVICE_EXCLUDED);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0011');
      expect(canSetInApp(evaluation)).assertFalse();
      expect(needsSettingsGuidance(evaluation)).assertFalse();
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
      const openHarmony = evaluateCapability(queryOf(14, DeviceForm.TV,
        SystemFlavor.OPEN_HARMONY));
      const harmony = evaluateCapability(queryOf(14, DeviceForm.TV, SystemFlavor.HARMONY_OS));
      expect(openHarmony.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
      expect(harmony.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
      expect(openHarmony.rule?.ruleId).assertEqual('CM-0012');
      expect(harmony.rule?.ruleId).assertEqual('CM-0012');
      expect(canSetInApp(openHarmony)).assertTrue();
      expect(canSetInApp(harmony)).assertTrue();
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
      const openHarmony = evaluateCapability(queryOf(15, DeviceForm.PHONE,
        SystemFlavor.OPEN_HARMONY));
      const harmony = evaluateCapability(queryOf(15, DeviceForm.PHONE, SystemFlavor.HARMONY_OS));
      expect(openHarmony.rule?.ruleId).assertEqual('CM-0013');
      expect(harmony.rule?.ruleId).assertEqual('CM-0013');
      expect(openHarmony.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
      expect(harmony.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
      expect(openHarmony.downgradedByEntry).assertFalse();
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
      const evaluation = evaluateCapability(queryOf(17, DeviceForm.TABLET,
        SystemFlavor.HARMONY_OS, false, false));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0013');
      expect(canSetInApp(evaluation)).assertTrue();
      expect(evaluation.downgradedByEntry).assertFalse();
      expect(isDefinitelyUnsupported(evaluation.verdict)).assertFalse();
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
      const forms: DeviceForm[] = [DeviceForm.PHONE, DeviceForm.TABLET, DeviceForm.TV,
        DeviceForm.WEARABLE];
      forms.forEach((form: DeviceForm): void => {
        const evaluation = evaluateCapability(queryOf(18, form, SystemFlavor.OPEN_HARMONY));
        expect(evaluation.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
        expect(evaluation.rule?.ruleId).assertEqual('CM-0014');
        expect(canSetInApp(evaluation)).assertTrue();
      });
      expect(forms.length).assertEqual(4);
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
      const evaluation = evaluateCapability(queryOf(26, DeviceForm.WEARABLE,
        SystemFlavor.HARMONY_OS, false, false));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0014');
      expect(canSetInApp(evaluation)).assertTrue();
      expect(needsSettingsGuidance(evaluation)).assertFalse();
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
      const evaluation = evaluateCapability(queryOf(27, DeviceForm.PHONE,
        SystemFlavor.OPEN_HARMONY));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.UNKNOWN);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0015');
      expect(canSetInApp(evaluation)).assertFalse();
      expect(isDefinitelyUnsupported(evaluation.verdict)).assertFalse();
      expect(needsSettingsGuidance(evaluation)).assertFalse();
      expect(evaluation.summary().indexOf('CM-0015') > 0).assertTrue();
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
      const evaluation = evaluateCapability(queryOf(30, DeviceForm.TABLET,
        SystemFlavor.HARMONY_OS));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.UNKNOWN);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0015');
      expect(evaluation.developerHint().indexOf('API 26') > 0).assertTrue();
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
      const evaluation = evaluateCapability(queryOf(13, DeviceForm.PHONE, SystemFlavor.UNKNOWN));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.UNKNOWN);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0017');
      expect(canSetInApp(evaluation)).assertFalse();
      expect(isDefinitelyUnsupported(evaluation.verdict)).assertFalse();
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
      const evaluation = evaluateCapability(queryOf(12, DeviceForm.TV, SystemFlavor.UNKNOWN));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.UNKNOWN);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0017');
      expect(evaluation.userHint().length > 0).assertTrue();
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
      const evaluation = evaluateCapability(queryOf(10, DeviceForm.UNKNOWN,
        SystemFlavor.OPEN_HARMONY));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.UNKNOWN);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0018');
      expect(canSetInApp(evaluation)).assertFalse();
      expect(isDefinitelyUnsupported(evaluation.verdict)).assertFalse();
      expect(needsSettingsGuidance(evaluation)).assertTrue();
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
      const evaluation = evaluateCapability(queryOf(20, DeviceForm.UNKNOWN,
        SystemFlavor.OPEN_HARMONY));
      expect(evaluation.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
      expect(evaluation.rule?.ruleId).assertEqual('CM-0014');
      expect(canSetInApp(evaluation)).assertTrue();
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
      expect(CAPABILITY_RULES.length).assertEqual(18);
      const probes: CapabilityQuery[] = [
        queryOf(5, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY),
        queryOf(10, DeviceForm.WEARABLE, SystemFlavor.OPEN_HARMONY),
        queryOf(10, DeviceForm.TV, SystemFlavor.OPEN_HARMONY),
        queryOf(10, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY),
        queryOf(10, DeviceForm.PHONE, SystemFlavor.HARMONY_OS),
        queryOf(12, DeviceForm.WEARABLE, SystemFlavor.OPEN_HARMONY),
        queryOf(12, DeviceForm.TV, SystemFlavor.OPEN_HARMONY),
        queryOf(12, DeviceForm.TV, SystemFlavor.HARMONY_OS),
        queryOf(12, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY),
        queryOf(12, DeviceForm.PHONE, SystemFlavor.HARMONY_OS),
        queryOf(15, DeviceForm.WEARABLE, SystemFlavor.OPEN_HARMONY),
        queryOf(15, DeviceForm.TV, SystemFlavor.OPEN_HARMONY),
        queryOf(15, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY),
        queryOf(20, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY),
        queryOf(28, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY),
        queryOf(10, DeviceForm.TABLET, SystemFlavor.UNKNOWN),
        queryOf(12, DeviceForm.TABLET, SystemFlavor.UNKNOWN),
        queryOf(10, DeviceForm.UNKNOWN, SystemFlavor.OPEN_HARMONY)
      ];
      expect(probes.length).assertEqual(CAPABILITY_RULES.length);
      probes.forEach((probe: CapabilityQuery, index: number): void => {
        const evaluation = evaluateCapability(probe);
        expect(evaluation.rule?.ruleId).assertEqual(CAPABILITY_RULES[index].ruleId);
        expect(evaluation.verdict).assertEqual(CAPABILITY_RULES[index].verdict);
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
      expect(ruleSummaries().length).assertEqual(18);
      const series = verdictSeries(DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY, true, true);
      expect(series.length).assertEqual(21);
      expect(series[0]).assertEqual(CapabilityVerdict.NEED_SYSTEM_UPDATE);
      expect(series[1]).assertEqual(CapabilityVerdict.SUPPORTED);
      expect(series[series.length - 1]).assertEqual(CapabilityVerdict.UNKNOWN);
      const wearable = verdictSeries(DeviceForm.WEARABLE, SystemFlavor.OPEN_HARMONY, true, true);
      expect(wearable.length).assertEqual(21);
      expect(wearable[1]).assertEqual(CapabilityVerdict.DEVICE_EXCLUDED);
      expect(wearable[10]).assertEqual(CapabilityVerdict.SUPPORTED);
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
      const base: CapabilityQuery = queryOf(18, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY,
        true, true);
      const clone: CapabilityQuery = base.clone();
      expect(clone.key()).assertEqual(base.key());
      clone.apiLevel = 19;
      expect(clone.key() === base.key()).assertFalse();
      clone.apiLevel = 18;
      clone.deviceForm = DeviceForm.TABLET;
      expect(clone.key() === base.key()).assertFalse();
      clone.deviceForm = DeviceForm.PHONE;
      clone.flavor = SystemFlavor.HARMONY_OS;
      expect(clone.key() === base.key()).assertFalse();
      clone.flavor = SystemFlavor.OPEN_HARMONY;
      clone.permissionGranted = false;
      expect(clone.key() === base.key()).assertFalse();
      clone.permissionGranted = true;
      clone.settingsEntryAvailable = false;
      expect(clone.key() === base.key()).assertFalse();
      expect(base.apiLevel).assertEqual(18);
      expect(base.settingsEntryAvailable).assertTrue();
    });
  });
}
