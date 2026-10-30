export enum DownloadState {
  IDLE = 0,
  PICKING = 1,
  SUCCESS = 2,
  FALLBACK = 3,
  FAILED = 4
}

export enum DownloadTarget {
  PICKER = 'picker',
  SANDBOX = 'sandbox'
}

export function supportsDocumentPicker(deviceType: string): boolean {
  return deviceType === 'phone' || deviceType === 'tablet' || deviceType === '2in1';
}

export function resolveDownloadTarget(deviceType: string): DownloadTarget {
  return supportsDocumentPicker(deviceType) ? DownloadTarget.PICKER : DownloadTarget.SANDBOX;
}

export function beginAttempt(previousToken: number): number {
  return previousToken + 1;
}

export function isStaleAttempt(token: number, activeToken: number): boolean {
  return token !== activeToken;
}

export function shouldFallbackOnTimeout(settled: boolean, token: number, activeToken: number): boolean {
  return !settled && token === activeToken;
}

export function nextDownloadState(current: DownloadState, success: boolean): DownloadState {
  return success ? DownloadState.SUCCESS : DownloadState.FALLBACK;
}

export function downloadStateName(state: DownloadState): string {
  switch (state) {
    case DownloadState.PICKING:
      return '等待文件选择器';
    case DownloadState.SUCCESS:
      return '已保存';
    case DownloadState.FALLBACK:
      return '已降级保存到沙箱';
    case DownloadState.FAILED:
      return '保存失败';
    default:
      return '待下载';
  }
}
