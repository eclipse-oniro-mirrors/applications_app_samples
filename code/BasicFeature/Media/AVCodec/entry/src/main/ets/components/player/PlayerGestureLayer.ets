/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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
