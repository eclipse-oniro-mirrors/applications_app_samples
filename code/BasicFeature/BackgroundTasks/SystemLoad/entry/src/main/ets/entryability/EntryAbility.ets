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

import { UIAbility } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { logger } from '@ohos/systemload';
import { SYSTEM_LOAD_PAGE_VISIBLE } from '../systemload/SystemLoadPage';

export default class EntryAbility extends UIAbility {
  onForeground(): void {
    // 应用回到前台：更新AppStorage，驱动SystemLoadPage的@Watch重新查询并注册监听
    logger.info('SystemLoad ability moved to foreground');
    AppStorage.setOrCreate<boolean>(SYSTEM_LOAD_PAGE_VISIBLE, true);
  }

  onBackground(): void {
    // 应用退入后台：更新AppStorage，驱动SystemLoadPage注销监听避免后台回调
    logger.info('SystemLoad ability moved to background');
    AppStorage.setOrCreate<boolean>(SYSTEM_LOAD_PAGE_VISIBLE, false);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.loadContent('pages/Index', (err: BusinessError) => {
      if (err.code) {
        logger.error(`Failed to load SystemLoad page: ${JSON.stringify(err)}`);
        return;
      }
      logger.info('SystemLoad page loaded');
    });
  }

  onWindowStageDestroy(): void {
    logger.info('SystemLoad window stage destroyed');
  }
}
