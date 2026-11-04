/**
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

import { inputEventClient, pointer } from '@kit.InputKit';
import { window } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import { BusinessError, emitter } from '@kit.BasicServicesKit';

/**
 * 事件相关工具类
 */
export class EventUtil {
  public static pixelMap: image.PixelMap | null = null;

  /**
   * 手动触发 entry键
   */
  static keyEventEntry(): void {
    try {
      let backKeyDown: inputEventClient.KeyEvent = {
        isPressed: true,
        keyCode: 2054,
        keyDownDuration: 0,
        isIntercepted: false
      }

      class EventDown {
        public keyEvent: inputEventClient.KeyEvent | null = null;
      }

      let eventDown: EventDown = { keyEvent: backKeyDown }
      inputEventClient.injectKeyEvent(eventDown);

      let backKeyUp: inputEventClient.KeyEvent = {
        isPressed: false,
        keyCode: 2054,
        keyDownDuration: 0,
        isIntercepted: false
      };

      class EventUp {
        public keyEvent: inputEventClient.KeyEvent | null = null;
      }

      let eventUp: EventUp = { keyEvent: backKeyUp }
      inputEventClient.injectKeyEvent(eventUp);
    } catch (error) {
      console.log(`Failed to inject KeyEvent, error: ${JSON.stringify(error, [`code`, `message`])}`);
    }

  }


  /**
   * 判断是否触发触摸事件
   * @returns 判断结果
   */
  static isTouchEvent(event: TouchEvent): boolean {

    if (event.type == TouchType.Down) {
      return false;
    }

    return event.source == SourceType.Mouse || event.source == SourceType.TouchScreen;
  }

  /**
   * 聚焦处理
   * @param keyItem 按键值
   * @param uniqueId 界面唯一id
   */
  static onHoverDetail(keyItem: String, uniqueId: number): void {
    try {
      AppStorage.setOrCreate('focusItem', keyItem);
      emitter.emit('auto_focus', { data: uniqueId });
    } catch (e) {
      console.error(e);
    }
  }
}
