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
import { resourceManager } from '@kit.LocalizationKit';
import { DEFAULT_STRINGS } from './DefaultStrings';
import { logWarning } from '../services/Logger';

/** Scene resources are owned by entry; the reusable feature receives only this narrow text port. */
class EntryShortcutResources implements ShortcutResourceProvider {
  text(name: string, args: string[]): string { return uiText(name, args); }
}

function bindShortcutResourceProvider(): void {
  setShortcutResourceProvider(new EntryShortcutResources());
}

let manager: resourceManager.ResourceManager | undefined = undefined;
let resolver: ((name: string) => string) | undefined = undefined;
let warned: boolean = false;

/** Inject a resource provider for isolated consumers; production binding resets this provider. */
export function setStringResolver(provider: ((name: string) => string) | undefined): void {
  resolver = provider;
  manager = undefined;
  warned = false;
  bindShortcutResourceProvider();
}

/** Bind before initializing services; no global getContext() or pre-Ability resource access. */
export function bindStrings(context: common.ApplicationContext): void {
  manager = context.resourceManager;
  resolver = undefined;
  warned = false;
  bindShortcutResourceProvider();
}

/** Resolve text for existing string-only models, dialogs, and APIs. */
export function uiText(name: string, args: string[] = []): string {
  let template: string = DEFAULT_STRINGS[name] || name;
  if (manager !== undefined || resolver !== undefined) {
    try {
      const provider = resolver;
      if (provider !== undefined) {
        template = provider(name) || template;
      } else if (manager !== undefined) {
        template = manager.getStringByNameSync(name);
      }
    } catch (_) {
      if (!warned) {
        warned = true;
        logWarning('String resource lookup failed; using English fallback');
      }
    }
  }
  // One replacement pass prevents user text such as "%2$s" from becoming another placeholder.
  return template.replace(/%([1-9][0-9]*)\$s/g, (token: string, index: string): string => {
    const value: string | undefined = args[Number(index) - 1];
    return value === undefined ? token : value;
  });
}

/** Resolve only explicitly tagged catalogue fields, never arbitrary user/business data. */
export function resourceText(value: string): string {
  const prefix: string = '@string/';
  return value.startsWith(prefix) ? uiText(value.substring(prefix.length)) : value;
}

// Shortcut text port and its existing fallback share this module with Context resolution.
/** The host owns localization. No page, scene catalogue or entry resource implementation is imported. */
export interface ShortcutResourceProvider {
  text(name: string, args: string[]): string;
}

