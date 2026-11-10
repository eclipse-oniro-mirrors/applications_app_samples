/**
 * 诊断与指引层用例：两个探针独立执行、结论分类、指引选择。
 */
import { describe, expect, it } from '@ohos/hypium';
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
  supportCalls: number = 0;
  statusCalls: number = 0;
  support: boolean = true;
  status: boolean = true;
  supportError: Object | null = null;
  statusError: Object | null = null;

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
  code: number;

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
      expect(guidanceIdsUnique()).assertTrue();
      expect(guidanceCoverage().length).assertEqual(GUIDANCE_ENTRIES.length);
      GUIDANCE_ENTRIES.forEach((entry: GuidanceEntry): void => {
        expect(entry.entryId.length > 0).assertTrue();
        expect(entry.steps.length > 0).assertTrue();
        expect(entry.minApi <= entry.maxApi).assertTrue();
        expect(entry.title.length > 0).assertTrue();
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
      const entry = selectGuidance(new CapabilityQuery(8, DeviceForm.PHONE,
        SystemFlavor.OPEN_HARMONY));
      expect(entry.entryId).assertEqual(FALLBACK_GUIDANCE.entryId);
      expect(entry.kind).assertEqual(GuidanceKind.MANUAL_ONLY);
      expect(needsJump(entry)).assertFalse();
      expect(manualOnly(new CapabilityQuery(8, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY)))
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
      const forms: DeviceForm[] = [DeviceForm.PHONE, DeviceForm.TABLET, DeviceForm.TV,
        DeviceForm.WEARABLE, DeviceForm.UNKNOWN];
      forms.forEach((form: DeviceForm): void => {
        const entry = selectGuidance(new CapabilityQuery(10, form, SystemFlavor.OPEN_HARMONY));
        expect(entry.entryId).assertEqual(FALLBACK_GUIDANCE.entryId);
        expect(needsJump(entry)).assertFalse();
        expect(entry.kind === GuidanceKind.IN_APP).assertFalse();
        expect(entry.kind === GuidanceKind.SYSTEM_SETTINGS).assertFalse();
      });
      expect(stepTexts(selectGuidance(new CapabilityQuery(10, DeviceForm.TABLET,
        SystemFlavor.OPEN_HARMONY)))[0].indexOf('1. ') === 0).assertTrue();
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
      const entry = selectGuidance(new CapabilityQuery(11, DeviceForm.PHONE,
        SystemFlavor.HARMONY_OS));
      expect(entry.summary.indexOf('不直接开启') >= 0).assertTrue();
      expect(entry.summary.indexOf('不跳转系统设置') >= 0).assertTrue();
      entry.steps.forEach((step): void => {
        expect(step.label.indexOf('开启开机自启') >= 0).assertFalse();
        expect(step.label.indexOf('授予') >= 0).assertFalse();
      });
      expect(entry.requiredCount() <= entry.stepCount()).assertTrue();
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
      const future = selectGuidance(new CapabilityQuery(30, DeviceForm.PHONE,
        SystemFlavor.OPEN_HARMONY));
      expect(future.entryId).assertEqual(FALLBACK_GUIDANCE.entryId);
      expect(guidanceIdsUnique()).assertTrue();
      expect(guidanceCoverage().length).assertEqual(GUIDANCE_ENTRIES.length);
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
      const entry = selectGuidance(new CapabilityQuery(18, DeviceForm.PHONE,
        SystemFlavor.OPEN_HARMONY));
      const caption: string = guidanceCaption(entry);
      expect(caption.indexOf('共 3 步') >= 0).assertTrue();
      expect(caption.indexOf('必做 3 步') >= 0).assertTrue();
      expect(stepTexts(FALLBACK_GUIDANCE).length).assertEqual(3);
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
      const port = new CountingPort();
      const diagnostic = diagnosticWith(port);
      diagnostic.configure(new CapabilityQuery(18, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY,
        true, true));
      const report: DiagnosticReport = await diagnostic.runAll();
      expect(port.supportCalls).assertEqual(1);
      expect(port.statusCalls).assertEqual(1);
      expect(report.ability.stage).assertEqual(ProbeStage.SUCCEEDED);
      expect(report.ability.value).assertTrue();
      expect(report.status.stage).assertEqual(ProbeStage.SUCCEEDED);
      expect(report.status.value).assertTrue();
      expect(report.consistent).assertTrue();
      expect(report.evaluation.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
      // 结论标题使用业务结论文本；不能用英文常量假设实现语言。
      expect(report.headline.indexOf(report.ability.conclusion) >= 0).assertTrue();
      expect(diagnostic.isRunning()).assertFalse();
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
      const port = new CountingPort();
      port.support = false;
      port.status = false;
      const diagnostic = diagnosticWith(port);
      const report: DiagnosticReport = await diagnostic.runAll();
      expect(report.ability.stage).assertEqual(ProbeStage.UNSUPPORTED);
      expect(report.ability.unsupportedEvidence).assertTrue();
      expect(report.status.stage).assertEqual(ProbeStage.SUCCEEDED);
      expect(report.status.value).assertFalse();
      expect(port.statusCalls).assertEqual(1);
      expect(report.consistent).assertFalse();
      expect(report.advice.indexOf('不支持') >= 0).assertTrue();
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
      const port = new CountingPort();
      port.statusError = new FakeBusinessError(16000050, '内部错误');
      const diagnostic = diagnosticWith(port);
      const report: DiagnosticReport = await diagnostic.runAll();
      expect(report.ability.stage).assertEqual(ProbeStage.SUCCEEDED);
      expect(report.status.stage).assertEqual(ProbeStage.FAILED);
      expect(report.status.errorCode).assertEqual('16000050');
      expect(report.advice.indexOf('可重试') >= 0).assertTrue();
      expect(adviceOf(report.ability, report.status, report.evaluation).length > 0).assertTrue();
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
      const port = new CountingPort();
      port.supportError = new FakeBusinessError(801, '不支持');
      const diagnostic = diagnosticWith(port);
      const ability: ProbeResult = await diagnostic.runAbilityProbe();
      expect(ability.stage).assertEqual(ProbeStage.UNSUPPORTED);
      expect(ability.conclusion.indexOf('801') >= 0).assertTrue();
      expect(isUnsupportedError('801')).assertTrue();
      expect(isUnsupportedError('16000050')).assertFalse();
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
      const port = new CountingPort();
      const diagnostic = diagnosticWith(port);
      const first: Promise<DiagnosticReport> = diagnostic.runAll();
      const second: DiagnosticReport = await diagnostic.runAll();
      expect(second.ability.stage).assertEqual(ProbeStage.RUNNING);
      await first;
      expect(port.supportCalls).assertEqual(1);
      expect(port.supportCalls >= 1).assertTrue();
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
      const slow = buildResult(ProbeStage.RUNNING, false, '', '', 5000);
      const diagnostic = diagnosticWith(new CountingPort());
      const degraded: ProbeResult = diagnostic.degradeIfTimeout(slow);
      expect(degraded.stage).assertEqual(ProbeStage.TIMEOUT);
      expect(degraded.errorCode).assertEqual('TIMEOUT');
      expect(degraded.value).assertFalse();
      const fast = buildResult(ProbeStage.SUCCEEDED, false, '0', '', 10);
      expect(diagnostic.degradeIfTimeout(fast).stage).assertEqual(ProbeStage.SUCCEEDED);
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
      const ok = buildResult(ProbeStage.SUCCEEDED, true, '0', '', 1);
      const no = buildResult(ProbeStage.SUCCEEDED, false, '0', '', 1);
      const unsupported = buildResult(ProbeStage.UNSUPPORTED, null, '801', '', 1);
      const failed = buildResult(ProbeStage.FAILED, null, '16000050', '', 1);
      expect(checkConsistency(ok, no)).assertTrue();
      expect(checkConsistency(unsupported, unsupported)).assertTrue();
      expect(checkConsistency(ok, failed)).assertFalse();
      expect(conclusionOf(ProbeStage.SUCCEEDED, true, '0')).assertEqual('返回已开启');
      expect(conclusionOf(ProbeStage.SUCCEEDED, false, '0')).assertEqual('返回未开启');
      expect(conclusionOf(ProbeStage.SUCCEEDED, null, '0')).assertEqual('调用成功但未返回明确状态');
      expect(conclusionOf(ProbeStage.TIMEOUT, null, 'TIMEOUT')).assertEqual('等待超时，可重试');
      expect(conclusionOf(ProbeStage.IDLE, null, '')).assertEqual('尚未执行');
      expect(conclusionOf(ProbeStage.RUNNING, null, '')).assertEqual('正在调用');
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
      const phone = deriveQuery(18, 'phone', true, true, false);
      expect(phone.deviceForm).assertEqual(DeviceForm.PHONE);
      expect(phone.flavor).assertEqual(SystemFlavor.OPEN_HARMONY);
      const tv = deriveQuery(18, 'tv', false, false, true);
      expect(tv.deviceForm).assertEqual(DeviceForm.TV);
      expect(tv.flavor).assertEqual(SystemFlavor.HARMONY_OS);
      const unknown = deriveQuery(9, 'car', true, false, false);
      expect(unknown.deviceForm).assertEqual(DeviceForm.UNKNOWN);
      expect(evaluateCapability(unknown).rule !== undefined).assertTrue();
    });
  });
}
