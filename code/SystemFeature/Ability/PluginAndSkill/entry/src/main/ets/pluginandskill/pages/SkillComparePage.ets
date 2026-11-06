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

interface SkillCompareResult {
  field: string;
  valueA: string;
  valueB: string;
  isSame: boolean;
}

interface CompareSummary {
  totalFields: number;
  sameFields: number;
  diffFields: number;
  samePercentage: string;
}

@Entry
@Component
struct SkillComparePage {
  @State private moduleA: string = MODULE_NAME_ARRAY[0];
  @State private skillA: string = SKILL_ARRAY[1];
  @State private moduleB: string = MODULE_NAME_ARRAY[0];
  @State private skillB: string = SKILL_ARRAY[2];
  @State private compareResults: Array<SkillCompareResult> = [];
  @State private compareSummary: CompareSummary = {
    totalFields: 0,
    sameFields: 0,
    diffFields: 0,
    samePercentage: '0%'
  };
  @State private operationResult: ResourceStr = $r('app.string.operation_ready');
  @State private isOperating: boolean = false;
  @State private skillInfoA: skillManager.SkillInfo | undefined = undefined;
  @State private skillInfoB: skillManager.SkillInfo | undefined = undefined;

  private formatOptional(value ?: string): string {
    return value ?? EMPTY_VALUE;
  }

  private formatList(values ?: Array<string>): string {
    if (!values || values.length === 0) {
      return EMPTY_VALUE;
    }
    return values.join(', ');
  }

  private async querySkillInfo(moduleName: string, skillName: string):
    Promise<skillManager.SkillInfo | undefined> {
    try {
      return await skillManager.getSkillInfoForSelf(moduleName, skillName,
        FLAG_VALUES[0]);
    } catch (error) {
      const bizError = error as BusinessError;
      Logger.error(`Failed to query skill ${skillName}: ${bizError.code}: ${bizError.message}`);
      return undefined;
    }
  }

  private buildCompareResults(): void {
    this.compareResults = [];
    if (this.skillInfoA === undefined || this.skillInfoB === undefined) {
      return;
    }
    const infoA = this.skillInfoA;
    const infoB = this.skillInfoB;

    const nameCompare: SkillCompareResult = {
      field: 'Skill Name',
      valueA: infoA.skillName,
      valueB: infoB.skillName,
      isSame: infoA.skillName === infoB.skillName
    };
    this.compareResults.push(nameCompare);

    const bundleCompare: SkillCompareResult = {
      field: 'Bundle Name',
      valueA: infoA.bundleName,
      valueB: infoB.bundleName,
      isSame: infoA.bundleName === infoB.bundleName
    };
    this.compareResults.push(bundleCompare);

    const moduleCompare: SkillCompareResult = {
      field: 'Module Name',
      valueA: infoA.moduleName,
      valueB: infoB.moduleName,
      isSame: infoA.moduleName === infoB.moduleName
    };
    this.compareResults.push(moduleCompare);

    const typeCompare: SkillCompareResult = {
      field: 'Skill Type',
      valueA: `${infoA.skillType}`,
      valueB: `${infoB.skillType}`,
      isSame: infoA.skillType === infoB.skillType
    };
    this.compareResults.push(typeCompare);

    const pathCompare: SkillCompareResult = {
      field: 'Skill Path',
      valueA: infoA.skillPath,
      valueB: infoB.skillPath,
      isSame: infoA.skillPath === infoB.skillPath
    };
    this.compareResults.push(pathCompare);

    const abilityCompare: SkillCompareResult = {
      field: 'Ability Name',
      valueA: infoA.abilityName,
      valueB: infoB.abilityName,
      isSame: infoA.abilityName === infoB.abilityName
    };
    this.compareResults.push(abilityCompare);

    const versionCodeCompare: SkillCompareResult = {
      field: 'Version Code',
      valueA: `${infoA.versionCode}`,
      valueB: `${infoB.versionCode}`,
      isSame: infoA.versionCode === infoB.versionCode
    };
    this.compareResults.push(versionCodeCompare);

    const versionCompare: SkillCompareResult = {
      field: 'Version',
      valueA: this.formatOptional(infoA.version),
      valueB: this.formatOptional(infoB.version),
      isSame: infoA.version === infoB.version
    };
    this.compareResults.push(versionCompare);

    const visibilityCompare: SkillCompareResult = {
      field: 'Visibility',
      valueA: this.formatOptional(infoA.visibility),
      valueB: this.formatOptional(infoB.visibility),
      isSame: infoA.visibility === infoB.visibility
    };
    this.compareResults.push(visibilityCompare);

    const descCompare: SkillCompareResult = {
      field: 'Description',
      valueA: this.formatOptional(infoA.description),
      valueB: this.formatOptional(infoB.description),
      isSame: infoA.description === infoB.description
    };
    this.compareResults.push(descCompare);

    const srcEntriesCompare: SkillCompareResult = {
      field: 'Source Entries',
      valueA: this.formatList(infoA.srcEntries),
      valueB: this.formatList(infoB.srcEntries),
      isSame: this.formatList(infoA.srcEntries) === this.formatList(infoB.srcEntries)
    };
    this.compareResults.push(srcEntriesCompare);

    const permissionsCompare: SkillCompareResult = {
      field: 'Permissions',
      valueA: this.formatList(infoA.permissions),
      valueB: this.formatList(infoB.permissions),
      isSame: this.formatList(infoA.permissions) === this.formatList(infoB.permissions)
    };
    this.compareResults.push(permissionsCompare);

    const reqPermCompare: SkillCompareResult = {
      field: 'Requested Permissions',
      valueA: this.formatList(infoA.requestPermissions),
      valueB: this.formatList(infoB.requestPermissions),
      isSame: this.formatList(infoA.requestPermissions) === this.formatList(infoB.requestPermissions)
    };
    this.compareResults.push(reqPermCompare);

    this.updateSummary();
  }

