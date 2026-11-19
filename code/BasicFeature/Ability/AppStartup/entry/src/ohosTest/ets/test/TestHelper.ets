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

import { application, bundleManager, common, StartupConfig, startupManager, UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { resourceManager } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo } from '@kit.CoreFileKit';
import { buffer } from '@kit.ArkTS';
import { distributedKVStore, relationalStore } from '@kit.ArkData';

export const BUNDLE_NAME: string = 'com.samples.appstartup';
export const ENTRY_ABILITY: string = 'EntryAbility';
export const TEST_ABILITY: string = 'TestAbility';
/** startup_config.json 里登记的六个启动任务，顺序与配置文件一致。 */
export const TASK_NAMES: string[] = ['ImageKnifeTask', 'ResourceManagerTask', 'FileTask', 'KVStoreTask',
  'RdbStoreTask', 'KvManagerUtilTask'];
/** 除 ImageKnifeTask（excludeFromAutoStart）外随应用启动自动执行的五个任务。 */
export const AUTO_TASK_NAMES: string[] = ['ResourceManagerTask', 'FileTask', 'KVStoreTask', 'RdbStoreTask',
  'KvManagerUtilTask'];
export const FILE_CONTENT: string = 'test StartupTask_003 file write data';
/** EntryAbility / AbilityStageContext 的 filesDir：FileTask 写文件、首页读文件都在这里。 */
export const ENTRY_FILES_DIR: string = '/data/storage/el2/base/haps/entry/files';
export const ENTRY_DATABASE_DIR: string = '/data/storage/el2/database/entry';
export const KV_KEY: string = 'key_test_string';
export const KV_VALUE: string = 'value_test_string';

export function getDelegator(): abilityDelegatorRegistry.AbilityDelegator {
  return abilityDelegatorRegistry.getAbilityDelegator();
}

/** 测试进程所在应用的 Context。 */
export function getAppContext(): common.Context {
  return getDelegator().getAppContext();
}

export function sleep(timeMs: number): Promise<void> {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, timeMs));
}

/** 把 (err, data) 形式的回调结果转给 Promise：err 为空或 code 为 0 视为成功。 */
export function settle<T>(resolve: (value: T) => void, reject: (reason: BusinessError) => void,
  err: BusinessError | undefined | null, data: T): void {
  if (err !== undefined && err !== null && err.code !== 0) {
    reject(err);
  } else {
    resolve(data);
  }
}

export async function getTopAbility(): Promise<UIAbility | undefined> {
  try {
    return await getDelegator().getCurrentTopAbility();
  } catch (error) {
    return undefined;
  }
}

export function getAbilityName(ability: UIAbility | undefined): string {
  if (ability === undefined) {
    return '';
  }
  return ability.context.abilityInfo.name;
}

/** 轮询等待某个 Ability 成为栈顶；超时后返回最后一次取到的栈顶。 */
export async function waitForTopAbility(name: string, timeoutMs: number = 6000): Promise<UIAbility | undefined> {
  const deadline: number = Date.now() + timeoutMs;
  let top: UIAbility | undefined = await getTopAbility();
  while (getAbilityName(top) !== name && Date.now() < deadline) {
    await sleep(200);
    top = await getTopAbility();
  }
  return top;
}

export interface StartResult {
  code: number;
  message: string;
}

/** 执行一次 startAbility 并捕获错误码；成功时 code 为 0。 */
export async function startAndCapture(want: Want): Promise<StartResult> {
  try {
    await getDelegator().startAbility(want);
    return { code: 0, message: '' };
  } catch (error) {
    const failure: BusinessError = error as BusinessError;
    return { code: failure.code, message: failure.message };
  }
}

/**
 * 显式拉起本应用的某个 Ability，并等它成为栈顶。
 * 连续 startAbility 时真机会报 16000017，所以先等当前栈顶稳定再发起。
 */
export async function launchAbility(name: string): Promise<UIAbility | undefined> {
  await sleep(800);
  await startAndCapture({ bundleName: BUNDLE_NAME, abilityName: name });
  return await waitForTopAbility(name, 8000);
}

/** 执行一次同步调用：成功时返回 'ok'，抛错时返回错误码字符串，便于直接断言。 */
export function errorOf(call: () => void): string {
  try {
    call();
    return 'ok';
  } catch (error) {
    return String((error as BusinessError).code);
  }
}

