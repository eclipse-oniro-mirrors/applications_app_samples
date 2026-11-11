import { common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';

export interface BatchStorage {
  read(context: common.ApplicationContext): Promise<string>;
  write(value: string): Promise<void>;
}

export class PreferencesBatchStorage implements BatchStorage {
  private store: preferences.Preferences | undefined = undefined;

  async read(context: common.ApplicationContext): Promise<string> {
    const store: preferences.Preferences = await preferences.getPreferences(context,
      { name: 'shortcut_visibility_batches_v1' });
    const raw: preferences.ValueType = await store.get('journal', '');
    if (typeof raw !== 'string') { throw new Error('batch storage format'); }
    this.store = store;
    return raw;
  }

  async write(value: string): Promise<void> {
    const store: preferences.Preferences | undefined = this.store;
    if (store === undefined) { throw new Error('batch storage unavailable'); }
    await store.put('journal', value);
    await store.flush();
  }
}
