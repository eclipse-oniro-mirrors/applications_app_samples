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

/**
 * 诊断与指引层用例：两个探针独立执行、结论分类、指引选择。
 */
import { describe, expect } from '@ohos/hypium';
import { traceParameter, loggedIt as it } from '../support/TestLog';
import { configureTestText } from '../support/TestTextResources';
import {
  AutoStartupProbePort, CapabilityDiagnostic, DiagnosticReport, ProbeResult, ProbeStage,
  adviceOf, buildResult, checkConsistency, conclusionOf, deriveQuery, isUnsupportedError
} from '../../../main/ets/autostart/diagnostics/CapabilityProbe';
import {
  FALLBACK_GUIDANCE, GUIDANCE_ENTRIES, GuidanceEntry, GuidanceKind, guidanceCaption,
  guidanceCoverage, guidanceIdsUnique, manualOnly, needsJump, selectGuidance, stepTexts
} from '../../../main/ets/autostart/revisit/GuidanceCatalog';
import {
  CapabilityQuery, CapabilityVerdict, DeviceForm, SystemFlavor, evaluateCapability
} from '../../../main/ets/autostart/rules/CapabilityMatrix';

class CountingPort implements AutoStartupProbePort {
  public supportCalls: number = 0;
  public statusCalls: number = 0;
  public support: boolean = true;
  public status: boolean = true;
  public supportError: Object | null = null;
  public statusError: Object | null = null;

  async isSupported(): Promise<boolean> {
    this.supportCalls++;
    if (this.supportError !== null) {
      throw this.supportError as Error;
    }
    return this.support;
  }

  async isEnabledForSelf(): Promise<boolean> {
    this.statusCalls++;
    if (this.statusError !== null) {
      throw this.statusError as Error;
    }
    return this.status;
  }
}

class FakeBusinessError extends Error {
  public code: number;

  constructor(code: number, message: string) {
    super(message);
    this.name = 'BusinessError';
    this.code = code;
  }
}

function diagnosticWith(port: CountingPort): CapabilityDiagnostic {
  let now = 1000;
  const clock = (): number => {
    now += 7;
    return now;
  };
  return new CapabilityDiagnostic(port, clock, 3000);
}

