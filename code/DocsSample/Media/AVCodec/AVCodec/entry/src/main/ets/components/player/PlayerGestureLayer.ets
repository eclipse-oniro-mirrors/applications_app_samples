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

@Component
export struct PlayerGestureLayer {
  onDoubleTap: (event: GestureEvent) => void = (_event: GestureEvent): void => {};
  onTap: () => void = (): void => {};
  onLongPress: () => void = (): void => {};
  onLongPressEnd: () => void = (): void => {};

  build() {
    Column()
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Transparent)
      .gesture(
        GestureGroup(GestureMode.Exclusive,
          TapGesture({ count: 2, fingers: 1 })
            .onAction(this.onDoubleTap),
          TapGesture({ count: 1, fingers: 1 })
            .onAction(this.onTap),
          LongPressGesture({ repeat: true })
            .onAction(this.onLongPress)
            .onActionEnd(this.onLongPressEnd)
        )
      )
  }
}
