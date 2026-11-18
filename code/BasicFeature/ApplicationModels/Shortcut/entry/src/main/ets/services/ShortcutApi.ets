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

import { shortcutManager } from '@kit.AbilityKit';

export interface ShortcutApi {
  isShortcutSupported(): boolean;
  getAllShortcutInfoForSelf(): Promise<shortcutManager.ShortcutInfo[]>;
  setShortcutVisibleForSelf(id: string, visible: boolean): Promise<void>;
}

export class PlatformShortcutApi implements ShortcutApi {
  isShortcutSupported(): boolean {
    return shortcutManager.isShortcutSupported();
  }

  getAllShortcutInfoForSelf(): Promise<shortcutManager.ShortcutInfo[]> {
    return shortcutManager.getAllShortcutInfoForSelf();
  }

  setShortcutVisibleForSelf(id: string, visible: boolean): Promise<void> {
    return shortcutManager.setShortcutVisibleForSelf(id, visible);
  }
}
