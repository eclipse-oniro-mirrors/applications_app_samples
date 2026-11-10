import { describe, expect, it } from '@ohos/hypium';
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
  preset: RangePreset;
  width: number;
  constructor(preset: RangePreset, width: number) {
    this.preset = preset; this.width = width;
  }
}

export default function startupHistoryViewWaveTwoTest(): void {
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
      const records = [
        viewRow(4, new Date(2026, 10, 6, 9, 1, 2).getTime(), QueryOutcome.SUCCESS, '已开启'),
        viewRow(3, new Date(2026, 10, 6, 8, 11, 2).getTime(), QueryOutcome.FAILURE, '查询失败'),
        viewRow(2, new Date(2026, 10, 6, 8, 1, 2).getTime(), QueryOutcome.SUCCESS, '未开启'),
        viewRow(1, new Date(2026, 10, 5, 20, 20, 2).getTime(), QueryOutcome.TIMEOUT, '等待超时')
      ];
      const original = JSON.stringify(records); const days = dayCounts(records);
      expect(days[0].count).assertEqual(3);
      expect(days[0].date).assertEqual('11-06');
      expect(days[1].count).assertEqual(1);
      expect(days[1].date).assertEqual('11-05');
      expect(dayCountLines(records)[0]).assertEqual('11-06：3 条');
      expect(JSON.stringify(records)).assertEqual(original);
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
      const midnight = new Date(2026, 10, 7, 0, 0, 0).getTime();
      const records = [
        viewRow(3, midnight, QueryOutcome.SUCCESS, '已开启'),
        viewRow(2, midnight - 1, QueryOutcome.SUCCESS, '未开启'),
        viewRow(1, midnight - 2, QueryOutcome.FAILURE, '查询失败')
      ];
      const days = dayCounts(records);
      expect(days[0].date).assertEqual('11-07');
      expect(days[0].count).assertEqual(1);
      expect(days[1].date).assertEqual('11-06');
      expect(days[1].count).assertEqual(2);
      expect(dayCountLines(records)[1]).assertEqual('11-06：2 条');
      expect(records.map((row: QueryRecord): number => row.id).join(',')).assertEqual('3,2,1');
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
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const scope = scopedHistory([], new HistoryFilter(), now);
      expect(recordLines(scope.records).join('\n')).assertEqual('当前筛选没有记录');
      expect(summaryLines(scope.summary).join('\n')).assertEqual('暂无历史记录');
      expect(dayCountLines(scope.records).join('\n')).assertEqual('没有采样日期');
      expect(detailLines(scope.records[0]).join('\n')).assertEqual('请选择当前范围内记录查看详情');
      expect(exportPreview('').join('\n')).assertEqual('暂无可导出内容');
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
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const records = [viewRow(3, now, QueryOutcome.FAILURE, '查询失败'),
        viewRow(2, now - 1000, QueryOutcome.SUCCESS, '已开启', RefreshSource.SETTINGS),
        viewRow(1, now - 7200000, QueryOutcome.SUCCESS, '未开启')];
      const filter = new HistoryFilter(QueryOutcome.FAILURE, RefreshSource.MANUAL, RangePreset.HOUR);
      const before = scopedHistory(records, filter, now);
      expect(before.records.map((row: QueryRecord): number => row.id).join(',')).assertEqual('3');
      filter.reset(); const after = scopedHistory(records, filter, now);
      expect(after.records.map((row: QueryRecord): number => row.id).join(',')).assertEqual('3,2,1');
      expect(after.latestValid?.id).assertEqual(2);
      expect(filter.text()).assertEqual('全部结果｜全部来源｜全部时间');
      expect(after.exportText.indexOf('#1 |') >= 0).assertTrue();
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
      expect(new HistoryFilter().text()).assertEqual('全部结果｜全部来源｜全部时间');
      expect(new HistoryFilter(QueryOutcome.SUCCESS, RefreshSource.MANUAL).text())
        .assertEqual('成功｜手动刷新｜全部时间');
      expect(new HistoryFilter(QueryOutcome.FAILURE, RefreshSource.SETTINGS).text())
        .assertEqual('失败｜设置后查询｜全部时间');
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
        expect(scope.records.map((row: QueryRecord): number => row.id).join(',')).assertEqual('3,2');
        expect(scope.summary.failure).assertEqual(1);
        expect(scope.latestValid?.id).assertEqual(3);
        expect(scope.exportText.indexOf('#4 |')).assertEqual(-1);
        expect(scope.exportText.indexOf('#1 |')).assertEqual(-1);
      });
      expect(rangeOf(RangePreset.HOUR, now).text()).assertEqual('11-06 11:00:00 之后');
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
      const now = new Date(2026, 10, 6, 7, 8, 9).getTime();
      const success = viewRow(1, now, QueryOutcome.SUCCESS, '未开启', RefreshSource.INITIAL);
      success.durationMillis = 0; success.statusResult = 'false';
      const failure = viewRow(2, now + 1000, QueryOutcome.FAILURE, '查询失败', RefreshSource.SETTINGS);
      failure.durationMillis = 17; failure.errorCode = '16000050'; failure.statusResult = '16000050';
      expect(describeRecord(success)).assertEqual('#1｜首次进入｜成功｜11-06 07:08:09｜耗时缺失');
      expect(describeRecord(failure)).assertEqual('#2｜设置后查询｜失败｜11-06 07:08:10｜17 ms｜错误 16000050');
      expect(detailLines(failure)[1]).assertEqual('结果：查询失败；能力：true；状态：16000050');
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
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const row = viewRow(1, now, QueryOutcome.FAILURE, '查询失败');
      row.errorMessage = '联系 user@example.com 或 13800138000';
      const scope = scopedHistory([row], new HistoryFilter(), now);
      const local = detailLines(scope.records[0]); const preview = exportPreview(scope.exportText).join('\n');
      expect(local[3]).assertEqual('本机错误说明：联系 user@example.com 或 13800138000');
      expect(scope.exportText.indexOf('user@example.com')).assertEqual(-1);
      expect(preview.indexOf('13800138000')).assertEqual(-1);
      expect(preview.indexOf('[邮箱]') >= 0).assertTrue();
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
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const records = [viewRow(2, now, QueryOutcome.FAILURE, '查询失败', RefreshSource.SETTINGS),
        viewRow(1, now - 1000, QueryOutcome.SUCCESS, '已开启')];
      records[0].errorMessage = 'selected failure details';
      const all = scopedHistory(records, new HistoryFilter(), now);
      expect(detailLines(all.records.find((row: QueryRecord): boolean => row.id === 2))[3])
        .assertEqual('本机错误说明：selected failure details');
      const filtered = scopedHistory(records, new HistoryFilter(QueryOutcome.SUCCESS, RefreshSource.MANUAL), now);
      const selected = filtered.records.find((row: QueryRecord): boolean => row.id === 2);
      expect(detailLines(selected).join('\n')).assertEqual('请选择当前范围内记录查看详情');
      expect(filtered.latestValid?.id).assertEqual(1);
      expect(filtered.exportText.indexOf('#2 |')).assertEqual(-1);
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
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const oldest = now - HISTORY_MAX_AGE_MS + 3600000;
      const records = [viewRow(5, now, QueryOutcome.SUCCESS, '已开启'),
        viewRow(4, now - 3600000, QueryOutcome.FAILURE, '查询失败'),
        viewRow(3, now - 86400000, QueryOutcome.UNSUPPORTED, '设备不支持'),
        viewRow(2, now - 172800000, QueryOutcome.UNKNOWN, '未知结果'),
        viewRow(1, oldest, QueryOutcome.TIMEOUT, '等待超时')];
      const lines = summaryLines(summarizeHistory(records, now));
      expect(lines[0]).assertEqual('共 5 条｜成功 1｜失败 1｜不支持 1｜超时 1｜未知 1');
      expect(lines[1]).assertEqual(`最近有效 #5｜最新 11-06 12:00:00｜最早 ${dateTimeText(oldest)}`);
      expect(lines[2]).assertEqual('1 条将在一天内到期');
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
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const records = [viewRow(2, now, QueryOutcome.FAILURE, '查询失败'),
        viewRow(1, now - 3600000, QueryOutcome.UNSUPPORTED, '设备不支持')];
      const lines = summaryLines(summarizeHistory(records, now));
      expect(lines[0]).assertEqual('共 2 条｜成功 0｜失败 1｜不支持 1｜超时 0｜未知 0');
      expect(lines[1]).assertEqual('最近有效 #无｜最新 11-06 12:00:00｜最早 11-06 11:00:00');
      expect(lines[2]).assertEqual('暂无到期记录');
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
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime(); const records: QueryRecord[] = [];
      for (let index = 0; index < 8; index++) {
        records.push(viewRow(8 - index, now - index * 1000, QueryOutcome.SUCCESS, '已开启'));
      }
      const exact = exportPreview('当前筛选范围\n' + exportRedacted(records, now));
      const finalRecordLine = exportRedacted([records[7]], now).split('\n')[3];
      expect(exact[11]).assertEqual(finalRecordLine);
      expect(exact.find((line: string): boolean => line.indexOf('…（共 ') === 0)).assertEqual(undefined);
      records.push(viewRow(9, now - 8000, QueryOutcome.SUCCESS, '已开启'));
      const overflow = exportPreview('当前筛选范围\n' + exportRedacted(records, now));
      expect(overflow[12]).assertEqual('…（共 13 行）');
      expect(overflow.join('\n').indexOf('#9 |')).assertEqual(-1);
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
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const row = viewRow(7, now, QueryOutcome.FAILURE, '查询失败');
      row.errorMessage = '一段\n#999 | fabricated\t联系 user@example.com\r\n结束';
      const preview = exportPreview(exportRedacted([row], now));
      expect(preview[2]).assertEqual('记录数：1');
      expect(preview[4]).assertEqual('  说明：一段 #999 | fabricated 联系 [邮箱] 结束');
      expect(preview.filter((line: string): boolean => line.indexOf('#999 |') === 0).length).assertEqual(0);
      expect(preview.some((line: string): boolean => line.indexOf('#7 |') === 0)).assertTrue();
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
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const records = [viewRow(3, now, QueryOutcome.SUCCESS, '已开启'),
        viewRow(2, now - 1000, QueryOutcome.SUCCESS, '未开启')];
      const scope = scopedHistory(records, new HistoryFilter(), now, 3, 2);
      expect(scope.comparisonText[0]).assertEqual('请选择不同记录，且“前”样本时间不得晚于“后”样本');
      expect(scope.comparison.beforeId).assertEqual(-1);
      expect(scope.records.map((row: QueryRecord): number => row.id).join(',')).assertEqual('3,2');
      expect(scope.exportText.indexOf('#3 |') >= 0).assertTrue();
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
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const records = [viewRow(2, now, QueryOutcome.SUCCESS, '已开启'),
        viewRow(1, now, QueryOutcome.SUCCESS, '未开启')];
      const scope = scopedHistory(records, new HistoryFilter(), now, 1, 2);
      expect(scope.comparison.beforeId).assertEqual(1);
      expect(scope.comparison.afterId).assertEqual(2);
      expect(scope.comparison.deltaMillis).assertEqual(0);
      expect(scope.comparisonText[2]).assertEqual('前后结果不同，请人工确认是否与设置变更一致');
      expect(scope.comparisonText[4]).assertEqual('状态已变化：未开启 → 已开启');
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
      const now = new Date(2026, 10, 6, 12, 0, 0).getTime();
      const row = viewRow(9, now, QueryOutcome.SUCCESS, '未开启', RefreshSource.FOREGROUND);
      row.statusResult = 'false'; const scope = scopedHistory([row], new HistoryFilter(), now);
      expect(scope.comparisonText[0]).assertEqual('只有一条样本 #9（未开启）');
      expect(scope.comparisonText[1]).assertEqual('无法比较：缺少离开前样本');
      expect(scope.comparisonText.some((line: string): boolean => line.indexOf('状态已变化') >= 0)).assertFalse();
      expect(scope.exportText.indexOf('#9 |') >= 0).assertTrue();
    });
  });
}
