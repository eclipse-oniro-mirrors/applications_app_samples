import { AssessmentConstants } from '../common/constants/AssessmentConstants';
import Logger from '../common/utils/Logger';

@ComponentV2
export default struct ConfigView {
  @Param durationIndex: number = 1;
  @Param allowedApps: string[] = [AssessmentConstants.DEFAULT_ALLOWED_APP];
  @Param inputBundle: string = '';
  @Event onDurationChange: (index: number) => void = () => {};
  @Event onInputChange: (value: string) => void = () => {};
  @Event onAddApp: () => void = () => {};
  @Event onRemoveApp: (bundle: string) => void = () => {};
  @Local showWhitelistPopup: boolean = false;

  private durationCandidates: number[] = [
    AssessmentConstants.DURATION_DEFAULT,
    AssessmentConstants.DURATION_TEN_MINUTES,
    AssessmentConstants.DURATION_THIRTY_MINUTES,
    AssessmentConstants.DURATION_SIXTY_MINUTES
  ];

  build() {
    Column({ space: 12 }) {
      Text($r('app.string.config_title'))
        .fontSize($r('app.float.font_size_section'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_font'))

      Text($r('app.string.duration_label'))
        .fontSize($r('app.float.font_size_caption'))
        .fontColor($r('app.color.secondary_font'))

      Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start }) {
        Repeat<number>(this.durationCandidates)
          .each((obj: RepeatItem<number>) => {
            Text(this.formatDuration(obj.item))
              .fontSize($r('app.float.font_size_caption'))
              .fontColor(this.durationIndex === obj.index ?
              $r('app.color.card_background') : $r('app.color.body_font'))
              .backgroundColor(this.durationIndex === obj.index ?
              $r('app.color.brand') : $r('app.color.page_background'))
              .padding({ left: 12, right: 12, top: 6, bottom: 6 })
              .borderRadius(16)
              .margin({ right: 8, bottom: 8 })
              .onClick(() => {
                this.onDurationChange(obj.index);
              })
          })
      }
      .width('100%')

      Divider()
        .color($r('app.color.divider'))

      Row({ space: 6 }) {
        Text($r('app.string.allowed_apps_label'))
          .fontSize($r('app.float.font_size_caption'))
          .fontColor($r('app.color.secondary_font'))
        Text('?')
          .fontSize(10)
          .fontColor($r('app.color.secondary_font'))
          .width(18)
          .height(18)
          .textAlign(TextAlign.Center)
          .borderRadius(9)
          .backgroundColor($r('app.color.page_background'))
          .onClick(() => {
            this.showWhitelistPopup = !this.showWhitelistPopup;
          })
          .bindPopup(this.showWhitelistPopup, {
            builder: this.whitelistPopupBuilder,
            placement: Placement.Bottom,
            onStateChange: (e: PopupStateChangeParam) => {
              if (!e.isVisible) {
                this.showWhitelistPopup = false;
              }
            }
          })
      }
      .width('100%')

      Row({ space: 8 }) {
        TextInput({ placeholder: $r('app.string.allowed_apps_placeholder'), text: this.inputBundle })
          .layoutWeight(1)
          .height(40)
          .id('assessment_bundle_input')
          .onChange((value: string) => {
            this.onInputChange(value);
          })
        Button($r('app.string.allowed_apps_add'))
          .height(40)
          .fontSize($r('app.float.font_size_caption'))
          .id('assessment_add_button')
          .onClick(() => {
            this.onAddApp();
          })
      }
      .width('100%')

      if (this.allowedApps.length === 0) {
        Text($r('app.string.allowed_apps_empty'))
          .fontSize($r('app.float.font_size_caption'))
          .fontColor($r('app.color.secondary_font'))
      } else {
        Repeat<string>(this.allowedApps)
          .each((obj: RepeatItem<string>) => {
            Row({ space: 8 }) {
              Text(obj.item)
                .fontSize($r('app.float.font_size_caption'))
                .fontColor($r('app.color.body_font'))
                .layoutWeight(1)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              Button($r('app.string.allowed_apps_remove'))
                .height(28)
                .fontSize($r('app.float.font_size_caption'))
                .backgroundColor($r('app.color.page_background'))
                .fontColor($r('app.color.warning'))
                .onClick(() => {
                  this.onRemoveApp(obj.item);
                })
            }
            .width('100%')
            .padding({ top: 4, bottom: 4 })
          })
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding($r('app.float.card_padding'))
    .backgroundColor($r('app.color.card_background'))
    .borderRadius($r('app.float.card_radius'))
  }

  @Builder
  whitelistPopupBuilder() {
    Column({ space: 8 }) {
      Text('白名单中的应用在评估模式期间仍可正常运行，未加入白名单的应用将被限制使用。')
        .fontSize($r('app.float.font_size_caption'))
        .fontColor($r('app.color.body_font'))
        .width('100%')

      Divider()
        .color($r('app.color.divider'))

      Text('默认白名单应用：')
        .fontSize($r('app.float.font_size_caption'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_font'))

      Column({ space: 4 }) {
        Row({ space: 6 }) {
          Text('•')
            .fontSize($r('app.float.font_size_caption'))
            .fontColor($r('app.color.secondary_font'))
          Text('com.samples.assessment：本应用')
            .fontSize($r('app.float.font_size_caption'))
            .fontColor($r('app.color.body_font'))
            .maxLines(1)
            .layoutWeight(1)
        }
        .width('100%')

        Row({ space: 6 }) {
          Text('•')
            .fontSize($r('app.float.font_size_caption'))
            .fontColor($r('app.color.secondary_font'))
          Text('com.huawei.hmos.emergency…：地震预警')
            .fontSize($r('app.float.font_size_caption'))
            .fontColor($r('app.color.body_font'))
            .maxLines(1)
            .layoutWeight(1)
        }
        .width('100%')

        Row({ space: 6 }) {
          Text('•')
            .fontSize($r('app.float.font_size_caption'))
            .fontColor($r('app.color.secondary_font'))
          Text('com.huawei.hmos.screenreader：屏幕朗读')
            .fontSize($r('app.float.font_size_caption'))
            .fontColor($r('app.color.body_font'))
            .maxLines(1)
            .layoutWeight(1)
        }
        .width('100%')
      }
      .width('100%')
    }
    .width(340)
    .padding(12)
    .backgroundColor($r('app.color.card_background'))
    .borderRadius($r('app.float.card_radius'))
    .alignItems(HorizontalAlign.Start)
  }

  private formatDuration(duration: number): Resource {
    if (duration === AssessmentConstants.DURATION_DEFAULT) {
      return $r('app.string.duration_default');
    }
    return $r('app.string.duration_minutes', duration / AssessmentConstants.MILLIS_PER_MINUTE);
  }
}
