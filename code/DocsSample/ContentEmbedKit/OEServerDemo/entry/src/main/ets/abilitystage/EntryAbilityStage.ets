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

import { AbilityStage, Want } from '@kit.AbilityKit';
import { Logger } from '../common/Logger';

export default class EntryAbilityStage extends AbilityStage {
  onCreate(): void {
    Logger.info('AbilityStage onCreate');
  }

  onAcceptWant(want: Want): string {
    Logger.info('Ability onAcceptWant. want.uri: %{public}s', want.uri);
    const isContentEmbed: boolean = (want.parameters?.['isContentEmbed'] as boolean) ?? false;
    if (isContentEmbed) {
      const objectKey: string = (want.parameters?.['id'] as string) ?? '';
      Logger.info('onAcceptWant content-embed objectKey: %{public}s', objectKey);
      return objectKey;
    }
    // Standalone launches (app icon / file manager): reuse a single instance.
    return 'standalone';
  }
}