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
      expect(THRESHOLD_CATALOG.length).assertEqual(24);
      expect(catalogKeys().length).assertEqual(24);
      expect(thresholdLines().length).assertEqual(24);
      const audit = auditThresholds();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('阈值目录自洽');
      THRESHOLD_CATALOG.forEach((entry): void => {
        expect(entry.key.length > 0).assertTrue();
        expect(entry.rationale.length > 0).assertTrue();
        expect(entry.value >= 0).assertTrue();
        expect(entry.text().indexOf(entry.entryId) === 0).assertTrue();
      });
      expect(entryOf('TH-99')).assertEqual(undefined);
      expect(entryOfKey('run.total.ms')?.value).assertEqual(6000);
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
      expect(entriesOfLevel(ThresholdLevel.MUST).length).assertEqual(16);
      expect(entriesOfLevel(ThresholdLevel.SHOULD).length).assertEqual(6);
      expect(entriesOfLevel(ThresholdLevel.INFO).length).assertEqual(2);
      expect(entriesOfKind(ThresholdKind.LATENCY).length).assertEqual(18);
      expect(entriesOfKind(ThresholdKind.COUNT).length).assertEqual(3);
      expect(entriesOfKind(ThresholdKind.RATIO).length).assertEqual(2);
      expect(entriesOfKind(ThresholdKind.SIZE).length).assertEqual(1);
      expect(levelLines().length).assertEqual(3);
      expect(kindLines().length).assertEqual(4);
      expect(limitText(Limit.AT_MOST)).assertEqual('不超过');
      expect(unitText(ThresholdUnit.MILLIS)).assertEqual('ms');
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
      expect(report.results.length).assertEqual(24);
      expect(report.passed()).assertEqual(24);
      expect(report.failed()).assertEqual(0);
      expect(report.missing()).assertEqual(0);
      expect(report.criticalFailures()).assertEqual(0);
      expect(report.passRate()).assertEqual(100);
      expect(report.headline()).assertEqual('全部达标');
      expect(report.failures().length).assertEqual(0);
      expect(report.text().split('\n').length).assertEqual(25);
      const must = evaluateMust(passingSamples());
      expect(must.results.length).assertEqual(16);
      expect(must.passRate()).assertEqual(100);
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
      expect(report.failed()).assertEqual(1);
      expect(report.criticalFailures()).assertEqual(1);
      expect(report.headline()).assertEqual('1 项必达阈值未达成');
      expect(report.failures()[0].key).assertEqual('run.failed.count');
      expect(report.failures()[0].critical()).assertTrue();
      expect(report.failures()[0].text().indexOf('未达标') > 0).assertTrue();
      expect(report.passRate()).assertEqual(95.8);
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
      expect(report.missing()).assertEqual(24);
      expect(report.passed()).assertEqual(0);
      expect(report.failed()).assertEqual(0);
      expect(report.criticalFailures()).assertEqual(0);
      expect(report.passRate()).assertEqual(0);
      expect(report.headline()).assertEqual('全部缺少观测值');
      expect(report.results[0].text().indexOf('缺少观测值') > 0).assertTrue();
      const partial: MetricSample[] = [new MetricSample('run.total.ms', 1000)];
      const partialReport = evaluateThresholds(partial);
      expect(partialReport.missing()).assertEqual(23);
      expect(partialReport.passed()).assertEqual(1);
      expect(partialReport.headline()).assertEqual('不可评估：部分指标缺少观测值');
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
      expect(samples.length).assertEqual(8);
      expect(samples[0].key).assertEqual('scan.files.ms');
      expect(samples[2].key).assertEqual('run.total.ms');
      expect(samples[2].value).assertEqual(1200);
      expect(samples[6].key).assertEqual('execute.batch.count');
      expect(samples[7].key).assertEqual('retry.ratio');
      const report = evaluateThresholds(samples);
      expect(report.passed() >= 5).assertTrue();
      expect(report.criticalFailures()).assertEqual(0);
      expect(report.results.length).assertEqual(24);
    });
  });
}
