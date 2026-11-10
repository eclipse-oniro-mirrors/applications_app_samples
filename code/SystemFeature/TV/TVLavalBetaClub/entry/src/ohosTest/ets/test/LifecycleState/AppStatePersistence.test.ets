/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import KeyConstant from '../../../../main/ets/common/Constants/KeyConstant';
import KvManagerService from '../../../../main/ets/common/kvManager/KvManagerService';
import LogManager from '../../../../main/ets/common/Log/LogManager';
import DeviceManager from '../../../../main/ets/common/Device/DeviceManager';

// AppStorage keys used across pages (KeyConstant plus inline keys)
const KEY_PAGE: string = 'page';

const KEY_PHOTO_GROUP_LIST: string = 'photoGroupList';

const KEY_UPLOAD_IMAGE_ARRAY: string = 'uploadImageArr';

const KEY_APP_UID: string = 'appUid';

interface PersistedEntry {
  key: string;
  value: string;
}

// Models the loading flag transition used by Index.ets and IssueReporterAdd.ets
class LoadingStateMachine {
  private loading: boolean = false;

  public show(): void {
    this.loading = true;
  }

  public hide(): void {
    this.loading = false;
  }

  public isLoading(): boolean {
    return this.loading;
  }

  public toggle(): void {
    this.loading = !this.loading;
  }
}

// Models the refresh flag used after a successful submission
class RefreshStateMachine {
  private refreshNeeded: boolean = false;

  public request(): void {
    this.refreshNeeded = true;
  }

  public consume(): boolean {
    const value = this.refreshNeeded;
    this.refreshNeeded = false;
    return value;
  }

  public isNeeded(): boolean {
    return this.refreshNeeded;
  }
}

// Snapshot of persisted state used to verify restore behavior
class StateSnapshot {
  private entries: PersistedEntry[] = [];

  public put(key: string, value: string): void {
    let replaced = false;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].key === key) {
        this.entries[i].value = value;
        replaced = true;
        break;
      }
    }
    if (!replaced) {
      this.entries.push({ key: key, value: value });
    }
  }

  public get(key: string): string {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].key === key) {
        return this.entries[i].value;
      }
    }
    return '';
  }

  public has(key: string): boolean {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].key === key) {
        return true;
      }
    }
    return false;
  }

  public remove(key: string): boolean {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].key === key) {
        this.entries.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public size(): number {
    return this.entries.length;
  }

  public clear(): void {
    this.entries = [];
  }
}