const FALLBACK: Record<string, string> = {
  'shortcut_text_0068': 'This app',
  'shortcut_text_0126': 'Compensation is not an atomic system rollback. Items with unknown original values are skipped. Explicitly choose to overwrite external changes.',
  'shortcut_text_0133': 'Not supported',
  'shortcut_text_0141': 'Operation has ended',
  'shortcut_text_0142': 'Operation in progress. Please wait.',
  'shortcut_text_0161': 'Success',
  'shortcut_text_0205': 'Needs verification',
  'shortcut_text_0208': 'Current device',
  'shortcut_text_0210': 'Already in the original state; no write needed',
  'shortcut_text_0211': 'Current visibility is unknown. Verify first; do not replay.',
  'shortcut_text_0216': 'Call',
  'shortcut_text_0219': 'Dynamic',
  'shortcut_text_0231': 'External changes found: choose overwrite or keep',
  'shortcut_text_0233': 'Returned %1$s',
  'shortcut_text_0234': 'Returned %1$s items',
  'shortcut_text_0267': 'Verification complete. Only verified failures can be retried; unknown results are not replayed.',
  'shortcut_text_0281': 'Restore all',
  'shortcut_text_0290': 'Read-back mismatch',
  'shortcut_text_0291': 'Read-back failed: %1$s',
  'shortcut_text_0292': 'Read-back did not return visibility',
  'shortcut_text_0293': 'Read-back did not return this shortcut',
  'shortcut_text_0294': 'Read-back matched',
  'shortcut_text_0315': 'Check shortcut support',
  'shortcut_text_0316': 'Check failed',
  'shortcut_text_0317': 'Checking',
  'shortcut_text_0324': 'API completed, visible=%1$s',
  'shortcut_text_0340': 'Retry only verified failures. Confirmed, unknown, and unexecuted items are not rewritten.',
  'shortcut_text_0347': 'Static',
  'shortcut_text_0349': 'An earlier setting request is still pending. Do not write again; verify later.',
  'shortcut_text_0350': 'An earlier setting request is still pending. Verify first; do not write again.',
  'shortcut_text_0352': 'Start',
  'shortcut_text_0358': 'Visibility verification',
  'shortcut_text_0361': 'Eligible',
  'shortcut_text_0372': 'Source %1$s',
  'shortcut_text_0405': 'Visible by default',
  'shortcut_text_0416': 'Batch sequence limit reached; nothing executed',
  'shortcut_text_0417': 'Could not read the batch journal. It will not be overwritten or replayed. Try reading again.',
  'shortcut_text_0418': 'Could not save the batch journal; stopped. Reload and verify first. Do not blindly retry.',
  'shortcut_text_0419': 'Batch finished. See individual results below. Unknown is not failure; compensation is not atomic.',
  'shortcut_text_0421': 'Verify unknown batch results',
  'shortcut_text_0422': 'Verify before batch preview',
  'shortcut_text_0430': 'Expected visible=%1$s, read-back visible=%2$s',
  'shortcut_text_0443': 'Review the preview before confirming. Items with unknown original values cannot be restored precisely.',
  'shortcut_text_0449': 'Check support first',
  'shortcut_text_0463': 'All shortcuts',
  'shortcut_text_0464': 'All shortcuts are visible',
  'shortcut_text_0466': 'Retry blocked by permission, capability, or invalid-ID errors. Fix the conditions and create a new preview.',
  'shortcut_text_0475': 'Verify again after confirmation',
  'shortcut_text_0476': 'State changed after confirmation; nothing executed. Create a new preview.',
  'shortcut_text_0498': 'Not checked',
  'shortcut_text_0499': 'Device not supported',
  'shortcut_text_0502': 'Read back after setting: %1$s',
  'shortcut_text_0503': 'Setting failed',
  'shortcut_text_0504': 'Setting',
  'shortcut_text_0513': 'Failed',
  'shortcut_text_0514': 'Failed (verified below target)',
  'shortcut_text_0534': 'Refresh shortcuts',
  'shortcut_text_0544': 'Selected shortcuts changed. Select again.',
  'shortcut_text_0583': 'Unknown (verify first)',
  'shortcut_text_0589': 'Not executed',
  'shortcut_text_0606': 'Visibility batch',
  'shortcut_text_0642': 'Navigation',
  'shortcut_text_0651': 'Read',
  'shortcut_text_0658': 'Restored %1$s items',
  'shortcut_text_0659': 'Restored %1$s/%2$s, %3$s; stopped',
  'shortcut_text_0673': 'Confirmed',
  'shortcut_text_0676': 'Submitted; verification pending',
  'shortcut_text_0677': 'Stopped',
  'shortcut_text_0713': 'Original batch did not execute; no compensation',
  'shortcut_text_0715': 'Original visibility is unknown; precise restoration is impossible',
  'shortcut_text_0747': 'Restoring %1$s/%2$s',
  'shortcut_text_0748': 'Applying settings',
  'shortcut_text_0749': 'Supported',
  'shortcut_text_0771': 'Verify before retry or compensation preview',
  'shortcut_text_0783': 'Restore %1$s items individually',
  'shortcut_text_0790': 'Custom',
  'shortcut_text_0793': 'code=not provided; no error details',
};
let provider: ShortcutResourceProvider | undefined = undefined;

export function setShortcutResourceProvider(value: ShortcutResourceProvider | undefined): void {
  provider = value;
}

export function shortcutText(name: string, args: string[] = []): string {
  const current: ShortcutResourceProvider | undefined = provider;
  if (current !== undefined) {
    try { return current.text(name, args); } catch (_) {
      logWarning('Shortcut resource provider failed; using feature fallback');
    }
  }
  const template: string = FALLBACK[name] || name;
  return template.replace(/%([1-9][0-9]*)\$s/g, (token: string, index: string): string => {
    const value: string | undefined = args[Number(index) - 1];
    return value === undefined ? token : value;
  });
}
