export const PREFS_NAME: string = 'atomic_service_demo_store';
export const PREFS_TEXT_KEY: string = 'demoText';
export const PREFS_COUNT_KEY: string = 'demoCount';
export const PREFS_MAX_LENGTH: number = 80;

export function normalizePrefsText(raw: string): string {
  const trimmed = raw.trim();
  return trimmed.length > PREFS_MAX_LENGTH ? trimmed.substring(0, PREFS_MAX_LENGTH) : trimmed;
}

export function canSaveText(raw: string): boolean {
  return normalizePrefsText(raw).length > 0;
}

export function nextCount(current: number): number {
  return current >= 0 ? current + 1 : 1;
}

export function readCount(value: number | string | boolean): number {
  if (typeof value === 'number' && value > 0) {
    return Math.floor(value);
  }
  return 0;
}

export function readText(value: number | string | boolean): string {
  return typeof value === 'string' ? value : '';
}

export function buildPrefsSummary(text: string, count: number): string {
  if (text.length > 0) {
    return `已保存「${text}」，读取 ${count} 次`;
  }
  return `尚未写入内容，读取 ${count} 次`;
}
