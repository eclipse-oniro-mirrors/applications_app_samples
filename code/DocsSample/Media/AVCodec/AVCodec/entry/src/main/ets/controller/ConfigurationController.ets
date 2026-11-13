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

import { common } from '@kit.AbilityKit';
import { ConfigurationStore, ConfigurationSnapshot } from '../model/ConfigurationStore';
import { UserConfiguration } from '../model/UserConfiguration';
import { PlayerSettingsModel } from '../model/PlayerSettingsModel';
import { CameraDataModel } from '../model/CameraDataModel';
import { LocalizedText } from '../common/LocalizedText';

export class ConfigurationController {
  public ready: boolean = false;
  public touched: boolean = false;

  async load(context: common.Context, allowed: () => boolean,
    apply: (snapshot: ConfigurationSnapshot) => void): Promise<string> {
    if (this.ready) { return ''; }
    try {
      await ConfigurationStore.open(context);
      const snapshot: ConfigurationSnapshot = await ConfigurationStore.load();
      if (!this.touched && allowed()) { apply(snapshot); }
      return '';
    } catch (_error) {
      return LocalizedText.get($r('app.string.configuration_load_default'));
    } finally {
      this.ready = true;
    }
  }

  async save(context: common.Context, settings: PlayerSettingsModel, data: CameraDataModel,
    custom: boolean): Promise<string> {
    this.touched = true;
    const snapshot: ConfigurationSnapshot = UserConfiguration.capture(settings, data);
    try {
      await ConfigurationStore.open(context);
      await ConfigurationStore.save(snapshot, custom);
      return LocalizedText.get(custom ? $r('app.string.configuration_custom_saved') :
        $r('app.string.configuration_saved'));
    } catch (_error) {
      return LocalizedText.get($r('app.string.configuration_save_failed'));
    }
  }

  async select(index: number): Promise<ConfigurationSnapshot> {
    this.touched = true;
    return index < 0 ? ConfigurationStore.load(true) : UserConfiguration.preset(index);
  }
}
