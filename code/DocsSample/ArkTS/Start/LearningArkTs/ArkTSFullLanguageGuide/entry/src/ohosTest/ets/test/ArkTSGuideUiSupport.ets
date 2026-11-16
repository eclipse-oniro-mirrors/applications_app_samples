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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Driver, ON, Component, MatchPattern } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';

export const DOMAIN: number = 0xF815;
export const TAG: string = '[Sample_ArkTSFullLanguageGuide]';
export const BUNDLE: string = 'com.samples.arktsfulllanguageguide';

const KEYCODE_WAKEUP: number = 224;
const SETTLE_MS: number = 400;
const CLICK_SETTLE_MS: number = 300;
const LOCK_RETRY: number = 3;
const QUERY_TIMEOUT_MS: number = 3000;

export const INDEX_TITLE: string = 'Index';
export const TAB_BASICS: string = '基本知识';
export const TAB_FUNCTIONS: string = '函数';
export const TAB_CLASSES: string = '类';
export const TAB_GENERICS: string = '泛型类型和函数';
export const STATUS_UNINITIALIZED: string = '未初始化';
export const LOG_EMPTY: string = '暂无日志信息';
export const LABEL_STATUS: string = '当前状态';
export const LABEL_LOG: string = '日志信息';

export class PageSpec {
  route: string;
  tabLabel: string;
  buttons: string[];
  finishes: string[];
  bodies: string[];

  constructor(route: string, tabLabel: string, buttons: string[], finishes: string[], bodies: string[]) {
    this.route = route;
    this.tabLabel = tabLabel;
    this.buttons = buttons;
    this.finishes = finishes;
    this.bodies = bodies;
  }
}

const BASICS_FINISH: string[] = ['测试变量声明完成', '测试类型标注完成', '测试BigInt完成', '测试空安全完成'];
const BASICS_BODY: string[] = [
  'count: 10\nname: ArkTS\nisActive: true\nmessage: Hello, ArkTS',
  'age: 25\nname: Alice\nnumbers: 1,2,3\nid: ABC-123',
  'bigValue: 999999999999999999999999999999999999\nnextValue: 1000000000000000000000000000000000000',
  'value: hello\nlength: 5\ndisplay: default'
];

const FUNCTIONS_FINISH: string[] = ['测试函数声明完成', '测试可选参数完成', '测试默认参数完成', '测试闭包完成'];
const FUNCTIONS_BODY: string[] = [
  'add(1, 2): 3\nmultiply(5, 3): 15',
  'greet(Alice): Hello, Alice\ngreet(Alice, Dr.): Hello, Dr. Alice',
  'greet(Alice): Hello, Alice\ngreet(Alice, Hi): Hi, Alice',
  'counter(): 1\ncounter(): 2'
];

const CLASSES_FINISH: string[] = ['测试类定义完成', '测试静态属性完成', '测试GetterSetter完成', '测试继承完成'];
const CLASSES_BODY: string[] = [
  'name: Alice\nage: 25\ngreet: Hello, I\'m Alice',
  'count: 1\ntotalInstances: ',
  'radius: 5',
  'name: Max\nbreed: Labrador\nspeak: Max barks'
];

const GENERICS_FINISH: string[] = ['测试泛型介绍完成', '测试泛型类完成', '测试泛型函数完成', '测试泛型约束完成'];
const GENERICS_BODY: string[] = [
  'identity<number>(42): 42\nidentity<string>(Hello): Hello\nidentity<boolean>(true): true',
  'Stack.pop(): 2\nContainer.getValue(): World',
  'wrap<number>(42)[0]: 42\nwrap<string>(Hello)[0]: Hello',
  'findById(1).name: Alice'
];

export const PAGE_BASICS: PageSpec = new PageSpec('pages/Basics', TAB_BASICS,
  ['测试变量声明', '测试类型标注', '测试BigInt', '测试空安全'], BASICS_FINISH, BASICS_BODY);
