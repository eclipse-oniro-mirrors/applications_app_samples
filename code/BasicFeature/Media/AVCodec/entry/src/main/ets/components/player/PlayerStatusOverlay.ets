/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

@Component
export struct PlayerStatusOverlay {
  @Prop audioOnly: boolean = false;
  @Prop audioOnlyText: string = '';
  @Prop hdrVisible: boolean = false;
  @Prop hdrLabel: string = 'HDR Vivid';
  @Prop subtitleText: string = '';
  @Prop subtitleVisible: boolean = false;
  @Prop subtitleFontSize: string = '18fp';
  @Prop subtitleFontColor: string = '#FFFFFF';
  @Prop subtitleBackgroundColor: string = '#99000000';
  @Prop subtitleAtBottom: boolean = true;

  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      if (this.audioOnly) {
        Text(this.audioOnlyText)
          .fontSize('20fp')
          .fontColor('#B3FFFFFF')
          .align(Alignment.Center)
          .hitTestBehavior(HitTestMode.None)
      }
      if (this.hdrVisible) {
        Text(this.hdrLabel)
          .fontSize('13fp')
          .fontColor('#E8FFFFFF')
          .backgroundColor('#4D101820')
          .padding({ left: '10vp', right: '10vp', top: '5vp', bottom: '5vp' })
          .borderRadius('4vp')
          .margin({ top: '16vp', right: '16vp' })
          .hitTestBehavior(HitTestMode.None)
      }
      if (this.subtitleText.length > 0 && this.subtitleVisible) {
        Text(this.subtitleText)
          .fontSize(this.subtitleFontSize)
          .fontColor(this.subtitleFontColor)
          .textAlign(TextAlign.Center)
          .backgroundColor(this.subtitleBackgroundColor)
          .textShadow({ radius: 2, color: '#FF000000', offsetX: 1, offsetY: 1 })
          .padding({ left: '12vp', right: '12vp', top: '4vp', bottom: '4vp' })
          .margin({ left: '24vp', right: '24vp', top: '72vp', bottom: '72vp' })
          .align(this.subtitleAtBottom ? Alignment.Bottom : Alignment.Top)
          .hitTestBehavior(HitTestMode.None)
      }
    }
    .width('100%')
    .height('100%')
  }
}
