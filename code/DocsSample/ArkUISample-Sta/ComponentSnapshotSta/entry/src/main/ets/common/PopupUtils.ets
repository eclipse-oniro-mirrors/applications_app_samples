'use static'

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

import { Position } from '@kit.ArkUI';

/**
 * Calculate the snapshot preview pop-up position class
 */
export class PopupUtils {
  static calcPopupCenter(displayWidth: int, displayHeight: int, snapPopupWidth: int,
    snapPopupHeight: int): Position {
    return {
      x: (displayWidth - snapPopupWidth) / 2,
      y: (displayHeight - snapPopupHeight) / 2
    } as Position;
  }

  static calcPopupBottomLeft(displayHeight: int, snapPopupHeight: int): Position {
    return {
      x: 20,
      y: displayHeight - snapPopupHeight - 40
    } as Position;
  }
}
