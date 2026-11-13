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
import { CSV_BOM, ReportFormat, ReportMeta, exportReport } from '../../../main/ets/core/report/ReportExport';
import { ExperimentSeriesState, SeriesPhase } from '../../../main/ets/core/ExperimentSeries';
import { SAMPLING_PROTOCOL, fieldsOfRecord, fingerprintOf } from '../../../main/ets/core/report/ConditionFingerprint';
import { formatMessage, message, withTextResourceResolver } from '../../../main/ets/core/TextMessages';
import { restoreRecords } from '../../../main/ets/core/ExperimentLedger';
import { buildSeriesPanelView } from '../../../main/ets/core/SeriesPresentation';
import { displayResourcePreview } from '../../../main/ets/core/UiText';
import { waveRecord } from '../support/PerformanceWaveOneFixtures';
import { TestMessageResolver, withTestMessages } from '../support/TestMessageResolver';
import { loggedIt as it, traceParameter } from '../support/TestLog';

export default function localeContractTests(): void {
  describe('LocaleContracts', (): void => {
    /** @tc.number SUB_PERFORMANCE_LOCALECONTRACTS_0100
     * @tc.name testLocaleContracts0001
     * Single-pass substitution never reinterprets braces supplied as payload data.
     */
    it('testLocaleContracts0001', 0, (): void => {
      const text = formatMessage('{0} / %2$s', ['{1}', 'tail']);
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0001 actual', text))
        .assertEqual(traceParameter('com.samples.appperformance_LocaleContracts_0001 expected', '{1} / tail'));
      const original = message('ap_series_references', [2, 3, 1]);
      withTestMessages('en', (): void => {
        const outer = message('ap_series_references', [2, 3, 1]);
        let caught: boolean = false;
        try {
          withTextResourceResolver(new TestMessageResolver('zh_CN'), (): void => {
            throw new Error('locale-scope-fixture-failure');
          });
        } catch (error) {
          if ((error as Error).message !== 'locale-scope-fixture-failure') { throw error as Error; }
          caught = true;
        }
        expect(traceParameter('com.samples.appperformance_LocaleContracts_0001 scopeThrows', caught)).assertTrue();
        expect(traceParameter('com.samples.appperformance_LocaleContracts_0001 innerRestored',
          message('ap_series_references', [2, 3, 1])))
          .assertEqual(traceParameter('com.samples.appperformance_LocaleContracts_0001 outerProvider', outer));
      });
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0001 outerRestored',
        message('ap_series_references', [2, 3, 1])))
        .assertEqual(traceParameter('com.samples.appperformance_LocaleContracts_0001 originalProvider', original));
    });

    /** @tc.number SUB_PERFORMANCE_LOCALECONTRACTS_0200
     * @tc.name testLocaleContracts0002
     * Explicit locale providers translate a dynamic message without losing its numeric arguments.
     */
    it('testLocaleContracts0002', 0, (): void => {
      const english = withTestMessages('en', (): string => message('ap_series_references', [2, 3, 1]));
      const chinese = withTestMessages('zh_CN', (): string => message('ap_series_references', [2, 3, 1]));
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0002 localesDiffer', english !== chinese)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0002 arguments', english.indexOf('2') >= 0 &&
        chinese.indexOf('3') >= 0 && !/\{[0-9]+\}/.test(english))).assertTrue();
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0002 actual', chinese))
        .assertEqual(traceParameter('com.samples.appperformance_LocaleContracts_0002 expected', '可用 2 / 3 条，缺失 1 条'));
    });

    /** @tc.number SUB_PERFORMANCE_LOCALECONTRACTS_0300
     * @tc.name testLocaleContracts0003
     * Locale changes do not alter a nonempty condition fingerprint or its canonical protocol.
     */
    it('testLocaleContracts0003', 0, (): void => {
      const record = waveRecord('EXP-LOCALE-3');
      record.condition = JSON.stringify(['locale-board · locale-os', '2.0', true, 'W-TEXT', 'sample.txt', [], [], []]);
      const serialized = JSON.stringify(record);
      const first = withTestMessages('en', () => fieldsOfRecord(record));
      const english = withTestMessages('en', (): string => fingerprintOf(first));
      const chinese = withTestMessages('zh_CN', (): string => fingerprintOf(fieldsOfRecord(record)));
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0003 nonempty', english.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0003 actual', chinese))
        .assertEqual(traceParameter('com.samples.appperformance_LocaleContracts_0003 expected', english));
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0003 protocol', first.protocol))
        .assertEqual(traceParameter('com.samples.appperformance_LocaleContracts_0003 expectedProtocol', SAMPLING_PROTOCOL));
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0003 record', JSON.stringify(record)))
        .assertEqual(traceParameter('com.samples.appperformance_LocaleContracts_0003 originalRecord', serialized));
    });

    /** @tc.number SUB_PERFORMANCE_LOCALECONTRACTS_0400
     * @tc.name testLocaleContracts0004
     * English rendering does not rewrite historical stage/integrity values or restore eligibility.
     */
    it('testLocaleContracts0004', 0, (): void => {
      const record = waveRecord('EXP-LOCALE-4');
      const serialized = JSON.stringify(record);
      const restored = withTestMessages('en', () => restoreRecords([JSON.parse(serialized) as Object]));
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0004 restoredCount', restored.length))
        .assertEqual(traceParameter('com.samples.appperformance_LocaleContracts_0004 expectedCount', 1));
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0004 complete', restored[0].complete())).assertTrue();
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0004 integrity', restored[0].integrity))
        .assertEqual(traceParameter('com.samples.appperformance_LocaleContracts_0004 historicalIntegrity', '一致'));
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0004 stage', restored[0].stages[0].status))
        .assertEqual(traceParameter('com.samples.appperformance_LocaleContracts_0004 historicalStage', '成功'));
    });

    /** @tc.number SUB_PERFORMANCE_LOCALECONTRACTS_0500
     * @tc.name testLocaleContracts0005
     * Both languages produce validated Markdown/CSV while preserving BOM and credential redaction.
     */
    it('testLocaleContracts0005', 0, (): void => {
      const record = waveRecord('EXP-LOCALE-5');
      record.condition = JSON.stringify(['locale-board · locale-os', '2.0', true, 'W-TEXT', 'sample.txt', [], [], []]);
      const meta = new ReportMeta('Locale report', 1700000100000, '', 'token=fixture-secret');
      for (const language of ['en', 'zh_CN']) {
        withTestMessages(language, (): void => {
          const markdown = exportReport([record], meta, ReportFormat.MARKDOWN);
          const csv = exportReport([record], meta, ReportFormat.CSV);
          expect(traceParameter('com.samples.appperformance_LocaleContracts_0005 markdownValid', markdown.ok)).assertTrue();
          expect(traceParameter('com.samples.appperformance_LocaleContracts_0005 csvValid', csv.ok)).assertTrue();
          expect(traceParameter('com.samples.appperformance_LocaleContracts_0005 bom', csv.text.startsWith(CSV_BOM))).assertTrue();
          expect(traceParameter('com.samples.appperformance_LocaleContracts_0005 redacted',
            markdown.text.indexOf('fixture-secret') < 0 && csv.text.indexOf('fixture-secret') < 0)).assertTrue();
        });
      }
    });

    /** @tc.number SUB_PERFORMANCE_LOCALECONTRACTS_0600
     * @tc.name testLocaleContracts0006
     * Error styling follows semantic flags, not a substring in the translated phase text.
     */
    it('testLocaleContracts0006', 0, (): void => {
      const series = new ExperimentSeriesState();
      series.phase = SeriesPhase.SAVE_FAILED;
      series.saveState = 'failed';
      const serialized = JSON.stringify(series);
      const english = withTestMessages('en', () => buildSeriesPanelView(series, []));
      const chinese = withTestMessages('zh_CN', () => buildSeriesPanelView(series, []));
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0006 semanticFlags',
        english.phaseFailed && english.saveFailed && chinese.phaseFailed && chinese.saveFailed)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0006 localized', english.phaseText !== chinese.phaseText)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0006 canonical', JSON.stringify(series)))
        .assertEqual(traceParameter('com.samples.appperformance_LocaleContracts_0006 originalCanonical', serialized));
    });

    /** @tc.number SUB_PERFORMANCE_LOCALECONTRACTS_0700
     * @tc.name testLocaleContracts0007
     * A workload preview remains opaque even when its body equals a known legacy status.
     */
    it('testLocaleContracts0007', 0, (): void => {
      const preview = withTestMessages('en', (): string => displayResourcePreview(undefined, '3 字节 · 成功'));
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0007 opaqueBody', preview.endsWith('成功'))).assertTrue();
      expect(traceParameter('com.samples.appperformance_LocaleContracts_0007 byteCount', preview.indexOf('3') >= 0)).assertTrue();
    });
  });
}
