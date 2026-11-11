import { Want } from '@kit.AbilityKit';
import { PageKey } from '../model/ShortcutModels';

export class LaunchRequest {
  public page: PageKey;
  public source: string;
  public error: string;
  public filter: string;
  public id: string;

  constructor(page: PageKey, source: string, error: string = '', filter: string = '', id: string = '') {
    this.page = page;
    this.source = source;
    this.error = error;
    this.filter = filter;
    this.id = id;
  }

  key(): string {
    return `${this.page}:${this.filter}:${this.id}`;
  }
}

export function parseLaunchRequest(want: Want, cold: boolean): LaunchRequest {
  const source: string = cold ? '冷启动' : '热启动';
  const params = want.parameters;
  const action = params === undefined ? undefined : params['sc.action'];
  const version = params === undefined ? undefined : params['sc.version'];
  const filter = params === undefined ? undefined : params['sc.filter'];
  if (action === undefined && version === undefined && filter === undefined) {
    return new LaunchRequest(PageKey.HOME, source);
  }
  if (version !== '1') {
    return new LaunchRequest(PageKey.HOME, source, '快捷方式参数版本无效');
  }
  if (action === 'note.new' && (filter === undefined || filter === '')) {
    return new LaunchRequest(PageKey.NOTE, source);
  }
  if (action === 'todo.list' && filter === 'todayOpen') {
    return new LaunchRequest(PageKey.TODO, source, '', 'todayOpen');
  }
  if (action === 'collection.list' && filter === 'saved') {
    return new LaunchRequest(PageKey.COLLECTION, source, '', 'saved');
  }
  return new LaunchRequest(PageKey.HOME, source, '快捷方式操作或筛选值无效');
}
