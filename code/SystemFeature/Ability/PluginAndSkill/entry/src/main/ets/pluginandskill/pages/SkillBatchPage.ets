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
  DEFAULT_MODULE_NAME,
  EMPTY_VALUE,
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

interface BatchOperationRecord {
  skillName: string;
  moduleName: string;
  status: string;
  duration: number;
  errorMessage: string;
  skillType: number;
  skillPath: string;
  bundleName: string;
}

const BATCH_STATUS_PENDING: string = 'pending';
const BATCH_STATUS_RUNNING: string = 'running';
const BATCH_STATUS_SUCCESS: string = 'success';
const BATCH_STATUS_FAILED: string = 'failed';

@Entry
@Component
struct SkillBatchPage {
  @State private selectedModule: string = MODULE_NAME_ARRAY[0];
  @State private batchRecords: BatchOperationRecord[] = [];
  @State private isOperating: boolean = false;
  @State private operationResult: ResourceStr = $r('app.string.operation_ready');
  @State private totalBatchTime: number = 0;
  @State private successBatchCount: number = 0;
  @State private failedBatchCount: number = 0;
  @State private pendingBatchCount: number = 0;
  @State private selectAllSkills: boolean = false;
  @State private selectedSkillIndices: number[] = [];

  private initializeBatchRecords(): void {
    this.batchRecords = [];
    const skillsToProcess = this.selectedSkillIndices.length > 0
      ? this.selectedSkillIndices
      : this.getAllSkillIndices();

    for (let i = 0; i < skillsToProcess.length; i++) {
      const skillIndex = skillsToProcess[i];
      const record: BatchOperationRecord = {
        skillName: SKILL_ARRAY[skillIndex],
        moduleName: this.selectedModule,
        status: BATCH_STATUS_PENDING,
        duration: 0,
        errorMessage: '',
        skillType: -1,
        skillPath: '',
        bundleName: DEFAULT_BUNDLE_NAME
      };
      this.batchRecords.push(record);
    }
    this.pendingBatchCount = this.batchRecords.length;
    this.successBatchCount = 0;
    this.failedBatchCount = 0;
    this.totalBatchTime = 0;
  }

  private getAllSkillIndices(): number[] {
    const indices: number[] = [];
    for (let i = 0; i < SKILL_ARRAY.length; i++) {
      indices.push(i);
    }
    return indices;
  }

  private async executeBatchQuery(): Promise<void> {
    if (this.isOperating) {
      return;
    }
    this.isOperating = true;
    this.initializeBatchRecords();
    const batchStartTime = Date.now();

    try {
      for (let i = 0; i < this.batchRecords.length; i++) {
        const record = this.batchRecords[i];
        record.status = BATCH_STATUS_RUNNING;

        const recordStartTime = Date.now();
        try {
          Logger.info(`Batch querying skill: ${record.skillName} from module: ${record.moduleName}`);
          const skillInfo: skillManager.SkillInfo =
            await skillManager.getSkillInfoForSelf(record.moduleName, record.skillName, FLAG_VALUES[0]);
          const recordEndTime = Date.now();

          record.status = BATCH_STATUS_SUCCESS;
          record.duration = recordEndTime - recordStartTime;
          record.skillType = skillInfo.skillType;
          record.skillPath = skillInfo.skillPath;
          record.bundleName = skillInfo.bundleName;
          this.successBatchCount++;
          this.pendingBatchCount--;
          Logger.info(`Batch skill ${record.skillName} succeeded in ${record.duration}ms`);
        } catch (error) {
          const recordEndTime = Date.now();
          const bizError = error as BusinessError;
          record.status = BATCH_STATUS_FAILED;
          record.duration = recordEndTime - recordStartTime;
          record.errorMessage = `${bizError.code}: ${bizError.message}`;
          this.failedBatchCount++;
          this.pendingBatchCount--;
          Logger.error(`Batch skill ${record.skillName} failed: ${bizError.message}`);
        }
      }

      const batchEndTime = Date.now();
      this.totalBatchTime = batchEndTime - batchStartTime;
      this.operationResult =
        `Batch completed: ${this.successBatchCount} success, ${this.failedBatchCount} failed in ${this.totalBatchTime}ms`;
      Logger.info(`Batch operation completed in ${this.totalBatchTime}ms`);
    } catch (error) {
      const bizError = error as BusinessError;
      this.operationResult = `Batch error: ${bizError.code}: ${bizError.message}`;
      Logger.error('Batch operation error: ' + JSON.stringify(error));
    } finally {
      this.isOperating = false;
    }
  }

