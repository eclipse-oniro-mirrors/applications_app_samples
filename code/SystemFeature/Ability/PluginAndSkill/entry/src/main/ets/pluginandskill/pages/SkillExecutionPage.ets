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
  EMPTY_VALUE,
  ITEM_SPACING,
  LABEL_WIDTH,
  MODULE_NAME_ARRAY,
  PAGE_PADDING,
  SECTION_SPACING,
  SKILL_ARRAY,
  SUBTITLE_FONT_SIZE,
  TITLE_FONT_SIZE
} from '../../util/Constant';

const EXECUTION_STATUS_IDLE: string = 'idle';
const EXECUTION_STATUS_RUNNING: string = 'running';
const EXECUTION_STATUS_SUCCESS: string = 'success';
const EXECUTION_STATUS_FAILED: string = 'failed';

interface ExecutionRecord {
  skillName: string;
  moduleName: string;
  status: string;
  startTime: number;
  endTime: number;
  duration: number;
  resultMessage: string;
  errorMessage: string;
}

@Entry
@Component
struct SkillExecutionPage {
  @State private selectedModule: string = MODULE_NAME_ARRAY[0];
  @State private selectedSkill: string = SKILL_ARRAY[1];
  @State private executionStatus: string = EXECUTION_STATUS_IDLE;
  @State private executionRecords: Array<ExecutionRecord> = [];
  @State private isOperating: boolean = false;
  @State private currentResult: string = '';

  private formatDuration(startTime: number, endTime: number): string {
    const duration = endTime - startTime;
    if (duration < 1000) {
      return `${duration}ms`;
    }
    const seconds = Math.floor(duration / 1000);
    const millis = duration % 1000;
    if (seconds < 60) {
      return `${seconds}s ${millis}ms`;
    }
    const minutes = Math.floor(seconds / 60);
    const remainSeconds = seconds % 60;
    return `${minutes}m ${remainSeconds}s`;
  }

  private createEmptyRecord(skillName: string, moduleName: string): ExecutionRecord {
    const record: ExecutionRecord = {
      skillName: skillName,
      moduleName: moduleName,
      status: EXECUTION_STATUS_IDLE,
      startTime: 0,
      endTime: 0,
      duration: 0,
      resultMessage: '',
      errorMessage: ''
    };
    return record;
  }

  private async executeSkill(): Promise<void> {
    if (!this.selectedModule.trim()) {
      this.currentResult = getContext(this).resourceManager.getStringSync($r('app.string.skill_module_required'));
      return;
    }
    if (!this.selectedSkill.trim()) {
      this.currentResult = getContext(this).resourceManager.getStringSync($r('app.string.skill_name_required'));
      return;
    }
    this.isOperating = true;
    this.executionStatus = EXECUTION_STATUS_RUNNING;
    const record = this.createEmptyRecord(this.selectedSkill, this.selectedModule);
    record.startTime = Date.now();
    record.status = EXECUTION_STATUS_RUNNING;
    try {
      Logger.info(`Executing skill: ${this.selectedSkill} from module: ${this.selectedModule}`);
      const skillInfo: skillManager.SkillInfo =
        await skillManager.getSkillInfoForSelf(this.selectedModule, this.selectedSkill,
          skillManager.SkillInfoFlag.GET_SKILL_INFO_DEFAULT);
      record.endTime = Date.now();
      record.duration = record.endTime - record.startTime;
      record.status = EXECUTION_STATUS_SUCCESS;
      record.resultMessage = `Skill '${skillInfo.skillName}' found at path: ${skillInfo.skillPath}`;
      this.currentResult = getContext(this).resourceManager.getStringSync($r('app.string.execution_success'));
      this.executionStatus = EXECUTION_STATUS_SUCCESS;
    } catch (error) {
      record.endTime = Date.now();
      record.duration = record.endTime - record.startTime;
      record.status = EXECUTION_STATUS_FAILED;
      const bizError = error as BusinessError;
      record.errorMessage = `${bizError.code}: ${bizError.message}`;
      this.currentResult = `Execution failed: ${bizError.code}: ${bizError.message}`;
      this.executionStatus = EXECUTION_STATUS_FAILED;
      Logger.error(`Skill execution failed: ${JSON.stringify(error)}`);
    } finally {
      this.executionRecords.push(record);
      this.isOperating = false;
    }
  }

