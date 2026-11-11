import { common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';

export class BusinessWriteError extends Error {
  public uncertain: boolean;
  constructor(message: string, uncertain: boolean) {
    super(message);
    this.uncertain = uncertain;
  }
}

export interface BusinessStorage {
  read(context: common.ApplicationContext): Promise<string>;
  write(value: string): Promise<void>;
  reload(context: common.ApplicationContext): Promise<string>;
}

export class PreferencesBusinessStorage implements BusinessStorage {
  private store: preferences.Preferences | undefined = undefined;
  private namespace: string;

  constructor(namespace: string = 'shortcut_business_v1') {
    this.namespace = namespace;
  }

  async read(context: common.ApplicationContext): Promise<string> {
    const store: preferences.Preferences = await preferences.getPreferences(context,
      { name: this.namespace });
    const raw: preferences.ValueType = await store.get('workspace', '');
    if (typeof raw !== 'string') { throw new Error('存储格式错误'); }
    this.store = store;
    return raw;
  }

  async reload(context: common.ApplicationContext): Promise<string> {
    this.store = undefined;
    await preferences.removePreferencesFromCache(context, this.namespace);
    return this.read(context);
  }

  async write(value: string): Promise<void> {
    const store: preferences.Preferences | undefined = this.store;
    if (store === undefined) { throw new BusinessWriteError('存储尚未初始化', false); }
    try {
      await store.put('workspace', value);
      await store.flush();
    } catch (_) {
      throw new BusinessWriteError('存档写入结果未确认', true);
    }
  }
}
