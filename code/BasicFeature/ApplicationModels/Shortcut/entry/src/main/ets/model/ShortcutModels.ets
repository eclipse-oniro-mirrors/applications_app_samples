import { shortcutManager } from '@kit.AbilityKit';
import { BatchPlan, BatchPreview } from '../services/VisibilityBatch';

export enum PageKey {
  HOME = 'home',
  NOTE = 'note',
  TODO = 'todo',
  COLLECTION = 'collection',
  DETAIL = 'detail',
  ACTIVITY = 'activity'
}

export class FeatureInfo {
  public id: string;
  public page: PageKey;
  public title: string;
  public description: string;
  public icon: Resource;

  constructor(id: string, page: PageKey, title: string, description: string, icon: Resource) {
    this.id = id;
    this.page = page;
    this.title = title;
    this.description = description;
    this.icon = icon;
  }
}

export const FEATURES: FeatureInfo[] = [
  new FeatureInfo('sc.note.new', PageKey.NOTE, '新建便签', '随手记录想法', $r('app.media.shortcut_note')),
  new FeatureInfo('sc.todo.today', PageKey.TODO, '今日待办', '处理今天的任务', $r('app.media.shortcut_todo')),
  new FeatureInfo('sc.collection.saved', PageKey.COLLECTION, '收藏资料', '查看常用资料', $r('app.media.shortcut_collection'))
];

export function featureForId(id: string): FeatureInfo | undefined {
  return FEATURES.find((item: FeatureInfo) => item.id === id);
}

export function featureForPage(page: PageKey): FeatureInfo | undefined {
  return FEATURES.find((item: FeatureInfo) => item.page === page);
}

export function clockText(millis: number): string {
  const date: Date = new Date(millis);
  return `${two(date.getHours())}:${two(date.getMinutes())}:${two(date.getSeconds())}`;
}

function two(value: number): string {
  return value.toString().padStart(2, '0');
}

export class ShortcutItem {
  public id: string = '';
  public title: string = '';
  public visible: boolean = true;
  public visibleExplicit: boolean = true;
  public status: string = '';
  public error: string = '';
  public raw: shortcutManager.ShortcutInfo;

  constructor(info: shortcutManager.ShortcutInfo, title: string) {
    this.raw = info;
    this.id = info.id;
    this.title = title;
    this.visible = info.visible === undefined ? true : info.visible;
    this.visibleExplicit = info.visible !== undefined;
  }
}

export class CallRecord {
  public id: number;
  public time: string;
  public api: string;
  public target: string;
  public status: string;
  public message: string;

  constructor(id: number, time: string, api: string, target: string, status: string, message: string) {
    this.id = id;
    this.time = time;
    this.api = api;
    this.target = target;
    this.status = status;
    this.message = message;
  }
}

export class ShortcutView {
  public support: string = '尚未检测';
  public supportError: string = '';
  public supported: boolean = false;
  public checking: boolean = false;
  public querying: boolean = false;
  public busy: boolean = false;
  public settingId: string = '';
  public batchMessage: string = '';
  public batchReady: boolean = false;
  public batchLoading: boolean = false;
  public batchError: string = '';
  public batches: BatchPlan[] = [];
  public batchPreview: BatchPreview | undefined = undefined;
  public queryError: string = '';
  public lastQuery: string = '';
  public items: ShortcutItem[] = [];
  public records: CallRecord[] = [];
}

export function sourceText(value: number): string {
  switch (value) {
    case 0: return '自定义';
    case 1: return '静态';
    case 2: return '动态';
    default: return `来源 ${value}`;
  }
}
