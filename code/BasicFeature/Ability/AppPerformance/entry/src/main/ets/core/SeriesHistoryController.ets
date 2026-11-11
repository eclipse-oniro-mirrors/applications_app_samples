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

import { AppService } from './AppService';
import { ReportFormat } from './report/ReportExport';
import { SeriesHistorySelection, SeriesHistoryView, buildSeriesHistoryView } from './SeriesHistoryPresentation';

/** Selection owns only view context; it never starts samples or holds an SDK lease. */
export class SeriesHistoryController {
  private readonly service: AppService;
  private readonly selection: SeriesHistorySelection = new SeriesHistorySelection();
  private generation: number = 0;
  private disposed: boolean = false;

  constructor(service: AppService) { this.service = service; }

  private invalidateFeedback(): void {
    this.generation++;
    this.selection.status = '';
    this.selection.copying = false;
  }

  selectSeries(ownerId: string): boolean {
    if (this.disposed || !this.service.seriesHistory().some((state): boolean => state.ownerId === ownerId)) {
      return false;
    }
    if (ownerId !== this.selection.selectedOwnerId) {
      this.invalidateFeedback(); this.selection.selectedOwnerId = ownerId;
      if (this.selection.comparisonOwnerId === ownerId) { this.selection.comparisonOwnerId = ''; }
    }
    return true;
  }

  selectComparisonBase(ownerId: string): boolean {
    if (this.disposed || ownerId === this.selection.selectedOwnerId ||
      !this.service.seriesHistory().some((state): boolean => state.ownerId === ownerId)) { return false; }
    if (ownerId !== this.selection.comparisonOwnerId) {
      this.invalidateFeedback(); this.selection.comparisonOwnerId = ownerId;
    }
    return true;
  }

  setFormat(format: ReportFormat): boolean {
    if (this.disposed || [ReportFormat.MARKDOWN, ReportFormat.CSV].indexOf(format) < 0) { return false; }
    if (format !== this.selection.format) { this.invalidateFeedback(); this.selection.format = format; }
    return true;
  }

  view(): SeriesHistoryView {
    const history = this.service.seriesHistory();
    if (this.selection.selectedOwnerId.length === 0 && history.length > 0) {
      this.selection.selectedOwnerId = history[0].ownerId;
    }
    if (this.selection.comparisonOwnerId.length === 0) {
      const other = history.find((state): boolean => state.ownerId !== this.selection.selectedOwnerId);
      if (other !== undefined) { this.selection.comparisonOwnerId = other.ownerId; }
    }
    const comparison = this.selection.selectedOwnerId.length > 0 && this.selection.comparisonOwnerId.length > 0 ?
      this.service.compareExperimentSeries(this.selection.comparisonOwnerId, this.selection.selectedOwnerId) :
      undefined;
    return buildSeriesHistoryView(history, this.selection, comparison);
  }

  async copySelected(): Promise<boolean> {
    if (this.disposed || this.selection.copying) { return false; }
    this.view();
    const ownerId = this.selection.selectedOwnerId;
    const format = this.selection.format;
    const report = this.service.seriesHistoryReport(ownerId, format);
    if (!report.ok) {
      this.selection.status = `历史报告未生成：${report.check.summary()}`;
      return false;
    }
    const generation = ++this.generation;
    this.selection.copying = true;
    this.selection.status = `正在复制所选系列历史（${format === ReportFormat.CSV ? 'CSV' : 'Markdown'}）`;
    let copied: boolean = false;
    try {
      copied = await this.service.copySeriesHistoryReport(ownerId, format);
    } catch (error) {
      copied = false;
    }
    if (!this.disposed && generation === this.generation && ownerId === this.selection.selectedOwnerId &&
      format === this.selection.format) {
      this.selection.copying = false;
      this.selection.status = copied ? `已复制所选系列历史（${format === ReportFormat.CSV ? 'CSV' : 'Markdown'}）` :
        '复制失败；所选系列未改变，请查看真实调用记录';
    }
    return copied;
  }

  dispose(): void { this.disposed = true; this.invalidateFeedback(); }
}
