/**
 * PerfTimer 性能计时工具类
 *
 * 提供 label 化的计时打点（start/stop）、同步代码段测量（measure）、
 * 记录汇总（summary）。场景2 的 FastBuffer vs Buffer 对比基于本类计时。
 */
import { LogUtil } from './LogUtil';

/** 单条计时记录 */
export interface PerfRecord {
  label: string;
  costMs: number;
}

export class PerfTimer {
  private static marks: Map<string, number> = new Map();
  private static records: PerfRecord[] = [];

  /** 开始计时（同名 label 重复 start 会覆盖前一次打点） */
  static start(label: string): void {
    PerfTimer.marks.set(label, Date.now());
    LogUtil.debug('PerfTimer', `start: ${label}`);
  }

  /** 结束计时并记录耗时，返回毫秒数；未 start 过的 label 返回 -1 */
  static stop(label: string): number {
    const begin: number | undefined = PerfTimer.marks.get(label);
    if (begin === undefined) {
      LogUtil.warn('PerfTimer', `stop: 未找到 ${label} 的开始打点`);
      return -1;
    }
    const cost: number = Date.now() - begin;
    PerfTimer.marks.delete(label);
    const record: PerfRecord = { label: label, costMs: cost };
    PerfTimer.records.push(record);
    LogUtil.info('PerfTimer', `stop: ${label} 耗时 ${cost}ms`);
    return cost;
  }

  /** 测量同步代码段耗时，返回原函数结果 */
  static measure<T>(label: string, fn: () => T): T {
    PerfTimer.start(label);
    const result: T = fn();
    PerfTimer.stop(label);
    return result;
  }

  /** 全部计时记录 */
  static getRecords(): PerfRecord[] {
    return PerfTimer.records;
  }

  /** 汇总文本：label=xxms，逗号分隔 */
  static summary(): string {
    if (PerfTimer.records.length === 0) {
      return '（无计时记录）';
    }
    let text: string = '';
    for (const r of PerfTimer.records) {
      text += (text === '' ? '' : '，') + `${r.label}=${r.costMs}ms`;
    }
    return text;
  }

  /** 清空打点与记录 */
  static clear(): void {
    PerfTimer.marks.clear();
    PerfTimer.records = [];
  }
}
