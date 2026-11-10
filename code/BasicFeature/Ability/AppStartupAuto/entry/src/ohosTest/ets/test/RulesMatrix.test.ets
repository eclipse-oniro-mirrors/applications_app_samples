/**
 * 能力矩阵、错误目录、状态机与回访规则的矩阵用例。
 *
 * 所有断言都引用主代码导出的规则表与函数，测试内不复制业务常量。
 */
import { describe, expect, it } from '@ohos/hypium';
import {
  CAPABILITY_RULES, CapabilityEvaluation, CapabilityQuery, CapabilityVerdict, DeviceForm,
  SystemFlavor, canSetInApp, evaluateCapability, isDefinitelyUnsupported, needsSettingsGuidance,
  ruleSummaries, verdictSeries
} from '../../../main/ets/autostart/rules/CapabilityMatrix';
import {
  ERROR_CATALOG, ErrorEntry, ErrorOwner, allowsAutoRetry, describeError, groupByOwner,
  isUnsupportedCode, logLineOf, needsSettingsForError, requiresUserActionFirst, tallyCodes
} from '../../../main/ets/autostart/rules/ErrorCatalog';
import {
  REVISIT_TIMEOUT_MS, RevisitComparison, RevisitSession, RevisitStage, RevisitTracker,
  compareSamples, isComparableRecord, valueText
} from '../../../main/ets/autostart/revisit/RevisitTracker';
import {
  EXPORT_ROW_LIMIT, SENSITIVE_KEYS, clip, clockText, compact, countByOutcome, dateTimeText,
  durationText, elapsedSince, exportable, isBlank, isKnownOutcome, isKnownSource, isSensitiveKey,
  latestRecords, maskToken, outcomeLabel, ratioPercent, selectForExport, sourceLabel, toCsv,
  toMarkdown
} from '../../../main/ets/autostart/tools/DiagnosticTools';
import { QueryOutcome, QueryPhase, QueryRecord, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';

const ALL_FORMS: DeviceForm[] = [DeviceForm.PHONE, DeviceForm.TABLET, DeviceForm.TV,
  DeviceForm.WEARABLE, DeviceForm.UNKNOWN];
const ALL_FLAVORS: SystemFlavor[] = [SystemFlavor.OPEN_HARMONY, SystemFlavor.HARMONY_OS,
  SystemFlavor.UNKNOWN];

function queryOf(api: number, form: DeviceForm, flavor: SystemFlavor, granted: boolean = true,
  entry: boolean = true): CapabilityQuery {
  return new CapabilityQuery(api, form, flavor, granted, entry);
}

function recordOf(id: number, timestamp: number, result: string,
  outcome: QueryOutcome): QueryRecord {
  const record: QueryRecord = new QueryRecord();
  record.id = id;
  record.timestamp = timestamp;
  record.source = RefreshSource.MANUAL;
  record.result = result;
  record.supportResult = 'true';
  record.statusResult = result;
  record.outcome = outcome;
  record.durationMillis = 12;
  return record;
}

export default function rulesMatrixTests(): void {
  describe('CapabilityMatrixRules', (): void => {
    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0100
     * @tc.name      testCapabilityMatrixRules0001
     * @tc.desc      Verify below api9 is system update for every form
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0001', 0, (): void => {
      ALL_FORMS.forEach((form: DeviceForm): void => {
        ALL_FLAVORS.forEach((flavor: SystemFlavor): void => {
          for (let api = 0; api <= 8; api++) {
            const evaluation: CapabilityEvaluation = evaluateCapability(queryOf(api, form, flavor));
            expect(evaluation.verdict).assertEqual(CapabilityVerdict.NEED_SYSTEM_UPDATE);
            expect(evaluation.rule !== undefined).assertTrue();
            expect(isDefinitelyUnsupported(evaluation.verdict)).assertTrue();
            expect(canSetInApp(evaluation)).assertFalse();
          }
        });
      });
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0200
     * @tc.name      testCapabilityMatrixRules0002
     * @tc.desc      Verify api9 to11 open harmony phone and tablet are supported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0002', 0, (): void => {
      const forms: DeviceForm[] = [DeviceForm.PHONE, DeviceForm.TABLET];
      forms.forEach((form: DeviceForm): void => {
        for (let api = 9; api <= 11; api++) {
          const evaluation = evaluateCapability(
            queryOf(api, form, SystemFlavor.OPEN_HARMONY, true, true));
          expect(evaluation.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
          expect(evaluation.downgradedByPermission).assertFalse();
          expect(canSetInApp(evaluation)).assertFalse();
          expect(needsSettingsGuidance(evaluation)).assertTrue();
        }
      });
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0300
     * @tc.name      testCapabilityMatrixRules0003
     * @tc.desc      Verify api9 to11 harmony os requires permission
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0003', 0, (): void => {
      for (let api = 9; api <= 11; api++) {
        const denied = evaluateCapability(
          queryOf(api, DeviceForm.PHONE, SystemFlavor.HARMONY_OS, false, true));
        expect(denied.verdict).assertEqual(CapabilityVerdict.NEED_PERMISSION);
        expect(denied.downgradedByPermission).assertTrue();
        expect(denied.rule !== undefined && denied.rule?.requiresPermission).assertTrue();
        const granted = evaluateCapability(
          queryOf(api, DeviceForm.PHONE, SystemFlavor.HARMONY_OS, true, true));
        expect(granted.verdict).assertEqual(CapabilityVerdict.NEED_PERMISSION);
        expect(granted.downgradedByPermission).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0400
     * @tc.name      testCapabilityMatrixRules0004
     * @tc.desc      Verify wearable is excluded until api18
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0004', 0, (): void => {
      for (let api = 9; api <= 17; api++) {
        ALL_FLAVORS.forEach((flavor: SystemFlavor): void => {
          const evaluation = evaluateCapability(queryOf(api, DeviceForm.WEARABLE, flavor));
          expect(evaluation.verdict).assertEqual(CapabilityVerdict.DEVICE_EXCLUDED);
          expect(isDefinitelyUnsupported(evaluation.verdict)).assertTrue();
        });
      }
      expect(ALL_FORMS.indexOf(DeviceForm.WEARABLE) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0500
     * @tc.name      testCapabilityMatrixRules0005
     * @tc.desc      Verify tv is excluded only before api12
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0005', 0, (): void => {
      for (let api = 9; api <= 11; api++) {
        const evaluation = evaluateCapability(
          queryOf(api, DeviceForm.TV, SystemFlavor.OPEN_HARMONY));
        expect(evaluation.verdict).assertEqual(CapabilityVerdict.DEVICE_EXCLUDED);
      }
      for (let api = 12; api <= 13; api++) {
        const open = evaluateCapability(queryOf(api, DeviceForm.TV, SystemFlavor.OPEN_HARMONY));
        expect(open.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
        const harmony = evaluateCapability(queryOf(api, DeviceForm.TV, SystemFlavor.HARMONY_OS));
        expect(harmony.verdict).assertEqual(CapabilityVerdict.NEED_PERMISSION);
      }
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0600
     * @tc.name      testCapabilityMatrixRules0006
     * @tc.desc      Verify api14 to17 phone tablet tv are supported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0006', 0, (): void => {
      const forms: DeviceForm[] = [DeviceForm.PHONE, DeviceForm.TABLET, DeviceForm.TV];
      for (let api = 14; api <= 17; api++) {
        forms.forEach((form: DeviceForm): void => {
          ALL_FLAVORS.forEach((flavor: SystemFlavor): void => {
            const evaluation = evaluateCapability(queryOf(api, form, flavor));
            expect(evaluation.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
            expect(canSetInApp(evaluation)).assertTrue();
            expect(needsSettingsGuidance(evaluation)).assertFalse();
          });
        });
      }
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0700
     * @tc.name      testCapabilityMatrixRules0007
     * @tc.desc      Verify api18 and above supports every form
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0007', 0, (): void => {
      for (let api = 18; api <= 26; api++) {
        ALL_FORMS.forEach((form: DeviceForm): void => {
          const evaluation = evaluateCapability(queryOf(api, form, SystemFlavor.OPEN_HARMONY));
          expect(evaluation.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
          expect(canSetInApp(evaluation)).assertTrue();
        });
      }
      expect(canSetInApp(evaluateCapability(queryOf(26, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY)))).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0800
     * @tc.name      testCapabilityMatrixRules0008
     * @tc.desc      Verify beyond verified api is unknown not supported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0008', 0, (): void => {
      for (let api = 27; api <= 30; api++) {
        const evaluation = evaluateCapability(queryOf(api, DeviceForm.PHONE,
          SystemFlavor.OPEN_HARMONY));
        expect(evaluation.verdict).assertEqual(CapabilityVerdict.UNKNOWN);
        expect(canSetInApp(evaluation)).assertFalse();
        expect(isDefinitelyUnsupported(evaluation.verdict)).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0900
     * @tc.name      testCapabilityMatrixRules0009
     * @tc.desc      Verify matrix has no gap between api8 and26
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0009', 0, (): void => {
      let evaluated = 0;
      const realForms: DeviceForm[] = [DeviceForm.PHONE, DeviceForm.TABLET, DeviceForm.TV,
        DeviceForm.WEARABLE];
      for (let api = 8; api <= 26; api++) {
        realForms.forEach((form: DeviceForm): void => {
          ALL_FLAVORS.forEach((flavor: SystemFlavor): void => {
            const evaluation = evaluateCapability(queryOf(api, form, flavor));
            expect(evaluation.rule !== undefined).assertTrue();
            evaluated++;
          });
        });
      }
      expect(evaluated).assertEqual(19 * 4 * 3);
      expect(evaluated > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_1000
     * @tc.name      testCapabilityMatrixRules0010
     * @tc.desc      Verify unknown flavor is never assumed supported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0010', 0, (): void => {
      for (let api = 9; api <= 13; api++) {
        const evaluation = evaluateCapability(queryOf(api, DeviceForm.PHONE, SystemFlavor.UNKNOWN));
        expect(evaluation.verdict).assertEqual(CapabilityVerdict.UNKNOWN);
        expect(canSetInApp(evaluation)).assertFalse();
        expect(isDefinitelyUnsupported(evaluation.verdict)).assertFalse();
      }
      const later = evaluateCapability(queryOf(18, DeviceForm.PHONE, SystemFlavor.UNKNOWN));
      expect(later.verdict).assertEqual(CapabilityVerdict.SUPPORTED);
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_1100
     * @tc.name      testCapabilityMatrixRules0011
     * @tc.desc      Verify rule ids are unique and ordered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testCapabilityMatrixRules0011', 0, (): void => {
      const seen: string[] = [];
      let previousMax = -1;
      CAPABILITY_RULES.forEach((rule) => {
        expect(seen.indexOf(rule.ruleId) < 0).assertTrue();
        seen.push(rule.ruleId);
        expect(rule.minApi >= previousMax || rule.minApi === 9).assertTrue();
        expect(rule.maxApi >= rule.minApi).assertTrue();
        expect(rule.developerHint.length > 0).assertTrue();
        expect(rule.userHint.length > 0).assertTrue();
        previousMax = rule.minApi;
      });
      expect(seen.length).assertEqual(CAPABILITY_RULES.length);
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_1200
     * @tc.name      testCapabilityMatrixRules0012
     * @tc.desc      Verify summaries and verdict series cover full range
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0012', 0, (): void => {
      const summaries: string[] = ruleSummaries();
      expect(summaries.length).assertEqual(CAPABILITY_RULES.length);
      summaries.forEach((line: string): void => {
        expect(line.indexOf('API') >= 0).assertTrue();
        expect(line.indexOf('：') > 0).assertTrue();
      });
      const series = verdictSeries(DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY, true, true);
      expect(series.length).assertEqual(21);
      expect(series[0]).assertEqual(CapabilityVerdict.NEED_SYSTEM_UPDATE);
      expect(series[26 - 8]).assertEqual(CapabilityVerdict.SUPPORTED);
      expect(series[series.length - 1]).assertEqual(CapabilityVerdict.UNKNOWN);
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_1300
     * @tc.name      testCapabilityMatrixRules0013
     * @tc.desc      Verify query key and clone are stable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0013', 0, (): void => {
      const query = queryOf(18, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY, true, true);
      const clone = query.clone();
      expect(clone.key()).assertEqual(query.key());
      clone.apiLevel = 19;
      expect(clone.key() === query.key()).assertFalse();
      expect(query.apiLevel).assertEqual(18);
      expect(evaluateCapability(query).summary().indexOf('supported') >= 0).assertTrue();
      expect(evaluateCapability(query).developerHint().length > 0).assertTrue();
      expect(evaluateCapability(query).userHint().length > 0).assertTrue();
    });
  });

  describe('ErrorCatalogRules', (): void => {
    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGRULES_0100
     * @tc.name      testErrorCatalogRules0001
     * @tc.desc      Verify every catalog entry is complete
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testErrorCatalogRules0001', 0, (): void => {
      expect(ERROR_CATALOG.length > 10).assertTrue();
      const codes: string[] = [];
      ERROR_CATALOG.forEach((entry: ErrorEntry): void => {
        expect(entry.code.length > 0).assertTrue();
        expect(entry.name.length > 0).assertTrue();
        expect(entry.message.length > 0).assertTrue();
        expect(entry.hint.length > 0).assertTrue();
        expect(codes.indexOf(entry.code) < 0).assertTrue();
        codes.push(entry.code);
      });
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGRULES_0200
     * @tc.name      testErrorCatalogRules0002
     * @tc.desc      Verify lookup falls back to unknown without throwing
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogRules0002', 0, (): void => {
      expect(describeError('201').code).assertEqual('201');
      expect(describeError(' 201 ').code).assertEqual('201');
      expect(describeError('not-a-code').code).assertEqual('UNKNOWN');
      expect(describeError('').code).assertEqual('UNKNOWN');
      expect(describeError('not-a-code').unsupported).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGRULES_0300
     * @tc.name      testErrorCatalogRules0003
     * @tc.desc      Verify unsupported and permission codes keep semantics
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogRules0003', 0, (): void => {
      expect(isUnsupportedCode('801')).assertTrue();
      expect(isUnsupportedCode('201')).assertFalse();
      expect(needsSettingsForError('201')).assertTrue();
      expect(needsSettingsForError('801')).assertFalse();
      expect(allowsAutoRetry('16000050')).assertTrue();
      expect(allowsAutoRetry('801')).assertFalse();
      expect(requiresUserActionFirst('201')).assertTrue();
      expect(requiresUserActionFirst('0')).assertFalse();
      expect(logLineOf('801', 'probe').indexOf('801') >= 0).assertTrue();
      expect(logLineOf('801', '').indexOf('｜') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGRULES_0400
     * @tc.name      testErrorCatalogRules0004
     * @tc.desc      Verify tally separates unsupported failure and timeout
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogRules0004', 0, (): void => {
      const tally = tallyCodes(['0', '', '801', '201', '16000050', 'TIMEOUT', 'weird', 'timeout']);
      expect(tally.succeeded).assertEqual(2);
      expect(tally.unsupported).assertEqual(1);
      expect(tally.failed).assertEqual(2);
      expect(tally.timeout).assertEqual(2);
      expect(tally.unknown).assertEqual(1);
      expect(tally.total()).assertEqual(8);
      expect(tally.summary().indexOf('超时 2') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGRULES_0500
     * @tc.name      testErrorCatalogRules0005
     * @tc.desc      Verify group by owner buckets every owner
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogRules0005', 0, (): void => {
      const grouped = groupByOwner(['201', '801', '16000050', 'TIMEOUT', '201']);
      expect(grouped.get(ErrorOwner.USER)?.length).assertEqual(1);
      expect(grouped.get(ErrorOwner.SYSTEM)?.length).assertEqual(2);
      expect(grouped.get(ErrorOwner.ENVIRONMENT)?.length).assertEqual(1);
      expect(grouped.get(ErrorOwner.APP)?.length).assertEqual(0);
    });
  });

  describe('RevisitRules', (): void => {
    /**
     * @tc.number    SUB_STARTUP_REVISITRULES_0100
     * @tc.name      testRevisitRules0001
     * @tc.desc      Verify full revisit produces comparison
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRules0001', 0, (): void => {
      const tracker = new RevisitTracker();
      const before = recordOf(1, 1000, '未开启', QueryOutcome.SUCCESS);
      const session: RevisitSession = tracker.begin(before, 2, 2000);
      expect(session.stage).assertEqual(RevisitStage.GUIDED);
      expect(session.guidanceRevision).assertEqual(2);
      expect(tracker.canGuide()).assertFalse();
      tracker.markLeft(3000);
      expect(tracker.isWaiting()).assertTrue();
      expect(tracker.remainingMillis(3000)).assertEqual(REVISIT_TIMEOUT_MS);
      tracker.markReturned(4000);
      const after = recordOf(2, 5000, '已开启', QueryOutcome.SUCCESS);
      const rechecked: RevisitSession = tracker.markRechecked(after, 6000);
      expect(rechecked.stage).assertEqual(RevisitStage.RECHECKED);
      expect(rechecked.conclusion.indexOf('状态已变化') >= 0).assertTrue();
      expect(tracker.isCompleted()).assertTrue();
      expect(tracker.conclusionText().indexOf('已开启') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITRULES_0200
     * @tc.name      testRevisitRules0002
     * @tc.desc      Verify expiry after timeout
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRules0002', 0, (): void => {
      const tracker = new RevisitTracker();
      tracker.begin(recordOf(1, 1000, '已开启', QueryOutcome.SUCCESS), 1, 2000);
      tracker.markLeft(2000);
      const notYet = tracker.checkExpiry(2000 + REVISIT_TIMEOUT_MS - 1);
      expect(notYet.stage).assertEqual(RevisitStage.LEFT);
      const expired = tracker.checkExpiry(2000 + REVISIT_TIMEOUT_MS);
      expect(expired.stage).assertEqual(RevisitStage.EXPIRED);
      expect(expired.conclusion.indexOf('10 分钟') >= 0).assertTrue();
      expect(tracker.isCompleted()).assertFalse();
      expect(tracker.canGuide()).assertTrue();
      expect(tracker.remainingMillis(9999)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITRULES_0300
     * @tc.name      testRevisitRules0003
     * @tc.desc      Verify cancel skips comparison
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRules0003', 0, (): void => {
      const tracker = new RevisitTracker();
      tracker.begin(recordOf(1, 1000, '未开启', QueryOutcome.SUCCESS), 1, 2000);
      const cancelled = tracker.cancel(2500);
      expect(cancelled.stage).assertEqual(RevisitStage.CANCELLED);
      expect(cancelled.cancelled).assertTrue();
      expect(cancelled.conclusion).assertEqual('用户取消，未做判断');
      expect(tracker.isCompleted()).assertFalse();
      expect(tracker.sourceForRecord()).assertEqual(RefreshSource.SETTINGS);
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITRULES_0400
     * @tc.name      testRevisitRules0004
     * @tc.desc      Verify invalid order does not advance
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRules0004', 0, (): void => {
      const tracker = new RevisitTracker();
      tracker.begin(undefined, 1, 2000);
      const returned = tracker.markReturned(3000);
      expect(returned.stage).assertEqual(RevisitStage.GUIDED);
      expect(tracker.notice().indexOf('不接受返回事件') >= 0).assertTrue();
      tracker.markLeft(4000);
      const leftAgain = tracker.markLeft(5000);
      expect(leftAgain.leftAt).assertEqual(4000);
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITRULES_0500
     * @tc.name      testRevisitRules0005
     * @tc.desc      Verify comparison refuses non success samples
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRules0005', 0, (): void => {
      const failed = recordOf(1, 1000, '未获取', QueryOutcome.FAILURE);
      const unsupported = recordOf(2, 2000, '', QueryOutcome.UNSUPPORTED);
      expect(isComparableRecord(undefined)).assertFalse();
      expect(isComparableRecord(failed)).assertFalse();
      const missingBefore: RevisitComparison = compareSamples(undefined, unsupported);
      expect(missingBefore.comparable).assertFalse();
      expect(missingBefore.reason).assertEqual('缺少离开前样本');
      const bothBad = compareSamples(failed, unsupported);
      expect(bothBad.comparable).assertFalse();
      expect(bothBad.reason.indexOf('不可比') >= 0).assertTrue();
      expect(bothBad.summary().indexOf('无法比较') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITRULES_0600
     * @tc.name      testRevisitRules0006
     * @tc.desc      Verify unchanged state is reported as unchanged
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRules0006', 0, (): void => {
      const before = recordOf(1, 1000, '已开启', QueryOutcome.SUCCESS);
      const after = recordOf(2, 4000, '已开启', QueryOutcome.SUCCESS);
      const comparison = compareSamples(before, after);
      expect(comparison.comparable).assertTrue();
      expect(comparison.changed).assertFalse();
      expect(comparison.elapsed).assertEqual(3000);
      expect(comparison.summary().indexOf('状态未变化') >= 0).assertTrue();
      expect(valueText(null)).assertEqual('未获取');
      expect(valueText(true)).assertEqual('已开启');
      expect(valueText(false)).assertEqual('未开启');
    });
  });

  describe('DiagnosticToolRules', (): void => {
    /**
     * @tc.number    SUB_STARTUP_DIAGNOSTICTOOLRULES_0100
     * @tc.name      testDiagnosticToolRules0001
     * @tc.desc      Verify clip and compact keep bounds
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDiagnosticToolRules0001', 0, (): void => {
      expect(clip('abc').length).assertEqual(3);
      const long: string = 'x'.repeat(600);
      expect(clip(long).length).assertEqual(512);
      expect(clip(long).endsWith('…')).assertTrue();
      expect(clip('a\r\nb').indexOf('\r')).assertEqual(-1);
      expect(compact('  a   b  ')).assertEqual('a b');
      expect(isBlank('   ')).assertTrue();
      expect(isBlank('a')).assertFalse();
      expect(durationText(500)).assertEqual('500 ms');
      expect(durationText(1500)).assertEqual('1.50 s');
      expect(durationText(-1)).assertEqual('未知耗时');
    });

    /**
     * @tc.number    SUB_STARTUP_DIAGNOSTICTOOLRULES_0200
     * @tc.name      testDiagnosticToolRules0002
     * @tc.desc      Verify time formatting handles invalid input
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDiagnosticToolRules0002', 0, (): void => {
      expect(clockText(0)).assertEqual('--:--:--');
      expect(clockText(Number.NaN)).assertEqual('--:--:--');
      expect(dateTimeText(0)).assertEqual('未知时间');
      const fixed: number = new Date(2026, 0, 2, 3, 4, 5).getTime();
      expect(clockText(fixed)).assertEqual('03:04:05');
      expect(dateTimeText(fixed)).assertEqual('01-02 03:04:05');
      expect(elapsedSince(100, 50)).assertEqual(0);
      expect(elapsedSince(100, 160)).assertEqual(60);
      expect(ratioPercent(1, 3)).assertEqual(33.3);
      expect(ratioPercent(1, 0)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_DIAGNOSTICTOOLRULES_0300
     * @tc.name      testDiagnosticToolRules0003
     * @tc.desc      Verify masking covers sensitive keys
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDiagnosticToolRules0003', 0, (): void => {
      expect(maskToken('')).assertEqual('');
      expect(maskToken('abc')).assertEqual('***');
      const masked: string = maskToken('abcdefgh');
      expect(masked.startsWith('ab')).assertTrue();
      expect(masked.endsWith('gh')).assertTrue();
      expect(masked.indexOf('cd')).assertEqual(-1);
      expect(SENSITIVE_KEYS.length > 5).assertTrue();
      expect(isSensitiveKey('DEVICE_ID')).assertTrue();
      expect(isSensitiveKey('userToken')).assertTrue();
      expect(isSensitiveKey('count')).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_DIAGNOSTICTOOLRULES_0400
     * @tc.name      testDiagnosticToolRules0004
     * @tc.desc      Verify labels and validators match enums
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDiagnosticToolRules0004', 0, (): void => {
      expect(outcomeLabel(QueryOutcome.SUCCESS)).assertEqual('成功');
      expect(outcomeLabel(QueryOutcome.FAILURE)).assertEqual('失败');
      expect(outcomeLabel(QueryOutcome.UNSUPPORTED)).assertEqual('不支持');
      expect(outcomeLabel(QueryOutcome.TIMEOUT)).assertEqual('超时');
      expect(outcomeLabel(QueryOutcome.UNKNOWN)).assertEqual('未知');
      expect(sourceLabel(RefreshSource.SETTINGS)).assertEqual('设置后查询');
      expect(sourceLabel(RefreshSource.FOREGROUND)).assertEqual('返回前台');
      expect(isKnownOutcome('success')).assertTrue();
      expect(isKnownOutcome('done')).assertFalse();
      expect(isKnownSource('设置后查询')).assertTrue();
      expect(isKnownSource('unknown')).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_DIAGNOSTICTOOLRULES_0500
     * @tc.name      testDiagnosticToolRules0005
     * @tc.desc      Verify export selects valid rows and escapes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDiagnosticToolRules0005', 0, (): void => {
      const rows: QueryRecord[] = [];
      for (let index = 1; index <= 210; index++) {
        rows.push(recordOf(index, 1000 + index, index % 2 === 0 ? '已开启' : '未开启',
          QueryOutcome.SUCCESS));
      }
      expect(selectForExport(rows).length).assertEqual(EXPORT_ROW_LIMIT);
      expect(latestRecords(rows, 3).length).assertEqual(3);
      expect(latestRecords(rows, 0).length).assertEqual(0);
      expect(exportable(rows[0])).assertTrue();
      const broken = new QueryRecord();
      expect(exportable(broken)).assertFalse();
      const csv: string = toCsv(rows);
      expect(csv.split('\n').length).assertEqual(EXPORT_ROW_LIMIT + 1);
      expect(csv.startsWith('id,时间')).assertTrue();
      const markdown: string = toMarkdown(rows);
      expect(markdown.split('\n').length).assertEqual(EXPORT_ROW_LIMIT + 2);
      expect(markdown.indexOf('|---') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_DIAGNOSTICTOOLRULES_0600
     * @tc.name      testDiagnosticToolRules0006
     * @tc.desc      Verify outcome counts are exhaustive
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDiagnosticToolRules0006', 0, (): void => {
      const rows: QueryRecord[] = [
        recordOf(1, 10, 'a', QueryOutcome.SUCCESS),
        recordOf(2, 20, 'b', QueryOutcome.SUCCESS),
        recordOf(3, 30, 'c', QueryOutcome.FAILURE),
        recordOf(4, 40, 'd', QueryOutcome.TIMEOUT)
      ];
      const counts = countByOutcome(rows);
      expect(counts.get(QueryOutcome.SUCCESS)).assertEqual(2);
      expect(counts.get(QueryOutcome.FAILURE)).assertEqual(1);
      expect(counts.get(QueryOutcome.TIMEOUT)).assertEqual(1);
      let total = 0;
      counts.forEach((value: number): void => {
        total += value;
      });
      expect(total).assertEqual(rows.length);
    });
  });
}
