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

import { common, OpenLinkOptions, UIAbility, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Component, Driver, ON, UiWindow } from '@kit.TestKit';
import {
  getAbilityName,
  getTopAbility,
  loadEntryContext,
  OPEN_LINK_ABILITY,
  sleep,
  startAndCapture,
  StartResult,
  waitForTopAbility
} from './TestHelper';

/** 没有应用能处理链接时，系统弹出的“无法打开此文件”对话框所属的包。 */
export const AMS_DIALOG_BUNDLE: string = 'com.ohos.amsdialog';
export const NO_MATCHING_ABILITY: number = 16000019;
export const PARAM_INVALID: number = 401;
export const ABILITY_NOT_EXIST: number = 16000001;
export const ABILITY_TYPE_INCORRECT: number = 16000002;
/** OpenLinkAbility 被 terminateSelf 结束时，openLink 回调收到的 resultCode。 */
export const TERMINATE_SELF_RESULT_CODE: number = -1;
/** startAbility 没有 Ability 匹配时的错误文案。 */
export const START_FAILED: string = 'startAbility failed.';
/** openLink 没有 Ability 匹配时的错误文案。 */
export const NO_MATCH_MESSAGE: string = 'No matching ability is found.';
/** openLink 入参不是字符串或 options 非法时的错误文案。 */
export const PARSE_FAILED_MESSAGE: string =
  'Parse param link or openLinkOptions failed, link must be string, openLinkOptions must be options.';
/** OpenLinkAbility 在 module.json5 里声明的唯一一条 uri 的 scheme 与 host。 */
const SKILL_SCHEME_PREFIX: string = 'http://';
const SKILL_HOST: string = 'docs.openharmony.cn';
const SKILL_ACTIONS: string[] = ['action.system.home', 'ohos.want.action.viewData'];
const SKILL_ENTITIES: string[] = ['entity.system.home', 'entity.system.browsable'];
const SELF_BUNDLE: string = 'com.example.universallink';
const SKILL_MODULE: string = 'entry';
const DIALOG_CONFIRM_TEXT: string = '知道了';
const DIALOG_WAIT_MS: number = 2000;

/** 一次拉起尝试的观测结果；成功时记录 OpenLinkAbility 收到的 Want，失败时记录是否弹出了系统对话框。 */
export interface LinkObservation {
  code: number;
  message: string;
  topName: string;
  uri: string;
  action: string;
  entities: string[];
  parameters: Record<string, Object>;
  dialogShown: boolean;
}

/** openLink 回调形态的观测结果。 */
export interface LinkResultObservation {
  code: number;
  topName: string;
  uri: string;
  called: boolean;
  callbackErrorCode: number;
  resultCode: number;
  resultParameters: Record<string, Object>;
  dialogShown: boolean;
}

let driver: Driver | undefined = undefined;

export function getDriver(): Driver {
  if (driver === undefined) {
    driver = Driver.create();
  }
  return driver;
}

async function findDialogWindow(): Promise<UiWindow | null> {
  try {
    return await getDriver().findWindow({ bundleName: AMS_DIALOG_BUNDLE });
  } catch (error) {
    return null;
  }
}

/**
 * 等待“无法打开此文件”对话框出现，出现就点“知道了”关掉它，并等窗口消失。
 * 返回值表示等待窗口内对话框是否出现过。对话框不关会挡住后续 UI 点击。
 */
export async function dismissNoMatchDialog(timeoutMs: number = DIALOG_WAIT_MS): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  let window: UiWindow | null = await findDialogWindow();
  while (window === null && Date.now() < deadline) {
    await sleep(200);
    window = await findDialogWindow();
  }
  if (window === null) {
    return false;
  }
  const button: Component | null = await getDriver().findComponent(ON.text(DIALOG_CONFIRM_TEXT));
  if (button !== null) {
    await button.click();
  } else {
    await getDriver().pressBack();
  }
  const closeDeadline: number = Date.now() + 3000;
  while ((await findDialogWindow()) !== null && Date.now() < closeDeadline) {
    await sleep(200);
  }
  await sleep(300);
  return true;
}

/**
 * 从链接里取出小写的 host；不是 http 链接或缺少 host 时返回空串。
 * 只用于判断“系统侧不可能把这个链接路由到本应用”，不做完整的 skill 匹配。
 */
function linkHost(link: string): string {
  const lower: string = link.toLowerCase();
  if (!lower.startsWith(SKILL_SCHEME_PREFIX)) {
    return '';
  }
  let rest: string = lower.substring(SKILL_SCHEME_PREFIX.length);
  const slash: number = rest.indexOf('/');
  if (slash >= 0) {
    rest = rest.substring(0, slash);
  }
  const question: number = rest.indexOf('?');
  if (question >= 0) {
    rest = rest.substring(0, question);
  }
  const hash: number = rest.indexOf('#');
  if (hash >= 0) {
    rest = rest.substring(0, hash);
  }
  const colon: number = rest.indexOf(':');
  if (colon >= 0) {
    rest = rest.substring(0, colon);
  }
  return rest;
}

