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
  BUNDLE_NAME_ARRAY,
  BUTTON_HEIGHT,
  CARD_RADIUS,
  CONTENT_MAX_WIDTH,
  DEFAULT_BUNDLE_NAME,
  DEFAULT_FLAG_INDEX,
  DEFAULT_MODULE_NAME,
  DEFAULT_OPTION_INDEX,
  EMPTY_OPTION_INDEX,
  EMPTY_VALUE,
  FLAG_LABELS,
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

@Entry
@Component
struct BundleSkillQueryPage {
  @State private bundleName: string = DEFAULT_BUNDLE_NAME;
  @State private moduleName: string = DEFAULT_MODULE_NAME;
  @State private skillName: string = '';
  @State private operationResult: ResourceStr = $r('app.string.operation_ready');
  @State private skills: skillManager.SkillInfo[] = [];
  @State private isOperating: boolean = false;
  @State private flagIndex: number = DEFAULT_FLAG_INDEX;

  private showError(error: BusinessError): void {
    this.operationResult = `${error.code}: ${error.message}`;
    Logger.error('Bundle skill query failed: ' + JSON.stringify(error));
  }

  private validateSkillQuery(): boolean {
    if (!this.bundleName.trim()) {
      this.operationResult = $r('app.string.skill_bundle_required');
      return false;
    }
    if (!this.moduleName.trim()) {
      this.operationResult = $r('app.string.skill_module_required');
      return false;
    }
    if (!this.skillName.trim()) {
      this.operationResult = $r('app.string.skill_name_required');
      return false;
    }
    return true;
  }

  private validateBundleQuery(): boolean {
    if (this.bundleName.trim()) {
      return true;
    }
    this.operationResult = $r('app.string.skill_bundle_required');
    return false;
  }

  private async showSkill(query: () => Promise<skillManager.SkillInfo>): Promise<void> {
    this.isOperating = true;
    try {
      const skill: skillManager.SkillInfo = await query();
      this.skills = [skill];
      this.operationResult = $r('app.string.skill_query_success');
    } catch (error) {
      this.showError(error as BusinessError);
    } finally {
      this.isOperating = false;
    }
  }

  private async showSkills(query: () => Promise<skillManager.SkillInfo[]>): Promise<void> {
    this.isOperating = true;
    try {
      this.skills = await query();
      this.operationResult = $r('app.string.skill_query_success');
    } catch (error) {
      this.showError(error as BusinessError);
    } finally {
      this.isOperating = false;
    }
  }

  private async queryBundleSkill(): Promise<void> {
    if (!this.validateSkillQuery()) {
      return;
    }
    await this.showSkill((): Promise<skillManager.SkillInfo> =>
    skillManager.getSkillInfo(this.bundleName.trim(), this.moduleName.trim(),
      this.skillName.trim(), FLAG_VALUES[this.flagIndex]));
  }

  private async queryBundleSkills(): Promise<void> {
    if (!this.validateBundleQuery()) {
      return;
    }
    await this.showSkills((): Promise<skillManager.SkillInfo[]> =>
    skillManager.getSkillInfos(this.bundleName.trim(), FLAG_VALUES[this.flagIndex]));
  }

  private formatOptional(value ?: string): string {
    return value ?? EMPTY_VALUE;
  }

  private formatList(values ?: string[]): string {
    if (!values || values.length === 0) {
      return EMPTY_VALUE;
    }
    return values.join(', ');
  }

  @Builder
  skillDetailRow(label: ResourceStr, value: string, idPrefix: string): void {
    Row({ space: ITEM_SPACING }) {
      Text(label)
        .id(`${idPrefix}_label`)
        .width(LABEL_WIDTH)
        .fontSize(BODY_FONT_SIZE)
        .fontColor($r('app.color.secondary_text'))
      Text(value)
        .id(`${idPrefix}_value`)
        .layoutWeight(1)
        .fontSize(BODY_FONT_SIZE)
    }
    .width('100%')
    .alignItems(VerticalAlign.Top)
  }

