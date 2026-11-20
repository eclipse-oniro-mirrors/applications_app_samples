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

/** Actions the overlay page can drive. */
export enum OverlayAction {
  DISABLE = 'disable',
  ENABLE = 'enable',
  ADD_RESOURCE = 'addResource',
  REMOVE_RESOURCE = 'removeResource'
}

/** Observable overlay state shown by the page. */
export enum OverlayState {
  INITIAL = 'initial',
  ENABLED = 'enabled',
  DISABLED = 'disabled',
  RUNTIME_LOADED = 'runtimeLoaded',
  RUNTIME_REMOVED = 'runtimeRemoved'
}

/**
 * Overlay page rules: hsp path assembly, result message mapping and the state
 * transitions driven by each button. Kept free of UI and of the overlay module so
 * the rules can be verified without installing any hsp.
 */
export class OverlayController {
  /** Module whose resources are overlaid statically. */
  static readonly OVERLAY_MODULE_NAME: string = 'libraryOverlay';
  /** Runtime hsp packaged next to the entry module. */
  static readonly RUNTIME_HSP_NAME: string = 'libraryRuntimeOverlay-default-signed.hsp';
  /** Returned when the bundle code dir cannot be used to build a path. */
  static readonly INVALID_PATH: string = '';
  /** Returned when an action name is unknown. */
  static readonly UNKNOWN_ACTION: string = '';

  /** Joins bundleCodeDir with the runtime hsp name, empty string when codeDir is invalid. */
  static buildHspPath(codeDir: string): string {
    if (!OverlayController.isValidCodeDir(codeDir)) {
      return OverlayController.INVALID_PATH;
    }
    return `${codeDir}/${OverlayController.RUNTIME_HSP_NAME}`;
  }

  /** Absolute dir without trailing slash is the only accepted shape. */
  static isValidCodeDir(codeDir: string): boolean {
    if (!codeDir) {
      return false;
    }
    if (codeDir.charAt(0) !== '/') {
      return false;
    }
    return !codeDir.endsWith('/');
  }

  /** Resource string key shown after an action, empty string when unknown. */
  static messageKeyOf(action: string, success: boolean): string {
    if (action === OverlayAction.DISABLE) {
      return success ? 'unEnableSuccess' : 'unEnableFailed';
    }
    if (action === OverlayAction.ENABLE) {
      return success ? 'enableSuccess' : 'enableFailed';
    }
    if (action === OverlayAction.ADD_RESOURCE || action === OverlayAction.REMOVE_RESOURCE) {
      return 'test_string';
    }
    return '';
  }

  /**
   * State after an action. A failed action keeps the current state unchanged, an
   * unknown action never mutates the state, an unknown current state is treated as
   * INITIAL.
   */
  static nextStateOf(current: string, action: string, success: boolean): string {
    const base: string = OverlayController.isKnownState(current) ? current : OverlayState.INITIAL;
    if (!success) {
      return base;
    }
    if (action === OverlayAction.ENABLE) {
      return OverlayState.ENABLED;
    }
    if (action === OverlayAction.DISABLE) {
      return OverlayState.DISABLED;
    }
    if (action === OverlayAction.ADD_RESOURCE) {
      return OverlayState.RUNTIME_LOADED;
    }
    if (action === OverlayAction.REMOVE_RESOURCE) {
      return OverlayState.RUNTIME_REMOVED;
    }
    return base;
  }

  /** True for the two buttons that toggle the overlay module. */
  static isSwitchAction(action: string): boolean {
    return action === OverlayAction.ENABLE || action === OverlayAction.DISABLE;
  }

  /** Normalizes a button name, UNKNOWN_ACTION when it is not a known action. */
  static parseAction(name: string): string {
    const actions: string[] = OverlayController.actionList();
    for (let index: number = 0; index < actions.length; index++) {
      if (actions[index] === name) {
        return name;
      }
    }
    return OverlayController.UNKNOWN_ACTION;
  }

  /** All actions in button order. */
  static actionList(): string[] {
    return [
      OverlayAction.DISABLE,
      OverlayAction.ENABLE,
      OverlayAction.ADD_RESOURCE,
      OverlayAction.REMOVE_RESOURCE
    ];
  }

  /** True when the value is one of the four observable states. */
  static isKnownState(state: string): boolean {
    return state === OverlayState.INITIAL || state === OverlayState.ENABLED ||
      state === OverlayState.DISABLED || state === OverlayState.RUNTIME_LOADED ||
      state === OverlayState.RUNTIME_REMOVED;
  }
}
