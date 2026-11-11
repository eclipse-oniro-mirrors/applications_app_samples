export const BG: Resource = $r('app.color.page_background');
export const CARD: Resource = $r('app.color.card_background');
export const TEXT: Resource = $r('app.color.text_primary');
export const MUTED: Resource = $r('app.color.text_secondary');
export const ACCENT: Resource = $r('app.color.accent');
export const OK: Resource = $r('app.color.success');
export const DANGER: Resource = $r('app.color.danger');
export const LINE: Resource = $r('app.color.line');

@Component
export struct PageHeader {
  @Prop title: string = '';
  @Prop subtitle: string = '';
  @Prop actionLabel: string = '';
  onBack: (() => void) | undefined = undefined;
  onAction: (() => void) | undefined = undefined;

  build() {
    Column({ space: 8 }) {
      Row({ space: 12 }) {
        if (this.onBack !== undefined) {
          Button('返回', { type: ButtonType.Normal })
            .fontSize(14)
            .fontColor(ACCENT)
            .backgroundColor(Color.Transparent)
            .height(44)
            .constraintSize({ minWidth: 44 })
            .padding({ left: 0, right: 8 })
            .onClick(() => this.onBack?.())
        }
        Text(this.title)
          .fontSize(26)
          .fontWeight(FontWeight.Bold)
          .fontColor(TEXT)
          .layoutWeight(1)
        if (this.actionLabel.length > 0) {
          Button(this.actionLabel)
            .fontSize(14)
            .height(44)
            .fontColor(ACCENT)
            .backgroundColor($r('app.color.accent_soft'))
            .onClick(() => this.onAction?.())
        }
      }
      .width('100%')
      if (this.subtitle.length > 0) {
        Text(this.subtitle).fontSize(14).fontColor(MUTED).width('100%')
      }
    }
    .width('100%')
    .padding({ left: 20, right: 20, top: 16, bottom: 16 })
    .backgroundColor(BG)
  }
}

@Component
export struct StatusBanner {
  @Prop message: string = '';
  @Prop error: boolean = false;

  build() {
    if (this.message.length > 0) {
      Text(this.message)
        .fontSize(14)
        .fontColor(this.error ? DANGER : ACCENT)
        .width('100%')
        .padding(12)
        .backgroundColor(this.error ? $r('app.color.danger_soft') : $r('app.color.accent_soft'))
        .borderRadius(12)
    }
  }
}

@Component
export struct EmptyState {
  @Prop title: string = '';
  @Prop detail: string = '';

  build() {
    Column({ space: 8 }) {
      Text(this.title).fontSize(17).fontWeight(FontWeight.Medium).fontColor(TEXT)
      if (this.detail.length > 0) {
        Text(this.detail).fontSize(14).fontColor(MUTED).textAlign(TextAlign.Center)
      }
    }
    .width('100%')
    .padding({ top: 36, bottom: 36, left: 16, right: 16 })
  }
}

@Component
export struct FieldRow {
  @Prop label: string = '';
  @Prop value: string = '';

  build() {
    Column({ space: 5 }) {
      Text(this.label).fontSize(12).fontColor(MUTED).width('100%')
      Text(this.value).fontSize(15).fontColor(TEXT).width('100%').copyOption(CopyOptions.InApp)
    }
    .width('100%')
    .padding({ top: 10, bottom: 10 })
  }
}