/** 执行一次 startupManager.run：成功返回 'ok'，失败返回“错误码:错误信息”。 */
export async function runResult(tasks: string[], config?: StartupConfig): Promise<string> {
  try {
    if (config === undefined) {
      await startupManager.run(tasks);
    } else {
      await startupManager.run(tasks, config);
    }
    return 'ok';
  } catch (error) {
    return `${(error as BusinessError).code}:${(error as BusinessError).message}`;
  }
}

/** 记录 startupListener.onCompleted 是否被回调以及回调结果：'none' 表示没回调。 */
export class ListenerProbe {
  state: string = 'none';
  calls: number = 0;
}

/** 带监听的 StartupConfig：成功时写 'ok'，失败时写 'error:错误码'。 */
export function listenerConfig(probe: ListenerProbe, timeoutMs: number): StartupConfig {
  return {
    timeoutMs: timeoutMs,
    startupListener: {
      onCompleted: (error: BusinessError<void>) => {
        probe.calls++;
        probe.state = error ? `error:${error.code}` : 'ok';
      }
    }
  };
}

/** 六个启动任务当前的初始化状态，形如 'true,true,...'；接口抛错的位置写错误码。 */
export function taskStates(): string {
  return TASK_NAMES.map((task: string) => {
    try {
      return String(startupManager.isStartupTaskInitialized(task));
    } catch (error) {
      return String((error as BusinessError).code);
    }
  }).join(',');
}

/** 某个任务 getStartupTaskResult 的形态：'undefined'、'object' 等 typeof 结果，抛错时为错误码。 */
export function resultKind(task: string): string {
  try {
    const result: Object = startupManager.getStartupTaskResult(task);
    return result === undefined ? 'undefined' : typeof result;
  } catch (error) {
    return String((error as BusinessError).code);
  }
}

/** 初始化结果对象的构造器名，用来确认拿到的是业务返回的那个类型。 */
export function resultClass(task: string): string {
  const result: Object = startupManager.getStartupTaskResult(task);
  return result.constructor.name;
}

/** 冷启动后的基线状态（TASK_NAMES 顺序）：只有 excludeFromAutoStart 的 ImageKnifeTask 未初始化。 */
export const BASELINE_STATES: string = 'false,true,true,true,true,true';

/**
 * 把启动任务恢复到冷启动后的基线：五个自动任务一起跑一遍（FileTask 在 taskPool 里执行，run 返回后才登记，
 * 所以末尾等它登记），再移除 ImageKnifeTask 的结果，让首页按钮重新走 run + 跳转分支。
 */
export async function resetBaseline(): Promise<string> {
  const result: string = await runResult(AUTO_TASK_NAMES);
  errorOf(() => startupManager.removeStartupTaskResult('ImageKnifeTask'));
  await waitForTask('FileTask', 3000);
  await sleep(300);
  return result;
}

/** 把六个任务都重新跑一遍，用例移除过结果后用它还原。 */
export async function restoreAllTasks(): Promise<string> {
  const result: string = await runResult(TASK_NAMES);
  await sleep(300);
  return result;
}

/** 安全地查询启动任务是否已初始化；接口抛错时返回 false。 */
export function isInitialized(task: string): boolean {
  try {
    return startupManager.isStartupTaskInitialized(task);
  } catch (error) {
    return false;
  }
}

/** 轮询等待某个启动任务完成初始化。 */
export async function waitForTask(task: string, timeoutMs: number = 5000): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (!isInitialized(task) && Date.now() < deadline) {
    await sleep(100);
  }
  return isInitialized(task);
}

let entryModuleContext: common.Context | undefined = undefined;

/**
 * 用 createModuleContext 拿到的 entry 模块 Context，只用来取 entry 的资源管理器，不需要拉起页面。
 * 它的 filesDir/databaseDir 是应用级目录，与 FileTask、RdbStoreTask 拿到的 AbilityStageContext 不同。
 */
export async function loadEntryModuleContext(): Promise<common.Context> {
  if (entryModuleContext === undefined) {
    // delegator 返回的 Context 不能直接传给 createModuleContext（报 must be a context of stageMode），先转成 ApplicationContext。
    entryModuleContext = await application.createModuleContext(getAppContext().getApplicationContext(), 'entry');
  }
  return entryModuleContext;
}