  private updateSummary(): void {
    const total = this.compareResults.length;
    let sameCount = 0;
    for (let i = 0; i < total; i++) {
      if (this.compareResults[i].isSame) {
        sameCount++;
      }
    }
    const diffCount = total - sameCount;
    const percentage = total > 0 ? Math.round((sameCount / total) * 100) : 0;
    this.compareSummary = {
      totalFields: total,
      sameFields: sameCount,
      diffFields: diffCount,
      samePercentage: `${percentage}%`
    };
  }

  private async compareSkills(): Promise<void> {
    this.isOperating = true;
    try {
      Logger.info(`Comparing skills: ${this.moduleA}/${this.skillA} vs ${this.moduleB}/${this.skillB}`);
      this.skillInfoA = await this.querySkillInfo(this.moduleA, this.skillA);
      this.skillInfoB = await this.querySkillInfo(this.moduleB, this.skillB);

      if (this.skillInfoA === undefined && this.skillInfoB === undefined) {
        this.operationResult = 'Both skills could not be found.';
      } else if (this.skillInfoA === undefined) {
        this.operationResult = `Skill A (${this.skillA}) not found. Skill B loaded.`;
        this.compareResults = [];
      } else if (this.skillInfoB === undefined) {
        this.operationResult = `Skill B (${this.skillB}) not found. Skill A loaded.`;
        this.compareResults = [];
      } else {
        this.buildCompareResults();
        this.operationResult = $r('app.string.skill_query_success');
      }
    } catch (error) {
      const bizError = error as BusinessError;
      this.operationResult = `${bizError.code}: ${bizError.message}`;
      Logger.error('Skill compare failed: ' + JSON.stringify(error));
    } finally {
      this.isOperating = false;
    }
  }