export const PAGE_FUNCTIONS: PageSpec = new PageSpec('pages/Functions', TAB_FUNCTIONS,
  ['测试函数声明', '测试可选参数', '测试默认参数', '测试闭包'], FUNCTIONS_FINISH, FUNCTIONS_BODY);
export const PAGE_CLASSES: PageSpec = new PageSpec('pages/Classes', TAB_CLASSES,
  ['测试类定义', '测试静态属性', '测试GetterSetter', '测试继承'], CLASSES_FINISH, CLASSES_BODY);
export const PAGE_GENERICS: PageSpec = new PageSpec('pages/Generics', TAB_GENERICS,
  ['测试泛型介绍', '测试泛型类', '测试泛型函数', '测试泛型约束'], GENERICS_FINISH, GENERICS_BODY);

export const ALL_PAGES: PageSpec[] = [PAGE_BASICS, PAGE_FUNCTIONS, PAGE_CLASSES, PAGE_GENERICS];

const LOG_BODY_PATTERN: RegExp = new RegExp('^\\[[^\\]]*\\]\\s+\\[(INFO|ERROR)\\]\\s+([\\s\\S]*)$');

let driverInstance: Driver | undefined = undefined;

export function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

export function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export function getDriver(): Driver {
  if (driverInstance === undefined) {
    driverInstance = Driver.create();
  }
  return driverInstance;
}

export function delegator(): abilityDelegatorRegistry.AbilityDelegator {
  return abilityDelegatorRegistry.getAbilityDelegator();
}

export function entryWant(): Want {
  const bundle: string | undefined = abilityDelegatorRegistry.getArguments().bundleName;
  return {
    bundleName: bundle === undefined || bundle.length === 0 ? BUNDLE : bundle,
    abilityName: 'EntryAbility'
  };
}

export async function delay(ms: number): Promise<void> {
  await getDriver().delayMs(ms);
}

export async function wakeScreen(): Promise<void> {
  try {
    await getDriver().triggerKey(KEYCODE_WAKEUP);
  } catch (err) {
    logInfo('wakeScreen failed: ' + JSON.stringify(err));
  }
  await delay(SETTLE_MS);
}

export async function launchEntry(): Promise<boolean> {
  try {
    await delegator().startAbility(entryWant());
    return true;
  } catch (err) {
    logInfo('startAbility failed: ' + JSON.stringify(err));
    return false;
  }
}

export async function isEntryForeground(): Promise<boolean> {
  const top: UIAbility | undefined = await delegator().getCurrentTopAbility();
  if (top === undefined) {
    return false;
  }
  return top.context.abilityInfo.name === 'EntryAbility';
}

export async function waitForText(text: string, timeoutMs: number): Promise<Component | null> {
  const driver: Driver = getDriver();
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    const component: Component | null = await driver.findComponent(ON.text(text));
    if (component !== null) {
      return component;
    }
    await delay(200);
  }
  return null;
}

export async function startApp(): Promise<boolean> {
  const driver: Driver = getDriver();
  for (let attempt = 0; attempt < LOCK_RETRY; attempt++) {
    await wakeScreen();
    if (!(await isEntryForeground())) {
      await launchEntry();
      await delay(SETTLE_MS);
    }
    if (await driver.waitForComponent(ON.text(INDEX_TITLE), QUERY_TIMEOUT_MS) !== null) {
      return true;
    }
    if (await isEntryForeground()) {
      for (let back = 0; back < LOCK_RETRY; back++) {
        await driver.pressBack();
        await delay(CLICK_SETTLE_MS);
        if (await driver.waitForComponent(ON.text(INDEX_TITLE), 1000) !== null) {
          return true;
        }
      }
    }
  }
  logInfo('startApp failed: Index not visible after ' + LOCK_RETRY + ' attempts');
  return false;
}