  private clearBatchResults(): void {
    this.batchRecords = [];
    this.totalBatchTime = 0;
    this.successBatchCount = 0;
    this.failedBatchCount = 0;
    this.pendingBatchCount = 0;
    this.operationResult = $r('app.string.operation_ready');
    Logger.info('Batch results cleared');
  }

  private toggleSkillSelection(index: number): void {
    const newIndices: number[] = [];
    let found = false;
    for (let i = 0; i < this.selectedSkillIndices.length; i++) {
      if (this.selectedSkillIndices[i] === index) {
        found = true;
      } else {
        newIndices.push(this.selectedSkillIndices[i]);
      }
    }
    if (!found) {
      newIndices.push(index);
    }
    this.selectedSkillIndices = newIndices;
    this.selectAllSkills = newIndices.length === SKILL_ARRAY.length;
  }

  private toggleSelectAll(): void {
    if (this.selectAllSkills) {
      this.selectedSkillIndices = [];
      this.selectAllSkills = false;
    } else {
      this.selectedSkillIndices = this.getAllSkillIndices();
      this.selectAllSkills = true;
    }
  }

  private getStatusText(status: string): string {
    if (status === BATCH_STATUS_SUCCESS) {
      return 'SUCCESS';
    } else if (status === BATCH_STATUS_FAILED) {
      return 'FAILED';
    } else if (status === BATCH_STATUS_RUNNING) {
      return 'RUNNING';
    }
    return 'PENDING';
  }

  @Builder
  batchRecordCard(record: BatchOperationRecord, index: number): void {
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
        Text(this.getStatusText(record.status))
          .id(`batch_status_${index}`)
          .fontSize(BODY_FONT_SIZE)
          .fontColor(record.status === BATCH_STATUS_SUCCESS ? '#4CAF50' :
            (record.status === BATCH_STATUS_FAILED ? '#F44336' : '#FF9800'))
      }
      .width('100%')

      Row() {
        Text('Module:')
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(LABEL_WIDTH)
        Text(record.moduleName)
          .id(`batch_module_${index}`)
          .fontSize(BODY_FONT_SIZE)
          .layoutWeight(1)
      }
      .width('100%')

      Row() {
        Text('Bundle:')
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(LABEL_WIDTH)
        Text(record.bundleName)
          .id(`batch_bundle_${index}`)
          .fontSize(BODY_FONT_SIZE)
          .layoutWeight(1)
      }
      .width('100%')

      Row() {
        Text('Duration:')
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(LABEL_WIDTH)
        Text(`${record.duration}ms`)
          .id(`batch_duration_${index}`)
          .fontSize(BODY_FONT_SIZE)
          .layoutWeight(1)
      }
      .width('100%')

      if (record.skillType >= 0) {
        Row() {
          Text('Type:')
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.secondary_text'))
            .width(LABEL_WIDTH)
          Text(`${record.skillType}`)
            .id(`batch_type_${index}`)
            .fontSize(BODY_FONT_SIZE)
            .layoutWeight(1)
        }
        .width('100%')
      }

      if (record.skillPath.length > 0) {
        Row() {
          Text('Path:')
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.secondary_text'))
            .width(LABEL_WIDTH)
          Text(record.skillPath)
            .id(`batch_path_${index}`)
            .fontSize(BODY_FONT_SIZE)
            .layoutWeight(1)
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .width('100%')
      }

      if (record.errorMessage.length > 0) {
        Row() {
          Text('Error:')
            .fontSize(BODY_FONT_SIZE)
            .fontColor('#F44336')
            .width(LABEL_WIDTH)
          Text(record.errorMessage)
            .id(`batch_error_${index}`)
            .fontSize(BODY_FONT_SIZE)
            .fontColor('#F44336')
            .layoutWeight(1)
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .width('100%')
      }
    }
    .id(`batch_record_${index}`)
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(PAGE_PADDING)
    .backgroundColor($r('app.color.card_background'))
    .borderRadius(CARD_RADIUS)
  }