  private getExecutionStatusText(status: string): string {
    if (status === EXECUTION_STATUS_SUCCESS) {
      return 'SUCCESS';
    } else if (status === EXECUTION_STATUS_FAILED) {
      return 'FAILED';
    } else if (status === EXECUTION_STATUS_RUNNING) {
      return 'RUNNING';
    }
    return 'IDLE';
  }

  @Builder
  executionRecordCard(record: ExecutionRecord, index: number): void {
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
        Text(this.getExecutionStatusText(record.status))
          .fontSize(BODY_FONT_SIZE)
          .fontColor(record.status === EXECUTION_STATUS_SUCCESS ? '#4CAF50' : '#F44336')
      }
      .width('100%')

      Row() {
        Text('Module:')
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(LABEL_WIDTH)
        Text(record.moduleName)
          .fontSize(BODY_FONT_SIZE)
          .layoutWeight(1)
      }
      .width('100%')

      Row() {
        Text('Duration:')
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(LABEL_WIDTH)
        Text(this.formatDuration(record.startTime, record.endTime))
          .fontSize(BODY_FONT_SIZE)
          .layoutWeight(1)
      }
      .width('100%')

      if (record.resultMessage.length > 0) {
        Row() {
          Text('Result:')
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.secondary_text'))
            .width(LABEL_WIDTH)
          Text(record.resultMessage)
            .fontSize(BODY_FONT_SIZE)
            .layoutWeight(1)
            .maxLines(3)
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
            .fontSize(BODY_FONT_SIZE)
            .fontColor('#F44336')
            .layoutWeight(1)
            .maxLines(3)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .width('100%')
      }
    }
    .id(`execution_record_${index}`)
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(PAGE_PADDING)
    .backgroundColor($r('app.color.card_background'))
    .borderRadius(CARD_RADIUS)
  }

  build(): void {
    Scroll() {
      Column({ space: SECTION_SPACING }) {
        Text($r('app.string.skill_execution_title'))
          .id('skill_execution_page_title')
          .fontSize(TITLE_FONT_SIZE)
          .fontWeight(FontWeight.Bold)

        Text($r('app.string.skill_execution_description'))
          .id('skill_execution_page_description')
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))

        Text($r('app.string.skill_module_placeholder'))
          .id('execution_module_label')
          .fontSize(BODY_FONT_SIZE)
        Select([
          { value: MODULE_NAME_ARRAY[0] },
          { value: MODULE_NAME_ARRAY[1] },
        ])
          .id('execution_module_select')
          .selected(MODULE_NAME_ARRAY.indexOf(this.selectedModule))
          .value(this.selectedModule)
          .width('100%')
          .enabled(!this.isOperating)
          .onSelect((index: number): void => {
            this.selectedModule = MODULE_NAME_ARRAY[index];
          })

        Text($r('app.string.skill_name_placeholder'))
          .id('execution_skill_label')
          .fontSize(BODY_FONT_SIZE)
        Select([
          { value: SKILL_ARRAY[0] },
          { value: SKILL_ARRAY[1] },
          { value: SKILL_ARRAY[2] },
          { value: SKILL_ARRAY[3] },
          { value: SKILL_ARRAY[4] },
        ])
          .id('execution_skill_select')
          .selected(SKILL_ARRAY.indexOf(this.selectedSkill))
          .value(this.selectedSkill)
          .width('100%')
          .enabled(!this.isOperating)
          .onSelect((index: number): void => {
            this.selectedSkill = SKILL_ARRAY[index];
          })

        Button($r('app.string.execute_skill_button'))
          .id('execute_skill_button')
          .width('100%')
          .height(BUTTON_HEIGHT)
          .enabled(!this.isOperating)
          .onClick(() => {
            this.executeSkill();
          })

        Text(this.currentResult.length > 0 ? this.currentResult : $r('app.string.execution_no_result'))
          .id('execution_result_text')
          .width('100%')
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.result_text'))

        Text($r('app.string.execution_result_title'))
          .id('execution_history_title')
          .fontSize(SUBTITLE_FONT_SIZE)
          .fontWeight(FontWeight.Medium)

        if (this.executionRecords.length === 0) {
          Text($r('app.string.execution_no_result'))
            .id('execution_no_history')
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.secondary_text'))
        } else {
          ForEach(this.executionRecords, (record: ExecutionRecord, index: number) => {
            this.executionRecordCard(record, index);
          }, (record: ExecutionRecord, index: number) =>
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
