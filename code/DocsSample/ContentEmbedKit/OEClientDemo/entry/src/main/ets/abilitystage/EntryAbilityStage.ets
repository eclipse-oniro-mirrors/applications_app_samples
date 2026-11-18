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

import { AbilityStage, Want } from '@kit.AbilityKit';
import { Logger } from '../common/Logger';

export default class EntryAbilityStage extends AbilityStage {
  onCreate(): void {
    Logger.info('AbilityStage onCreate');
  }

  /**
   * Computes a 31-based polynomial rolling hash of `str` and returns it as an
   * 8-character, zero-padded hex string.
   *
   * Each char contributes hash = 31 * hash + charCode, truncated to 32 bits on
   * every step to stay within ECMAScript safe-integer range; the final result
   * is reinterpreted as unsigned (>>> 0) before hex conversion.
   */
  stringHashToHex(str: string): string {
    let hash: number = 0;
    for (let i: number = 0; i < str.length; i++) {
      hash = 31 * hash + str.charCodeAt(i);
      hash = hash & 0xFFFFFFFF; // Convert to 32-bit integer.
    }
    // Convert integer hash to hex string and zero-pad.
    return (hash >>> 0).toString(16).padStart(8, '0');
  }

  /**
   * Decides which instance to reuse for a specified-launch want. Returns a hash
   * of want.uri so that each .ole file maps to its own EntryAbility instance,
   * and 'empty' for wants without a uri.
   */
  onAcceptWant(want: Want): string {
    Logger.info('Ability onAcceptWant. want.uri: %{public}s', want.uri);
    if (want.uri) {
      return this.stringHashToHex(want.uri);
    } else {
      return 'empty';
    }
  }
}
