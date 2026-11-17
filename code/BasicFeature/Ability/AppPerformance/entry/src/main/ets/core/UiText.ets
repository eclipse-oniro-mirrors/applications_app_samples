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
import { formatMessage, localize, message, setTextContext } from './TextMessages';
import { statusText } from './Types';

/** Resolve at the current UI boundary, never while a model module is initialized. */
export function resolveText(context: common.Context | undefined, resource: Resource,
  args: (string | number)[] = []): string {
  if (context === undefined) {
    logWarn('UI resource context is unavailable');
    return message('ap_resource_unavailable');
  }
  try {
    setTextContext(context);
    // A compiled entry_test ID is not an application-manager ID. Preserve the Resource's
    // bundle/module/name metadata on this SDK-supported synchronous compatibility path.
    const template: string = context.resourceManager.getStringSync(resource);
    return formatMessage(template,
      args.map((value: string | number): string => typeof value === 'string' ? localize(value) : `${value}`));
  } catch (error) {
    logWarn(`UI resource resolution failed: ${(error as Error).message}`);
    return message('ap_resource_unavailable');
  }
}

/** Status codes are stable; messages that are already rendered remain unchanged. */
export function displayValue(context: common.Context | undefined, value: string): string {
  setTextContext(context);
  return statusText(value);
}

/** The producer formats the preview; its resource body must never be interpreted as a message. */
export function displayResourcePreview(context: common.Context | undefined, value: string): string {
  setTextContext(context);
  return value;
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
