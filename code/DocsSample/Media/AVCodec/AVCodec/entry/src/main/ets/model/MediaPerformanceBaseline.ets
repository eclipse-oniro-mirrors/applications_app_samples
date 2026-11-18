/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { MediaReports, MediaSessionReport, MediaSessionMetric } from './MediaSessionReport';

export class MediaPerformanceBaseline {
  static eligible(report: MediaSessionReport): boolean {
    return report.outcome === 'completed' && report.input !== undefined && MediaReports.validInput(report.input) &&
      typeof report.input.sha256 === 'string' && /^[0-9a-f]{64}$/.test(report.input.sha256);
  }

  static matches(first: MediaSessionReport, second: MediaSessionReport): boolean {
    return MediaPerformanceBaseline.eligible(first) && MediaPerformanceBaseline.eligible(second) &&
      first.input?.sha256 === second.input?.sha256 && first.input?.bytes === second.input?.bytes &&
      first.operation === second.operation && first.device === second.device && first.api === second.api &&
      first.requested === second.requested && first.observed === second.observed;
  }

  static compare(report: MediaSessionReport, baseline: MediaSessionReport): string {
    if (report.outcome !== 'completed' || baseline.outcome !== 'completed' ||
      !MediaPerformanceBaseline.matches(report, baseline)) { return ''; }
    return report.metrics.map((metric: MediaSessionMetric): string => {
      const previous: MediaSessionMetric | undefined = baseline.metrics.find((item: MediaSessionMetric): boolean =>
        item.name === metric.name && item.unit === metric.unit);
      if (previous === undefined || !Number.isFinite(previous.amount) || previous.amount <= 0 ||
        !Number.isFinite(metric.amount) || metric.amount < 0) { return ''; }
      const delta: number = (metric.amount - previous.amount) / previous.amount * 100;
      return metric.name + ': ' + metric.amount.toFixed(2) + ' / ' + previous.amount.toFixed(2) +
        ' ' + metric.unit + ' (' + (delta >= 0 ? '+' : '') + delta.toFixed(1) + '%)';
    }).filter((line: string): boolean => line.length > 0).join('\n');
  }
}
