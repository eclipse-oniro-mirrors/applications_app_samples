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

// Deterministic parts of pages/Index.ets, uiextensionpages/*.ets and entryability/OpenLinkUIAbility.ets:
// routes, Want contents, result codes and the messages written to hilog / promptAction.

// Mirrors the fileName list of pages/Index.ets.
export const PAGE_NAMES: string[] = ['AbilityStartCallback', 'UIExtensionContext', 'UIExtensionContentSession'];
// Mirrors the Want targets of requestModalUIExtension().
export const BUNDLE_NAME: string = 'com.samples.uiextension';
export const CONTEXT_ABILITY: string = 'ContextUIExtensionAbility';
export const SESSION_ABILITY: string = 'SessionUIExtensionAbility';
export const UI_EXTENSION_TYPE_KEY: string = 'ability.want.params.uiExtensionType';
export const UI_EXTENSION_TYPE: string = 'sys/commonUI';
// Mirrors the result codes of terminateSelfWithResult() (callback and promise variants).
export const CALLBACK_RESULT_CODE: number = 99;
export const PROMISE_RESULT_CODE: number = 100;
// Mirrors the openLink() target and options of UIExtensionContext.ets.
export const OPEN_LINK: string = 'http://docs.openharmony.cn';
export const APP_LINKING_ONLY: boolean = false;
// Mirrors the startAbilityByType() types used by AbilityStartCallback.ets.
export const PICKER_TYPES: string[] = ['audioPicker', 'error'];
// Mirrors the system bar colors set by OpenLinkUIAbility.
export const BAR_COLOR: string = '#f1f3f5';
// Mirrors the pages loaded by the abilities.
export const OPEN_LINK_PAGE: string = 'pages/OpenLinkIndex';
export const CONTEXT_PAGE: string = 'uiextensionpages/UIExtensionContextPage';

// Mirrors the Want of requestModalUIExtension() flattened to its fields.
export interface ModalWant {
  bundleName: string;
  abilityName: string;
  paramBundleName: string;
  uiExtensionType: string;
}

// Mirrors the result passed to terminateSelfWithResult().
export interface TerminateResult {
  resultCode: number;
  hasWant: boolean;
}

// Mirrors router.pushUrl({ url: `uiextensionpages/${item}` }) of the Index list.
export function routeOf(item: string): string {
  return `uiextensionpages/${item}`;
}

// Mirrors $r(`app.string.${item}`) used for the list item titles.
export function titleResourceOf(item: string): string {
  return `app.string.${item}`;
}

// Mirrors the ForEach key generator (item: string) => item.
export function listKeyOf(item: string): string {
  return item;
}

// Mirrors the Index list: whether a page name is one of the routed pages.
export function isListedPage(item: string): boolean {
  return PAGE_NAMES.indexOf(item) >= 0;
}

// Mirrors the Want built by UIExtensionContext.ets (context) or UIExtensionContentSession.ets (session).
export function modalWantOf(useSession: boolean): ModalWant {
  const want: ModalWant = {
    bundleName: BUNDLE_NAME,
    abilityName: useSession ? SESSION_ABILITY : CONTEXT_ABILITY,
    paramBundleName: BUNDLE_NAME,
    uiExtensionType: UI_EXTENSION_TYPE
  };
  return want;
}

// Mirrors terminateSelfWithResult({ resultCode: 99 | 100, want: this.want }).
export function terminateResultOf(usePromise: boolean, hasWant: boolean): TerminateResult {
  const result: TerminateResult = {
    resultCode: usePromise ? PROMISE_RESULT_CODE : CALLBACK_RESULT_CODE,
    hasWant: hasWant
  };
  return result;
}

// Mirrors the requestModalUIExtension() success / failure messages.
export function modalMessageOf(code: number, message: string): string {
  if (code === 0) {
    return 'requestModalUIExtension succeed.';
  }
  return `requestModalUIExtension failed, code is ${code}, message is ${message}`;
}

// Mirrors the reportDrawnCompleted() callback messages (err.code decides the branch).
export function reportDrawnMessageOf(code: number, message: string): string {
  if (code !== 0) {
    return `UIExtensionContent.reportDrawnCompleted failed, code is ${code}, message is ${message}`;
  }
  return 'UIExtensionContent.reportDrawnCompleted succeed.';
}

