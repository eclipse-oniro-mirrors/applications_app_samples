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

import { skillManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Logger from '../../util/Logger';
import {
  BODY_FONT_SIZE,
  BUTTON_HEIGHT,
  CARD_RADIUS,
  CONTENT_MAX_WIDTH,
  DEFAULT_BUNDLE_NAME,
  FLAG_VALUES,
  ITEM_SPACING,
  LABEL_WIDTH,
  MODULE_NAME_ARRAY,
  PAGE_PADDING,
  SECTION_SPACING,
  SKILL_ARRAY,
  SUBTITLE_FONT_SIZE,
  TITLE_FONT_SIZE
} from '../../util/Constant';

interface SkillHistoryRecord {
  skillName: string;
  moduleName: string;
  bundleName: string;
  queryTime: number;
  duration: number;
  success: boolean;
  errorMessage: string;
  skillType: number;
  skillPath: string;
}

@Entry
@Component
struct SkillHistoryPage {
  @State private historyRecords: SkillHistoryRecord[] = [];
  @State private isOperating: boolean = false;
  @State private operationResult: ResourceStr = $r('app.string.operation_ready');
  @State private filterModule: string = '';
  @State private filterSuccessOnly: boolean = false;
  @State private filterFailedOnly: boolean = false;
  @State private totalQueryCount: number = 0;
  @State private successQueryCount: number = 0;
  @State private failedQueryCount: number = 0;
  @State private averageDuration: number = 0;

  private formatTimestamp(timestamp: number): string {
    const date: Date = new Date(timestamp);
    const year: number = date.getFullYear();
    const month: string = String(date.getMonth() + 1).padStart(2, '0');
    const day: string = String(date.getDate()).padStart(2, '0');
    const hours: string = String(date.getHours()).padStart(2, '0');
    const minutes: string = String(date.getMinutes()).padStart(2, '0');
    const seconds: string = String(date.getSeconds()).padStart(2, '0');
    return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
  }

  private formatDuration(duration: number): string {
    if (duration < 1000) {
      return `${duration}ms`;
    }
    const seconds: number = Math.floor(duration / 1000);
    const millis: number = duration % 1000;
    return `${seconds}s ${millis}ms`;
  }

  private recalculateStats(): void {
    this.totalQueryCount = this.historyRecords.length;
    let successCount: number = 0;
    let failedCount: number = 0;
    let totalDuration: number = 0;
    for (let i: number = 0; i < this.historyRecords.length; i++) {
      if (this.historyRecords[i].success) {
        successCount++;
      } else {
        failedCount++;
      }
      totalDuration += this.historyRecords[i].duration;
    }
    this.successQueryCount = successCount;
    this.failedQueryCount = failedCount;
    this.averageDuration = this.totalQueryCount > 0
      ? Math.round(totalDuration / this.totalQueryCount)
      : 0;
  }

  private async queryAllSkills(): Promise<void> {
    this.isOperating = true;
    try {
      for (let i: number = 0; i < SKILL_ARRAY.length; i++) {
        const skillName: string = SKILL_ARRAY[i];
        const moduleName: string = MODULE_NAME_ARRAY[0];
        const startTime: number = Date.now();
        try {
          const skillInfo: skillManager.SkillInfo =
            await skillManager.getSkillInfoForSelf(moduleName, skillName, FLAG_VALUES[0]);
          const endTime: number = Date.now();
          const record: SkillHistoryRecord = {
            skillName: skillInfo.skillName,
            moduleName: skillInfo.moduleName,
            bundleName: skillInfo.bundleName,
            queryTime: endTime,
            duration: endTime - startTime,
            success: true,
            errorMessage: '',
            skillType: skillInfo.skillType,
            skillPath: skillInfo.skillPath
          };
          this.historyRecords.push(record);
          Logger.info(`History query success: ${skillName} in ${endTime - startTime}ms`);
        } catch (error) {
          const endTime: number = Date.now();
          const bizError: BusinessError = error as BusinessError;
          const record: SkillHistoryRecord = {
            skillName: skillName,
            moduleName: moduleName,
            bundleName: DEFAULT_BUNDLE_NAME,
            queryTime: endTime,
            duration: endTime - startTime,
            success: false,
            errorMessage: `${bizError.code}: ${bizError.message}`,
            skillType: -1,
            skillPath: ''
          };
          this.historyRecords.push(record);
          Logger.error(`History query failed: ${skillName}: ${bizError.message}`);
        }
      }
      this.recalculateStats();
      this.operationResult = $r('app.string.skill_query_success');
    } catch (error) {
      const bizError: BusinessError = error as BusinessError;
      this.operationResult = `${bizError.code}: ${bizError.message}`;
      Logger.error('History query failed: ' + JSON.stringify(error));
    } finally {
      this.isOperating = false;
    }
  }

  private clearHistory(): void {
    this.historyRecords = [];
    this.totalQueryCount = 0;
    this.successQueryCount = 0;
    this.failedQueryCount = 0;
    this.averageDuration = 0;
    this.operationResult = $r('app.string.operation_ready');
    Logger.info('History cleared');
  }

  private getFilteredRecords(): SkillHistoryRecord[] {
    const filtered: SkillHistoryRecord[] = [];
    for (let i: number = 0; i < this.historyRecords.length; i++) {
      const record: SkillHistoryRecord = this.historyRecords[i];
      if (this.filterModule.length > 0 && record.moduleName !== this.filterModule) {
        continue;
      }
      if (this.filterSuccessOnly && !record.success) {
        continue;
      }
      if (this.filterFailedOnly && record.success) {
        continue;
      }
      filtered.push(record);
    }
    return filtered;
  }

  @Builder
  historyRecordCard(record: SkillHistoryRecord, index: number): void {
    Column({ space: ITEM_SPACING }) {
      Row() {
        Text(`#${index + 1}`)
          .fontSize(BODY_FONT_SIZE)
          .fontWeight(FontWeight.Medium)
          .width(40)
        Text(record.skillName)
          .fontSize(BODY_FONT_SIZE)
          .fontWeight(FontWeight.Medium)
          .layoutWeight(1)
        Text(record.success ? $r('app.string.status_success') : $r('app.string.status_failed'))
          .fontSize(BODY_FONT_SIZE)
          .fontColor(record.success ? $r('app.color.success_color') : $r('app.color.error_color'))
      }
      .width('100%')

      Row() {
        Text($r('app.string.history_label_bundle'))
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(LABEL_WIDTH)
        Text(record.bundleName)
          .id(`history_bundle_${index}`)
          .fontSize(BODY_FONT_SIZE)
          .layoutWeight(1)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')

      Row() {
        Text($r('app.string.history_label_module'))
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(LABEL_WIDTH)
        Text(record.moduleName)
          .id(`history_module_${index}`)
          .fontSize(BODY_FONT_SIZE)
          .layoutWeight(1)
      }
      .width('100%')

      Row() {
        Text($r('app.string.history_label_time'))
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(LABEL_WIDTH)
        Text(this.formatTimestamp(record.queryTime))
          .id(`history_time_${index}`)
          .fontSize(BODY_FONT_SIZE)
          .layoutWeight(1)
      }
      .width('100%')

      Row() {
        Text($r('app.string.history_label_duration'))
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(LABEL_WIDTH)
        Text(this.formatDuration(record.duration))
          .id(`history_duration_${index}`)
          .fontSize(BODY_FONT_SIZE)
          .layoutWeight(1)
      }
      .width('100%')

      Row() {
        Text($r('app.string.history_label_type'))
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(LABEL_WIDTH)
        Text(`${record.skillType}`)
          .id(`history_type_${index}`)
          .fontSize(BODY_FONT_SIZE)
          .layoutWeight(1)
      }
      .width('100%')

      if (record.skillPath.length > 0) {
        Row() {
          Text($r('app.string.history_label_path'))
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.secondary_text'))
            .width(LABEL_WIDTH)
          Text(record.skillPath)
            .id(`history_path_${index}`)
            .fontSize(BODY_FONT_SIZE)
            .layoutWeight(1)
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .width('100%')
      }

      if (record.errorMessage.length > 0) {
        Row() {
          Text($r('app.string.history_label_error'))
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.error_color'))
            .width(LABEL_WIDTH)
          Text(record.errorMessage)
            .id(`history_error_${index}`)
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.error_color'))
            .layoutWeight(1)
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .width('100%')
      }
    }
    .id(`history_record_${index}`)
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(PAGE_PADDING)
    .backgroundColor($r('app.color.card_background'))
    .borderRadius(CARD_RADIUS)
  }

  build(): void {
    Scroll() {
      Column({ space: SECTION_SPACING }) {
        Text($r('app.string.skill_history_title'))
          .id('skill_history_page_title')
          .fontSize(TITLE_FONT_SIZE)
          .fontWeight(FontWeight.Bold)

        Text($r('app.string.skill_history_description'))
          .id('skill_history_page_description')
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))

        // Action buttons
        Row({ space: ITEM_SPACING }) {
          Button($r('app.string.history_query_all'))
            .id('history_query_all_button')
            .layoutWeight(1)
            .height(BUTTON_HEIGHT)
            .enabled(!this.isOperating)
            .onClick(() => {
              this.queryAllSkills();
            })
          Button($r('app.string.history_clear'))
            .id('history_clear_button')
            .layoutWeight(1)
            .height(BUTTON_HEIGHT)
            .enabled(!this.isOperating)
            .onClick(() => {
              this.clearHistory();
            })
        }
        .width('100%')

        // Filter controls
        Text($r('app.string.history_filter_title'))
          .id('history_filter_label')
          .fontSize(SUBTITLE_FONT_SIZE)
          .fontWeight(FontWeight.Medium)

        Row({ space: ITEM_SPACING }) {
          Toggle({ type: ToggleType.Checkbox, isOn: this.filterSuccessOnly })
            .id('history_filter_success_toggle')
            .onChange((isOn: boolean): void => {
              this.filterSuccessOnly = isOn;
              if (isOn) {
                this.filterFailedOnly = false;
              }
            })
          Text($r('app.string.history_filter_success'))
            .fontSize(BODY_FONT_SIZE)

          Toggle({ type: ToggleType.Checkbox, isOn: this.filterFailedOnly })
            .id('history_filter_failed_toggle')
            .onChange((isOn: boolean): void => {
              this.filterFailedOnly = isOn;
              if (isOn) {
                this.filterSuccessOnly = false;
              }
            })
          Text($r('app.string.history_filter_failed'))
            .fontSize(BODY_FONT_SIZE)
        }
        .width('100%')

        // Statistics card
        Column({ space: ITEM_SPACING }) {
          Text($r('app.string.history_statistics_title'))
            .id('history_stats_title')
            .fontSize(SUBTITLE_FONT_SIZE)
            .fontWeight(FontWeight.Medium)

          Row() {
            Text($r('app.string.history_stats_total'))
              .fontSize(BODY_FONT_SIZE)
              .fontColor($r('app.color.secondary_text'))
              .width(LABEL_WIDTH)
            Text(`${this.totalQueryCount}`)
              .id('history_total_count')
              .fontSize(BODY_FONT_SIZE)
          }
          .width('100%')

          Row() {
            Text($r('app.string.history_stats_successful'))
              .fontSize(BODY_FONT_SIZE)
              .fontColor($r('app.color.success_color'))
              .width(LABEL_WIDTH)
            Text(`${this.successQueryCount}`)
              .id('history_success_count')
              .fontSize(BODY_FONT_SIZE)
              .fontColor($r('app.color.success_color'))
          }
          .width('100%')

          Row() {
            Text($r('app.string.history_stats_failed'))
              .fontSize(BODY_FONT_SIZE)
              .fontColor($r('app.color.error_color'))
              .width(LABEL_WIDTH)
            Text(`${this.failedQueryCount}`)
              .id('history_failed_count')
              .fontSize(BODY_FONT_SIZE)
              .fontColor($r('app.color.error_color'))
          }
          .width('100%')

          Row() {
            Text($r('app.string.history_stats_avg_duration'))
              .fontSize(BODY_FONT_SIZE)
              .fontColor($r('app.color.secondary_text'))
              .width(LABEL_WIDTH)
            Text(`${this.averageDuration}ms`)
              .id('history_avg_duration')
              .fontSize(BODY_FONT_SIZE)
          }
          .width('100%')
        }
        .id('history_statistics_card')
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding(PAGE_PADDING)
        .backgroundColor($r('app.color.card_background'))
        .borderRadius(CARD_RADIUS)

        Text(this.operationResult)
          .id('history_operation_result')
          .width('100%')
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.result_text'))

        // History records
        Text($r('app.string.history_records_title'))
          .id('history_records_title')
          .fontSize(SUBTITLE_FONT_SIZE)
          .fontWeight(FontWeight.Medium)

        if (this.getFilteredRecords().length === 0) {
          Text($r('app.string.execution_no_result'))
            .id('history_no_records')
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.secondary_text'))
        } else {
          ForEach(this.getFilteredRecords(), (record: SkillHistoryRecord, index: number) => {
            this.historyRecordCard(record, index);
          }, (record: SkillHistoryRecord, index: number) =>
          `${record.skillName}_${record.moduleName}_${index}_${record.queryTime}`)
        }
      }
      .width('100%')
      .constraintSize({ maxWidth: CONTENT_MAX_WIDTH })
      .alignItems(HorizontalAlign.Start)
      .padding(PAGE_PADDING)
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
    .backgroundColor($r('app.color.page_background'))
  }
}
