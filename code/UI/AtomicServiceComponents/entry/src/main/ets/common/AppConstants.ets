export class StorageKeys {
  static readonly NAV_TITLE: string = 'navTitle';
  static readonly NAV_GRADIENT: string = 'navGradient';
  static readonly NAV_HIDE_TITLE: string = 'navHideTitle';
  static readonly NAV_SPLIT: string = 'navSplit';
  static readonly APP_LOGS: string = 'appLogs';
  static readonly LAYOUT_PROFILE: string = 'layoutProfile';
}

export enum RouteKey {
  NAVIGATION = 'navigation',
  SEARCH = 'search',
  TABS = 'tabs',
  WEB = 'web',
  DOWNLOAD = 'download',
  HALF_SCREEN = 'halfScreen',
  JUMP = 'jump',
  SHEET = 'sheet',
  PREFS = 'prefs'
}

export function isRouteKey(value: string): boolean {
  return value === RouteKey.NAVIGATION || value === RouteKey.SEARCH || value === RouteKey.TABS ||
    value === RouteKey.WEB || value === RouteKey.DOWNLOAD || value === RouteKey.HALF_SCREEN ||
    value === RouteKey.JUMP || value === RouteKey.SHEET || value === RouteKey.PREFS;
}

export const DEFAULT_NAV_TITLE: string = '原子化服务组件';
export const NAV_TITLE_PRESETS: string[] = ['原子化服务组件', '组件演示中心'];

export const TAB_COUNT: number = 3;
export const PICKER_TIMEOUT_MS: number = 3000;
export const JUMP_TIMEOUT_MS: number = 3000;

export const LOG_STORE_CAPACITY: number = 200;
export const PAGE_LOG_LIMIT: number = 20;
export const HOME_LOG_LIMIT: number = 30;

export const HILOG_DOMAIN: number = 0x0000;
export const HILOG_TAG: string = 'AtomicServiceComponents';

export const HALF_SCREEN_APP_ID: string = '576000000000000000';
