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
import { audio } from '@kit.AudioKit';

export function audioStateString(state: audio.AudioState): string {
  switch (state) {
    case -1:
      return 'STATE_INVALID';
    case 0:
      return 'STATE_NEW';
    case 1:
      return 'STATE_PREPARED';
    case 2:
      return 'STATE_RUNNING';
    case 3:
      return 'STATE_STOPPED';
    case 4:
      return 'STATE_RELEASED';
    case 5:
      return 'STATE_PAUSED';
    default:
      return 'STATE_UNKNOWN';
  }
}