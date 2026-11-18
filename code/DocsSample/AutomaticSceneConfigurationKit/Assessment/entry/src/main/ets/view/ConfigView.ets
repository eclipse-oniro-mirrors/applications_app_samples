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
              .padding({ left: $r('app.float.chip_padding_h'), right: $r('app.float.chip_padding_h'), top: $r('app.float.chip_padding_v'), bottom: $r('app.float.chip_padding_v') })
              .borderRadius($r('app.float.card_radius'))
              .margin({ right: $r('app.float.space_medium'), bottom: $r('app.float.space_medium') })
              .onClick(() => {
                this.onDurationChange(obj.index);
              })
          })
      }
      .width('100%')

      Divider()
        .color($r('app.color.divider'))

      Row({ space: 8 }) {
        Text($r('app.string.allowed_apps_label'))
          .fontSize($r('app.float.font_size_caption'))
          .fontColor($r('app.color.secondary_font'))
        Text($r('app.string.whitelist_help_icon'))
          .fontSize($r('app.float.icon_font_size'))
          .fontColor($r('app.color.secondary_font'))
          .width($r('app.float.icon_size'))
          .height($r('app.float.icon_size'))
          .textAlign(TextAlign.Center)
          .borderRadius($r('app.float.icon_radius'))
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
          .height($r('app.float.input_height'))
          .id('assessment_bundle_input')
          .onChange((value: string) => {
            this.onInputChange(value);
          })
        Button($r('app.string.allowed_apps_add'))
          .height($r('app.float.input_height'))
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
                .height($r('app.float.small_button_height'))
                .fontSize($r('app.float.font_size_caption'))
                .backgroundColor($r('app.color.page_background'))
                .fontColor($r('app.color.warning'))
                .onClick(() => {
                  this.onRemoveApp(obj.item);
                })
            }
            .width('100%')
            .padding({ top: $r('app.float.space_small'), bottom: $r('app.float.space_small') })
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
      Text($r('app.string.whitelist_popup_description'))
        .fontSize($r('app.float.font_size_caption'))
        .fontColor($r('app.color.body_font'))
        .width('100%')

      Divider()
        .color($r('app.color.divider'))

      Text($r('app.string.whitelist_default_apps_label'))
        .fontSize($r('app.float.font_size_caption'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_font'))

      Column({ space: 4 }) {
        Row({ space: 6 }) {
          Text($r('app.string.whitelist_help_icon'))
            .fontSize($r('app.float.font_size_caption'))
            .fontColor($r('app.color.secondary_font'))
          Text($r('app.string.whitelist_app_self'))
            .fontSize($r('app.float.font_size_caption'))
            .fontColor($r('app.color.body_font'))
            .maxLines(1)
            .layoutWeight(1)
        }
        .width('100%')

        Row({ space: 6 }) {
          Text($r('app.string.whitelist_help_icon'))
            .fontSize($r('app.float.font_size_caption'))
            .fontColor($r('app.color.secondary_font'))
          Text($r('app.string.whitelist_app_emergency'))
            .fontSize($r('app.float.font_size_caption'))
            .fontColor($r('app.color.body_font'))
            .maxLines(1)
            .layoutWeight(1)
        }
        .width('100%')

        Row({ space: 6 }) {
          Text($r('app.string.whitelist_help_icon'))
            .fontSize($r('app.float.font_size_caption'))
            .fontColor($r('app.color.secondary_font'))
          Text($r('app.string.whitelist_app_screenreader'))
            .fontSize($r('app.float.font_size_caption'))
            .fontColor($r('app.color.body_font'))
            .maxLines(1)
            .layoutWeight(1)
        }
        .width('100%')
      }
      .width('100%')
    }
    .width($r('app.float.popup_width'))
    .padding($r('app.float.component_space'))
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