export async function backToIndex(): Promise<boolean> {
  const driver: Driver = getDriver();
  const top: UIAbility | undefined = await delegator().getCurrentTopAbility();
  if (top !== undefined && top.context.abilityInfo.name === 'EntryAbility') {
    if (await waitForText(INDEX_TITLE, 1000) !== null) {
      return true;
    }
  }
  await driver.pressBack();
  await delay(CLICK_SETTLE_MS);
  if (await waitForText(INDEX_TITLE, 2000) !== null) {
    return true;
  }
  return await startApp();
}

export async function lockRecovery(): Promise<void> {
  await wakeScreen();
  if (await waitForText(INDEX_TITLE, 1500) === null) {
    await startApp();
    await backToIndex();
  }
}

export async function clickLabel(label: string): Promise<boolean> {
  const driver: Driver = getDriver();
  const component: Component | null = await waitForText(label, QUERY_TIMEOUT_MS);
  if (component === null) {
    return false;
  }
  await component.click();
  await delay(CLICK_SETTLE_MS);
  return true;
}

export async function navigate(page: PageSpec): Promise<boolean> {
  if (!(await backToIndex())) {
    return false;
  }
  if (!(await clickLabel(page.tabLabel))) {
    return false;
  }
  return await waitForText(page.buttons[0], QUERY_TIMEOUT_MS) !== null;
}

export async function readStatus(): Promise<string> {
  const driver: Driver = getDriver();
  const uninitialized: Component | null = await driver.findComponent(ON.text(STATUS_UNINITIALIZED));
  if (uninitialized !== null) {
    return STATUS_UNINITIALIZED;
  }
  const finishes: string[] = BASICS_FINISH.concat(FUNCTIONS_FINISH).concat(CLASSES_FINISH).concat(GENERICS_FINISH);
  for (let i = 0; i < finishes.length; i++) {
    if (await driver.findComponent(ON.text(finishes[i])) !== null) {
      return finishes[i];
    }
  }
  return '';
}

export async function readLogRaw(): Promise<string> {
  const driver: Driver = getDriver();
  const empty: Component | null = await driver.findComponent(ON.text(LOG_EMPTY));
  if (empty !== null) {
    return LOG_EMPTY;
  }
  const bodies: string[] = BASICS_BODY.concat(FUNCTIONS_BODY).concat(CLASSES_BODY).concat(GENERICS_BODY);
  for (let i = 0; i < bodies.length; i++) {
    const found: Component | null = await driver.findComponent(ON.text(bodies[i], MatchPattern.CONTAINS));
    if (found !== null) {
      return readLogBody(await found.getText());
    }
  }
  return '';
}

export function readLogBody(raw: string): string {
  if (raw === LOG_EMPTY) {
    return LOG_EMPTY;
  }
  const matched: RegExpMatchArray | null = raw.match(LOG_BODY_PATTERN);
  if (matched === null) {
    return raw;
  }
  const groups: string[] = Array.from(matched);
  if (groups.length < 3) {
    return '';
  }
  return groups[2];
}

export function stripDynamicBody(body: string, prefix: string): string {
  if (body.startsWith(prefix)) {
    return body.substring(0, prefix.length);
  }
  return body;
}

export async function runButtonCase(page: PageSpec, index: number): Promise<void> {
  const navigated: boolean = await navigate(page);
  if (!navigated) {
    throw new Error('navigate failed: ' + page.route);
  }
  const clicked: boolean = await clickLabel(page.buttons[index]);
  if (!clicked) {
    throw new Error('click failed: ' + page.buttons[index]);
  }
  await delay(SETTLE_MS);
}

export async function pageButtonCount(page: PageSpec): Promise<number> {
  const driver: Driver = getDriver();
  let count: number = 0;
  for (let i = 0; i < page.buttons.length; i++) {
    if (await driver.findComponent(ON.text(page.buttons[i])) !== null) {
      count++;
    }
  }
  return count;
}
