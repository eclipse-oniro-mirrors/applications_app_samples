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
import { loggedIt as it } from '../support/TestLog';
import { ReportTable } from '../../../main/ets/core/report/ReportTable';
import {
  ReportFormat, ReportMeta, buildCsv, buildMarkdown, checkReport, exportReport
} from '../../../main/ets/core/report/ReportExport';
import { waveRecord } from '../support/PerformanceWaveOneFixtures';

export default function performanceExportWaveTwoTests(): void {
  describe('PerformanceExportWaveTwo', (): void => {
    /**
     * @tc.number SUB_PERFORMANCE_EXPORTWAVETWO_0100
     * @tc.name testPerformanceExportWaveTwo0001
     * @tc.desc 多组CSV保留条件差异和各组独立统计，失败阶段不冒充零耗时
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceExportWaveTwo0001', 0, (): void => {
      const ok = waveRecord('ok');
      const bad = waveRecord('bad'); bad.integrity = '不一致'; bad.stages[4].status = '失败';
      bad.condition = '["fixture-board · next-os","1.0.fixture",true]';
      bad.stages[4].detail = 'PRIVATE-BUSINESS-BODY';
      const text = buildCsv(ReportTable.build([ok, bad]), new ReportMeta('多组', 1700000001000));
      expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0001 PerformanceExportWaveTwo.test:39 assertTrue actual', text.indexOf('系统版本（fixture-os → next-os）') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0001 PerformanceExportWaveTwo.test:40 assertTrue actual', text.indexOf('分组统计,条件组1,P50,60 ms,阶段耗时合计') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0001 PerformanceExportWaveTwo.test:41 assertTrue actual', text.indexOf('分组统计,条件组2,P50,不可评估,阶段耗时合计') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0001 PerformanceExportWaveTwo.test:42 assertTrue actual', text.indexOf('阶段耗时,条件组2,reread,P50 不可评估,样本 0 · 均值 不可评估') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0001 PerformanceExportWaveTwo.test:43 assertEqual actual', text.indexOf('PRIVATE-BUSINESS-BODY'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0001 PerformanceExportWaveTwo.test:43 assertEqual expected', -1));
    });

    /**
     * @tc.number SUB_PERFORMANCE_EXPORTWAVETWO_0200
     * @tc.name testPerformanceExportWaveTwo0002
     * @tc.desc 负数和非有限生成时间拒绝导出，零值仍允许使用本机时间
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceExportWaveTwo0002', 0, (): void => {
      const records = [waveRecord('time')];
      expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0002 PerformanceExportWaveTwo.test:56 assertEqual actual', checkReport(records, new ReportMeta('负数', -1)).findings.join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0002 PerformanceExportWaveTwo.test:56 assertEqual expected', '生成时间非法'));
      const nan = exportReport(records, new ReportMeta('非数字', Number.NaN), ReportFormat.MARKDOWN);
      expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0002 PerformanceExportWaveTwo.test:58 assertEqual actual', nan.text)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0002 PerformanceExportWaveTwo.test:58 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0002 PerformanceExportWaveTwo.test:59 assertEqual actual', checkReport(records, new ReportMeta('无穷', Number.POSITIVE_INFINITY)).findings.join('|')))
        .assertEqual(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0002 PerformanceExportWaveTwo.test:59 assertEqual expected', '生成时间非法'));
      expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0002 PerformanceExportWaveTwo.test:61 assertEqual actual', checkReport(records, new ReportMeta('当前时间', 0)).findings.join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0002 PerformanceExportWaveTwo.test:61 assertEqual expected', ''));
    });

    /**
     * @tc.number SUB_PERFORMANCE_EXPORTWAVETWO_0300
     * @tc.name testPerformanceExportWaveTwo0003
     * @tc.desc Markdown与CSV实际脱敏凭据、长数字和相对路径，同时保留正常业务文字
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceExportWaveTwo0003', 0, (): void => {
      const records = [waveRecord('sensitive')];
      const meta = new ReportMeta('脱敏', 1700000001000, '',
        '正常说明 token=fixture-sensitive-key 138001380001234567 ../private/cache.txt 保留结尾');
      const markdown = exportReport(records, meta, ReportFormat.MARKDOWN);
      const csv = exportReport(records, meta, ReportFormat.CSV);
      expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0003 PerformanceExportWaveTwo.test:78 assertTrue actual', markdown.ok)).assertTrue();
      expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0003 PerformanceExportWaveTwo.test:79 assertTrue actual', csv.ok)).assertTrue();
      [markdown.text, csv.text].forEach((text: string): void => {
        expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0003 PerformanceExportWaveTwo.test:81 assertEqual actual', text.indexOf('fixture-sensitive-key'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0003 PerformanceExportWaveTwo.test:81 assertEqual expected', -1));
        expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0003 PerformanceExportWaveTwo.test:82 assertEqual actual', text.indexOf('138001380001234567'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0003 PerformanceExportWaveTwo.test:82 assertEqual expected', -1));
        expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0003 PerformanceExportWaveTwo.test:83 assertEqual actual', text.indexOf('../private/cache.txt'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0003 PerformanceExportWaveTwo.test:83 assertEqual expected', -1));
        expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0003 PerformanceExportWaveTwo.test:84 assertTrue actual', text.indexOf('[凭据已脱敏]') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0003 PerformanceExportWaveTwo.test:85 assertTrue actual', text.indexOf('[长数字已脱敏]') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0003 PerformanceExportWaveTwo.test:86 assertTrue actual', text.indexOf('保留结尾') >= 0)).assertTrue();
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_EXPORTWAVETWO_0400
     * @tc.name testPerformanceExportWaveTwo0004
     * @tc.desc Markdown工作负载与阶段单元格转义分隔符，筛选换行折叠为单行
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceExportWaveTwo0004', 0, (): void => {
      const record = waveRecord('cells'); record.workloadLabel = '文本|对照';
      record.stages[0].label = '发现|目标';
      const text = buildMarkdown(ReportTable.build([record]),
        new ReportMeta('单元格', 1700000001000, '行一\r\n\t行二'));
      expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0004 PerformanceExportWaveTwo.test:103 assertTrue actual', text.indexOf('文本\\|对照（W-TEXT）') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0004 PerformanceExportWaveTwo.test:104 assertTrue actual', text.indexOf('| 发现\\|目标 | 1 | 10 ms | 10 ms |') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_PerformanceExportWaveTwo_0004 PerformanceExportWaveTwo.test:105 assertTrue actual', text.indexOf('- 筛选：行一 行二\n') >= 0)).assertTrue();
    });
  });
}
