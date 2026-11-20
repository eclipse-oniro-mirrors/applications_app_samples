/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

@Component
export struct PlayerPage {
  @BuilderParam surfaceContent: () => void;
  @BuilderParam gestureContent: () => void;
  @BuilderParam controlsContent: () => void;

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      this.surfaceContent()
      this.gestureContent()
      this.controlsContent()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }
}
