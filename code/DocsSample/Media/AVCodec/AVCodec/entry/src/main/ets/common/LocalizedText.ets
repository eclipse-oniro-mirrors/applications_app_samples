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

import { resourceManager } from '@kit.LocalizationKit';
import Logger from './utils/Logger';

// Ability 创建时绑定应用资源；每次读取都交给资源管理器，不缓存某种语言的文本。
export class LocalizedText {
  private static resources: resourceManager.ResourceManager | undefined = undefined;

  static bind(resources: resourceManager.ResourceManager): void {
    LocalizedText.resources = resources;
  }

  static get(resource: Resource): string {
    if (LocalizedText.resources === undefined) {
      return '';
    }
    try {
      return LocalizedText.resources.getStringSync(resource.id);
    } catch (error) {
      Logger.error('LocalizedText', 'Read string resource failed: ' + JSON.stringify(error));
      return '';
    }
  }

  static format(resource: Resource, first: string, second: string = '', third: string = ''): string {
    if (LocalizedText.resources === undefined) {
      return '';
    }
    try {
      return LocalizedText.resources.getStringSync(resource.id, first, second, third);
    } catch (error) {
      Logger.error('LocalizedText', 'Format string resource failed: ' + JSON.stringify(error));
      return '';
    }
  }
}
