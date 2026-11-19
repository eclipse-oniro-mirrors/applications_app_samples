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
import { QueryOutcome, QueryRecord, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import { HISTORY_MAX_AGE_MS, exportRedacted, summarizeHistory } from '../../../main/ets/autostart/AutoStartupHistory';
import { dateTimeText } from '../../../main/ets/autostart/tools/DiagnosticTools';
import {
  HistoryFilter, RangePreset, dayCounts, dayCountLines, describeRecord, detailLines,
  exportPreview, rangeOf, recordLines, scopedHistory, summaryLines
} from '../../../main/ets/autostart/history/HistoryView';

function viewRow(id: number, timestamp: number, outcome: QueryOutcome, result: string,
  source: RefreshSource = RefreshSource.MANUAL): QueryRecord {
  const row = new QueryRecord();
  row.id = id; row.timestamp = timestamp; row.outcome = outcome; row.result = result;
  row.source = source; row.supportResult = 'true'; row.statusResult = 'true'; row.durationMillis = 7;
  return row;
}

class RangeBoundaryInput {
  public preset: RangePreset;
  public width: number;
  constructor(preset: RangePreset, width: number) {
    this.preset = preset; this.width = width;
  }
}

export default function startupHistoryViewWaveTwoTest(): void {
  configureTestText();
  describe('StartupHistoryViewWaveTwo', (): void => {
    /**
     * @tc.number SUB_STARTUP_HISTORYVIEWWAVETWO_0100
     * @tc.name testStartupHistoryViewWaveTwo0001
     * @tc.desc 同一天跨十分钟和小时的查询应合为同一日期分布
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupHistoryViewWaveTwo0001', 0, (): void => {
      configureTestText();
      const records = [
        viewRow(4, new Date(2026, 10, 6, 9, 1, 2).getTime(), QueryOutcome.SUCCESS, '已开启'),
        viewRow(3, new Date(2026, 10, 6, 8, 11, 2).getTime(), QueryOutcome.FAILURE, '查询失败'),
        viewRow(2, new Date(2026, 10, 6, 8, 1, 2).getTime(), QueryOutcome.SUCCESS, '未开启'),
        viewRow(1, new Date(2026, 10, 5, 20, 20, 2).getTime(), QueryOutcome.TIMEOUT, '等待超时')
      ];
      const original = JSON.stringify(records); const days = dayCounts(records);
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0001|StartupHistoryViewWaveTwo.test.ets|assert0001|assertEqual|actual', days[0].count)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0001|StartupHistoryViewWaveTwo.test.ets|assert0001|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0001|StartupHistoryViewWaveTwo.test.ets|assert0002|assertEqual|actual', days[0].date)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0001|StartupHistoryViewWaveTwo.test.ets|assert0002|assertEqual|expected', '11-06'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0001|StartupHistoryViewWaveTwo.test.ets|assert0003|assertEqual|actual', days[1].count)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0001|StartupHistoryViewWaveTwo.test.ets|assert0003|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0001|StartupHistoryViewWaveTwo.test.ets|assert0004|assertEqual|actual', days[1].date)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0001|StartupHistoryViewWaveTwo.test.ets|assert0004|assertEqual|expected', '11-05'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0001|StartupHistoryViewWaveTwo.test.ets|assert0005|assertEqual|actual', dayCountLines(records)[0])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0001|StartupHistoryViewWaveTwo.test.ets|assert0005|assertEqual|expected', '11-06：3 条'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0001|StartupHistoryViewWaveTwo.test.ets|assert0006|assertEqual|actual', JSON.stringify(records))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0001|StartupHistoryViewWaveTwo.test.ets|assert0006|assertEqual|expected', original));
    });

    /**
     * @tc.number SUB_STARTUP_HISTORYVIEWWAVETWO_0200
     * @tc.name testStartupHistoryViewWaveTwo0002
     * @tc.desc 本地午夜前后相差一毫秒的查询必须分属相邻日期
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupHistoryViewWaveTwo0002', 0, (): void => {
      configureTestText();
      const midnight = new Date(2026, 10, 7, 0, 0, 0).getTime();
      const records = [
        viewRow(3, midnight, QueryOutcome.SUCCESS, '已开启'),
        viewRow(2, midnight - 1, QueryOutcome.SUCCESS, '未开启'),
        viewRow(1, midnight - 2, QueryOutcome.FAILURE, '查询失败')
      ];
      const days = dayCounts(records);
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0002|StartupHistoryViewWaveTwo.test.ets|assert0007|assertEqual|actual', days[0].date)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0002|StartupHistoryViewWaveTwo.test.ets|assert0007|assertEqual|expected', '11-07'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0002|StartupHistoryViewWaveTwo.test.ets|assert0008|assertEqual|actual', days[0].count)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0002|StartupHistoryViewWaveTwo.test.ets|assert0008|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0002|StartupHistoryViewWaveTwo.test.ets|assert0009|assertEqual|actual', days[1].date)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0002|StartupHistoryViewWaveTwo.test.ets|assert0009|assertEqual|expected', '11-06'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0002|StartupHistoryViewWaveTwo.test.ets|assert0010|assertEqual|actual', days[1].count)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0002|StartupHistoryViewWaveTwo.test.ets|assert0010|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0002|StartupHistoryViewWaveTwo.test.ets|assert0011|assertEqual|actual', dayCountLines(records)[1])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0002|StartupHistoryViewWaveTwo.test.ets|assert0011|assertEqual|expected', '11-06：2 条'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0002|StartupHistoryViewWaveTwo.test.ets|assert0012|assertEqual|actual', records.map((row: QueryRecord): number => row.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0002|StartupHistoryViewWaveTwo.test.ets|assert0012|assertEqual|expected', '3,2,1'));
    });

    /**
     * @tc.number SUB_STARTUP_HISTORYVIEWWAVETWO_0300
     * @tc.name testStartupHistoryViewWaveTwo0003
     * @tc.desc 当前范围无样本时历史页各区域显示明确的空态
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupHistoryViewWaveTwo0003', 0, (): void => {
      configureTestText();
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const scope = scopedHistory([], new HistoryFilter(), now);
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0003|StartupHistoryViewWaveTwo.test.ets|assert0013|assertEqual|actual', recordLines(scope.records).join('\n'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0003|StartupHistoryViewWaveTwo.test.ets|assert0013|assertEqual|expected', '当前筛选没有记录'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0003|StartupHistoryViewWaveTwo.test.ets|assert0014|assertEqual|actual', summaryLines(scope.summary).join('\n'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0003|StartupHistoryViewWaveTwo.test.ets|assert0014|assertEqual|expected', '暂无历史记录'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0003|StartupHistoryViewWaveTwo.test.ets|assert0015|assertEqual|actual', dayCountLines(scope.records).join('\n'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0003|StartupHistoryViewWaveTwo.test.ets|assert0015|assertEqual|expected', '没有采样日期'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0003|StartupHistoryViewWaveTwo.test.ets|assert0016|assertEqual|actual', detailLines(scope.records[0]).join('\n'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0003|StartupHistoryViewWaveTwo.test.ets|assert0016|assertEqual|expected', '请选择当前范围内记录查看详情'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0003|StartupHistoryViewWaveTwo.test.ets|assert0017|assertEqual|actual', exportPreview('').join('\n'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0003|StartupHistoryViewWaveTwo.test.ets|assert0017|assertEqual|expected', '暂无可导出内容'));
    });

    /**
     * @tc.number SUB_STARTUP_HISTORYVIEWWAVETWO_0400
     * @tc.name testStartupHistoryViewWaveTwo0004
     * @tc.desc 重置复合筛选后恢复全部记录和最近有效成功样本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupHistoryViewWaveTwo0004', 0, (): void => {
      configureTestText();
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const records = [viewRow(3, now, QueryOutcome.FAILURE, '查询失败'),
        viewRow(2, now - 1000, QueryOutcome.SUCCESS, '已开启', RefreshSource.SETTINGS),
        viewRow(1, now - 7200000, QueryOutcome.SUCCESS, '未开启')];
      const filter = new HistoryFilter(QueryOutcome.FAILURE, RefreshSource.MANUAL, RangePreset.HOUR);
      const before = scopedHistory(records, filter, now);
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0004|StartupHistoryViewWaveTwo.test.ets|assert0018|assertEqual|actual', before.records.map((row: QueryRecord): number => row.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0004|StartupHistoryViewWaveTwo.test.ets|assert0018|assertEqual|expected', '3'));
      filter.reset(); const after = scopedHistory(records, filter, now);
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0004|StartupHistoryViewWaveTwo.test.ets|assert0019|assertEqual|actual', after.records.map((row: QueryRecord): number => row.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0004|StartupHistoryViewWaveTwo.test.ets|assert0019|assertEqual|expected', '3,2,1'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0004|StartupHistoryViewWaveTwo.test.ets|assert0020|assertEqual|actual', after.latestValid?.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0004|StartupHistoryViewWaveTwo.test.ets|assert0020|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0004|StartupHistoryViewWaveTwo.test.ets|assert0021|assertEqual|actual', filter.text())).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0004|StartupHistoryViewWaveTwo.test.ets|assert0021|assertEqual|expected', '全部结果｜全部来源｜全部时间'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0004|StartupHistoryViewWaveTwo.test.ets|assert0022|assertTrue|actual|expected=true', after.exportText.indexOf('#1 |') >= 0)).assertTrue();
    });

    /**
     * @tc.number SUB_STARTUP_HISTORYVIEWWAVETWO_0500
     * @tc.name testStartupHistoryViewWaveTwo0005
     * @tc.desc 筛选说明区分默认条件与实际选中的来源结果组合
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupHistoryViewWaveTwo0005', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0005|StartupHistoryViewWaveTwo.test.ets|assert0023|assertEqual|actual', new HistoryFilter().text())).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0005|StartupHistoryViewWaveTwo.test.ets|assert0023|assertEqual|expected', '全部结果｜全部来源｜全部时间'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0005|StartupHistoryViewWaveTwo.test.ets|assert0024|assertEqual|actual', new HistoryFilter(QueryOutcome.SUCCESS, RefreshSource.MANUAL).text()))
        .assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0005|StartupHistoryViewWaveTwo.test.ets|assert0024|assertEqual|expected', '成功｜手动刷新｜全部时间'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0005|StartupHistoryViewWaveTwo.test.ets|assert0025|assertEqual|actual', new HistoryFilter(QueryOutcome.FAILURE, RefreshSource.SETTINGS).text()))
        .assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0005|StartupHistoryViewWaveTwo.test.ets|assert0025|assertEqual|expected', '失败｜设置后查询｜全部时间'));
    });

    /**
     * @tc.number SUB_STARTUP_HISTORYVIEWWAVETWO_0600
     * @tc.name testStartupHistoryViewWaveTwo0006
     * @tc.desc 三种实际时间预设包含边界样本并排除界外一毫秒的样本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupHistoryViewWaveTwo0006', 0, (): void => {
      configureTestText();
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const windows = [new RangeBoundaryInput(RangePreset.HOUR, 3600000),
        new RangeBoundaryInput(RangePreset.DAY, 86400000),
        new RangeBoundaryInput(RangePreset.WEEK, 604800000)];
      windows.forEach((window: RangeBoundaryInput): void => {
        const lower = now - window.width;
        const records = [viewRow(4, now + 1, QueryOutcome.SUCCESS, '已开启'),
          viewRow(3, now, QueryOutcome.SUCCESS, '未开启'),
          viewRow(2, lower, QueryOutcome.FAILURE, '查询失败'),
          viewRow(1, lower - 1, QueryOutcome.SUCCESS, '已开启')];
        const scope = scopedHistory(records, new HistoryFilter('', '', window.preset), now);
        expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0006|StartupHistoryViewWaveTwo.test.ets|assert0026|assertEqual|actual', scope.records.map((row: QueryRecord): number => row.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0006|StartupHistoryViewWaveTwo.test.ets|assert0026|assertEqual|expected', '3,2'));
        expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0006|StartupHistoryViewWaveTwo.test.ets|assert0027|assertEqual|actual', scope.summary.failure)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0006|StartupHistoryViewWaveTwo.test.ets|assert0027|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0006|StartupHistoryViewWaveTwo.test.ets|assert0028|assertEqual|actual', scope.latestValid?.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0006|StartupHistoryViewWaveTwo.test.ets|assert0028|assertEqual|expected', 3));
        expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0006|StartupHistoryViewWaveTwo.test.ets|assert0029|assertEqual|actual', scope.exportText.indexOf('#4 |'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0006|StartupHistoryViewWaveTwo.test.ets|assert0029|assertEqual|expected', -1));
        expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0006|StartupHistoryViewWaveTwo.test.ets|assert0030|assertEqual|actual', scope.exportText.indexOf('#1 |'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0006|StartupHistoryViewWaveTwo.test.ets|assert0030|assertEqual|expected', -1));
      });
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0006|StartupHistoryViewWaveTwo.test.ets|assert0031|assertEqual|actual', rangeOf(RangePreset.HOUR, now).text())).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0006|StartupHistoryViewWaveTwo.test.ets|assert0031|assertEqual|expected', '11-06 11:00:00 之后'));
    });

    /**
     * @tc.number SUB_STARTUP_HISTORYVIEWWAVETWO_0700
     * @tc.name testStartupHistoryViewWaveTwo0007
     * @tc.desc 记录摘要区分零耗时与真实耗时并保留详情的接口返回值
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupHistoryViewWaveTwo0007', 0, (): void => {
      configureTestText();
      const now = new Date(2026, 10, 6, 7, 8, 9).getTime();
      const success = viewRow(1, now, QueryOutcome.SUCCESS, '未开启', RefreshSource.INITIAL);
      success.durationMillis = 0; success.statusResult = 'false';
      const failure = viewRow(2, now + 1000, QueryOutcome.FAILURE, '查询失败', RefreshSource.SETTINGS);
      failure.durationMillis = 17; failure.errorCode = '16000050'; failure.statusResult = '16000050';
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0007|StartupHistoryViewWaveTwo.test.ets|assert0032|assertEqual|actual', describeRecord(success))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0007|StartupHistoryViewWaveTwo.test.ets|assert0032|assertEqual|expected', '#1｜首次进入｜成功｜11-06 07:08:09｜耗时缺失'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0007|StartupHistoryViewWaveTwo.test.ets|assert0033|assertEqual|actual', describeRecord(failure))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0007|StartupHistoryViewWaveTwo.test.ets|assert0033|assertEqual|expected', '#2｜设置后查询｜失败｜11-06 07:08:10｜17 ms｜错误 16000050'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0007|StartupHistoryViewWaveTwo.test.ets|assert0034|assertEqual|actual', detailLines(failure)[1])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0007|StartupHistoryViewWaveTwo.test.ets|assert0034|assertEqual|expected', '结果：查询失败；能力：true；状态：16000050'));
    });

    /**
     * @tc.number SUB_STARTUP_HISTORYVIEWWAVETWO_0800
     * @tc.name testStartupHistoryViewWaveTwo0008
     * @tc.desc 本机错误详情保持原文而范围导出和预览隐藏个人信息
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupHistoryViewWaveTwo0008', 0, (): void => {
      configureTestText();
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const row = viewRow(1, now, QueryOutcome.FAILURE, '查询失败');
      row.errorMessage = '联系 user@example.com 或 13800138000';
      const scope = scopedHistory([row], new HistoryFilter(), now);
      const local = detailLines(scope.records[0]); const preview = exportPreview(scope.exportText).join('\n');
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0008|StartupHistoryViewWaveTwo.test.ets|assert0035|assertEqual|actual', local[3])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0008|StartupHistoryViewWaveTwo.test.ets|assert0035|assertEqual|expected', '本机错误说明：联系 user@example.com 或 13800138000'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0008|StartupHistoryViewWaveTwo.test.ets|assert0036|assertEqual|actual', scope.exportText.indexOf('user@example.com'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0008|StartupHistoryViewWaveTwo.test.ets|assert0036|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0008|StartupHistoryViewWaveTwo.test.ets|assert0037|assertEqual|actual', preview.indexOf('13800138000'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0008|StartupHistoryViewWaveTwo.test.ets|assert0037|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0008|StartupHistoryViewWaveTwo.test.ets|assert0038|assertTrue|actual|expected=true', preview.indexOf('[邮箱]') >= 0)).assertTrue();
    });

    /**
     * @tc.number SUB_STARTUP_HISTORYVIEWWAVETWO_0900
     * @tc.name testStartupHistoryViewWaveTwo0009
     * @tc.desc 切换筛选隐藏已选详情后不显示范围外记录的旧详情
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupHistoryViewWaveTwo0009', 0, (): void => {
      configureTestText();
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const records = [viewRow(2, now, QueryOutcome.FAILURE, '查询失败', RefreshSource.SETTINGS),
        viewRow(1, now - 1000, QueryOutcome.SUCCESS, '已开启')];
      records[0].errorMessage = 'selected failure details';
      const all = scopedHistory(records, new HistoryFilter(), now);
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0009|StartupHistoryViewWaveTwo.test.ets|assert0039|assertEqual|actual', detailLines(all.records.find((row: QueryRecord): boolean => row.id === 2))[3]))
        .assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0009|StartupHistoryViewWaveTwo.test.ets|assert0039|assertEqual|expected', '本机错误说明：selected failure details'));
      const filtered = scopedHistory(records, new HistoryFilter(QueryOutcome.SUCCESS, RefreshSource.MANUAL), now);
      const selected = filtered.records.find((row: QueryRecord): boolean => row.id === 2);
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0009|StartupHistoryViewWaveTwo.test.ets|assert0040|assertEqual|actual', detailLines(selected).join('\n'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0009|StartupHistoryViewWaveTwo.test.ets|assert0040|assertEqual|expected', '请选择当前范围内记录查看详情'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0009|StartupHistoryViewWaveTwo.test.ets|assert0041|assertEqual|actual', filtered.latestValid?.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0009|StartupHistoryViewWaveTwo.test.ets|assert0041|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0009|StartupHistoryViewWaveTwo.test.ets|assert0042|assertEqual|actual', filtered.exportText.indexOf('#2 |'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0009|StartupHistoryViewWaveTwo.test.ets|assert0042|assertEqual|expected', -1));
    });

    /**
     * @tc.number SUB_STARTUP_HISTORYVIEWWAVETWO_1000
     * @tc.name testStartupHistoryViewWaveTwo0010
     * @tc.desc 历史汇总展示全部结果计数和最近样本及即将到期提醒
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupHistoryViewWaveTwo0010', 0, (): void => {
      configureTestText();
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const oldest = now - HISTORY_MAX_AGE_MS + 3600000;
      const records = [viewRow(5, now, QueryOutcome.SUCCESS, '已开启'),
        viewRow(4, now - 3600000, QueryOutcome.FAILURE, '查询失败'),
        viewRow(3, now - 86400000, QueryOutcome.UNSUPPORTED, '设备不支持'),
        viewRow(2, now - 172800000, QueryOutcome.UNKNOWN, '未知结果'),
        viewRow(1, oldest, QueryOutcome.TIMEOUT, '等待超时')];
      const lines = summaryLines(summarizeHistory(records, now));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0010|StartupHistoryViewWaveTwo.test.ets|assert0043|assertEqual|actual', lines[0])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0010|StartupHistoryViewWaveTwo.test.ets|assert0043|assertEqual|expected', '共 5 条｜成功 1｜失败 1｜不支持 1｜超时 1｜未知 1'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0010|StartupHistoryViewWaveTwo.test.ets|assert0044|assertEqual|actual', lines[1])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0010|StartupHistoryViewWaveTwo.test.ets|assert0044|assertEqual|expected', `最近有效 #5｜最新 11-06 12:00:00｜最早 ${dateTimeText(oldest)}`));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0010|StartupHistoryViewWaveTwo.test.ets|assert0045|assertEqual|actual', lines[2])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0010|StartupHistoryViewWaveTwo.test.ets|assert0045|assertEqual|expected', '1 条将在一天内到期'));
    });

    /**
     * @tc.number SUB_STARTUP_HISTORYVIEWWAVETWO_1100
     * @tc.name testStartupHistoryViewWaveTwo0011
     * @tc.desc 只有失败和不支持记录时汇总明确无有效样本且无到期项
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupHistoryViewWaveTwo0011', 0, (): void => {
      configureTestText();
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const records = [viewRow(2, now, QueryOutcome.FAILURE, '查询失败'),
        viewRow(1, now - 3600000, QueryOutcome.UNSUPPORTED, '设备不支持')];
      const lines = summaryLines(summarizeHistory(records, now));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0011|StartupHistoryViewWaveTwo.test.ets|assert0046|assertEqual|actual', lines[0])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0011|StartupHistoryViewWaveTwo.test.ets|assert0046|assertEqual|expected', '共 2 条｜成功 0｜失败 1｜不支持 1｜超时 0｜未知 0'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0011|StartupHistoryViewWaveTwo.test.ets|assert0047|assertEqual|actual', lines[1])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0011|StartupHistoryViewWaveTwo.test.ets|assert0047|assertEqual|expected', '最近有效 #无｜最新 11-06 12:00:00｜最早 11-06 11:00:00'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0011|StartupHistoryViewWaveTwo.test.ets|assert0048|assertEqual|actual', lines[2])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0011|StartupHistoryViewWaveTwo.test.ets|assert0048|assertEqual|expected', '暂无到期记录'));
    });

    /**
     * @tc.number SUB_STARTUP_HISTORYVIEWWAVETWO_1200
     * @tc.name testStartupHistoryViewWaveTwo0012
     * @tc.desc 导出预览在十二行边界保留末条而超出时显示真实总行数
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupHistoryViewWaveTwo0012', 0, (): void => {
      configureTestText();
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime(); const records: QueryRecord[] = [];
      for (let index = 0; index < 8; index++) {
        records.push(viewRow(8 - index, now - index * 1000, QueryOutcome.SUCCESS, '已开启'));
      }
      const exact = exportPreview('当前筛选范围\n' + exportRedacted(records, now));
      const finalRecordLine = exportRedacted([records[7]], now).split('\n')[3];
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0012|StartupHistoryViewWaveTwo.test.ets|assert0049|assertEqual|actual', exact[11])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0012|StartupHistoryViewWaveTwo.test.ets|assert0049|assertEqual|expected', finalRecordLine));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0012|StartupHistoryViewWaveTwo.test.ets|assert0050|assertEqual|actual', exact.find((line: string): boolean => line.indexOf('…（共 ') === 0))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0012|StartupHistoryViewWaveTwo.test.ets|assert0050|assertEqual|expected', undefined));
      records.push(viewRow(9, now - 8000, QueryOutcome.SUCCESS, '已开启'));
      const overflow = exportPreview('当前筛选范围\n' + exportRedacted(records, now));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0012|StartupHistoryViewWaveTwo.test.ets|assert0051|assertEqual|actual', overflow[12])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0012|StartupHistoryViewWaveTwo.test.ets|assert0051|assertEqual|expected', '…（共 13 行）'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0012|StartupHistoryViewWaveTwo.test.ets|assert0052|assertEqual|actual', overflow.join('\n').indexOf('#9 |'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0012|StartupHistoryViewWaveTwo.test.ets|assert0052|assertEqual|expected', -1));
    });

    /**
     * @tc.number SUB_STARTUP_HISTORYVIEWWAVETWO_1300
     * @tc.name testStartupHistoryViewWaveTwo0013
     * @tc.desc 原生说明中的换行和伪记录文本不会成为导出预览的新记录行
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupHistoryViewWaveTwo0013', 0, (): void => {
      configureTestText();
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const row = viewRow(7, now, QueryOutcome.FAILURE, '查询失败');
      row.errorMessage = '一段\n#999 | fabricated\t联系 user@example.com\r\n结束';
      const preview = exportPreview(exportRedacted([row], now));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0013|StartupHistoryViewWaveTwo.test.ets|assert0053|assertEqual|actual', preview[2])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0013|StartupHistoryViewWaveTwo.test.ets|assert0053|assertEqual|expected', '记录数：1'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0013|StartupHistoryViewWaveTwo.test.ets|assert0054|assertEqual|actual', preview[4])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0013|StartupHistoryViewWaveTwo.test.ets|assert0054|assertEqual|expected', '  说明：一段 #999 | fabricated 联系 [邮箱] 结束'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0013|StartupHistoryViewWaveTwo.test.ets|assert0055|assertEqual|actual', preview.filter((line: string): boolean => line.indexOf('#999 |') === 0).length)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0013|StartupHistoryViewWaveTwo.test.ets|assert0055|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0013|StartupHistoryViewWaveTwo.test.ets|assert0056|assertTrue|actual|expected=true', preview.some((line: string): boolean => line.indexOf('#7 |') === 0))).assertTrue();
    });

    /**
     * @tc.number SUB_STARTUP_HISTORYVIEWWAVETWO_1400
     * @tc.name testStartupHistoryViewWaveTwo0014
     * @tc.desc 把较晚样本选为前样本时提示重选但保留当前范围数据
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupHistoryViewWaveTwo0014', 0, (): void => {
      configureTestText();
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const records = [viewRow(3, now, QueryOutcome.SUCCESS, '已开启'),
        viewRow(2, now - 1000, QueryOutcome.SUCCESS, '未开启')];
      const scope = scopedHistory(records, new HistoryFilter(), now, 3, 2);
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0014|StartupHistoryViewWaveTwo.test.ets|assert0057|assertEqual|actual', scope.comparisonText[0])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0014|StartupHistoryViewWaveTwo.test.ets|assert0057|assertEqual|expected', '请选择不同记录，且“前”样本时间不得晚于“后”样本'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0014|StartupHistoryViewWaveTwo.test.ets|assert0058|assertEqual|actual', scope.comparison.beforeId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0014|StartupHistoryViewWaveTwo.test.ets|assert0058|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0014|StartupHistoryViewWaveTwo.test.ets|assert0059|assertEqual|actual', scope.records.map((row: QueryRecord): number => row.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0014|StartupHistoryViewWaveTwo.test.ets|assert0059|assertEqual|expected', '3,2'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0014|StartupHistoryViewWaveTwo.test.ets|assert0060|assertTrue|actual|expected=true', scope.exportText.indexOf('#3 |') >= 0)).assertTrue();
    });

    /**
     * @tc.number SUB_STARTUP_HISTORYVIEWWAVETWO_1500
     * @tc.name testStartupHistoryViewWaveTwo0015
     * @tc.desc 同毫秒但编号不同的成功样本允许比较真实开关结果
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupHistoryViewWaveTwo0015', 0, (): void => {
      configureTestText();
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const records = [viewRow(2, now, QueryOutcome.SUCCESS, '已开启'),
        viewRow(1, now, QueryOutcome.SUCCESS, '未开启')];
      const scope = scopedHistory(records, new HistoryFilter(), now, 1, 2);
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0015|StartupHistoryViewWaveTwo.test.ets|assert0061|assertEqual|actual', scope.comparison.beforeId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0015|StartupHistoryViewWaveTwo.test.ets|assert0061|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0015|StartupHistoryViewWaveTwo.test.ets|assert0062|assertEqual|actual', scope.comparison.afterId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0015|StartupHistoryViewWaveTwo.test.ets|assert0062|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0015|StartupHistoryViewWaveTwo.test.ets|assert0063|assertEqual|actual', scope.comparison.deltaMillis)).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0015|StartupHistoryViewWaveTwo.test.ets|assert0063|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0015|StartupHistoryViewWaveTwo.test.ets|assert0064|assertEqual|actual', scope.comparisonText[2])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0015|StartupHistoryViewWaveTwo.test.ets|assert0064|assertEqual|expected', '前后结果不同，请人工确认是否与设置变更一致'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0015|StartupHistoryViewWaveTwo.test.ets|assert0065|assertEqual|actual', scope.comparisonText[4])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0015|StartupHistoryViewWaveTwo.test.ets|assert0065|assertEqual|expected', '状态已变化：未开启 → 已开启'));
    });

    /**
     * @tc.number SUB_STARTUP_HISTORYVIEWWAVETWO_1600
     * @tc.name testStartupHistoryViewWaveTwo0016
     * @tc.desc 只有一条成功样本时比较区域说明缺少前样本而不报告变化
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupHistoryViewWaveTwo0016', 0, (): void => {
      configureTestText();
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const row = viewRow(9, now, QueryOutcome.SUCCESS, '未开启', RefreshSource.FOREGROUND);
      row.statusResult = 'false'; const scope = scopedHistory([row], new HistoryFilter(), now);
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0016|StartupHistoryViewWaveTwo.test.ets|assert0066|assertEqual|actual', scope.comparisonText[0])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0016|StartupHistoryViewWaveTwo.test.ets|assert0066|assertEqual|expected', '只有一条样本 #9（未开启）'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0016|StartupHistoryViewWaveTwo.test.ets|assert0067|assertEqual|actual', scope.comparisonText[1])).assertEqual(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0016|StartupHistoryViewWaveTwo.test.ets|assert0067|assertEqual|expected', '无法比较：缺少离开前样本'));
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0016|StartupHistoryViewWaveTwo.test.ets|assert0068|assertFalse|actual|expected=false', scope.comparisonText.some((line: string): boolean => line.indexOf('状态已变化') >= 0))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupHistoryViewWaveTwo_0016|StartupHistoryViewWaveTwo.test.ets|assert0069|assertTrue|actual|expected=true', scope.exportText.indexOf('#9 |') >= 0)).assertTrue();
    });
  });
}
