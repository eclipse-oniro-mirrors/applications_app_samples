import { QueryPhase, QuerySnapshot, RefreshSource, SupportState } from '../autostart/AutoStartupTypes';

function twoDigits(value: number): string {
  return value < 10 ? `0${value}` : `${value}`;
}

export function formatQueryTime(timestamp: number): string {
  if (timestamp <= 0) {
    return '未查询';
  }
  const date = new Date(timestamp);
  return `${twoDigits(date.getMonth() + 1)}-${twoDigits(date.getDate())} ` +
    `${twoDigits(date.getHours())}:${twoDigits(date.getMinutes())}:${twoDigits(date.getSeconds())}`;
}

export function sourceLabel(source: RefreshSource): string {
  switch (source) {
    case RefreshSource.INITIAL:
      return '首次进入';
    case RefreshSource.MANUAL:
      return '手动刷新';
    case RefreshSource.FOREGROUND:
      return '返回前台';
    case RefreshSource.SETTINGS:
      return '设置后查询';
    default:
      return '查询';
  }
}

export function supportLabel(support: SupportState): string {
  switch (support) {
    case SupportState.SUPPORTED:
      return '支持';
    case SupportState.UNSUPPORTED:
      return '不支持';
    case SupportState.FAILED:
      return '检测失败';
    default:
      return '待检测';
  }
}

export function statusLabel(snapshot: QuerySnapshot): string {
  switch (snapshot.phase) {
    case QueryPhase.CHECKING:
    case QueryPhase.QUERYING:
      return '正在查询';
    case QueryPhase.SUCCEEDED:
      if (snapshot.value === null) {
        return '等待查询';
      }
      return snapshot.value === true ? '本应用已开启' : '本应用未开启';
    case QueryPhase.UNSUPPORTED:
      return snapshot.support === SupportState.UNSUPPORTED ? '设备不支持' : '查询暂不可用';
    case QueryPhase.FAILED:
      return snapshot.support === SupportState.FAILED ? '检测失败' : '查询失败';
    case QueryPhase.TIMEOUT:
      return '查询超时';
    default:
      return '等待查询';
  }
}

export function apiResultLabel(result: string): string {
  return result === '' || result === '待调用' ? '未调用' : result;
}
