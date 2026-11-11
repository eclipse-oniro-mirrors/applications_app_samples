import { describe, expect, it } from '@ohos/hypium';
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
      expect(text.indexOf('系统版本（fixture-os → next-os）') >= 0).assertTrue();
      expect(text.indexOf('分组统计,条件组1,P50,60 ms,阶段耗时合计') >= 0).assertTrue();
      expect(text.indexOf('分组统计,条件组2,P50,不可评估,阶段耗时合计') >= 0).assertTrue();
      expect(text.indexOf('阶段耗时,条件组2,reread,P50 不可评估,样本 0 · 均值 不可评估') >= 0).assertTrue();
      expect(text.indexOf('PRIVATE-BUSINESS-BODY')).assertEqual(-1);
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
      expect(checkReport(records, new ReportMeta('负数', -1)).findings.join('|')).assertEqual('生成时间非法');
      const nan = exportReport(records, new ReportMeta('非数字', Number.NaN), ReportFormat.MARKDOWN);
      expect(nan.text).assertEqual('');
      expect(checkReport(records, new ReportMeta('无穷', Number.POSITIVE_INFINITY)).findings.join('|'))
        .assertEqual('生成时间非法');
      expect(checkReport(records, new ReportMeta('当前时间', 0)).findings.join('|')).assertEqual('');
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
      expect(markdown.ok).assertTrue();
      expect(csv.ok).assertTrue();
      [markdown.text, csv.text].forEach((text: string): void => {
        expect(text.indexOf('fixture-sensitive-key')).assertEqual(-1);
        expect(text.indexOf('138001380001234567')).assertEqual(-1);
        expect(text.indexOf('../private/cache.txt')).assertEqual(-1);
        expect(text.indexOf('[凭据已脱敏]') >= 0).assertTrue();
        expect(text.indexOf('[长数字已脱敏]') >= 0).assertTrue();
        expect(text.indexOf('保留结尾') >= 0).assertTrue();
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
      expect(text.indexOf('文本\\|对照（W-TEXT）') >= 0).assertTrue();
      expect(text.indexOf('| 发现\\|目标 | 1 | 10 ms | 10 ms |') >= 0).assertTrue();
      expect(text.indexOf('- 筛选：行一 行二\n') >= 0).assertTrue();
    });
  });
}
