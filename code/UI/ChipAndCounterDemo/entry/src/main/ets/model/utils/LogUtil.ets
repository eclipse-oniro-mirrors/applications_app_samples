/**
 * LogUtil 统一日志工具类
 *
 * 双通道输出：hilog（设备日志，可用 hdc shell hilog 查看日志）+ UI 日志面板回调。
 * 支持级别过滤（DEBUG/INFO/WARN/ERROR），统一时间戳与格式，供业务层与工具类共用。
 *
 * UI 层在 aboutToAppear 中调用 LogUtil.init(sink) 注入面板回调；
 * 未注入时仅输出 hilog，不影响任何功能。
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

/** UI 日志回调类型：参数为已格式化的单行日志 */
export type LogSink = (line: string) => void;

/** 日志级别，数值越大级别越高 */
export enum LogLevel {
  DEBUG = 0,
  INFO = 1,
  WARN = 2,
  ERROR = 3
}

export class LogUtil {
  private static uiSink: LogSink | null = null;
  private static minLevel: LogLevel = LogLevel.DEBUG;
  private static readonly DOMAIN = 0x0001;
  private static readonly HILOG_TAG = 'ChipAndCounter';

  /** 注入 UI 日志回调（Index 页面 aboutToAppear 调用一次） */
  static init(sink: LogSink, minLevel?: LogLevel): void {
    LogUtil.uiSink = sink;
    if (minLevel !== undefined) {
      LogUtil.minLevel = minLevel;
    }
    LogUtil.hilog(LogLevel.INFO, 'LogUtil 已初始化');
  }

  /** 设置最低输出级别，低于该级别的日志被过滤 */
  static setMinLevel(level: LogLevel): void {
    LogUtil.minLevel = level;
  }

  static debug(tag: string, msg: string): void {
    LogUtil.log(LogLevel.DEBUG, tag, msg);
  }

  static info(tag: string, msg: string): void {
    LogUtil.log(LogLevel.INFO, tag, msg);
  }

  static warn(tag: string, msg: string): void {
    LogUtil.log(LogLevel.WARN, tag, msg);
  }

  static error(tag: string, msg: string): void {
    LogUtil.log(LogLevel.ERROR, tag, msg);
  }

  /** 格式化时间为 HH:mm:ss */
  static formatTime(d: Date): string {
    return `${LogUtil.pad2(d.getHours())}:${LogUtil.pad2(d.getMinutes())}:${LogUtil.pad2(d.getSeconds())}`;
  }

  /** 单字母级别标记 */
  static levelMark(level: LogLevel): string {
    switch (level) {
      case LogLevel.DEBUG:
        return 'D';
      case LogLevel.INFO:
        return 'I';
      case LogLevel.WARN:
        return 'W';
      case LogLevel.ERROR:
        return 'E';
      default:
        return '?';
    }
  }

  private static log(level: LogLevel, tag: string, msg: string): void {
    if (level < LogUtil.minLevel) {
      return;
    }
    const line: string = `[${LogUtil.formatTime(new Date())}][${LogUtil.levelMark(level)}][${tag}] ${msg}`;
    LogUtil.hilog(level, msg);
    if (LogUtil.uiSink !== null) {
      LogUtil.uiSink(line);
    }
  }

  private static hilog(level: LogLevel, msg: string): void {
    switch (level) {
      case LogLevel.DEBUG:
        hilog.debug(LogUtil.DOMAIN, LogUtil.HILOG_TAG, '%{public}s', msg);
        break;
      case LogLevel.INFO:
        hilog.info(LogUtil.DOMAIN, LogUtil.HILOG_TAG, '%{public}s', msg);
        break;
      case LogLevel.WARN:
        hilog.warn(LogUtil.DOMAIN, LogUtil.HILOG_TAG, '%{public}s', msg);
        break;
      case LogLevel.ERROR:
        hilog.error(LogUtil.DOMAIN, LogUtil.HILOG_TAG, '%{public}s', msg);
        break;
      default:
        hilog.info(LogUtil.DOMAIN, LogUtil.HILOG_TAG, '%{public}s', msg);
        break;
    }
  }

  private static pad2(n: number): string {
    return n < 10 ? `0${n}` : `${n}`;
  }
}