/** 读取 EntryAbility filesDir 下的文本文件；文件不存在时返回 'none'。 */
export function readEntryFile(name: string): string {
  const path: string = ENTRY_FILES_DIR + '/' + name;
  if (!fileIo.accessSync(path)) {
    return 'none';
  }
  return fileIo.readTextSync(path);
}

/** EntryAbility filesDir 下文件的字节数；不存在时返回 -1。 */
export function entryFileSize(name: string): number {
  const path: string = ENTRY_FILES_DIR + '/' + name;
  if (!fileIo.accessSync(path)) {
    return -1;
  }
  return fileIo.statSync(path).size;
}

/** 用只读方式打开文件，从 offset 处读 length 个字节并按 UTF-8 解码。 */
export function readEntryRange(name: string, offset: number, length: number): string {
  const file: fileIo.File = fileIo.openSync(ENTRY_FILES_DIR + '/' + name, fileIo.OpenMode.READ_ONLY);
  const buf: ArrayBuffer = new ArrayBuffer(length);
  const read: number = fileIo.readSync(file.fd, buf, { offset: offset, length: length });
  fileIo.closeSync(file);
  return buffer.from(buf, 0, read).toString();
}

/** 按 UTF-8 编码后的字节数。 */
export function utf8Length(text: string): number {
  return buffer.byteLength(text, 'utf-8');
}

let entryAbilityContext: common.UIAbilityContext | undefined = undefined;

/** 记住最近一次拿到的 EntryAbility 实例的 Context，重新拉起后由调用方刷新。 */
export function rememberEntry(ability: UIAbility | undefined): void {
  if (ability !== undefined && getAbilityName(ability) === ENTRY_ABILITY) {
    entryAbilityContext = ability.context;
  }
}

/**
 * 首次需要业务数据的用例先把 EntryAbility 拉起来：测试进程由 entry_test 模块启动，
 * entry 的启动配置要等 entry 模块加载后才生效。等到自动任务都完成、文件已写出再返回。
 */
export async function ensureEntryStarted(): Promise<common.UIAbilityContext> {
  if (entryAbilityContext === undefined || !isInitialized('KvManagerUtilTask')) {
    rememberEntry(await launchAbility(ENTRY_ABILITY));
  }
  for (let i = 0; i < AUTO_TASK_NAMES.length; i++) {
    await waitForTask(AUTO_TASK_NAMES[i], 5000);
  }
  // KVStoreTask、RdbStoreTask 的 init 不等写库回调就返回，再给异步写入留一点时间。
  await sleep(500);
  if (entryAbilityContext === undefined) {
    throw new Error('EntryAbility not started');
  }
  return entryAbilityContext;
}

const KV_OPTIONS: distributedKVStore.Options = {
  createIfMissing: true,
  encrypt: false,
  backup: false,
  autoSync: false,
  kvStoreType: distributedKVStore.KVStoreType.SINGLE_VERSION,
  securityLevel: distributedKVStore.SecurityLevel.S1
};

/** 以业务相同的参数打开 storeId 键值库：KVManager 取 KvManagerUtilTask 的初始化结果。 */
export function openBusinessKvStore(): Promise<distributedKVStore.SingleKVStore> {
  const manager: distributedKVStore.KVManager =
    startupManager.getStartupTaskResult('KvManagerUtilTask') as distributedKVStore.KVManager;
  return manager.getKVStore<distributedKVStore.SingleKVStore>('storeId', KV_OPTIONS);
}

/** 读取键值库里的值并转成字符串；键不存在时返回错误码字符串，便于直接断言。 */
export async function getKvString(key: string): Promise<string> {
  const store: distributedKVStore.SingleKVStore = await openBusinessKvStore();
  try {
    const value: Uint8Array | string | number | boolean = await store.get(key);
    if (value instanceof Uint8Array) {
      return 'bytes:' + Array.from(value).join(',');
    }
    return typeof value + ':' + String(value);
  } catch (error) {
    return 'code:' + (error as BusinessError).code;
  }
}

/** 在业务键值库里写入测试自己的键；不碰业务的 key_test_string。 */
export async function putKv(key: string, value: Uint8Array | string | number | boolean): Promise<string> {
  const store: distributedKVStore.SingleKVStore = await openBusinessKvStore();
  try {
    await store.put(key, value);
    return 'ok';
  } catch (error) {
    return 'code:' + (error as BusinessError).code;
  }
}

