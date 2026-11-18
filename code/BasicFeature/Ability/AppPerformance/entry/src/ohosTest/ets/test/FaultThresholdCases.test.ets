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

import { traceParameter } from '../support/TestLog';
import { describe, expect } from '@ohos/hypium';
import { boundedIt as it } from '../support/BoundedCase';
import {
  Limit, MetricSample, THRESHOLD_CATALOG, ThresholdEntry, ThresholdLevel, auditThresholds,
  catalogKeys, entriesOfKind, entriesOfLevel, entryOf, entryOfKey, evaluateMust, evaluateThresholds,
  kindLines, levelLines, limitText, samplesOfRun, thresholdLines, unitText, ThresholdKind,
  ThresholdUnit
} from '../../../main/ets/core/ThresholdCatalog';
import { StepKind } from '../../../main/ets/core/MaintenancePlan';

function passingSamples(): MetricSample[] {
  return THRESHOLD_CATALOG.map((entry: ThresholdEntry): MetricSample =>
    new MetricSample(entry.key, entry.value));
}

export default function faultThresholdCasesTest(): void {

  describe('ThresholdCatalogCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDCATALOGCASES_0100
     * @tc.name      testThresholdCatalogCases0001
     * @tc.desc      Verify catalog is consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testThresholdCatalogCases0001', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:44 assertEqual actual', THRESHOLD_CATALOG.length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:44 assertEqual expected', 24));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:45 assertEqual actual', catalogKeys().length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:45 assertEqual expected', 24));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:46 assertEqual actual', thresholdLines().length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:46 assertEqual expected', 24));
      const audit = auditThresholds();
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:48 assertEqual actual', audit.findings.length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:48 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:49 assertTrue actual', audit.ok)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:50 assertEqual actual', audit.summary())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:50 assertEqual expected', '阈值目录自洽'));
      THRESHOLD_CATALOG.forEach((entry): void => {
        expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:52 assertTrue actual', entry.key.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:53 assertTrue actual', entry.rationale.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:54 assertTrue actual', entry.value >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:55 assertTrue actual', entry.text().indexOf(entry.entryId) === 0)).assertTrue();
      });
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:57 assertEqual actual', entryOf('TH-99'))).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:57 assertEqual expected', undefined));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:58 assertEqual actual', entryOfKey('run.total.ms')?.value)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0001 FaultThresholdCases.test:58 assertEqual expected', 6000));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDCATALOGCASES_0200
     * @tc.name      testThresholdCatalogCases0002
     * @tc.desc      Verify level and kind distribution
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdCatalogCases0002', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:71 assertEqual actual', entriesOfLevel(ThresholdLevel.MUST).length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:71 assertEqual expected', 16));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:72 assertEqual actual', entriesOfLevel(ThresholdLevel.SHOULD).length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:72 assertEqual expected', 6));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:73 assertEqual actual', entriesOfLevel(ThresholdLevel.INFO).length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:73 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:74 assertEqual actual', entriesOfKind(ThresholdKind.LATENCY).length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:74 assertEqual expected', 18));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:75 assertEqual actual', entriesOfKind(ThresholdKind.COUNT).length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:75 assertEqual expected', 3));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:76 assertEqual actual', entriesOfKind(ThresholdKind.RATIO).length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:76 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:77 assertEqual actual', entriesOfKind(ThresholdKind.SIZE).length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:77 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:78 assertEqual actual', levelLines().length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:78 assertEqual expected', 3));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:79 assertEqual actual', kindLines().length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:79 assertEqual expected', 4));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:80 assertEqual actual', limitText(Limit.AT_MOST))).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:80 assertEqual expected', '不超过'));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:81 assertEqual actual', unitText(ThresholdUnit.MILLIS))).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0002 FaultThresholdCases.test:81 assertEqual expected', 'ms'));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDCATALOGCASES_0300
     * @tc.name      testThresholdCatalogCases0003
     * @tc.desc      Verify passing samples report all green
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdCatalogCases0003', 0, (): void => {
      const report = evaluateThresholds(passingSamples());
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:95 assertEqual actual', report.results.length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:95 assertEqual expected', 24));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:96 assertEqual actual', report.passed())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:96 assertEqual expected', 24));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:97 assertEqual actual', report.failed())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:97 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:98 assertEqual actual', report.missing())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:98 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:99 assertEqual actual', report.criticalFailures())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:99 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:100 assertEqual actual', report.passRate())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:100 assertEqual expected', 100));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:101 assertEqual actual', report.headline())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:101 assertEqual expected', '全部达标'));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:102 assertEqual actual', report.failures().length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:102 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:103 assertEqual actual', report.text().split('\n').length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:103 assertEqual expected', 25));
      const must = evaluateMust(passingSamples());
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:105 assertEqual actual', must.results.length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:105 assertEqual expected', 16));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:106 assertEqual actual', must.passRate())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0003 FaultThresholdCases.test:106 assertEqual expected', 100));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDCATALOGCASES_0400
     * @tc.name      testThresholdCatalogCases0004
     * @tc.desc      Verify failed must entry is critical
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdCatalogCases0004', 0, (): void => {
      const samples: MetricSample[] = [];
      passingSamples().forEach((item: MetricSample): void => {
        samples.push(item.key === 'run.failed.count' ? new MetricSample(item.key, 1) : item);
      });
      const report = evaluateThresholds(samples);
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0004 FaultThresholdCases.test:124 assertEqual actual', report.failed())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0004 FaultThresholdCases.test:124 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0004 FaultThresholdCases.test:125 assertEqual actual', report.criticalFailures())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0004 FaultThresholdCases.test:125 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0004 FaultThresholdCases.test:126 assertEqual actual', report.headline())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0004 FaultThresholdCases.test:126 assertEqual expected', '1 项必达阈值未达成'));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0004 FaultThresholdCases.test:127 assertEqual actual', report.failures()[0].key)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0004 FaultThresholdCases.test:127 assertEqual expected', 'run.failed.count'));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0004 FaultThresholdCases.test:128 assertTrue actual', report.failures()[0].critical())).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0004 FaultThresholdCases.test:129 assertTrue actual', report.failures()[0].text().indexOf('未达标') > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0004 FaultThresholdCases.test:130 assertEqual actual', report.passRate())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0004 FaultThresholdCases.test:130 assertEqual expected', 95.8));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDCATALOGCASES_0500
     * @tc.name      testThresholdCatalogCases0005
     * @tc.desc      Verify missing samples are reported separately
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdCatalogCases0005', 0, (): void => {
      const report = evaluateThresholds([]);
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:144 assertEqual actual', report.missing())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:144 assertEqual expected', 24));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:145 assertEqual actual', report.passed())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:145 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:146 assertEqual actual', report.failed())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:146 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:147 assertEqual actual', report.criticalFailures())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:147 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:148 assertEqual actual', report.passRate())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:148 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:149 assertEqual actual', report.headline())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:149 assertEqual expected', '全部缺少观测值'));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:150 assertTrue actual', report.results[0].text().indexOf('缺少观测值') > 0)).assertTrue();
      const partial: MetricSample[] = [new MetricSample('run.total.ms', 1000)];
      const partialReport = evaluateThresholds(partial);
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:153 assertEqual actual', partialReport.missing())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:153 assertEqual expected', 23));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:154 assertEqual actual', partialReport.passed())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:154 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:155 assertEqual actual', partialReport.headline())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0005 FaultThresholdCases.test:155 assertEqual expected', '不可评估：部分指标缺少观测值'));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_THRESHOLDCATALOGCASES_0600
     * @tc.name      testThresholdCatalogCases0006
     * @tc.desc      Verify samples of run builds full key set
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testThresholdCatalogCases0006', 0, (): void => {
      const steps: MetricSample[] = [
        new MetricSample('scan.files.ms', 100),
        new MetricSample('execute.files.ms', 900)
      ];
      const samples = samplesOfRun(steps, 1200, 0, 0, 100);
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:173 assertEqual actual', samples.length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:173 assertEqual expected', 8));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:174 assertEqual actual', samples[0].key)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:174 assertEqual expected', 'scan.files.ms'));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:175 assertEqual actual', samples[2].key)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:175 assertEqual expected', 'run.total.ms'));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:176 assertEqual actual', samples[2].value)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:176 assertEqual expected', 1200));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:177 assertEqual actual', samples[6].key)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:177 assertEqual expected', 'execute.batch.count'));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:178 assertEqual actual', samples[7].key)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:178 assertEqual expected', 'retry.ratio'));
      const report = evaluateThresholds(samples);
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:180 assertTrue actual', report.passed() >= 5)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:181 assertEqual actual', report.criticalFailures())).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:181 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:182 assertEqual actual', report.results.length)).assertEqual(traceParameter('com.samples.appperformance_ThresholdCatalogCases_0006 FaultThresholdCases.test:182 assertEqual expected', 24));
    });
  });
}
