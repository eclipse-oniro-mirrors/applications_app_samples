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
import { PAGE_LOG_LIMIT } from '../common/AppConstants';
import { LogItem, LogLevel, queryLogs } from '../model/LogStore';
import { Logger } from '../utils/Logger';
import { truncateMiddle } from '../utils/FormatUtil';

@Component
export struct LogPanel {
  @StorageProp('appLogs') allLogs: LogItem[] = [];
  filterSource: string = '';
  title: ResourceStr = '';
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
        Text($r('app.string.component_log_count', this.visibleLogs().length))
          .fontSize(AppText.BODY)
          .fontColor(AppColors.TEXT_TERTIARY)
        if (this.visibleLogs().length > 0) {
          Button($r('app.string.component_log_clear'))
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
        Text($r('app.string.component_log_empty'))
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
              .padding({ left: 6, right: 6, top: 2, bottom: 2 })
            Text(truncateMiddle(item.detail, 160))
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