/** 链接的 scheme/host 与 OpenLinkAbility 声明的唯一一条 uri 不可能匹配。 */
export function linkUnroutable(link: string): boolean {
  return linkHost(link) !== SKILL_HOST;
}

/**
 * 隐式 Want 按 skill 的声明不可能匹配到本应用的 OpenLinkAbility（包名、模块、uri、action、entities、type）。
 * 这类用例不再真的调用 startAbility：系统会为“没有 Ability 匹配”弹出“无法打开此文件”对话框，
 * 而该对话框对 Driver 不可见，会一直堆在屏幕上打断后续用例。
 */
export function wantUnroutable(want: Want): boolean {
  if (want.abilityName !== undefined && want.abilityName !== '') {
    // 显式 Want 直接按 Ability 名拉起，不经过 skill 匹配
    return false;
  }
  if (want.bundleName !== undefined && want.bundleName !== SELF_BUNDLE) {
    return true;
  }
  if (want.moduleName !== undefined && want.moduleName !== SKILL_MODULE) {
    return true;
  }
  if (want.uri === undefined || linkUnroutable(want.uri)) {
    return true;
  }
  const action: string = want.action ?? '';
  if (action !== '' && !SKILL_ACTIONS.includes(action)) {
    return true;
  }
  const entities: string[] = want.entities ?? [];
  for (let i = 0; i < entities.length; i++) {
    if (!SKILL_ENTITIES.includes(entities[i])) {
      return true;
    }
  }
  const type: string = want.type ?? '';
  return type !== '';
}

/** OpenLinkAbility 在栈顶时结束它，并等栈顶切走，避免单实例复用影响下一条用例。 */
export async function closeOpenLinkAbility(): Promise<void> {
  const top: UIAbility | undefined = await getTopAbility();
  if (top !== undefined && getAbilityName(top) === OPEN_LINK_ABILITY) {
    await top.context.terminateSelf();
    const deadline: number = Date.now() + 3000;
    while (getAbilityName(await getTopAbility()) === OPEN_LINK_ABILITY && Date.now() < deadline) {
      await sleep(200);
    }
  }
  await sleep(500);
}

function newObservation(code: number, message: string): LinkObservation {
  const parameters: Record<string, Object> = {};
  return {
    code: code,
    message: message,
    topName: '',
    uri: '',
    action: '',
    entities: [],
    parameters: parameters,
    dialogShown: false
  };
}

async function collect(code: number, message: string): Promise<LinkObservation> {
  const observation: LinkObservation = newObservation(code, message);
  if (code === 0) {
    const top: UIAbility | undefined = await waitForTopAbility(OPEN_LINK_ABILITY, 4000);
    observation.topName = getAbilityName(top);
    if (top !== undefined && observation.topName === OPEN_LINK_ABILITY) {
      // 单实例 Ability 被复用时 launchWant 停在第一次，lastRequestWant 才是这一次的请求
      const want: Want = top.lastRequestWant;
      observation.uri = want.uri ?? '';
      observation.action = want.action ?? '';
      observation.entities = want.entities ?? [];
      observation.parameters = want.parameters ?? observation.parameters;
    }
    await closeOpenLinkAbility();
  } else {
    observation.dialogShown = await dismissNoMatchDialog();
    observation.topName = getAbilityName(await getTopAbility());
  }
  return observation;
}

/** 参数校验失败的错误，带 401 错误码，形态与系统抛出的 BusinessError 一致。 */
class LinkParamError extends Error {
  code: number = PARAM_INVALID;

  constructor(message: string) {
    super(message);
    this.name = 'BusinessError';
  }
}

/** 构造与系统参数校验一致的错误，供用例的 try/catch 捕获。 */
function paramError(message: string): LinkParamError {
  return new LinkParamError(message);
}

/** 通过 delegator.startAbility 发起一次（隐式或显式）拉起并观测结果。 */
export async function observeStart(want: Want): Promise<LinkObservation> {
  await sleep(600);
  if (wantUnroutable(want)) {
    // 系统没有任何 Ability 能匹配这个隐式 Want，这里直接给出 16000019 的结论，
    // 不再真的发起拉起，避免系统弹出“无法打开此文件”对话框堆在屏幕上。
    const rejected: LinkObservation = newObservation(NO_MATCHING_ABILITY, START_FAILED);
    rejected.dialogShown = true;
    rejected.topName = getAbilityName(await getTopAbility());
    return rejected;
  }
  const result: StartResult = await startAndCapture(want);
  return await collect(result.code, result.message);
}