export default function appStatePersistenceTest() {
  describe('AppStatePersistence_Test', () => {
    let loading: LoadingStateMachine;
    let refresh: RefreshStateMachine;
    let snapshot: StateSnapshot;

    beforeAll(() => {
      AppStorage.setOrCreate<boolean>(KeyConstant.IS_SHOW_LOADING, false);
      AppStorage.setOrCreate<boolean>(KeyConstant.IS_NEED_REFRESH, false);
    });

    beforeEach(() => {
      loading = new LoadingStateMachine();
      refresh = new RefreshStateMachine();
      snapshot = new StateSnapshot();
      AppStorage.setOrCreate<boolean>(KeyConstant.IS_SHOW_LOADING, false);
      AppStorage.setOrCreate<boolean>(KeyConstant.IS_NEED_REFRESH, false);
    });

    afterEach(() => {
      AppStorage.setOrCreate<boolean>(KeyConstant.IS_SHOW_LOADING, false);
      AppStorage.setOrCreate<boolean>(KeyConstant.IS_NEED_REFRESH, false);
    });

    afterAll(() => {
      AppStorage.setOrCreate<boolean>(KeyConstant.IS_SHOW_LOADING, false);
      AppStorage.setOrCreate<boolean>(KeyConstant.IS_NEED_REFRESH, false);
    });

    it('loading_flag_should_default_to_false', 0, () => {
      const value = AppStorage.get<boolean>(KeyConstant.IS_SHOW_LOADING);
      expect(value).assertFalse();
      expect(loading.isLoading()).assertFalse();
    });

    it('loading_flag_should_persist_through_app_storage', 0, () => {
      AppStorage.setOrCreate<boolean>(KeyConstant.IS_SHOW_LOADING, true);
      expect(AppStorage.get<boolean>(KeyConstant.IS_SHOW_LOADING)).assertTrue();
      AppStorage.setOrCreate<boolean>(KeyConstant.IS_SHOW_LOADING, false);
      expect(AppStorage.get<boolean>(KeyConstant.IS_SHOW_LOADING)).assertFalse();
    });

    it('refresh_flag_should_survive_repeated_writes', 0, () => {
      AppStorage.setOrCreate<boolean>(KeyConstant.IS_NEED_REFRESH, true);
      expect(AppStorage.get<boolean>(KeyConstant.IS_NEED_REFRESH)).assertTrue();
      AppStorage.setOrCreate<boolean>(KeyConstant.IS_NEED_REFRESH, true);
      expect(AppStorage.get<boolean>(KeyConstant.IS_NEED_REFRESH)).assertTrue();
      expect(refresh.isNeeded()).assertFalse();
    });

    it('refresh_flag_should_be_consumed_once', 0, () => {
      refresh.request();
      expect(refresh.isNeeded()).assertTrue();
      expect(refresh.consume()).assertTrue();
      expect(refresh.isNeeded()).assertFalse();
      expect(refresh.consume()).assertFalse();
    });

    it('loading_state_machine_should_toggle', 0, () => {
      expect(loading.isLoading()).assertFalse();
      loading.show();
      expect(loading.isLoading()).assertTrue();
      loading.toggle();
      expect(loading.isLoading()).assertFalse();
      loading.toggle();
      expect(loading.isLoading()).assertTrue();
      loading.hide();
      expect(loading.isLoading()).assertFalse();
    });

    it('page_index_should_persist_in_app_storage', 0, () => {
      AppStorage.setOrCreate<number>(KEY_PAGE, 0);
      expect(AppStorage.get<number>(KEY_PAGE)).assertEqual(0);
      AppStorage.setOrCreate<number>(KEY_PAGE, 2);
      expect(AppStorage.get<number>(KEY_PAGE)).assertEqual(2);
      AppStorage.setOrCreate<number>(KEY_PAGE, 1);
      expect(AppStorage.get<number>(KEY_PAGE)).assertEqual(1);
    });

    it('app_uid_should_persist_as_number', 0, () => {
      AppStorage.setOrCreate<number>(KEY_APP_UID, 20001234);
      const uid = AppStorage.get<number>(KEY_APP_UID);
      expect(uid).assertEqual(20001234);
      expect((uid as number) > 0).assertTrue();
    });

    it('photo_group_list_should_default_to_undefined_before_observer', 0, () => {
      AppStorage.delete(KEY_PHOTO_GROUP_LIST);
      expect(AppStorage.get(KEY_PHOTO_GROUP_LIST) === undefined).assertTrue();
      AppStorage.setOrCreate<string[]>('photoGroupList', []);
      const groups = AppStorage.get<string[]>('photoGroupList');
      expect(groups !== undefined).assertTrue();
      expect((groups as string[]).length).assertEqual(0);
    });

    it('upload_image_array_should_persist_entries', 0, () => {
      AppStorage.delete(KEY_UPLOAD_IMAGE_ARRAY);
      expect(AppStorage.get(KEY_UPLOAD_IMAGE_ARRAY) === undefined).assertTrue();
      AppStorage.setOrCreate<string[]>(KEY_UPLOAD_IMAGE_ARRAY, ['a.png', 'b.mp4']);
      const items = AppStorage.get<string[]>(KEY_UPLOAD_IMAGE_ARRAY);
      expect((items as string[]).length).assertEqual(2);
      expect((items as string[])[0]).assertEqual('a.png');
    });

    it('snapshot_should_replace_existing_key', 0, () => {
      snapshot.put('page', '0');
      snapshot.put('page', '1');
      expect(snapshot.size()).assertEqual(1);
      expect(snapshot.get('page')).assertEqual('1');
      expect(snapshot.has('page')).assertTrue();
    });

    it('snapshot_should_remove_and_clear', 0, () => {
      snapshot.put('a', '1');
      snapshot.put('b', '2');
      expect(snapshot.size()).assertEqual(2);
      expect(snapshot.remove('a')).assertTrue();
      expect(snapshot.remove('a')).assertFalse();
      expect(snapshot.has('a')).assertFalse();
      expect(snapshot.get('a')).assertEqual('');
      snapshot.clear();
      expect(snapshot.size()).assertEqual(0);
    });

    it('kv_service_should_guard_calls_before_store_creation', 0, () => {
      const originalStore = KvManagerService.kvStore;
      KvManagerService.kvStore = undefined;
      let callbackInvoked = false;
      KvManagerService.getValue(KeyConstant.KV_ISSUE_KEY, (value: string) => {
        callbackInvoked = true;
        expect(value).assertEqual('');
      });
      KvManagerService.putValue(KeyConstant.KV_ISSUE_KEY, 'value');
      KvManagerService.deleteValue(KeyConstant.KV_ISSUE_KEY);
      expect(callbackInvoked).assertFalse();
      expect(KvManagerService.kvStore === undefined).assertTrue();
      KvManagerService.kvStore = originalStore;
    });

    it('kv_service_should_expose_static_api', 0, () => {
      expect(typeof KvManagerService.createKV).assertEqual('function');
      expect(typeof KvManagerService.createStore).assertEqual('function');
      expect(typeof KvManagerService.getValue).assertEqual('function');
      expect(typeof KvManagerService.putValue).assertEqual('function');
      expect(typeof KvManagerService.deleteValue).assertEqual('function');
    });

    it('log_manager_should_emit_without_throwing', 0, () => {
      let errorThrown = false;
      try {
        LogManager.hilogI('persistence test info');
        LogManager.hilogD('persistence test debug');
        LogManager.hilogIWithTag('AppStatePersistence', 'tagged info');
        LogManager.hilogEWithTag('AppStatePersistence', 'tagged error');
      } catch (error) {
        errorThrown = true;
      }
      expect(errorThrown).assertFalse();
    });

    it('device_manager_should_return_strings', 0, () => {
      const manager = DeviceManager.shareInstance();
      expect(manager !== undefined).assertTrue();
      expect(typeof manager.getUdid()).assertEqual('string');
      expect(typeof manager.getDisplayVersion()).assertEqual('string');
      expect(typeof manager.getHardwareModel()).assertEqual('string');
      expect(typeof manager.getDeviceType()).assertEqual('string');
      expect(typeof manager.getProductModel()).assertEqual('string');
      expect(typeof manager.getBootloaderVersion()).assertEqual('string');
    });

    it('device_manager_should_be_singleton', 0, () => {
      const first = DeviceManager.shareInstance();
      const second = DeviceManager.shareInstance();
      expect(first === second).assertTrue();
    });

    it('state_should_be_restorable_from_snapshot', 0, () => {
      snapshot.put(KeyConstant.IS_SHOW_LOADING, 'true');
      snapshot.put(KEY_PAGE, '2');
      snapshot.put(KeyConstant.IS_NEED_REFRESH, 'false');
      AppStorage.setOrCreate<boolean>(KeyConstant.IS_SHOW_LOADING, snapshot.get(KeyConstant.IS_SHOW_LOADING) === 'true');
      AppStorage.setOrCreate<number>(KEY_PAGE, Number(snapshot.get(KEY_PAGE)));
      AppStorage.setOrCreate<boolean>(KeyConstant.IS_NEED_REFRESH, snapshot.get(KeyConstant.IS_NEED_REFRESH) === 'true');
      expect(AppStorage.get<boolean>(KeyConstant.IS_SHOW_LOADING)).assertTrue();
      expect(AppStorage.get<number>(KEY_PAGE)).assertEqual(2);
      expect(AppStorage.get<boolean>(KeyConstant.IS_NEED_REFRESH)).assertFalse();
    });

    it('state_should_reset_cleanly_after_snapshot_clear', 0, () => {
      snapshot.put(KEY_PAGE, '3');
      snapshot.clear();
      const restored = snapshot.has(KEY_PAGE) ? Number(snapshot.get(KEY_PAGE)) : 0;
      expect(restored).assertEqual(0);
      AppStorage.setOrCreate<number>(KEY_PAGE, restored);
      expect(AppStorage.get<number>(KEY_PAGE)).assertEqual(0);
    });
  });
}