export default function diagnosticCoverage(): void {
  configureTestText();
  describe('GuidanceCatalogRules', (): void => {
    /**
     * @tc.number    SUB_STARTUP_GUIDANCECATALOGRULES_0100
     * @tc.name      testGuidanceCatalogRules0001
     * @tc.desc      Verify entries have unique ids and cover every range
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testGuidanceCatalogRules0001', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0001|DiagnosticCoverage.test.ets|assert0001|assertTrue|actual|expected=true', guidanceIdsUnique())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0001|DiagnosticCoverage.test.ets|assert0002|assertEqual|actual', guidanceCoverage().length)).assertEqual(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0001|DiagnosticCoverage.test.ets|assert0002|assertEqual|expected', GUIDANCE_ENTRIES.length));
      GUIDANCE_ENTRIES.forEach((entry: GuidanceEntry): void => {
        expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0001|DiagnosticCoverage.test.ets|assert0003|assertTrue|actual|expected=true', entry.entryId.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0001|DiagnosticCoverage.test.ets|assert0004|assertTrue|actual|expected=true', entry.steps.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0001|DiagnosticCoverage.test.ets|assert0005|assertTrue|actual|expected=true', entry.minApi <= entry.maxApi)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0001|DiagnosticCoverage.test.ets|assert0006|assertTrue|actual|expected=true', entry.title.length > 0)).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_STARTUP_GUIDANCECATALOGRULES_0200
     * @tc.name      testGuidanceCatalogRules0002
     * @tc.desc      Verify low api gets manual guidance
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testGuidanceCatalogRules0002', 0, (): void => {
      configureTestText();
      const entry = selectGuidance(new CapabilityQuery(8, DeviceForm.PHONE,
        SystemFlavor.OPEN_HARMONY));
      expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0002|DiagnosticCoverage.test.ets|assert0007|assertEqual|actual', entry.entryId)).assertEqual(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0002|DiagnosticCoverage.test.ets|assert0007|assertEqual|expected', FALLBACK_GUIDANCE.entryId));
      expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0002|DiagnosticCoverage.test.ets|assert0008|assertEqual|actual', entry.kind)).assertEqual(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0002|DiagnosticCoverage.test.ets|assert0008|assertEqual|expected', GuidanceKind.MANUAL_ONLY));
      expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0002|DiagnosticCoverage.test.ets|assert0009|assertFalse|actual|expected=false', needsJump(entry))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0002|DiagnosticCoverage.test.ets|assert0010|assertTrue|actual|expected=true', manualOnly(new CapabilityQuery(8, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY))))
        .assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_GUIDANCECATALOGRULES_0300
     * @tc.name      testGuidanceCatalogRules0003
     * @tc.desc      Verify open harmony early api never promises settings jump
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testGuidanceCatalogRules0003', 0, (): void => {
      configureTestText();
      const forms: DeviceForm[] = [DeviceForm.PHONE, DeviceForm.TABLET, DeviceForm.TV,
        DeviceForm.WEARABLE, DeviceForm.UNKNOWN];
      forms.forEach((form: DeviceForm): void => {
        const entry = selectGuidance(new CapabilityQuery(10, form, SystemFlavor.OPEN_HARMONY));
        expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0003|DiagnosticCoverage.test.ets|assert0011|assertEqual|actual', entry.entryId)).assertEqual(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0003|DiagnosticCoverage.test.ets|assert0011|assertEqual|expected', FALLBACK_GUIDANCE.entryId));
        expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0003|DiagnosticCoverage.test.ets|assert0012|assertFalse|actual|expected=false', needsJump(entry))).assertFalse();
        expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0003|DiagnosticCoverage.test.ets|assert0013|assertFalse|actual|expected=false', entry.kind === GuidanceKind.IN_APP)).assertFalse();
        expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0003|DiagnosticCoverage.test.ets|assert0014|assertFalse|actual|expected=false', entry.kind === GuidanceKind.SYSTEM_SETTINGS)).assertFalse();
      });
      expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0003|DiagnosticCoverage.test.ets|assert0015|assertTrue|actual|expected=true', stepTexts(selectGuidance(new CapabilityQuery(10, DeviceForm.TABLET,
        SystemFlavor.OPEN_HARMONY)))[0].indexOf('1. ') === 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_GUIDANCECATALOGRULES_0400
     * @tc.name      testGuidanceCatalogRules0004
     * @tc.desc      Verify guidance denies permission and switch claims
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testGuidanceCatalogRules0004', 0, (): void => {
      configureTestText();
      const entry = selectGuidance(new CapabilityQuery(11, DeviceForm.PHONE,
        SystemFlavor.COMMERCIAL));
      expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0004|DiagnosticCoverage.test.ets|assert0016|assertTrue|actual|expected=true', entry.summary.indexOf('不直接开启') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0004|DiagnosticCoverage.test.ets|assert0017|assertTrue|actual|expected=true', entry.summary.indexOf('不跳转系统设置') >= 0)).assertTrue();
      entry.steps.forEach((step): void => {
        expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0004|DiagnosticCoverage.test.ets|assert0018|assertFalse|actual|expected=false', step.label.indexOf('开启开机自启') >= 0)).assertFalse();
        expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0004|DiagnosticCoverage.test.ets|assert0019|assertFalse|actual|expected=false', step.label.indexOf('授予') >= 0)).assertFalse();
      });
      expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0004|DiagnosticCoverage.test.ets|assert0020|assertTrue|actual|expected=true', entry.requiredCount() <= entry.stepCount())).assertTrue();
    });

;

;

    /**
     * @tc.number    SUB_STARTUP_GUIDANCECATALOGRULES_0700
     * @tc.name      testGuidanceCatalogRules0007
     * @tc.desc      Verify future api falls back to same manual entry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testGuidanceCatalogRules0007', 0, (): void => {
      configureTestText();
      const future = selectGuidance(new CapabilityQuery(30, DeviceForm.PHONE,
        SystemFlavor.OPEN_HARMONY));
      expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0007|DiagnosticCoverage.test.ets|assert0021|assertEqual|actual', future.entryId)).assertEqual(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0007|DiagnosticCoverage.test.ets|assert0021|assertEqual|expected', FALLBACK_GUIDANCE.entryId));
      expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0007|DiagnosticCoverage.test.ets|assert0022|assertTrue|actual|expected=true', guidanceIdsUnique())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0007|DiagnosticCoverage.test.ets|assert0023|assertEqual|actual', guidanceCoverage().length)).assertEqual(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0007|DiagnosticCoverage.test.ets|assert0023|assertEqual|expected', GUIDANCE_ENTRIES.length));
    });

    /**
     * @tc.number    SUB_STARTUP_GUIDANCECATALOGRULES_0800
     * @tc.name      testGuidanceCatalogRules0008
     * @tc.desc      Verify caption reports step counts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testGuidanceCatalogRules0008', 0, (): void => {
      configureTestText();
      const entry = selectGuidance(new CapabilityQuery(18, DeviceForm.PHONE,
        SystemFlavor.OPEN_HARMONY));
      const caption: string = guidanceCaption(entry);
      expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0008|DiagnosticCoverage.test.ets|assert0024|assertTrue|actual|expected=true', caption.indexOf('共 3 步') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0008|DiagnosticCoverage.test.ets|assert0025|assertTrue|actual|expected=true', caption.indexOf('必做 3 步') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0008|DiagnosticCoverage.test.ets|assert0026|assertEqual|actual', stepTexts(FALLBACK_GUIDANCE).length)).assertEqual(traceParameter('com.samples.appstartupauto_GuidanceCatalogRules_0008|DiagnosticCoverage.test.ets|assert0026|assertEqual|expected', 3));
    });
  });

  describe('CapabilityDiagnosticRules', (): void => {
    /**
     * @tc.number    SUB_STARTUP_CAPABILITYDIAGNOSTICRULES_0100
     * @tc.name      testCapabilityDiagnosticRules0001
     * @tc.desc      Verify both probes succeed and report consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testCapabilityDiagnosticRules0001', 0, async (): Promise<void> => {
      configureTestText();
      const port = new CountingPort();
      const diagnostic = diagnosticWith(port);
      diagnostic.configure(new CapabilityQuery(18, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY,
        true, true));
      const report: DiagnosticReport = await diagnostic.runAll();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0001|DiagnosticCoverage.test.ets|assert0027|assertEqual|actual', port.supportCalls)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0001|DiagnosticCoverage.test.ets|assert0027|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0001|DiagnosticCoverage.test.ets|assert0028|assertEqual|actual', port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0001|DiagnosticCoverage.test.ets|assert0028|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0001|DiagnosticCoverage.test.ets|assert0029|assertEqual|actual', report.ability.stage)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0001|DiagnosticCoverage.test.ets|assert0029|assertEqual|expected', ProbeStage.SUCCEEDED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0001|DiagnosticCoverage.test.ets|assert0030|assertTrue|actual|expected=true', report.ability.value)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0001|DiagnosticCoverage.test.ets|assert0031|assertEqual|actual', report.status.stage)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0001|DiagnosticCoverage.test.ets|assert0031|assertEqual|expected', ProbeStage.SUCCEEDED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0001|DiagnosticCoverage.test.ets|assert0032|assertTrue|actual|expected=true', report.status.value)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0001|DiagnosticCoverage.test.ets|assert0033|assertTrue|actual|expected=true', report.consistent)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0001|DiagnosticCoverage.test.ets|assert0034|assertEqual|actual', report.evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0001|DiagnosticCoverage.test.ets|assert0034|assertEqual|expected', CapabilityVerdict.SUPPORTED));
      // 结论标题使用业务结论文本；不能用英文常量假设实现语言。
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0001|DiagnosticCoverage.test.ets|assert0035|assertTrue|actual|expected=true', report.headline.indexOf(report.ability.conclusion) >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0001|DiagnosticCoverage.test.ets|assert0036|assertFalse|actual|expected=false', diagnostic.isRunning())).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYDIAGNOSTICRULES_0200
     * @tc.name      testCapabilityDiagnosticRules0002
     * @tc.desc      Verify unsupported probe still allows independent status query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityDiagnosticRules0002', 0, async (): Promise<void> => {
      configureTestText();
      const port = new CountingPort();
      port.support = false;
      port.status = false;
      const diagnostic = diagnosticWith(port);
      const report: DiagnosticReport = await diagnostic.runAll();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0002|DiagnosticCoverage.test.ets|assert0037|assertEqual|actual', report.ability.stage)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0002|DiagnosticCoverage.test.ets|assert0037|assertEqual|expected', ProbeStage.UNSUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0002|DiagnosticCoverage.test.ets|assert0038|assertTrue|actual|expected=true', report.ability.unsupportedEvidence)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0002|DiagnosticCoverage.test.ets|assert0039|assertEqual|actual', report.status.stage)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0002|DiagnosticCoverage.test.ets|assert0039|assertEqual|expected', ProbeStage.SUCCEEDED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0002|DiagnosticCoverage.test.ets|assert0040|assertFalse|actual|expected=false', report.status.value)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0002|DiagnosticCoverage.test.ets|assert0041|assertEqual|actual', port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0002|DiagnosticCoverage.test.ets|assert0041|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0002|DiagnosticCoverage.test.ets|assert0042|assertFalse|actual|expected=false', report.consistent)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0002|DiagnosticCoverage.test.ets|assert0043|assertTrue|actual|expected=true', report.advice.indexOf('不支持') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYDIAGNOSTICRULES_0300
     * @tc.name      testCapabilityDiagnosticRules0003
     * @tc.desc      Verify status failure is retryable not disabled
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityDiagnosticRules0003', 0, async (): Promise<void> => {
      configureTestText();
      const port = new CountingPort();
      port.statusError = new FakeBusinessError(16000050, '内部错误');
      const diagnostic = diagnosticWith(port);
      const report: DiagnosticReport = await diagnostic.runAll();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0003|DiagnosticCoverage.test.ets|assert0044|assertEqual|actual', report.ability.stage)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0003|DiagnosticCoverage.test.ets|assert0044|assertEqual|expected', ProbeStage.SUCCEEDED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0003|DiagnosticCoverage.test.ets|assert0045|assertEqual|actual', report.status.stage)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0003|DiagnosticCoverage.test.ets|assert0045|assertEqual|expected', ProbeStage.FAILED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0003|DiagnosticCoverage.test.ets|assert0046|assertEqual|actual', report.status.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0003|DiagnosticCoverage.test.ets|assert0046|assertEqual|expected', '16000050'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0003|DiagnosticCoverage.test.ets|assert0047|assertTrue|actual|expected=true', report.advice.indexOf('可重试') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0003|DiagnosticCoverage.test.ets|assert0048|assertTrue|actual|expected=true', adviceOf(report.ability, report.status, report.evaluation).length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYDIAGNOSTICRULES_0400
     * @tc.name      testCapabilityDiagnosticRules0004
     * @tc.desc      Verify probe801 becomes unsupported not failure
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityDiagnosticRules0004', 0, async (): Promise<void> => {
      configureTestText();
      const port = new CountingPort();
      port.supportError = new FakeBusinessError(801, '不支持');
      const diagnostic = diagnosticWith(port);
      const ability: ProbeResult = await diagnostic.runAbilityProbe();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0004|DiagnosticCoverage.test.ets|assert0049|assertEqual|actual', ability.stage)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0004|DiagnosticCoverage.test.ets|assert0049|assertEqual|expected', ProbeStage.UNSUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0004|DiagnosticCoverage.test.ets|assert0050|assertTrue|actual|expected=true', ability.conclusion.indexOf('801') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0004|DiagnosticCoverage.test.ets|assert0051|assertTrue|actual|expected=true', isUnsupportedError('801'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0004|DiagnosticCoverage.test.ets|assert0052|assertFalse|actual|expected=false', isUnsupportedError('16000050'))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYDIAGNOSTICRULES_0500
     * @tc.name      testCapabilityDiagnosticRules0005
     * @tc.desc      Verify run all is single flight while running
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityDiagnosticRules0005', 0, async (): Promise<void> => {
      configureTestText();
      const port = new CountingPort();
      const diagnostic = diagnosticWith(port);
      const first: Promise<DiagnosticReport> = diagnostic.runAll();
      const second: DiagnosticReport = await diagnostic.runAll();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0005|DiagnosticCoverage.test.ets|assert0053|assertEqual|actual', second.ability.stage)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0005|DiagnosticCoverage.test.ets|assert0053|assertEqual|expected', ProbeStage.RUNNING));
      await first;
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0005|DiagnosticCoverage.test.ets|assert0054|assertEqual|actual', port.supportCalls)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0005|DiagnosticCoverage.test.ets|assert0054|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0005|DiagnosticCoverage.test.ets|assert0055|assertTrue|actual|expected=true', port.supportCalls >= 1)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYDIAGNOSTICRULES_0600
     * @tc.name      testCapabilityDiagnosticRules0006
     * @tc.desc      Verify timeout degradation keeps value and marks timeout
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityDiagnosticRules0006', 0, (): void => {
      configureTestText();
      const slow = buildResult(ProbeStage.RUNNING, false, '', '', 5000);
      const diagnostic = diagnosticWith(new CountingPort());
      const degraded: ProbeResult = diagnostic.degradeIfTimeout(slow);
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0006|DiagnosticCoverage.test.ets|assert0056|assertEqual|actual', degraded.stage)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0006|DiagnosticCoverage.test.ets|assert0056|assertEqual|expected', ProbeStage.TIMEOUT));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0006|DiagnosticCoverage.test.ets|assert0057|assertEqual|actual', degraded.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0006|DiagnosticCoverage.test.ets|assert0057|assertEqual|expected', 'TIMEOUT'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0006|DiagnosticCoverage.test.ets|assert0058|assertFalse|actual|expected=false', degraded.value)).assertFalse();
      const fast = buildResult(ProbeStage.SUCCEEDED, false, '0', '', 10);
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0006|DiagnosticCoverage.test.ets|assert0059|assertEqual|actual', diagnostic.degradeIfTimeout(fast).stage)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0006|DiagnosticCoverage.test.ets|assert0059|assertEqual|expected', ProbeStage.SUCCEEDED));
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYDIAGNOSTICRULES_0700
     * @tc.name      testCapabilityDiagnosticRules0007
     * @tc.desc      Verify consistency and conclusion texts cover all stages
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testCapabilityDiagnosticRules0007', 0, (): void => {
      configureTestText();
      const ok = buildResult(ProbeStage.SUCCEEDED, true, '0', '', 1);
      const no = buildResult(ProbeStage.SUCCEEDED, false, '0', '', 1);
      const unsupported = buildResult(ProbeStage.UNSUPPORTED, null, '801', '', 1);
      const failed = buildResult(ProbeStage.FAILED, null, '16000050', '', 1);
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0007|DiagnosticCoverage.test.ets|assert0060|assertTrue|actual|expected=true', checkConsistency(ok, no))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0007|DiagnosticCoverage.test.ets|assert0061|assertTrue|actual|expected=true', checkConsistency(unsupported, unsupported))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0007|DiagnosticCoverage.test.ets|assert0062|assertFalse|actual|expected=false', checkConsistency(ok, failed))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0007|DiagnosticCoverage.test.ets|assert0063|assertEqual|actual', conclusionOf(ProbeStage.SUCCEEDED, true, '0'))).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0007|DiagnosticCoverage.test.ets|assert0063|assertEqual|expected', '返回已开启'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0007|DiagnosticCoverage.test.ets|assert0064|assertEqual|actual', conclusionOf(ProbeStage.SUCCEEDED, false, '0'))).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0007|DiagnosticCoverage.test.ets|assert0064|assertEqual|expected', '返回未开启'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0007|DiagnosticCoverage.test.ets|assert0065|assertEqual|actual', conclusionOf(ProbeStage.SUCCEEDED, null, '0'))).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0007|DiagnosticCoverage.test.ets|assert0065|assertEqual|expected', '调用成功但未返回明确状态'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0007|DiagnosticCoverage.test.ets|assert0066|assertEqual|actual', conclusionOf(ProbeStage.TIMEOUT, null, 'TIMEOUT'))).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0007|DiagnosticCoverage.test.ets|assert0066|assertEqual|expected', '等待超时，可重试'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0007|DiagnosticCoverage.test.ets|assert0067|assertEqual|actual', conclusionOf(ProbeStage.IDLE, null, ''))).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0007|DiagnosticCoverage.test.ets|assert0067|assertEqual|expected', '尚未执行'));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0007|DiagnosticCoverage.test.ets|assert0068|assertEqual|actual', conclusionOf(ProbeStage.RUNNING, null, ''))).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0007|DiagnosticCoverage.test.ets|assert0068|assertEqual|expected', '正在调用'));
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYDIAGNOSTICRULES_0800
     * @tc.name      testCapabilityDiagnosticRules0008
     * @tc.desc      Verify derive query maps device types and flavor
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityDiagnosticRules0008', 0, (): void => {
      configureTestText();
      const phone = deriveQuery(18, 'phone', true, true, false);
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0008|DiagnosticCoverage.test.ets|assert0069|assertEqual|actual', phone.deviceForm)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0008|DiagnosticCoverage.test.ets|assert0069|assertEqual|expected', DeviceForm.PHONE));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0008|DiagnosticCoverage.test.ets|assert0070|assertEqual|actual', phone.flavor)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0008|DiagnosticCoverage.test.ets|assert0070|assertEqual|expected', SystemFlavor.OPEN_HARMONY));
      const tv = deriveQuery(18, 'tv', false, false, true);
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0008|DiagnosticCoverage.test.ets|assert0071|assertEqual|actual', tv.deviceForm)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0008|DiagnosticCoverage.test.ets|assert0071|assertEqual|expected', DeviceForm.TV));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0008|DiagnosticCoverage.test.ets|assert0072|assertEqual|actual', tv.flavor)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0008|DiagnosticCoverage.test.ets|assert0072|assertEqual|expected', SystemFlavor.COMMERCIAL));
      const unknown = deriveQuery(9, 'car', true, false, false);
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0008|DiagnosticCoverage.test.ets|assert0073|assertEqual|actual', unknown.deviceForm)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0008|DiagnosticCoverage.test.ets|assert0073|assertEqual|expected', DeviceForm.UNKNOWN));
      expect(traceParameter('com.samples.appstartupauto_CapabilityDiagnosticRules_0008|DiagnosticCoverage.test.ets|assert0074|assertTrue|actual|expected=true', evaluateCapability(unknown).rule !== undefined)).assertTrue();
    });
  });
}
