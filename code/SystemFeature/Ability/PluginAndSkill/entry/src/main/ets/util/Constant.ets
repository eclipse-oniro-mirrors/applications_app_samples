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

// UI layout constants
export const PAGE_PADDING: number = 24;

export const SECTION_SPACING: number = 16;

export const ITEM_SPACING: number = 8;

export const TITLE_FONT_SIZE: number = 28;

export const SUBTITLE_FONT_SIZE: number = 20;

export const BODY_FONT_SIZE: number = 16;

export const CONTENT_MAX_WIDTH: number = 720;

export const CARD_RADIUS: number = 12;

export const LABEL_WIDTH: number = 128;

export const EMPTY_VALUE: string = '-';

export const BUTTON_HEIGHT: number = 44;

// Skill query default values
export const DEFAULT_BUNDLE_NAME: string = 'com.samples.pluginandskill';

export const DEFAULT_MODULE_NAME: string = 'entry';

export const MODULE_NAME_ARRAY: string[] = ['entry', 'nonexistent_module'];

export const BUNDLE_NAME_ARRAY: string[] = ['com.samples.pluginandskill', 'com.nonexistent.bundle'];

export const SKILL_ARRAY: Array<string> =
  ['skill-nonexistent', 'skill-test', 'skill-echo', 'skill-calculator', 'skill-validation'];

export const DEFAULT_SKILL_NAME: string = 'skill-test';

export const DEFAULT_OPTION_INDEX: number = 0;

export const EMPTY_OPTION_INDEX: number = 0;

// Skill info query flags
export const SKILL_INFO_FLAGS: number = skillManager.SkillInfoFlag.GET_SKILL_INFO_WITH_DESCRIPTION |
  skillManager.SkillInfoFlag.GET_SKILL_INFO_WITH_SRC_ENTRIES |
  skillManager.SkillInfoFlag.GET_SKILL_INFO_WITH_PERMISSIONS |
  skillManager.SkillInfoFlag.GET_SKILL_INFO_WITH_REQUEST_PERMISSIONS;

// Flag selector options
export const FLAG_LABELS: Array<string> =
  ['All flags', 'Default', '+ Description', '+ SrcEntries', '+ Permissions', '+ RequestPermissions'];

export const FLAG_VALUES: Array<number> = [
  skillManager.SkillInfoFlag.GET_SKILL_INFO_DEFAULT |
    skillManager.SkillInfoFlag.GET_SKILL_INFO_WITH_DESCRIPTION |
    skillManager.SkillInfoFlag.GET_SKILL_INFO_WITH_SRC_ENTRIES |
    skillManager.SkillInfoFlag.GET_SKILL_INFO_WITH_PERMISSIONS |
    skillManager.SkillInfoFlag.GET_SKILL_INFO_WITH_REQUEST_PERMISSIONS,
  skillManager.SkillInfoFlag.GET_SKILL_INFO_DEFAULT,
  skillManager.SkillInfoFlag.GET_SKILL_INFO_DEFAULT |
    skillManager.SkillInfoFlag.GET_SKILL_INFO_WITH_DESCRIPTION,
  skillManager.SkillInfoFlag.GET_SKILL_INFO_DEFAULT |
    skillManager.SkillInfoFlag.GET_SKILL_INFO_WITH_SRC_ENTRIES,
  skillManager.SkillInfoFlag.GET_SKILL_INFO_DEFAULT |
    skillManager.SkillInfoFlag.GET_SKILL_INFO_WITH_PERMISSIONS,
  skillManager.SkillInfoFlag.GET_SKILL_INFO_DEFAULT |
    skillManager.SkillInfoFlag.GET_SKILL_INFO_WITH_REQUEST_PERMISSIONS
];

export const DEFAULT_FLAG_INDEX: number = 0;

// Plugin file filter
export const HSP_FILE_FILTER: string = 'HSP(.hsp)|.hsp';