  @Builder
  compareRow(result: SkillCompareResult, index: number): void {
    Row() {
      Text(result.field)
        .fontSize(BODY_FONT_SIZE)
        .fontColor($r('app.color.secondary_text'))
        .width(LABEL_WIDTH)
      Column() {
        Text(result.valueA)
          .id(`compare_a_${index}`)
          .fontSize(BODY_FONT_SIZE)
          .fontColor(result.isSame ? '#4CAF50' : '#FF9800')
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      Column() {
        Text(result.valueB)
          .id(`compare_b_${index}`)
          .fontSize(BODY_FONT_SIZE)
          .fontColor(result.isSame ? '#4CAF50' : '#FF9800')
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .padding({ top: 4, bottom: 4 })
  }

  build(): void {
    Scroll() {
      Column({ space: SECTION_SPACING }) {
        Text($r('app.string.skill_compare_title'))
          .id('skill_compare_page_title')
          .fontSize(TITLE_FONT_SIZE)
          .fontWeight(FontWeight.Bold)

        Text($r('app.string.skill_compare_description'))
          .id('skill_compare_page_description')
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))

        // Skill A selector
        Text($r('app.string.compare_skill_a_label'))
          .id('compare_skill_a_label')
          .fontSize(SUBTITLE_FONT_SIZE)
          .fontWeight(FontWeight.Medium)

        Select([
          { value: MODULE_NAME_ARRAY[0] },
          { value: MODULE_NAME_ARRAY[1] },
        ])
          .id('compare_module_a_select')
          .selected(MODULE_NAME_ARRAY.indexOf(this.moduleA))
          .value(this.moduleA)
          .width('100%')
          .enabled(!this.isOperating)
          .onSelect((index: number): void => {
            this.moduleA = MODULE_NAME_ARRAY[index];
          })

        Select([
          { value: SKILL_ARRAY[0] },
          { value: SKILL_ARRAY[1] },
          { value: SKILL_ARRAY[2] },
          { value: SKILL_ARRAY[3] },
          { value: SKILL_ARRAY[4] },
        ])
          .id('compare_skill_a_select')
          .selected(SKILL_ARRAY.indexOf(this.skillA))
          .value(this.skillA)
          .width('100%')
          .enabled(!this.isOperating)
          .onSelect((index: number): void => {
            this.skillA = SKILL_ARRAY[index];
          })

        // Skill B selector
        Text($r('app.string.compare_skill_b_label'))
          .id('compare_skill_b_label')
          .fontSize(SUBTITLE_FONT_SIZE)
          .fontWeight(FontWeight.Medium)

        Select([
          { value: MODULE_NAME_ARRAY[0] },
          { value: MODULE_NAME_ARRAY[1] },
        ])
          .id('compare_module_b_select')
          .selected(MODULE_NAME_ARRAY.indexOf(this.moduleB))
          .value(this.moduleB)
          .width('100%')
          .enabled(!this.isOperating)
          .onSelect((index: number): void => {
            this.moduleB = MODULE_NAME_ARRAY[index];
          })

        Select([
          { value: SKILL_ARRAY[0] },
          { value: SKILL_ARRAY[1] },
          { value: SKILL_ARRAY[2] },
          { value: SKILL_ARRAY[3] },
          { value: SKILL_ARRAY[4] },
        ])
          .id('compare_skill_b_select')
          .selected(SKILL_ARRAY.indexOf(this.skillB))
          .value(this.skillB)
          .width('100%')
          .enabled(!this.isOperating)
          .onSelect((index: number): void => {
            this.skillB = SKILL_ARRAY[index];
          })

        Button($r('app.string.compare_button'))
          .id('compare_skills_button')
          .width('100%')
          .height(BUTTON_HEIGHT)
          .enabled(!this.isOperating)
          .onClick(() => {
            this.compareSkills();
          })

        Text(this.operationResult)
          .id('compare_operation_result')
          .width('100%')
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.result_text'))

        // Compare summary
        if (this.compareResults.length > 0) {
          Text($r('app.string.compare_result_title'))
            .id('compare_result_title')
            .fontSize(SUBTITLE_FONT_SIZE)
            .fontWeight(FontWeight.Medium)

          Row() {
            Text('Total Fields:')
              .fontSize(BODY_FONT_SIZE)
              .fontColor($r('app.color.secondary_text'))
              .width(LABEL_WIDTH)
            Text(`${this.compareSummary.totalFields}`)
              .id('compare_total_fields')
              .fontSize(BODY_FONT_SIZE)
          }
          .width('100%')

          Row() {
            Text('Same:')
              .fontSize(BODY_FONT_SIZE)
              .fontColor('#4CAF50')
              .width(LABEL_WIDTH)
            Text(`${this.compareSummary.sameFields}`)
              .id('compare_same_count')
              .fontSize(BODY_FONT_SIZE)
              .fontColor('#4CAF50')
          }
          .width('100%')

          Row() {
            Text('Different:')
              .fontSize(BODY_FONT_SIZE)
              .fontColor('#FF9800')
              .width(LABEL_WIDTH)
            Text(`${this.compareSummary.diffFields}`)
              .id('compare_diff_count')
              .fontSize(BODY_FONT_SIZE)
              .fontColor('#FF9800')
          }
          .width('100%')

          Row() {
            Text('Match Rate:')
              .fontSize(BODY_FONT_SIZE)
              .fontColor($r('app.color.secondary_text'))
              .width(LABEL_WIDTH)
            Text(this.compareSummary.samePercentage)
              .id('compare_match_rate')
              .fontSize(BODY_FONT_SIZE)
              .fontWeight(FontWeight.Medium)
          }
          .width('100%')

          // Compare detail rows
          ForEach(this.compareResults, (result: SkillCompareResult, index: number) => {
            this.compareRow(result, index);
          }, (result: SkillCompareResult, index: number) =>
            `${result.field}_${index}`)
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
