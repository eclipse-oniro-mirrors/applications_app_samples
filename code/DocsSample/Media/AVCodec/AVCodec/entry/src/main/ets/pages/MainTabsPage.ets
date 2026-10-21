/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

@Component
export struct MainTabsPage {
  @Prop activeIndex: number = 0;
  @BuilderParam playerContent: () => void;
  @BuilderParam libraryContent: () => void;
  @BuilderParam recorderContent: () => void;
  @BuilderParam deviceContent: () => void;
  @BuilderParam navigationContent: () => void;

  @Builder
  private tabContent() {
    Stack() {
      this.playerContent()
      if (this.activeIndex === 1) {
        Column() {
          this.libraryContent()
        }
        .width('100%')
        .height('100%')
        .backgroundColor(Color.White)
      } else if (this.activeIndex === 2) {
        Column() {
          this.recorderContent()
        }
        .width('100%')
        .height('100%')
        .backgroundColor('#F8F9FA')
      } else if (this.activeIndex === 3) {
        Column() {
          this.deviceContent()
        }
        .width('100%')
        .height('100%')
        .backgroundColor(Color.White)
      }
    }
    .width('100%')
    .layoutWeight(1)
  }

  build() {
    Column() {
      this.tabContent()
      this.navigationContent()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }
}