  build(): void {
    Scroll() {
      Column({ space: SECTION_SPACING }) {
        Text($r('app.string.skill_batch_title'))
          .id('skill_batch_page_title')
          .fontSize(TITLE_FONT_SIZE)
          .fontWeight(FontWeight.Bold)

        Text($r('app.string.skill_batch_description'))
          .id('skill_batch_page_description')
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))

        // Module selector
        Text($r('app.string.skill_module_placeholder'))
          .id('batch_module_label')
          .fontSize(BODY_FONT_SIZE)
        Select([
          { value: MODULE_NAME_ARRAY[0] },
          { value: MODULE_NAME_ARRAY[1] },
        ])
          .id('batch_module_select')
          .selected(MODULE_NAME_ARRAY.indexOf(this.selectedModule))
          .value(this.selectedModule)
          .width('100%')
          .enabled(!this.isOperating)
          .onSelect((index: number): void => {
            this.selectedModule = MODULE_NAME_ARRAY[index];
          })

        // Skill selection
        Text($r('app.string.skill_batch_select_skills'))
          .id('batch_select_skills_label')
          .fontSize(SUBTITLE_FONT_SIZE)
          .fontWeight(FontWeight.Medium)

        Row({ space: ITEM_SPACING }) {
          Toggle({ type: ToggleType.Checkbox, isOn: this.selectAllSkills })
            .id('batch_select_all_toggle')
            .onChange((isOn: boolean): void => {
              this.toggleSelectAll();
            })
          Text('Select All')
            .fontSize(BODY_FONT_SIZE)
        }
        .width('100%')

        ForEach(SKILL_ARRAY, (skillName: string, index: number) => {
          Row({ space: ITEM_SPACING }) {
            Toggle({ type: ToggleType.Checkbox,
              isOn: this.selectedSkillIndices.indexOf(index) >= 0 })
              .id(`batch_skill_toggle_${index}`)
              .onChange((isOn: boolean): void => {
                this.toggleSkillSelection(index);
              })
            Text(skillName)
              .fontSize(BODY_FONT_SIZE)
          }
          .width('100%')
          .padding({ top: 2, bottom: 2 })
        }, (skillName: string, index: number) => `batch_skill_${index}`)

        // Action buttons
        Row({ space: ITEM_SPACING }) {
          Button($r('app.string.skill_batch_execute'))
            .id('batch_execute_button')
            .layoutWeight(1)
            .height(BUTTON_HEIGHT)
            .enabled(!this.isOperating)
            .onClick(() => {
              this.executeBatchQuery();
            })
          Button($r('app.string.history_clear'))
            .id('batch_clear_button')
            .layoutWeight(1)
            .height(BUTTON_HEIGHT)
            .enabled(!this.isOperating)
            .onClick(() => {
              this.clearBatchResults();
            })
        }
        .width('100%')

        Text(this.operationResult)
          .id('batch_operation_result')
          .width('100%')
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.result_text'))

        // Batch summary
        if (this.batchRecords.length > 0) {
          Column({ space: ITEM_SPACING }) {
            Text($r('app.string.skill_batch_summary'))
              .id('batch_summary_title')
              .fontSize(SUBTITLE_FONT_SIZE)
              .fontWeight(FontWeight.Medium)

            Row() {
              Text('Total:')
                .fontSize(BODY_FONT_SIZE)
                .fontColor($r('app.color.secondary_text'))
                .width(LABEL_WIDTH)
              Text(`${this.batchRecords.length}`)
                .id('batch_total_count')
                .fontSize(BODY_FONT_SIZE)
            }
            .width('100%')

            Row() {
              Text('Success:')
                .fontSize(BODY_FONT_SIZE)
                .fontColor('#4CAF50')
                .width(LABEL_WIDTH)
              Text(`${this.successBatchCount}`)
                .id('batch_success_count')
                .fontSize(BODY_FONT_SIZE)
                .fontColor('#4CAF50')
            }
            .width('100%')

            Row() {
              Text('Failed:')
                .fontSize(BODY_FONT_SIZE)
                .fontColor('#F44336')
                .width(LABEL_WIDTH)
              Text(`${this.failedBatchCount}`)
                .id('batch_failed_count')
                .fontSize(BODY_FONT_SIZE)
                .fontColor('#F44336')
            }
            .width('100%')

            Row() {
              Text('Total Time:')
                .fontSize(BODY_FONT_SIZE)
                .fontColor($r('app.color.secondary_text'))
                .width(LABEL_WIDTH)
              Text(`${this.totalBatchTime}ms`)
                .id('batch_total_time')
                .fontSize(BODY_FONT_SIZE)
            }
            .width('100%')
          }
          .id('batch_summary_card')
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .padding(PAGE_PADDING)
          .backgroundColor($r('app.color.card_background'))
          .borderRadius(CARD_RADIUS)

          // Individual records
          Text($r('app.string.skill_batch_records_title'))
            .id('batch_records_title')
            .fontSize(SUBTITLE_FONT_SIZE)
            .fontWeight(FontWeight.Medium)

          ForEach(this.batchRecords, (record: BatchOperationRecord, index: number) => {
            this.batchRecordCard(record, index);
          }, (record: BatchOperationRecord, index: number) =>
            `${record.skillName}_${record.moduleName}_${index}_${record.status}`)
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
