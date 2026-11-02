/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { LocalizedText } from '../common/LocalizedText';
import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';

export interface ConfigurationSnapshot {
  player: number[];
  recorder: number[];
  dump: number[];
}

// 只保存可复用的设置，不保存文件描述符、媒体 URI、音轨索引和运行中状态。
export class ConfigurationStore {
  private static store: preferences.Preferences | undefined = undefined;
  private static opening: Promise<void> | undefined = undefined;
  private static writes: Promise<void> = Promise.resolve();

  static async open(context: common.Context): Promise<void> {
    if (ConfigurationStore.opening === undefined) {
      ConfigurationStore.opening = preferences.getPreferences(context, { name: 'avcodec_configuration_v1' })
        .then((store: preferences.Preferences): void => { ConfigurationStore.store = store; })
        .catch((error: Error): void => {
          ConfigurationStore.opening = undefined;
          throw error;
        });
    }
    await ConfigurationStore.opening;
  }

  static async load(custom: boolean = false): Promise<ConfigurationSnapshot> {
    const store = ConfigurationStore.store;
    if (store === undefined) {
      throw new Error(LocalizedText.get($r('app.string.configuration_store_unopened')));
    }
    await ConfigurationStore.writes;
    const prefix: string = custom ? 'custom.' : 'current.';
    const values = ConfigurationStore.numbers(await store.get(prefix + 'snapshot', []));
    const counts = values.slice(1, 4);
    if (values[0] !== 1 || counts.length !== 3 ||
      !counts.every((count: number): boolean => Number.isInteger(count) && count >= 0 && count <= 256) ||
      values.length !== 4 + counts[0] + counts[1] + counts[2]) {
      return { player: [], recorder: [], dump: [] };
    }
    const recorderOffset: number = 4 + counts[0];
    const dumpOffset: number = recorderOffset + counts[1];
    return {
      player: values.slice(4, recorderOffset),
      recorder: values.slice(recorderOffset, dumpOffset),
      dump: values.slice(dumpOffset)
    };
  }

  static save(snapshot: ConfigurationSnapshot, custom: boolean = false): Promise<void> {
    // 入队前复制。用户连续应用设置时，后一次修改不能改变前一次正在写入的数据。
    const copy: ConfigurationSnapshot = {
      player: snapshot.player.slice(), recorder: snapshot.recorder.slice(), dump: snapshot.dump.slice()
    };
    const task: Promise<void> = ConfigurationStore.writes.then(async (): Promise<void> => {
      const store = ConfigurationStore.store;
      if (store === undefined) {
        throw new Error(LocalizedText.get($r('app.string.configuration_store_unopened')));
      }
      const prefix: string = custom ? 'custom.' : 'current.';
      // 一组配置只写一个值，避免写到一半失败时把新播放参数和旧录制参数混在一起。
      const values: number[] = [1, copy.player.length, copy.recorder.length, copy.dump.length]
        .concat(copy.player, copy.recorder, copy.dump);
      await store.put(prefix + 'snapshot', values);
      await store.flush();
    });
    ConfigurationStore.writes = task.catch((): void => {});
    return task;
  }

  private static numbers(stored: preferences.ValueType): number[] {
    if (!Array.isArray(stored)) {
      return [];
    }
    const values = stored as number[];
    return values.every((item: number): boolean => typeof item === 'number' && Number.isFinite(item)) ?
      values.slice() : [];
  }
}