export async function deleteKv(key: string): Promise<string> {
  const store: distributedKVStore.SingleKVStore = await openBusinessKvStore();
  try {
    await store.delete(key);
    return 'ok';
  } catch (error) {
    return 'code:' + (error as BusinessError).code;
  }
}

/** 以业务相同的配置打开 RdbTest.db；必须用 EntryAbility 的 Context，库文件在 database/entry 下。 */
export async function openBusinessRdbStore(): Promise<relationalStore.RdbStore> {
  const config: relationalStore.StoreConfig = {
    name: 'RdbTest.db',
    securityLevel: relationalStore.SecurityLevel.S1
  };
  return await relationalStore.getRdbStore(await ensureEntryStarted(), config);
}

/** EMPLOYEE 表里一行数据，按业务插入的四个标量列读取。 */
export interface EmployeeRow {
  id: number;
  name: string;
  age: number;
  salary: number;
  codes: string;
}

/** 按 ID 升序读出 EMPLOYEE 表里 NAME 为指定值的全部行；name 为 undefined 时读全表。 */
export async function queryEmployees(name?: string): Promise<EmployeeRow[]> {
  const store: relationalStore.RdbStore = await openBusinessRdbStore();
  const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
  if (name !== undefined) {
    predicates.equalTo('NAME', name);
  }
  predicates.orderByAsc('ID');
  const resultSet: relationalStore.ResultSet = await store.query(predicates, ['ID', 'NAME', 'AGE', 'SALARY', 'CODES']);
  const rows: EmployeeRow[] = [];
  while (resultSet.goToNextRow()) {
    rows.push({
      id: resultSet.getLong(resultSet.getColumnIndex('ID')),
      name: resultSet.getString(resultSet.getColumnIndex('NAME')),
      age: resultSet.getLong(resultSet.getColumnIndex('AGE')),
      salary: resultSet.getDouble(resultSet.getColumnIndex('SALARY')),
      codes: Array.from(resultSet.getBlob(resultSet.getColumnIndex('CODES'))).join(',')
    });
  }
  resultSet.close();
  return rows;
}

const overrideManagers: Map<string, resourceManager.ResourceManager> = new Map();

/**
 * 按指定语言与深浅色取 entry 模块的资源管理器。
 * 走 getOverrideResourceManager，不改应用全局配置，用例之间互不影响。
 */
export async function loadOverrideResourceManager(locale: string,
  colorMode: resourceManager.ColorMode): Promise<resourceManager.ResourceManager> {
  const key: string = `${locale}|${colorMode}`;
  const cached: resourceManager.ResourceManager | undefined = overrideManagers.get(key);
  if (cached !== undefined) {
    return cached;
  }
  const base: resourceManager.ResourceManager = (await loadEntryModuleContext()).resourceManager;
  const configuration: resourceManager.Configuration = base.getOverrideConfiguration();
  configuration.locale = locale;
  configuration.colorMode = colorMode;
  const manager: resourceManager.ResourceManager = base.getOverrideResourceManager(configuration);
  overrideManagers.set(key, manager);
  return manager;
}

let selfBundleInfo: bundleManager.BundleInfo | undefined = undefined;

/** 本应用的 BundleInfo，带 HAP、Ability、扩展与 skills 信息；结果只取一次。 */
export function getSelfBundleInfo(): bundleManager.BundleInfo {
  if (selfBundleInfo === undefined) {
    const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
    selfBundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
  }
  return selfBundleInfo;
}

export function findHapModule(moduleName: string): bundleManager.HapModuleInfo | undefined {
  return getSelfBundleInfo().hapModulesInfo.find((m: bundleManager.HapModuleInfo) => m.name === moduleName);
}

export function findAbility(moduleName: string, abilityName: string): bundleManager.AbilityInfo | undefined {
  const hap: bundleManager.HapModuleInfo | undefined = findHapModule(moduleName);
  if (hap === undefined) {
    return undefined;
  }
  return hap.abilitiesInfo.find((a: bundleManager.AbilityInfo) => a.name === abilityName);
}

export function findExtension(name: string): bundleManager.ExtensionAbilityInfo | undefined {
  const hap: bundleManager.HapModuleInfo | undefined = findHapModule('entry');
  if (hap === undefined) {
    return undefined;
  }
  return hap.extensionAbilitiesInfo.find((e: bundleManager.ExtensionAbilityInfo) => e.name === name);
}