// Mirrors the setWindowPrivacyMode() messages of the callback (true) and promise (false) buttons.
export function privacyModeMessageOf(isPrivacyMode: boolean): string {
  const style: string = isPrivacyMode ? 'callback' : 'promise';
  return `UIExtensionContentSession.setWindowPrivacyMode(${style}) called. isPrivacyMode: ${isPrivacyMode}`;
}

// Mirrors the getUIExtensionWindowProxy() message: proxy: ${typeof windowProxy}.
export function windowProxyMessageOf(proxyType: string): string {
  return `UIExtensionContentSession.getUIExtensionWindowProxy called. proxy: ${proxyType}`;
}

// Mirrors the startAbilityByType onError message.
export function startErrorMessageOf(code: number, name: string, message: string): string {
  return `startAbilityByType onError, code:${code} name:${name} message:${message}`;
}

// Mirrors the startAbilityByType onResult hilog line: `resultCode:` + code + `bundleName:` + bundleName.
export function startResultLogOf(resultCode: number, bundleName: string): string {
  return `resultCode:${resultCode}bundleName:${bundleName}`;
}

// Mirrors the openLink() logs: callback result code, failure errCode and exception code.
export function openLinkLogOf(stage: string, code: number): string {
  switch (stage) {
    case 'callback':
      return `openLink callback result: ${JSON.stringify(code)}`;
    case 'failed':
      return `open link failed, errCode : ${JSON.stringify(code)}`;
    default:
      return `exception occurred, errCode : ${JSON.stringify(code)}`;
  }
}

// Mirrors appLinkingOnly: false - the link may also open in a browser.
export function allowsBrowserFallback(appLinkingOnly: boolean): boolean {
  return !appLinkingOnly;
}

// Mirrors the onSessionCreate() log: `UIExtAbility onSessionCreate, want: ${JSON.stringify(want)}`.
export function sessionCreateLogOf(bundleName: string, abilityName: string): string {
  const want: ModalWant = { bundleName: bundleName, abilityName: abilityName, paramBundleName: bundleName,
    uiExtensionType: UI_EXTENSION_TYPE };
  return `UIExtAbility onSessionCreate, want: ${JSON.stringify(want)}`;
}

// Mirrors the windowStage.loadContent() / session.loadContent() targets of the abilities.
export function contentPageOf(abilityName: string): string {
  return abilityName === 'OpenLinkUIAbility' ? OPEN_LINK_PAGE : CONTEXT_PAGE;
}

// Mirrors the button flow of the UIExtension pages: each action records the result the page reports.
export class UiExtensionPageState {
  route: string = '';
  lastMessage: string = '';
  terminated: boolean = false;
  resultCode: number = -1;
  privacyMode: boolean = false;
  requests: number = 0;

  // Mirrors the Index list item onClick().
  open(item: string): string {
    this.route = isListedPage(item) ? routeOf(item) : '';
    return this.route;
  }

  // Mirrors a requestModalUIExtension() button with the code the call reports.
  requestModal(useSession: boolean, code: number): string {
    this.requests++;
    this.lastMessage = modalMessageOf(code, useSession ? SESSION_ABILITY : CONTEXT_ABILITY);
    return this.lastMessage;
  }

  // Mirrors the terminateSelfWithResult() buttons.
  terminateWithResult(usePromise: boolean): number {
    this.terminated = true;
    this.resultCode = terminateResultOf(usePromise, true).resultCode;
    return this.resultCode;
  }

  // Mirrors the setWindowPrivacyMode() buttons.
  setPrivacyMode(isPrivacyMode: boolean): string {
    this.privacyMode = isPrivacyMode;
    this.lastMessage = privacyModeMessageOf(isPrivacyMode);
    return this.lastMessage;
  }

  // Mirrors the reportDrawnCompleted() button.
  reportDrawn(code: number): string {
    this.lastMessage = reportDrawnMessageOf(code, 'error');
    return this.lastMessage;
  }
}
