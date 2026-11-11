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

import { common } from '@kit.AbilityKit';
import { logWarn } from './Logger';

/** Resolve at the current UI boundary, never while a model module is initialized. */
export function resolveText(context: common.Context | undefined, resource: Resource,
  args: (string | number)[] = []): string {
  if (context === undefined) {
    logWarn('UI resource context is unavailable');
    return 'Resource unavailable';
  }
  try {
    return context.resourceManager.getStringSync(resource.id, ...args.map((value: string | number): string => `${value}`));
  } catch (error) {
    logWarn(`UI resource resolution failed: ${(error as Error).message}`);
    return 'Resource unavailable';
  }
}

/** Historical serialized status/group values are unchanged; translate only their display. */
export function displayValue(context: common.Context | undefined, value: string): string {
  switch (value) {
    case '启用': return resolveText(context, $r('app.string.ap_ui_enabled'));
    case '禁用': return resolveText(context, $r('app.string.ap_ui_disabled'));
    case '初始': return resolveText(context, $r('app.string.ap_ui_initial'));
    case '成功': return resolveText(context, $r('app.string.ap_ui_succeeded'));
    case '失败': return resolveText(context, $r('app.string.ap_ui_failed'));
    case '超时': return resolveText(context, $r('app.string.ap_ui_timed_out'));
    case '已取消': return resolveText(context, $r('app.string.ap_ui_cancelled'));
    case '跳过': return resolveText(context, $r('app.string.ap_ui_skipped'));
    case '待执行': return resolveText(context, $r('app.string.ap_ui_pending'));
    case '未校验': return resolveText(context, $r('app.string.ap_ui_not_verified'));
    case '一致': return resolveText(context, $r('app.string.ap_ui_consistent'));
    case '不一致': return resolveText(context, $r('app.string.ap_ui_inconsistent'));
    case '不可观测': return resolveText(context, $r('app.string.ap_ui_not_observable'));
    case '未观测': return resolveText(context, $r('app.string.ap_ui_not_observed'));
    case '未运行': return resolveText(context, $r('app.string.ap_ui_not_run'));
    case '待读取': return resolveText(context, $r('app.string.ap_ui_not_read_yet'));
    case '尚未设置': return resolveText(context, $r('app.string.ap_ui_not_set_yet'));
    case '调用中': return resolveText(context, $r('app.string.ap_ui_calling'));
    case '调用成功': return resolveText(context, $r('app.string.ap_ui_call_succeeded'));
    case '调用失败': return resolveText(context, $r('app.string.ap_ui_call_failed'));
    default: return value;
  }
}

export function workloadTitle(context: common.Context | undefined, id: string, fallback: string): string {
  switch (id) {
    case 'W-TEXT': return resolveText(context, $r('app.string.ap_ui_sample_text'));
    case 'W-NOTES': return resolveText(context, $r('app.string.ap_ui_note_list'));
    case 'W-IMAGES': return resolveText(context, $r('app.string.ap_ui_image_index'));
    case 'W-FORM': return resolveText(context, $r('app.string.ap_ui_form_draft'));
    default: return fallback;
  }
}

export function workloadDescription(context: common.Context | undefined, id: string, fallback: string): string {
  switch (id) {
    case 'W-TEXT': return resolveText(context, $r('app.string.ap_ui_a_basic_single_file_workload_used_as_a_control_for_the_existing_flow'));
    case 'W-NOTES': return resolveText(context, $r('app.string.ap_ui_multi_line_business_data_covering_field_parsing_and_empty_content_checks'));
    case 'W-IMAGES': return resolveText(context, $r('app.string.ap_ui_dimension_checks_detect_truncation_and_invalid_values'));
    case 'W-FORM': return resolveText(context, $r('app.string.ap_ui_cross_field_integrity_must_be_rechecked_after_restoration'));
    default: return fallback;
  }
}
