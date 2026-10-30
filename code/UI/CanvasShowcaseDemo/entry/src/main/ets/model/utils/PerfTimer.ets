/**
 * PerfTimer 绘制性能计时工具类
 *
 * - 静态 time()：同步代码块计时包装（自动输出耗时日志）
 * - 实例模式：多次采样统计（count/avg/min/max），用于对比各场景绘制开销
 */
import { LogUtil } from './LogUtil';

const TAG = 'PerfTimer';

export class PerfTimer {
  private samples: number[] = [];
  private startMs: number = 0;

  /** 同步代码块计时：返回 fn 结果并输出耗时日志 */
  static time<T>(tag: string, name: string, fn: () => T): T {
    const begin: number = Date.now();
    try {
      return fn();
    } finally {
      const cost: number = Date.now() - begin;
      LogUtil.info(tag, `⏱ ${name} 耗时 ${cost}ms`);
    }
  }

  /** 开始采样 */
  start(): void {
    this.startMs = Date.now();
  }

  /** 结束采样并记录，返回本次耗时 ms */
  stop(): number {
    const cost: number = Date.now() - this.startMs;
    this.samples.push(cost);
    return cost;
  }

  /** 采样次数 */
  count(): number {
    return this.samples.length;
  }

  /** 平均耗时 ms（无样本返回 0） */
  avg(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let sum = 0;
    for (const s of this.samples) {
      sum += s;
    }
    return Math.round(sum / this.samples.length * 100) / 100;
  }

  /** 最小耗时 ms（无样本返回 0） */
  min(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let m = this.samples[0];
    for (const s of this.samples) {
      if (s < m) {
        m = s;
      }
    }
    return m;
  }

  /** 最大耗时 ms（无样本返回 0） */
  max(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let m = this.samples[0];
    for (const s of this.samples) {
      if (s > m) {
        m = s;
      }
    }
    return m;
  }

  /** 统计报告（输出到日志并返回） */
  report(name: string): string {
    const line: string = `${name}：${this.count()} 次采样，平均 ${this.avg()}ms，最小 ${this.min()}ms，最大 ${this.max()}ms`;
    LogUtil.info(TAG, line);
    return line;
  }

  /** 清空样本 */
  reset(): void {
    this.samples = [];
  }
}