  build(): void {
    Scroll() {
      Column({ space: SECTION_SPACING }) {
        Text($r('app.string.bundle_skill_query_title'))
          .id('bundle_skill_page_title')
          .fontSize(TITLE_FONT_SIZE)
          .fontWeight(FontWeight.Bold)

        Text($r('app.string.skill_bundle_placeholder'))
          .id('skill_bundle_selector_label')
          .fontSize(BODY_FONT_SIZE)
        Select([
          { value: 'Not set (empty value)' },
          { value: BUNDLE_NAME_ARRAY[0] },
          { value: BUNDLE_NAME_ARRAY[1] },
        ])
          .id('skill_bundle_select')
          .selected(this.bundleName.length > 0 ? BUNDLE_NAME_ARRAY.indexOf(this.bundleName) : EMPTY_OPTION_INDEX)
          .value(this.bundleName.length > 0 ? this.bundleName : 'Not set (empty value)')
          .width('100%')
          .enabled(!this.isOperating)
          .onSelect((index: number): void => {
            this.bundleName = index === DEFAULT_OPTION_INDEX ? '' : BUNDLE_NAME_ARRAY[index - 1];
          })
        Text($r('app.string.skill_module_placeholder'))
          .id('skill_module_selector_label')
          .fontSize(BODY_FONT_SIZE)
        Select([
          { value: 'Not set (empty value)' },
          { value: MODULE_NAME_ARRAY[0] },
          { value: MODULE_NAME_ARRAY[1] },
        ])
          .id('skill_module_select')
          .selected(this.moduleName.length > 0 ? MODULE_NAME_ARRAY.indexOf(this.moduleName) : EMPTY_OPTION_INDEX)
          .value(this.moduleName.length > 0 ? this.moduleName : 'Not set (empty value)')
          .width('100%')
          .enabled(!this.isOperating)
          .onSelect((index: number): void => {
            this.moduleName = index === DEFAULT_OPTION_INDEX ? '' : MODULE_NAME_ARRAY[index - 1];
          })
        Text($r('app.string.skill_name_placeholder'))
          .id('skill_name_selector_label')
          .fontSize(BODY_FONT_SIZE)
        Select([
          { value: 'Not set (empty value)' },
          { value: SKILL_ARRAY[0] },
          { value: SKILL_ARRAY[1] },
          { value: SKILL_ARRAY[2] },
          { value: SKILL_ARRAY[3] },
          { value: SKILL_ARRAY[4] },
        ])
          .id('skill_name_select')
          .selected(this.skillName.length > 0 ? SKILL_ARRAY.indexOf(this.skillName) : EMPTY_OPTION_INDEX)
          .value(this.skillName.length > 0 ? this.skillName : 'Not set (empty value)')
          .width('100%')
          .enabled(!this.isOperating)
          .onSelect((index: number): void => {
            this.skillName = index === DEFAULT_OPTION_INDEX ? '' : SKILL_ARRAY[index - 1];
          })

        Text($r('app.string.skill_flag_placeholder'))
          .id('skill_flag_selector_label')
          .fontSize(BODY_FONT_SIZE)
        Select([
          { value: FLAG_LABELS[0] },
          { value: FLAG_LABELS[1] },
          { value: FLAG_LABELS[2] },
          { value: FLAG_LABELS[3] },
          { value: FLAG_LABELS[4] },
          { value: FLAG_LABELS[5] },
        ])
          .id('skill_flag_select')
          .selected(this.flagIndex)
          .value(FLAG_LABELS[this.flagIndex])
          .width('100%')
          .enabled(!this.isOperating)
          .onSelect((index: number): void => {
            this.flagIndex = index;
          })

        Button($r('app.string.query_bundle_skill_button'))
          .id('query_bundle_skill_button')
          .width('100%')
          .height(BUTTON_HEIGHT)
          .enabled(!this.isOperating)
          .onClick(() => {
            this.queryBundleSkill();
          })
        Button($r('app.string.query_bundle_skills_button'))
          .id('query_bundle_skills_button')
          .width('100%')
          .height(BUTTON_HEIGHT)
          .enabled(!this.isOperating)
          .onClick(() => {
            this.queryBundleSkills();
          })
        Text(this.operationResult)
          .id('skill_operation_result')
          .width('100%')
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.result_text'))

        Text($r('app.string.skill_results_title'))
          .id('skill_results_title')
          .fontSize(SUBTITLE_FONT_SIZE)
          .fontWeight(FontWeight.Medium)
        if (this.skills.length === 0) {
          Text($r('app.string.no_skills'))
            .id('skill_no_results')
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.secondary_text'))
        } else {
          ForEach(this.skills, (skill: skillManager.SkillInfo, index: number) => {
            Column({ space: ITEM_SPACING }) {
              Text(skill.skillName)
                .id(`skill_result_name_${index}`)
                .fontSize(SUBTITLE_FONT_SIZE)
                .fontWeight(FontWeight.Medium)
              this.skillDetailRow($r('app.string.skill_bundle_label'), skill.bundleName,
                `skill_result_bundle_${index}`)
              this.skillDetailRow($r('app.string.skill_module_label'), skill.moduleName,
                `skill_result_module_${index}`)
              this.skillDetailRow($r('app.string.skill_name_label'), skill.skillName,
                `skill_result_name_${index}`)
              this.skillDetailRow($r('app.string.skill_type_label'), `${skill.skillType}`,
                `skill_result_type_${index}`)
              this.skillDetailRow($r('app.string.skill_path_label'), skill.skillPath,
                `skill_result_path_${index}`)
              this.skillDetailRow($r('app.string.skill_ability_label'), skill.abilityName,
                `skill_result_ability_${index}`)
              this.skillDetailRow($r('app.string.skill_version_code_label'), `${skill.versionCode}`,
                `skill_result_version_code_${index}`)
              this.skillDetailRow($r('app.string.skill_version_label'), this.formatOptional(skill.version),
                `skill_result_version_${index}`)
              this.skillDetailRow($r('app.string.skill_visibility_label'), this.formatOptional(skill.visibility),
                `skill_result_visibility_${index}`)
              this.skillDetailRow($r('app.string.skill_description_label'), this.formatOptional(skill.description),
                `skill_result_description_${index}`)
              this.skillDetailRow($r('app.string.skill_src_entries_label'), this.formatList(skill.srcEntries),
                `skill_result_src_entries_${index}`)
              this.skillDetailRow($r('app.string.skill_permissions_label'), this.formatList(skill.permissions),
                `skill_result_permissions_${index}`)
              this.skillDetailRow($r('app.string.skill_request_permissions_label'),
                this.formatList(skill.requestPermissions), `skill_result_request_permissions_${index}`)
            }
            .id(`skill_card_${index}`)
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding(PAGE_PADDING)
            .backgroundColor($r('app.color.card_background'))
            .borderRadius(CARD_RADIUS)
          }, (skill: skillManager.SkillInfo) =>
          `${skill.bundleName}/${skill.moduleName}/${skill.skillName}`)
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