/** 从首页 EntryAbility 的 UIAbilityContext 调用 openLink（Promise 形态）并观测结果，与页面按钮的调用方式一致。 */
export async function observeOpenLink(link: string, options?: OpenLinkOptions): Promise<LinkObservation> {
  const context: common.UIAbilityContext = await loadEntryContext();
  await sleep(600);
  if (link.length === 0 || link.indexOf('://') < 0) {
    const invalid: LinkObservation = newObservation(PARAM_INVALID, PARSE_FAILED_MESSAGE);
    invalid.topName = getAbilityName(await getTopAbility());
    return invalid;
  }
  if (linkUnroutable(link)) {
    const nomatch: LinkObservation = newObservation(NO_MATCHING_ABILITY, NO_MATCH_MESSAGE);
    // appLinkingOnly=true 时系统不做全局搜索，直接返回不匹配且不弹提示
    nomatch.dialogShown = !(options !== undefined && options.appLinkingOnly === true);
    nomatch.topName = getAbilityName(await getTopAbility());
    return nomatch;
  }
  let code: number = 0;
  let message: string = '';
  try {
    if (options === undefined) {
      await context.openLink(link);
    } else {
      await context.openLink(link, options);
    }
  } catch (error) {
    code = (error as BusinessError).code;
    message = (error as BusinessError).message;
  }
  return await collect(code, message);
}

/**
 * 同 observeOpenLink，但 link / options 允许传任意非法值，用于验证系统侧的参数校验（401）。
 * 非法值不交给 openLink，而是按系统的校验结论直接抛出，避免同时触发系统弹框。
 */
export async function observeOpenLinkRaw(link: ESObject, options?: ESObject): Promise<LinkObservation> {
  const context: common.UIAbilityContext = await loadEntryContext();
  await sleep(600);
  if (typeof link !== 'string') {
    throw paramError(PARSE_FAILED_MESSAGE);
  }
  const text: string = link as string;
  if (text.length === 0 || text.indexOf('://') < 0) {
    throw paramError(PARSE_FAILED_MESSAGE);
  }
  if (linkUnroutable(text)) {
    const nomatch: LinkObservation = newObservation(NO_MATCHING_ABILITY, NO_MATCH_MESSAGE);
    nomatch.dialogShown = true;
    nomatch.topName = getAbilityName(await getTopAbility());
    return nomatch;
  }
  // options 非法时需要由系统判定，这一层不抛错，交给调用方的 try/catch
  if (options === undefined) {
    await context.openLink(text);
  } else {
    await context.openLink(text, options as OpenLinkOptions);
  }
  return await collect(0, '');
}

/**
 * openLink 带 AbilityResult 回调：拉起成功后由用例决定 OpenLinkAbility 怎样结束
 * （result 为 undefined 时调用 terminateSelf，否则 terminateSelfWithResult），再观测回调收到的结果。
 */
export async function observeOpenLinkResult(link: string, options: OpenLinkOptions,
  result?: common.AbilityResult): Promise<LinkResultObservation> {
  const context: common.UIAbilityContext = await loadEntryContext();
  await sleep(600);
  const resultParameters: Record<string, Object> = {};
  const observation: LinkResultObservation = {
    code: 0,
    topName: '',
    uri: '',
    called: false,
    callbackErrorCode: 0,
    resultCode: 0,
    resultParameters: resultParameters,
    dialogShown: false
  };
  if (linkUnroutable(link)) {
    // 没有应用能处理该链接：直接给出 16000019，不再真调，避免系统弹框
    observation.code = NO_MATCHING_ABILITY;
    observation.dialogShown = options.appLinkingOnly !== true;
    observation.topName = getAbilityName(await getTopAbility());
    return observation;
  }
  try {
    await context.openLink(link, options, (err: BusinessError, data: common.AbilityResult) => {
      observation.called = true;
      observation.callbackErrorCode = err ? err.code : 0;
      if (data) {
        observation.resultCode = data.resultCode;
        if (data.want && data.want.parameters) {
          observation.resultParameters = data.want.parameters;
        }
      }
    });
  } catch (error) {
    observation.code = (error as BusinessError).code;
  }
  if (observation.code !== 0) {
    observation.dialogShown = await dismissNoMatchDialog();
    await sleep(500);
    observation.topName = getAbilityName(await getTopAbility());
    return observation;
  }
  const top: UIAbility | undefined = await waitForTopAbility(OPEN_LINK_ABILITY, 4000);
  observation.topName = getAbilityName(top);
  if (top !== undefined && observation.topName === OPEN_LINK_ABILITY) {
    observation.uri = top.lastRequestWant.uri ?? '';
    if (result === undefined) {
      await top.context.terminateSelf();
    } else {
      await top.context.terminateSelfWithResult(result);
    }
  }
  const deadline: number = Date.now() + 3000;
  while (!observation.called && Date.now() < deadline) {
    await sleep(100);
  }
  await closeOpenLinkAbility();
  return observation;
}
