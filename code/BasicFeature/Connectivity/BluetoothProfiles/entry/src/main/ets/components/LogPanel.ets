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

import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../common/Theme';
import { PAGE_LOG_LIMIT, LOG_DETAIL_MAX_CHARS } from '../common/AppConstants';
import { text } from '../common/StringResource';
import { LogItem, LogLevel, queryLogs } from '../model/LogStore';
import { Logger } from '../utils/Logger';
import { truncateMiddle } from '../utils/FormatUtil';

@Component
export struct LogPanel {
  @StorageProp('appLogs') allLogs: LogItem[] = [];
  filterSource: string = '';
  title: string = text('log_panel_title');
  maxItems: number = PAGE_LOG_LIMIT;

  private visibleLogs(): LogItem[] {
    return queryLogs(this.allLogs, this.filterSource, LogLevel.DEBUG, '', this.maxItems);
  }

  private tagBackground(item: LogItem): string {
    if (item.level === LogLevel.ERROR) {
      return AppColors.DANGER_SOFT;
    }
    if (item.level === LogLevel.WARN) {
      return AppColors.WARNING_SOFT;
    }
    return AppColors.PRIMARY_SOFT;
  }

  private tagColor(item: LogItem): string {
    if (item.level === LogLevel.ERROR) {
      return AppColors.DANGER;
    }
    if (item.level === LogLevel.WARN) {
      return AppColors.WARNING;
    }
    return AppColors.PRIMARY;
  }

  build() {
    Column({ space: AppSpacing.MD }) {
      Row({ space: AppSpacing.MD }) {
        Text(this.title)
          .fontSize(AppText.SECTION)
          .fontWeight(FontWeight.Medium)
          .fontColor(AppColors.TEXT_PRIMARY)
        Blank()
        Text(text('log_count', this.visibleLogs().length))
          .fontSize(AppText.BODY)
          .fontColor(AppColors.TEXT_TERTIARY)
        if (this.visibleLogs().length > 0) {
          Button(text('log_clear'))
            .fontSize(AppText.SMALL)
            .height(AppSize.BUTTON_SM)
            .backgroundColor(AppColors.SOFT_BG)
            .fontColor(AppColors.TEXT_STRONG)
            .onClick(() => {
              Logger.clear();
            })
        }
      }
      .width('100%')

      if (this.visibleLogs().length === 0) {
        Text(text('log_empty'))
          .fontSize(AppText.BODY)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')
          .padding({ top: AppSpacing.SM, bottom: AppSpacing.SM })
      } else {
        ForEach(this.visibleLogs(), (item: LogItem) => {
          Row({ space: AppSpacing.MD }) {
            Text(item.time)
              .fontSize(AppText.SMALL)
              .fontColor(AppColors.TEXT_TERTIARY)
              .fontFamily('monospace')
            Text(`${item.source}·${item.tag}`)
              .fontSize(AppText.SMALL)
              .fontColor(this.tagColor(item))
              .backgroundColor(this.tagBackground(item))
              .borderRadius(AppRadius.TAG)
              .padding({
                left: AppSpacing.SM,
                right: AppSpacing.SM,
                top: AppSpacing.XXS,
                bottom: AppSpacing.XXS
              })
            Text(truncateMiddle(item.detail, LOG_DETAIL_MAX_CHARS))
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_STRONG)
              .layoutWeight(1)
          }
          .width('100%')
          .alignItems(VerticalAlign.Top)
        }, (item: LogItem) => item.id.toString())
      }
    }
    .width('100%')
    .padding(AppSpacing.XL)
    .backgroundColor(AppColors.CARD_BG)
    .borderRadius(AppRadius.LARGE)
  }
}
