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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager, common, contextConstant } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import { resourceManager } from '@kit.LocalizationKit';
import { process } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import {
  BUNDLE_NAME,
  ENTRY_MODULE,
  entryContext,
  ERR_RES_NAME_INVALID,
  findModule,
  selfBundle,
  TEST_MODULE
} from './shared/AppProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

// Values read from AppScope/app.json5, entry/src/main/module.json5 and the base element string.json files.
const APP_NAME_TEXT: string = 'ArkTSGC';
const MODULE_DESC_TEXT: string = 'module description';
const ABILITY_DESC_TEXT: string = 'description';
const APP_LABEL_RES: string = '$string:app_name';
const APP_ICON_RES: string = '$media:layered_image';
const BUNDLE_HEAD: string = 'com';
const BUNDLE_MIDDLE: string = 'sample';
const APP_NAME_UNITS: number = 7;
const MODULE_DESC_UNITS: number = 18;
const ABILITY_DESC_UNITS: number = 11;
const BUNDLE_SEGMENTS_TOTAL: number = 3;
const DIR_TOTAL: number = 5;
const MODULE_TOTAL: number = 2;
const PRIMARY_APP_INDEX: number = 0;

// The five module scoped storage directories plus the code directory every case walks over.
const FILES_SUFFIX: string = '/files';
const CACHE_SUFFIX: string = '/cache';
const TEMP_SUFFIX: string = '/temp';
const PREFERENCES_SUFFIX: string = '/preferences';
const DATABASE_SUFFIX: string = '/database';
const BUNDLE_CODE_SUFFIX: string = '/bundle';
const FILES_TAIL: string = 'files';
const CACHE_TAIL: string = 'cache';
const TEMP_TAIL: string = 'temp';
const PREFERENCES_TAIL: string = 'preferences';
const DATABASE_TAIL: string = 'database';
const BUNDLE_CODE_TAIL: string = 'bundle';

const EMPTY_LENGTH: number = 0;
const ZERO: number = 0;
const ONE: number = 1;
const TWO: number = 2;
const THREE: number = 3;
const FOUR: number = 4;
const FIVE: number = 5;
const ROUND_TOTAL: number = 5;
const NEGATIVE_CODE: number = -1;

const SLASH: string = '/';
const DOUBLE_SLASH: string = '//';
const SPACE: string = ' ';
const DOT: string = '.';
const PIPE: string = '|';
const SLASH_CODE: number = 0x2f;
const ASCII_LIMIT: number = 127;

// Names handed to createModuleContext that no installed HAP answers to.
const UNKNOWN_MODULE: string = 'entry_missing';
const UNKNOWN_CASED: string = 'Entry';
const UNKNOWN_SPACED: string = 'entry ';
const MISSING_RESOURCE: string = 'appctx_missing_entry';
const INVALID_AREA: number = 7;

const PROBE_ROOT: string = 'appctx_matrix';
const PAYLOAD_ALPHA: string = 'alpha-probe-0001';
const PAYLOAD_BETA: string = 'beta probe 0002 with blanks';
const PAYLOAD_GAMMA: string = 'gamma:003/004,005;006';
const PAYLOAD_DELTA: string = '0123456789';
const PAYLOAD_EPSILON: string = 'cache dir payload epsilon';
const PAYLOAD_ZETA: string = 'temp dir payload zeta!';
const PAYLOAD_ETA: string = 'preferences payload eta?';
const PAYLOAD_THETA: string = 'database payload theta#';
const PAYLOAD_IOTA: string = 'x'.repeat(384);

function appContext(): common.Context {
  return abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
}

function moduleContext(name: string): common.Context {
  return appContext().createModuleContext(name);
}

function textOrEmpty(value: string | undefined): string {
  return value === undefined ? '' : value;
}

function joinPath(base: string, child: string): string {
  return base.endsWith(SLASH) ? base + child : base + SLASH + child;
}

function isAbsolutePath(path: string): boolean {
  return path.length > EMPTY_LENGTH && path.startsWith(SLASH);
}

function hasTrailingSlash(path: string): boolean {
  return path.length > ONE && path.endsWith(SLASH);
}

function hasDoubleSlash(path: string): boolean {
  return path.indexOf(DOUBLE_SLASH) >= ZERO;
}

function hasBlank(path: string): boolean {
  return path.indexOf(SPACE) >= ZERO;
}

function tailSegment(path: string): string {
  const index: number = path.lastIndexOf(SLASH);
  return index >= ZERO ? path.substring(index + ONE) : path;
}

function parentOf(path: string): string {
  const index: number = path.lastIndexOf(SLASH);
  return index > ZERO ? path.substring(ZERO, index) : path;
}

function depthOf(path: string): number {
  let total: number = ZERO;
  for (let index: number = ZERO; index < path.length; index += ONE) {
    if (path.charCodeAt(index) === SLASH_CODE) {
      total += ONE;
    }
  }
  return total;
}

function asciiOnly(text: string): boolean {
  if (text.length === EMPTY_LENGTH) {
    return false;
  }
  for (let index: number = ZERO; index < text.length; index += ONE) {
    if (text.charCodeAt(index) > ASCII_LIMIT) {
      return false;
    }
  }
  return true;
}

function commonPrefix(paths: string[]): string {
  if (paths.length === EMPTY_LENGTH) {
    return '';
  }
  let prefix: string = paths[EMPTY_LENGTH];
  for (let index: number = ONE; index < paths.length; index += ONE) {
    const candidate: string = paths[index];
    let shared: number = ZERO;
    while (shared < prefix.length && shared < candidate.length &&
      prefix.charCodeAt(shared) === candidate.charCodeAt(shared)) {
      shared += ONE;
    }
    prefix = prefix.substring(ZERO, shared);
    if (prefix.length === EMPTY_LENGTH) {
      return '';
    }
  }
  return prefix;
}

function dirsOf(context: common.Context): string[] {
  return [context.filesDir, context.cacheDir, context.tempDir, context.preferencesDir, context.databaseDir];
}

function nonEmptyCount(values: string[]): number {
  let total: number = ZERO;
  for (let index: number = ZERO; index < values.length; index += ONE) {
    if (values[index].length > EMPTY_LENGTH) {
      total += ONE;
    }
  }
  return total;
}

function distinctCount(values: string[]): number {
  const seen: Set<string> = new Set<string>();
  for (let index: number = ZERO; index < values.length; index += ONE) {
    seen.add(values[index]);
  }
  return seen.size;
}

function absoluteCount(values: string[]): number {
  let total: number = ZERO;
  for (let index: number = ZERO; index < values.length; index += ONE) {
    if (isAbsolutePath(values[index])) {
      total += ONE;
    }
  }
  return total;
}

function dirKey(context: common.Context): string {
  return context.filesDir + PIPE + context.cacheDir + PIPE + context.tempDir + PIPE + context.preferencesDir +
    PIPE + context.databaseDir;
}

function identityKey(context: common.Context): string {
  return context.applicationInfo.name + PIPE + context.applicationInfo.uid + PIPE + context.processName +
    PIPE + Number(context.area);
}

function prefixFree(left: string, right: string): boolean {
  return left !== right && left.indexOf(right) < ZERO && right.indexOf(left) < ZERO;
}

function probeExists(path: string): boolean {
  try {
    return fileIo.accessSync(path);
  } catch (error) {
    return false;
  }
}

function probeSize(path: string): number {
  try {
    return fileIo.statSync(path).size;
  } catch (error) {
    return NEGATIVE_CODE;
  }
}

function probeIsDir(path: string): boolean {
  try {
    return fileIo.statSync(path).isDirectory();
  } catch (error) {
    return false;
  }
}

function entriesOf(path: string): string[] {
  try {
    return fileIo.listFileSync(path);
  } catch (error) {
    return [];
  }
}

function ensureDir(path: string): boolean {
  try {
    if (!fileIo.accessSync(path)) {
      fileIo.mkdirSync(path, true);
    }
    return fileIo.statSync(path).isDirectory();
  } catch (error) {
    return false;
  }
}

function prepareProbe(base: string, tag: string): string {
  const root: string = joinPath(base, PROBE_ROOT);
  if (!probeExists(root)) {
    fileIo.mkdirSync(root, true);
  }
  const path: string = joinPath(root, tag);
  if (!probeExists(path)) {
    fileIo.mkdirSync(path);
  }
  return path;
}

function dropFile(path: string): boolean {
  try {
    if (fileIo.accessSync(path)) {
      fileIo.unlinkSync(path);
    }
    return !fileIo.accessSync(path);
  } catch (error) {
    return false;
  }
}

function dropDir(path: string): boolean {
  try {
    if (!fileIo.accessSync(path)) {
      return true;
    }
    const entries: string[] = fileIo.listFileSync(path);
    for (let index: number = ZERO; index < entries.length; index += ONE) {
      const child: string = joinPath(path, entries[index]);
      if (fileIo.statSync(child).isDirectory()) {
        dropDir(child);
      } else {
        fileIo.unlinkSync(child);
      }
    }
    fileIo.rmdirSync(path);
    return !fileIo.accessSync(path);
  } catch (error) {
    return false;
  }
}

function cleanProbe(base: string, tag: string): boolean {
  return dropDir(joinPath(joinPath(base, PROBE_ROOT), tag));
}

function writeTextFile(path: string, text: string): number {
  const file: fileIo.File = fileIo.openSync(path,
    fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
  try {
    return fileIo.writeSync(file.fd, text);
  } finally {
    fileIo.closeSync(file);
  }
}

function appendTextFile(path: string, text: string): number {
  const file: fileIo.File = fileIo.openSync(path,
    fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.APPEND);
  try {
    return fileIo.writeSync(file.fd, text);
  } finally {
    fileIo.closeSync(file);
  }
}

function readFileBytes(path: string): Uint8Array {
  const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
  try {
    const size: number = fileIo.statSync(path).size;
    const buffer: ArrayBuffer = new ArrayBuffer(size);
    const read: number = fileIo.readSync(file.fd, buffer);
    const view: Uint8Array = new Uint8Array(buffer);
    const bytes: Uint8Array = new Uint8Array(read);
    for (let index: number = ZERO; index < read; index += ONE) {
      bytes[index] = view[index];
    }
    return bytes;
  } finally {
    fileIo.closeSync(file);
  }
}

function readTextFile(path: string): string {
  return bytesToText(readFileBytes(path));
}

function asciiBytes(text: string): Uint8Array {
  const bytes: Uint8Array = new Uint8Array(text.length);
  for (let index: number = ZERO; index < text.length; index += ONE) {
    bytes[index] = text.charCodeAt(index);
  }
  return bytes;
}

function bytesToText(bytes: Uint8Array): string {
  let text: string = '';
  for (let index: number = ZERO; index < bytes.length; index += ONE) {
    text += String.fromCharCode(bytes[index]);
  }
  return text;
}

function bytesEqual(left: Uint8Array, right: Uint8Array): boolean {
  if (left.length !== right.length) {
    return false;
  }
  for (let index: number = ZERO; index < left.length; index += ONE) {
    if (left[index] !== right[index]) {
      return false;
    }
  }
  return true;
}

function byteSum(bytes: Uint8Array): number {
  let total: number = ZERO;
  for (let index: number = ZERO; index < bytes.length; index += ONE) {
    total += bytes[index];
  }
  return total;
}

function stringByName(manager: resourceManager.ResourceManager, name: string): string {
  try {
    return manager.getStringByNameSync(name);
  } catch (error) {
    return '';
  }
}

function stringById(manager: resourceManager.ResourceManager, id: number): string {
  try {
    return manager.getStringSync(id);
  } catch (error) {
    return '';
  }
}

function resourceError(manager: resourceManager.ResourceManager, name: string): number {
  try {
    manager.getStringByNameSync(name);
    return ZERO;
  } catch (error) {
    return Number((error as BusinessError).code);
  }
}

// Result of a context factory call that may be refused by the runtime, so a case can assert on the
// refusal code instead of dying on an exception.
class GuardedContext {
  threw: boolean = false;
  code: number = ZERO;
  context: common.Context | undefined = undefined;
  appName: string = '';
  filesDir: string = '';
  cacheDir: string = '';
  bundleCodeDir: string = '';
  processName: string = '';
  area: number = ZERO;
  uid: number = NEGATIVE_CODE;
}

function capture(build: () => common.Context): GuardedContext {
  const outcome: GuardedContext = new GuardedContext();
  try {
    const context: common.Context = build();
    outcome.context = context;
    outcome.appName = textOrEmpty(context.applicationInfo.name);
    outcome.filesDir = textOrEmpty(context.filesDir);
    outcome.cacheDir = textOrEmpty(context.cacheDir);
    outcome.bundleCodeDir = textOrEmpty(context.bundleCodeDir);
    outcome.processName = textOrEmpty(context.processName);
    outcome.area = Number(context.area);
    outcome.uid = context.applicationInfo.uid;
  } catch (error) {
    const failure: BusinessError = error as BusinessError;
    outcome.threw = true;
    outcome.code = Number(failure.code);
  }
  return outcome;
}

function captureModule(name: string): GuardedContext {
  return capture(() => moduleContext(name));
}

function captureBundle(name: string): GuardedContext {
  return capture((): common.Context => entryContext().createModuleContext(name));
}

function captureArea(mode: contextConstant.AreaMode): GuardedContext {
  return capture(() => entryContext().createAreaModeContext(mode));
}

function areaKnown(context: common.Context): boolean {
  return context.area === contextConstant.AreaMode.EL1 || context.area === contextConstant.AreaMode.EL2;
}

export default function appContextMatrixTest() {
  describe('AppContextMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_0100
     * @tc.name      testAppCtxBundleIdentity0001
     * @tc.desc      Check the bundle name carried by the entry module context equals the installed bundle name and is
     *               a plain ASCII identifier
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxBundleIdentity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const context: common.Context = entryContext();
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = context.applicationInfo.name;
      logCase('testAppCtxBundleIdentity0001', `contextName=${name} bundleInfoName=${info.name} ` +
        `length=${name.length}`);
      expect(name).assertEqual(BUNDLE_NAME);
      expect(name).assertEqual(info.name);
      expect(name.length > EMPTY_LENGTH).assertTrue();
      expect(asciiOnly(name)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_0200
     * @tc.name      testAppCtxBundleIdentity0002
     * @tc.desc      Check the application context and the entry module context report the same bundle name and that
     *               the name holds the three declared segments
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxBundleIdentity0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const moduleName: string = entryContext().applicationInfo.name;
      const applicationName: string = appContext().applicationInfo.name;
      const segments: string[] = applicationName.split(DOT);
      logCase('testAppCtxBundleIdentity0002', `module=${moduleName} application=${applicationName} ` +
        `segments=${segments.length}`);
      expect(applicationName).assertEqual(moduleName);
      expect(applicationName).assertEqual(BUNDLE_NAME);
      expect(segments.length).assertEqual(BUNDLE_SEGMENTS_TOTAL);
      expect(applicationName === applicationName.trim()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_0300
     * @tc.name      testAppCtxBundleIdentity0003
     * @tc.desc      Check the bundle name splits and rebuilds without loss, ends on the application label text and
     *               never starts or ends with a separator dot
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxBundleIdentity0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const name: string = entryContext().applicationInfo.name;
      const segments: string[] = name.split(DOT);
      const rebuilt: string = segments.join(DOT);
      const last: string = segments[segments.length - ONE];
      logCase('testAppCtxBundleIdentity0003', `name=${name} last=${last} rebuilt=${rebuilt}`);
      expect(rebuilt).assertEqual(name);
      expect(last).assertEqual(APP_NAME_TEXT);
      expect(name.startsWith(DOT) || name.endsWith(DOT)).assertFalse();
      expect(segments.length).assertEqual(BUNDLE_SEGMENTS_TOTAL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_0400
     * @tc.name      testAppCtxBundleIdentity0004
     * @tc.desc      Check a context created for an unknown module still reports the real bundle name and is answered
     *               without an exception
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxBundleIdentity0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const guarded: GuardedContext = captureModule(UNKNOWN_MODULE);
      logCase('testAppCtxBundleIdentity0004', `threw=${guarded.threw} code=${guarded.code} ` +
        `appName=${guarded.appName}`);
      expect(guarded.threw).assertFalse();
      expect(guarded.code).assertEqual(ZERO);
      expect(guarded.appName).assertEqual(BUNDLE_NAME);
      expect(guarded.appName === UNKNOWN_MODULE).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_0500
     * @tc.name      testAppCtxBundleIdentity0005
     * @tc.desc      Check the module context built from the own bundle name exposes the same bundle identity and an
     *               absolute files directory
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxBundleIdentity0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const guarded: GuardedContext = captureBundle(BUNDLE_NAME);
      logCase('testAppCtxBundleIdentity0005', `threw=${guarded.threw} code=${guarded.code} ` +
        `appName=${guarded.appName} filesDir=${guarded.filesDir}`);
      expect(guarded.threw).assertFalse();
      expect(guarded.appName).assertEqual(BUNDLE_NAME);
      expect(guarded.filesDir.length > EMPTY_LENGTH).assertTrue();
      expect(isAbsolutePath(guarded.filesDir)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_0600
     * @tc.name      testAppCtxBundleIdentity0006
     * @tc.desc      Check two independently created entry module contexts agree on the bundle name and on the
     *               application uid
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxBundleIdentity0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const first: common.Context = entryContext();
      const second: common.Context = entryContext();
      const sameName: boolean = first.applicationInfo.name === second.applicationInfo.name;
      const sameUid: boolean = first.applicationInfo.uid === second.applicationInfo.uid;
      logCase('testAppCtxBundleIdentity0006', `sameName=${sameName} sameUid=${sameUid} uid=${first.applicationInfo.uid}`);
      expect(sameName).assertTrue();
      expect(sameUid).assertTrue();
      expect(first.applicationInfo.uid).assertEqual(process.uid);
      expect(first.applicationInfo.name).assertEqual(second.applicationInfo.name);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_0700
     * @tc.name      testAppCtxBundleIdentity0007
     * @tc.desc      Check the bundle name read from the module context, from the application context and from the
     *               bundle manager collapse into a single distinct value
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxBundleIdentity0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sources: string[] = [
        entryContext().applicationInfo.name,
        appContext().applicationInfo.name,
        (await selfBundle()).appInfo.name
      ];
      const distinct: number = distinctCount(sources);
      logCase('testAppCtxBundleIdentity0007', `sources=${sources.join(PIPE)} distinct=${distinct}`);
      expect(sources.length).assertEqual(THREE);
      expect(distinct).assertEqual(ONE);
      expect(sources[EMPTY_LENGTH]).assertEqual(BUNDLE_NAME);
      expect(nonEmptyCount(sources)).assertEqual(THREE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_0800
     * @tc.name      testAppCtxBundleIdentity0008
     * @tc.desc      Check the first two bundle name segments are the lower case vendor segments and the last segment
     *               is the application label text
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxBundleIdentity0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const segments: string[] = entryContext().applicationInfo.name.split(DOT);
      const head: string = segments[EMPTY_LENGTH];
      const middle: string = segments[ONE];
      const lowerCase: boolean = head === head.toLowerCase() && middle === middle.toLowerCase();
      logCase('testAppCtxBundleIdentity0008', `head=${head} middle=${middle} lowerCase=${lowerCase} ` +
        `last=${segments[TWO]}`);
      expect(head).assertEqual(BUNDLE_HEAD);
      expect(middle).assertEqual(BUNDLE_MIDDLE);
      expect(lowerCase).assertTrue();
      expect(segments[TWO]).assertEqual(APP_NAME_TEXT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_0900
     * @tc.name      testAppCtxBundleIdentity0009
     * @tc.desc      Check the bundle name length is the sum of its segment lengths plus one dot between each pair of
     *               neighbours
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxBundleIdentity0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const name: string = entryContext().applicationInfo.name;
      const segments: string[] = name.split(DOT);
      let units: number = ZERO;
      for (let index: number = ZERO; index < segments.length; index += ONE) {
        units += segments[index].length;
      }
      const dots: number = segments.length - ONE;
      logCase('testAppCtxBundleIdentity0009', `units=${units} dots=${dots} nameLength=${name.length}`);
      expect(units + dots).assertEqual(name.length);
      expect(dots).assertEqual(TWO);
      expect(name.indexOf(DOUBLE_SLASH) < ZERO).assertTrue();
      expect(units > EMPTY_LENGTH).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_1000
     * @tc.name      testAppCtxModuleSurface0001
     * @tc.desc      Check the module context is a distinct object from the application context and both expose a non
     *               empty files directory
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxModuleSurface0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const module: common.Context = moduleContext(ENTRY_MODULE);
      const application: common.Context = appContext();
      logCase('testAppCtxModuleSurface0001', `sameObject=${module === application} ` +
        `moduleFiles=${module.filesDir} appFiles=${application.filesDir}`);
      expect(module === application).assertFalse();
      expect(module.filesDir.length > EMPTY_LENGTH).assertTrue();
      expect(application.filesDir.length > EMPTY_LENGTH).assertTrue();
      expect(module.filesDir === application.filesDir).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_1100
     * @tc.name      testAppCtxModuleSurface0002
     * @tc.desc      Check all five storage directories of the module context are populated and absolute
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxModuleSurface0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const dirs: string[] = dirsOf(entryContext());
      logCase('testAppCtxModuleSurface0002', `dirs=${dirs.join(PIPE)} nonEmpty=${nonEmptyCount(dirs)} ` +
        `absolute=${absoluteCount(dirs)}`);
      expect(dirs.length).assertEqual(DIR_TOTAL);
      expect(nonEmptyCount(dirs)).assertEqual(DIR_TOTAL);
      expect(absoluteCount(dirs)).assertEqual(DIR_TOTAL);
      expect(distinctCount(dirs)).assertEqual(DIR_TOTAL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_1200
     * @tc.name      testAppCtxModuleSurface0003
     * @tc.desc      Check the module context also carries the code directory, a known area mode, a process name and a
     *               resource manager
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxModuleSurface0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const context: common.Context = entryContext();
      logCase('testAppCtxModuleSurface0003', `bundleCodeDir=${context.bundleCodeDir} area=${context.area} ` +
        `processName=${context.processName}`);
      expect(context.bundleCodeDir.length > EMPTY_LENGTH).assertTrue();
      expect(areaKnown(context)).assertTrue();
      expect(context.processName.length > EMPTY_LENGTH).assertTrue();
      expect(context.resourceManager !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_1300
     * @tc.name      testAppCtxModuleSurface0004
     * @tc.desc      Check the event hub handed out by one module context is the very same instance on every property
     *               access and is never undefined
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxModuleSurface0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const first = context.eventHub;
      const second = context.eventHub;
      logCase('testAppCtxModuleSurface0004', `sameHub=${first === second} hubDefined=${first !== undefined}`);
      expect(first !== undefined).assertTrue();
      expect(first === second).assertTrue();
      expect(context.eventHub !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_1400
     * @tc.name      testAppCtxModuleSurface0005
     * @tc.desc      Check the application uid of the module context matches the running process uid and the uid
     *               published by the bundle manager
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxModuleSurface0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const uid: number = entryContext().applicationInfo.uid;
      const info: bundleManager.BundleInfo = await selfBundle();
      logCase('testAppCtxModuleSurface0005', `contextUid=${uid} processUid=${process.uid} ` +
        `bundleUid=${info.appInfo.uid}`);
      expect(uid).assertEqual(process.uid);
      expect(uid).assertEqual(info.appInfo.uid);
      expect(uid > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_1500
     * @tc.name      testAppCtxModuleSurface0006
     * @tc.desc      Check the entry and the test module contexts own different data directories while sharing the
     *               same installation directory
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxModuleSurface0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const entry: common.Context = moduleContext(ENTRY_MODULE);
      const test: common.Context = moduleContext(TEST_MODULE);
      logCase('testAppCtxModuleSurface0006', `entryFiles=${entry.filesDir} testFiles=${test.filesDir} ` +
        `entryCode=${entry.bundleCodeDir} testCode=${test.bundleCodeDir}`);
      expect(entry.filesDir === test.filesDir).assertFalse();
      expect(entry.cacheDir === test.cacheDir).assertFalse();
      expect(entry.bundleCodeDir).assertEqual(test.bundleCodeDir);
      expect(entry.preferencesDir === test.preferencesDir).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_1600
     * @tc.name      testAppCtxModuleSurface0007
     * @tc.desc      Check the module context created from the application context resolves the entry module exactly
     *               like the one created from the module context
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxModuleSurface0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const single: common.Context = entryContext().createModuleContext(ENTRY_MODULE);
      const guarded: GuardedContext = capture((): common.Context => appContext().createModuleContext(ENTRY_MODULE));
      logCase('testAppCtxModuleSurface0007', `threw=${guarded.threw} code=${guarded.code} ` +
        `filesDir=${guarded.filesDir}`);
      expect(guarded.threw).assertFalse();
      expect(guarded.appName).assertEqual(BUNDLE_NAME);
      expect(guarded.filesDir).assertEqual(single.filesDir);
      expect(guarded.cacheDir).assertEqual(single.cacheDir);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_1700
     * @tc.name      testAppCtxModuleSurface0008
     * @tc.desc      Check the application context obtained from the module context reports the own bundle name, the
     *               running uid and an absolute files directory
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxModuleSurface0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const application: common.ApplicationContext = entryContext().getApplicationContext();
      logCase('testAppCtxModuleSurface0008', `appName=${application.applicationInfo.name} ` +
        `uid=${application.applicationInfo.uid} filesDir=${application.filesDir}`);
      expect(application.applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(application.applicationInfo.uid).assertEqual(process.uid);
      expect(isAbsolutePath(application.filesDir)).assertTrue();
      expect(areaKnown(application)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_1800
     * @tc.name      testAppCtxModuleSurface0009
     * @tc.desc      Check the directory profile of the application context differs from the module context while both
     *               keep five non duplicated entries
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxModuleSurface0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const moduleDirs: string[] = dirsOf(entryContext());
      const applicationDirs: string[] = dirsOf(appContext());
      logCase('testAppCtxModuleSurface0009', `moduleKey=${dirKey(entryContext())} ` +
        `applicationKey=${dirKey(appContext())}`);
      expect(dirKey(entryContext()) === dirKey(appContext())).assertFalse();
      expect(distinctCount(moduleDirs)).assertEqual(DIR_TOTAL);
      expect(distinctCount(applicationDirs)).assertEqual(DIR_TOTAL);
      expect(nonEmptyCount(applicationDirs)).assertEqual(DIR_TOTAL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_1900
     * @tc.name      testAppCtxModuleSurface0010
     * @tc.desc      Check the application info object handed out by one module context is stable across repeated
     *               property reads
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxModuleSurface0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const first: bundleManager.ApplicationInfo = context.applicationInfo;
      const second: bundleManager.ApplicationInfo = context.applicationInfo;
      logCase('testAppCtxModuleSurface0010', `sameInfo=${first === second} name=${first.name} uid=${first.uid}`);
      expect(first === second).assertTrue();
      expect(first.name).assertEqual(BUNDLE_NAME);
      expect(first.uid > ZERO).assertTrue();
      expect(first.process.length > EMPTY_LENGTH).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_2000
     * @tc.name      testAppCtxModuleSurface0011
     * @tc.desc      Check the distributed files directory of the module context is populated, absolute and not the
     *               ordinary files directory
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxModuleSurface0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const context: common.Context = entryContext();
      logCase('testAppCtxModuleSurface0011', `distributed=${context.distributedFilesDir} ` +
        `files=${context.filesDir}`);
      expect(context.distributedFilesDir.length > EMPTY_LENGTH).assertTrue();
      expect(isAbsolutePath(context.distributedFilesDir)).assertTrue();
      expect(context.distributedFilesDir === context.filesDir).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_2100
     * @tc.name      testAppCtxFilesDir0001
     * @tc.desc      Check the module files directory is a well formed absolute path without a trailing separator, a
     *               doubled separator or embedded blanks
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxFilesDir0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const path: string = entryContext().filesDir;
      logCase('testAppCtxFilesDir0001', `path=${path} depth=${depthOf(path)}`);
      expect(path.length > EMPTY_LENGTH).assertTrue();
      expect(isAbsolutePath(path)).assertTrue();
      expect(hasTrailingSlash(path)).assertFalse();
      expect(hasDoubleSlash(path)).assertFalse();
      expect(hasBlank(path)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_2200
     * @tc.name      testAppCtxFilesDir0002
     * @tc.desc      Check the module files directory ends on the files segment and that the directory really exists on
     *               the data partition
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxFilesDir0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const path: string = entryContext().filesDir;
      const tail: string = tailSegment(path);
      logCase('testAppCtxFilesDir0002', `tail=${tail} exists=${probeExists(path)} isDir=${probeIsDir(path)}`);
      expect(path.endsWith(FILES_SUFFIX)).assertTrue();
      expect(tail).assertEqual(FILES_TAIL);
      expect(probeExists(path)).assertTrue();
      expect(probeIsDir(path)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_2300
     * @tc.name      testAppCtxFilesDir0003
     * @tc.desc      Check the files directory sits beside the cache directory: same tail case, same depth and the
     *               same parent folder
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxFilesDir0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const tail: string = tailSegment(context.filesDir);
      const sameDepth: boolean = depthOf(context.filesDir) === depthOf(context.cacheDir);
      const sameParent: boolean = parentOf(context.filesDir) === parentOf(context.cacheDir);
      logCase('testAppCtxFilesDir0003', `tail=${tail} sameDepth=${sameDepth} sameParent=${sameParent} ` +
        `parent=${parentOf(context.filesDir)}`);
      expect(tail).assertEqual(tail.toLowerCase());
      expect(asciiOnly(tail)).assertTrue();
      expect(sameDepth).assertTrue();
      expect(sameParent).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_2400
     * @tc.name      testAppCtxFilesDir0004
     * @tc.desc      Write a probe file into a folder under the files directory and check the reported byte count, the
     *               on disk size and the read back text
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxFilesDir0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.filesDir, 'files_write');
      const path: string = joinPath(dir, 'alpha.txt');
      const written: number = writeTextFile(path, PAYLOAD_ALPHA);
      const size: number = probeSize(path);
      const text: string = readTextFile(path);
      logCase('testAppCtxFilesDir0004', `written=${written} size=${size} text=${text}`);
      expect(probeExists(path)).assertTrue();
      expect(written).assertEqual(PAYLOAD_ALPHA.length);
      expect(size).assertEqual(PAYLOAD_ALPHA.length);
      expect(text).assertEqual(PAYLOAD_ALPHA);
      expect(dropFile(path)).assertTrue();
      expect(cleanProbe(context.filesDir, 'files_write')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_2500
     * @tc.name      testAppCtxFilesDir0005
     * @tc.desc      Compare a probe file byte by byte against its own payload after a read back and confirm the folder
     *               is left empty after removal
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxFilesDir0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.filesDir, 'files_bytes');
      const path: string = joinPath(dir, 'gamma.txt');
      writeTextFile(path, PAYLOAD_GAMMA);
      const bytes: Uint8Array = readFileBytes(path);
      const expected: Uint8Array = asciiBytes(PAYLOAD_GAMMA);
      logCase('testAppCtxFilesDir0005', `read=${bytes.length} expected=${expected.length} ` +
        `sum=${byteSum(bytes)}`);
      expect(bytesEqual(bytes, expected)).assertTrue();
      expect(bytes.length).assertEqual(PAYLOAD_GAMMA.length);
      expect(byteSum(bytes)).assertEqual(byteSum(expected));
      expect(dropFile(path)).assertTrue();
      expect(entriesOf(dir).length).assertEqual(ZERO);
      expect(cleanProbe(context.filesDir, 'files_bytes')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_2600
     * @tc.name      testAppCtxFilesDir0006
     * @tc.desc      Create a nested folder below the files directory, store a file inside it and remove the whole
     *               tree again
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxFilesDir0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.filesDir, 'files_nested');
      const nested: string = joinPath(dir, 'level_one');
      const created: boolean = ensureDir(nested);
      const inner: string = joinPath(nested, 'delta.txt');
      writeTextFile(inner, PAYLOAD_DELTA);
      logCase('testAppCtxFilesDir0006', `created=${created} inner=${inner} size=${probeSize(inner)}`);
      expect(created).assertTrue();
      expect(probeIsDir(nested)).assertTrue();
      expect(probeExists(inner)).assertTrue();
      expect(readTextFile(inner)).assertEqual(PAYLOAD_DELTA);
      expect(dropDir(dir)).assertTrue();
      expect(probeExists(dir)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_2700
     * @tc.name      testAppCtxCacheDir0001
     * @tc.desc      Check the cache directory of the module context is populated, absolute, clean of doubled
     *               separators and present on disk
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxCacheDir0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const path: string = entryContext().cacheDir;
      logCase('testAppCtxCacheDir0001', `path=${path} isDir=${probeIsDir(path)}`);
      expect(path.length > EMPTY_LENGTH).assertTrue();
      expect(isAbsolutePath(path)).assertTrue();
      expect(hasDoubleSlash(path)).assertFalse();
      expect(probeIsDir(path)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_2800
     * @tc.name      testAppCtxCacheDir0002
     * @tc.desc      Check the cache directory carries the cache tail, matches the depth of the files directory and
     *               never shares its path
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxCacheDir0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const tail: string = tailSegment(context.cacheDir);
      logCase('testAppCtxCacheDir0002', `tail=${tail} cache=${context.cacheDir} files=${context.filesDir}`);
      expect(tail).assertEqual(CACHE_TAIL);
      expect(context.cacheDir.endsWith(CACHE_SUFFIX)).assertTrue();
      expect(depthOf(context.cacheDir)).assertEqual(depthOf(context.filesDir));
      expect(context.cacheDir === context.filesDir).assertFalse();
      expect(parentOf(context.cacheDir)).assertEqual(parentOf(context.filesDir));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_2900
     * @tc.name      testAppCtxCacheDir0003
     * @tc.desc      Store a payload in a folder under the cache directory and verify the read back bytes before the
     *               folder is dropped
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxCacheDir0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.cacheDir, 'cache_round');
      const path: string = joinPath(dir, 'epsilon.txt');
      const written: number = writeTextFile(path, PAYLOAD_EPSILON);
      const bytes: Uint8Array = readFileBytes(path);
      logCase('testAppCtxCacheDir0003', `written=${written} read=${bytes.length} dir=${dir}`);
      expect(written).assertEqual(PAYLOAD_EPSILON.length);
      expect(bytesEqual(bytes, asciiBytes(PAYLOAD_EPSILON))).assertTrue();
      expect(probeSize(path)).assertEqual(PAYLOAD_EPSILON.length);
      expect(dropFile(path)).assertTrue();
      expect(cleanProbe(context.cacheDir, 'cache_round')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_3000
     * @tc.name      testAppCtxCacheDir0004
     * @tc.desc      Overwrite a cached probe file with a longer payload and check only the second payload survives the
     *               truncating create
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxCacheDir0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.cacheDir, 'cache_swap');
      const path: string = joinPath(dir, 'swap.txt');
      const firstWrite: number = writeTextFile(path, PAYLOAD_ALPHA);
      const secondWrite: number = writeTextFile(path, PAYLOAD_BETA);
      const text: string = readTextFile(path);
      logCase('testAppCtxCacheDir0004', `first=${firstWrite} second=${secondWrite} text=${text}`);
      expect(firstWrite).assertEqual(PAYLOAD_ALPHA.length);
      expect(secondWrite).assertEqual(PAYLOAD_BETA.length);
      expect(secondWrite > firstWrite).assertTrue();
      expect(text).assertEqual(PAYLOAD_BETA);
      expect(probeSize(path)).assertEqual(PAYLOAD_BETA.length);
      expect(dropFile(path)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_3100
     * @tc.name      testAppCtxCacheDir0005
     * @tc.desc      Append a second payload to a cached probe file in append mode and check the concatenation and the
     *               resulting file size
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxCacheDir0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.cacheDir, 'cache_append');
      const path: string = joinPath(dir, 'log.txt');
      const firstWrite: number = writeTextFile(path, PAYLOAD_ALPHA);
      const secondWrite: number = appendTextFile(path, PAYLOAD_DELTA);
      const text: string = readTextFile(path);
      const expected: string = PAYLOAD_ALPHA + PAYLOAD_DELTA;
      logCase('testAppCtxCacheDir0005', `first=${firstWrite} second=${secondWrite} text=${text}`);
      expect(firstWrite + secondWrite).assertEqual(expected.length);
      expect(text).assertEqual(expected);
      expect(probeSize(path)).assertEqual(expected.length);
      expect(text.startsWith(PAYLOAD_ALPHA)).assertTrue();
      expect(dropFile(path)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_3200
     * @tc.name      testAppCtxCacheDir0006
     * @tc.desc      List two cached probe files, check the sorted names and confirm the listing drains after both
     *               files are removed
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxCacheDir0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.cacheDir, 'cache_list');
      const first: string = joinPath(dir, 'one.txt');
      const second: string = joinPath(dir, 'two.txt');
      writeTextFile(first, PAYLOAD_EPSILON);
      writeTextFile(second, PAYLOAD_ZETA);
      const entries: string[] = entriesOf(dir);
      const names: string = entries.slice().sort().join(',');
      logCase('testAppCtxCacheDir0006', `entries=${names} count=${entries.length}`);
      expect(entries.length).assertEqual(TWO);
      expect(names).assertEqual('one.txt,two.txt');
      expect(dropFile(first)).assertTrue();
      expect(dropFile(second)).assertTrue();
      expect(entriesOf(dir).length).assertEqual(ZERO);
      expect(cleanProbe(context.cacheDir, 'cache_list')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_3300
     * @tc.name      testAppCtxTempDir0001
     * @tc.desc      Check the temporary directory of the module context is a populated absolute path ending on the temp
     *               segment and backed by a real folder
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxTempDir0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const path: string = entryContext().tempDir;
      logCase('testAppCtxTempDir0001', `path=${path} tail=${tailSegment(path)}`);
      expect(path.length > EMPTY_LENGTH).assertTrue();
      expect(isAbsolutePath(path)).assertTrue();
      expect(path.endsWith(TEMP_SUFFIX)).assertTrue();
      expect(probeIsDir(path)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_3400
     * @tc.name      testAppCtxTempDir0002
     * @tc.desc      Check the temporary directory is not a parent or a child of the files and cache directories and
     *               sits at the same depth as both
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxTempDir0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const versusFiles: boolean = prefixFree(context.tempDir, context.filesDir);
      const versusCache: boolean = prefixFree(context.tempDir, context.cacheDir);
      logCase('testAppCtxTempDir0002', `versusFiles=${versusFiles} versusCache=${versusCache} ` +
        `depth=${depthOf(context.tempDir)}`);
      expect(versusFiles).assertTrue();
      expect(versusCache).assertTrue();
      expect(depthOf(context.tempDir)).assertEqual(depthOf(context.filesDir));
      expect(tailSegment(context.tempDir)).assertEqual(TEMP_TAIL);
      expect(context.tempDir === context.cacheDir).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_3500
     * @tc.name      testAppCtxTempDir0003
     * @tc.desc      Write a temporary probe, delete it and write a second probe under the very same name to prove the
     *               name can be reused
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxTempDir0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.tempDir, 'temp_reuse');
      const path: string = joinPath(dir, 'reuse.txt');
      const firstWrite: number = writeTextFile(path, PAYLOAD_ZETA);
      const removed: boolean = dropFile(path);
      const goneAfterDelete: boolean = !probeExists(path);
      const secondWrite: number = writeTextFile(path, PAYLOAD_THETA);
      const text: string = readTextFile(path);
      logCase('testAppCtxTempDir0003', `first=${firstWrite} removed=${removed} gone=${goneAfterDelete} ` +
        `second=${secondWrite}`);
      expect(firstWrite).assertEqual(PAYLOAD_ZETA.length);
      expect(removed).assertTrue();
      expect(goneAfterDelete).assertTrue();
      expect(secondWrite).assertEqual(PAYLOAD_THETA.length);
      expect(text).assertEqual(PAYLOAD_THETA);
      expect(cleanProbe(context.tempDir, 'temp_reuse')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_3600
     * @tc.name      testAppCtxTempDir0004
     * @tc.desc      Write a payload with punctuation into the temporary directory and check the byte codes sit at the
     *               offsets the payload implies
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxTempDir0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.tempDir, 'temp_codes');
      const path: string = joinPath(dir, 'codes.txt');
      writeTextFile(path, PAYLOAD_GAMMA);
      const bytes: Uint8Array = readFileBytes(path);
      logCase('testAppCtxTempDir0004', `length=${bytes.length} code5=${bytes[FIVE]} code6=${bytes[FIVE + ONE]}`);
      expect(bytes.length).assertEqual(PAYLOAD_GAMMA.length);
      expect(bytes[FIVE]).assertEqual(':'.charCodeAt(ZERO));
      expect(bytes[FIVE + ONE]).assertEqual('0'.charCodeAt(ZERO));
      expect(bytes[bytes.length - ONE]).assertEqual('6'.charCodeAt(ZERO));
      expect(bytesToText(bytes)).assertEqual(PAYLOAD_GAMMA);
      expect(dropFile(path)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_3700
     * @tc.name      testAppCtxTempDir0005
     * @tc.desc      Create a zero length file in the temporary directory and check the reported write, the on disk size
     *               and the empty read back
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxTempDir0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.tempDir, 'temp_empty');
      const path: string = joinPath(dir, 'empty.txt');
      const written: number = writeTextFile(path, '');
      logCase('testAppCtxTempDir0005', `written=${written} size=${probeSize(path)}`);
      expect(probeExists(path)).assertTrue();
      expect(written).assertEqual(ZERO);
      expect(probeSize(path)).assertEqual(ZERO);
      expect(readFileBytes(path).length).assertEqual(ZERO);
      expect(dropFile(path)).assertTrue();
      expect(cleanProbe(context.tempDir, 'temp_empty')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_3800
     * @tc.name      testAppCtxPreferencesDir0001
     * @tc.desc      Check the preferences directory of the module context is populated, absolute, free of doubled
     *               separators and present on disk
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxPreferencesDir0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const path: string = entryContext().preferencesDir;
      logCase('testAppCtxPreferencesDir0001', `path=${path} isDir=${probeIsDir(path)}`);
      expect(path.length > EMPTY_LENGTH).assertTrue();
      expect(isAbsolutePath(path)).assertTrue();
      expect(hasDoubleSlash(path)).assertFalse();
      expect(path.endsWith(PREFERENCES_SUFFIX)).assertTrue();
      expect(probeIsDir(path)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_3900
     * @tc.name      testAppCtxPreferencesDir0002
     * @tc.desc      Check the preferences directory is a sibling of the database directory at the same depth and
     *               carries the preferences tail
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxPreferencesDir0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const sameParent: boolean = parentOf(context.preferencesDir) === parentOf(context.databaseDir);
      logCase('testAppCtxPreferencesDir0002', `tail=${tailSegment(context.preferencesDir)} ` +
        `sameParent=${sameParent} parent=${parentOf(context.preferencesDir)}`);
      expect(tailSegment(context.preferencesDir)).assertEqual(PREFERENCES_TAIL);
      expect(sameParent).assertTrue();
      expect(depthOf(context.preferencesDir)).assertEqual(depthOf(context.databaseDir));
      expect(context.preferencesDir === context.databaseDir).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_4000
     * @tc.name      testAppCtxPreferencesDir0003
     * @tc.desc      Round trip a payload through a file inside the preferences directory and verify the bytes before
     *               the file is deleted
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxPreferencesDir0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.preferencesDir, 'prefs_round');
      const path: string = joinPath(dir, 'eta.txt');
      const written: number = writeTextFile(path, PAYLOAD_ETA);
      const bytes: Uint8Array = readFileBytes(path);
      logCase('testAppCtxPreferencesDir0003', `written=${written} read=${bytes.length} ` +
        `equal=${bytesEqual(bytes, asciiBytes(PAYLOAD_ETA))}`);
      expect(written).assertEqual(PAYLOAD_ETA.length);
      expect(bytes.length).assertEqual(PAYLOAD_ETA.length);
      expect(bytesEqual(bytes, asciiBytes(PAYLOAD_ETA))).assertTrue();
      expect(dropFile(path)).assertTrue();
      expect(cleanProbe(context.preferencesDir, 'prefs_round')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_4100
     * @tc.name      testAppCtxPreferencesDir0004
     * @tc.desc      Create a nested folder inside the preferences directory, place one file there and remove the whole
     *               tree afterwards
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxPreferencesDir0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.preferencesDir, 'prefs_nested');
      const nested: string = joinPath(dir, 'store');
      const created: boolean = ensureDir(nested);
      const path: string = joinPath(nested, 'theta.txt');
      writeTextFile(path, PAYLOAD_THETA);
      const entries: string[] = entriesOf(dir);
      logCase('testAppCtxPreferencesDir0004', `created=${created} entries=${entries.join(',')} ` +
        `size=${probeSize(path)}`);
      expect(created).assertTrue();
      expect(entries.length).assertEqual(ONE);
      expect(entries[ZERO]).assertEqual('store');
      expect(readTextFile(path)).assertEqual(PAYLOAD_THETA);
      expect(dropDir(dir)).assertTrue();
      expect(probeExists(dir)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_4200
     * @tc.name      testAppCtxPreferencesDir0005
     * @tc.desc      Check the preferences path carries no files segment, no blank and no trailing separator while the
     *               folder itself exists
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxPreferencesDir0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const path: string = entryContext().preferencesDir;
      logCase('testAppCtxPreferencesDir0005', `path=${path} filesSegment=${path.indexOf(FILES_SUFFIX)}`);
      expect(path.indexOf(FILES_SUFFIX) < ZERO).assertTrue();
      expect(hasBlank(path)).assertFalse();
      expect(hasTrailingSlash(path)).assertFalse();
      expect(probeExists(path)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_4300
     * @tc.name      testAppCtxDatabaseDir0001
     * @tc.desc      Check the database directory of the module context is populated, absolute, ends on the database
     *               segment and exists as a folder
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxDatabaseDir0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const path: string = entryContext().databaseDir;
      logCase('testAppCtxDatabaseDir0001', `path=${path} tail=${tailSegment(path)}`);
      expect(path.length > EMPTY_LENGTH).assertTrue();
      expect(isAbsolutePath(path)).assertTrue();
      expect(path.endsWith(DATABASE_SUFFIX)).assertTrue();
      expect(probeIsDir(path)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_4400
     * @tc.name      testAppCtxDatabaseDir0002
     * @tc.desc      Check the database directory shares the depth of the files directory and is neither the code
     *               directory nor the files directory
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxDatabaseDir0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      logCase('testAppCtxDatabaseDir0002', `tail=${tailSegment(context.databaseDir)} ` +
        `depth=${depthOf(context.databaseDir)} filesDepth=${depthOf(context.filesDir)}`);
      expect(tailSegment(context.databaseDir)).assertEqual(DATABASE_TAIL);
      expect(depthOf(context.databaseDir)).assertEqual(depthOf(context.filesDir));
      expect(context.databaseDir === context.bundleCodeDir).assertFalse();
      expect(isAbsolutePath(context.bundleCodeDir)).assertTrue();
      expect(context.databaseDir === context.filesDir).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_4500
     * @tc.name      testAppCtxDatabaseDir0003
     * @tc.desc      Round trip a payload through the database directory and compare the read back bytes and their
     *               checksum against the payload
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxDatabaseDir0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.databaseDir, 'db_round');
      const path: string = joinPath(dir, 'theta.txt');
      const written: number = writeTextFile(path, PAYLOAD_THETA);
      const bytes: Uint8Array = readFileBytes(path);
      const expected: Uint8Array = asciiBytes(PAYLOAD_THETA);
      logCase('testAppCtxDatabaseDir0003', `written=${written} read=${bytes.length} sum=${byteSum(bytes)} ` +
        `expectedSum=${byteSum(expected)}`);
      expect(written).assertEqual(PAYLOAD_THETA.length);
      expect(bytesEqual(bytes, expected)).assertTrue();
      expect(byteSum(bytes)).assertEqual(byteSum(expected));
      expect(probeSize(path)).assertEqual(PAYLOAD_THETA.length);
      expect(dropFile(path)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_4600
     * @tc.name      testAppCtxDatabaseDir0004
     * @tc.desc      Build a nested folder under the database directory, confirm the file size, then remove the file and
     *               the folder step by step
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxDatabaseDir0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.databaseDir, 'db_nested');
      const nested: string = joinPath(dir, 'store');
      const created: boolean = ensureDir(nested);
      const path: string = joinPath(nested, 'records.txt');
      writeTextFile(path, PAYLOAD_IOTA);
      const size: number = probeSize(path);
      const removedFile: boolean = dropFile(path);
      const removedDir: boolean = dropDir(nested);
      logCase('testAppCtxDatabaseDir0004', `created=${created} size=${size} removedFile=${removedFile} ` +
        `removedDir=${removedDir}`);
      expect(created).assertTrue();
      expect(size).assertEqual(PAYLOAD_IOTA.length);
      expect(removedFile).assertTrue();
      expect(removedDir).assertTrue();
      expect(probeExists(nested)).assertFalse();
      expect(cleanProbe(context.databaseDir, 'db_nested')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_4700
     * @tc.name      testAppCtxDatabaseDir0005
     * @tc.desc      Compare every byte of a database directory probe file with the expected character code in an
     *               explicit loop and report the first mismatch
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxDatabaseDir0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.databaseDir, 'db_bytes');
      const path: string = joinPath(dir, 'digits.txt');
      writeTextFile(path, PAYLOAD_DELTA);
      const bytes: Uint8Array = readFileBytes(path);
      let mismatches: number = ZERO;
      for (let index: number = ZERO; index < PAYLOAD_DELTA.length; index += ONE) {
        if (bytes[index] !== PAYLOAD_DELTA.charCodeAt(index)) {
          mismatches += ONE;
        }
      }
      logCase('testAppCtxDatabaseDir0005', `length=${bytes.length} mismatches=${mismatches}`);
      expect(bytes.length).assertEqual(PAYLOAD_DELTA.length);
      expect(mismatches).assertEqual(ZERO);
      expect(bytesToText(bytes)).assertEqual(PAYLOAD_DELTA);
      expect(dropFile(path)).assertTrue();
      expect(cleanProbe(context.databaseDir, 'db_bytes')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_4800
     * @tc.name      testAppCtxDirectoryGraph0001
     * @tc.desc      Check the five storage directories of the module context are all populated and pairwise different
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxDirectoryGraph0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const dirs: string[] = dirsOf(entryContext());
      logCase('testAppCtxDirectoryGraph0001', `dirs=${dirs.join(PIPE)} distinct=${distinctCount(dirs)}`);
      expect(dirs.length).assertEqual(DIR_TOTAL);
      expect(nonEmptyCount(dirs)).assertEqual(DIR_TOTAL);
      expect(distinctCount(dirs)).assertEqual(DIR_TOTAL);
      expect(absoluteCount(dirs)).assertEqual(DIR_TOTAL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_4900
     * @tc.name      testAppCtxDirectoryGraph0002
     * @tc.desc      Check two independent directory pairs are prefix free, so neither member of a pair can be mistaken
     *               for the parent of the other
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxDirectoryGraph0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const filesCache: boolean = prefixFree(context.filesDir, context.cacheDir);
      const tempPreferences: boolean = prefixFree(context.tempDir, context.preferencesDir);
      const filesTemp: boolean = prefixFree(context.filesDir, context.tempDir);
      logCase('testAppCtxDirectoryGraph0002', `filesCache=${filesCache} tempPreferences=${tempPreferences} ` +
        `filesTemp=${filesTemp}`);
      expect(filesCache).assertTrue();
      expect(tempPreferences).assertTrue();
      expect(filesTemp).assertTrue();
      expect(probeIsDir(context.preferencesDir)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_5000
     * @tc.name      testAppCtxDirectoryGraph0003
     * @tc.desc      Check the last segment of every storage directory is unique so the five directories can be told
     *               apart by their tail alone
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxDirectoryGraph0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const dirs: string[] = dirsOf(entryContext());
      const tails: string[] = [];
      for (let index: number = ZERO; index < dirs.length; index += ONE) {
        tails.push(tailSegment(dirs[index]));
      }
      logCase('testAppCtxDirectoryGraph0003', `tails=${tails.join(PIPE)} distinct=${distinctCount(tails)}`);
      expect(tails.length).assertEqual(DIR_TOTAL);
      expect(distinctCount(tails)).assertEqual(DIR_TOTAL);
      expect(nonEmptyCount(tails)).assertEqual(DIR_TOTAL);
      expect(tails.indexOf(FILES_TAIL) >= ZERO).assertTrue();
      expect(tails.indexOf(DATABASE_TAIL) >= ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_5100
     * @tc.name      testAppCtxDirectoryGraph0004
     * @tc.desc      Check the five storage directories share one parent folder and that this parent is an absolute path
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxDirectoryGraph0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const dirs: string[] = dirsOf(entryContext());
      const parents: string[] = [];
      for (let index: number = ZERO; index < dirs.length; index += ONE) {
        parents.push(parentOf(dirs[index]));
      }
      const parent: string = parents[ZERO];
      logCase('testAppCtxDirectoryGraph0004', `parent=${parent} distinct=${distinctCount(parents)}`);
      expect(distinctCount(parents)).assertEqual(ONE);
      expect(parent.length > EMPTY_LENGTH).assertTrue();
      expect(isAbsolutePath(parent)).assertTrue();
      expect(parent).assertEqual(parentOf(dirs[FOUR]));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_5200
     * @tc.name      testAppCtxDirectoryGraph0005
     * @tc.desc      Check the five storage directories all live at the same depth below the root and that the depth is
     *               deeper than a bare root path
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxDirectoryGraph0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const dirs: string[] = dirsOf(entryContext());
      const depths: string[] = [];
      for (let index: number = ZERO; index < dirs.length; index += ONE) {
        depths.push(depthOf(dirs[index]).toString());
      }
      logCase('testAppCtxDirectoryGraph0005', `depths=${depths.join(PIPE)} distinct=${distinctCount(depths)}`);
      expect(distinctCount(depths)).assertEqual(ONE);
      expect(depthOf(dirs[ZERO]) > ONE).assertTrue();
      expect(depthOf(dirs[ZERO])).assertEqual(depthOf(dirs[TWO]));
      expect(depths.length).assertEqual(DIR_TOTAL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_5300
     * @tc.name      testAppCtxDirectoryGraph0006
     * @tc.desc      Sweep every ordered pair of storage directories and check no directory is a prefix of another,
     *               counting the inspected pairs as an oracle
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxDirectoryGraph0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const dirs: string[] = dirsOf(entryContext());
      let inspected: number = ZERO;
      let conflicts: number = ZERO;
      for (let outer: number = ZERO; outer < dirs.length; outer += ONE) {
        for (let inner: number = ZERO; inner < dirs.length; inner += ONE) {
          if (outer !== inner) {
            inspected += ONE;
            if (dirs[outer].indexOf(dirs[inner]) >= ZERO) {
              conflicts += ONE;
            }
          }
        }
      }
      logCase('testAppCtxDirectoryGraph0006', `inspected=${inspected} conflicts=${conflicts}`);
      expect(inspected).assertEqual(DIR_TOTAL * (DIR_TOTAL - ONE));
      expect(conflicts).assertEqual(ZERO);
      expect(dirs.length).assertEqual(DIR_TOTAL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_5400
     * @tc.name      testAppCtxDirectoryGraph0007
     * @tc.desc      Check the longest common prefix of the five storage directories ends on a separator and leads every
     *               one of them
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxDirectoryGraph0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const dirs: string[] = dirsOf(entryContext());
      const prefix: string = commonPrefix(dirs);
      let leading: number = ZERO;
      for (let index: number = ZERO; index < dirs.length; index += ONE) {
        if (dirs[index].startsWith(prefix)) {
          leading += ONE;
        }
      }
      logCase('testAppCtxDirectoryGraph0007', `prefix=${prefix} leading=${leading}`);
      expect(prefix.length > EMPTY_LENGTH).assertTrue();
      expect(prefix.endsWith(SLASH)).assertTrue();
      expect(leading).assertEqual(DIR_TOTAL);
      expect(isAbsolutePath(prefix)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_5500
     * @tc.name      testAppCtxWritableSpace0001
     * @tc.desc      Write, size check, read back and delete one probe file in the files directory as a full writability
     *               proof
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxWritableSpace0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.filesDir, 'writable_files');
      const path: string = joinPath(dir, 'proof.txt');
      const written: number = writeTextFile(path, PAYLOAD_EPSILON);
      const size: number = probeSize(path);
      const text: string = readTextFile(path);
      const deleted: boolean = dropFile(path);
      logCase('testAppCtxWritableSpace0001', `written=${written} size=${size} deleted=${deleted}`);
      expect(written).assertEqual(PAYLOAD_EPSILON.length);
      expect(size).assertEqual(written);
      expect(text).assertEqual(PAYLOAD_EPSILON);
      expect(deleted).assertTrue();
      expect(cleanProbe(context.filesDir, 'writable_files')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_5600
     * @tc.name      testAppCtxWritableSpace0002
     * @tc.desc      Prove the cache directory is writable by comparing a read back probe both as text and as bytes
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxWritableSpace0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.cacheDir, 'writable_cache');
      const path: string = joinPath(dir, 'proof.txt');
      writeTextFile(path, PAYLOAD_BETA);
      const text: string = readTextFile(path);
      const bytes: Uint8Array = readFileBytes(path);
      logCase('testAppCtxWritableSpace0002', `text=${text} length=${bytes.length}`);
      expect(text).assertEqual(PAYLOAD_BETA);
      expect(bytes.length).assertEqual(PAYLOAD_BETA.length);
      expect(bytesEqual(bytes, asciiBytes(PAYLOAD_BETA))).assertTrue();
      expect(dropFile(path)).assertTrue();
      expect(cleanProbe(context.cacheDir, 'writable_cache')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_5700
     * @tc.name      testAppCtxWritableSpace0003
     * @tc.desc      Prove the temporary directory is writable and that both the probe folder and the temporary
     *               directory still behave after the probe is cleaned
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxWritableSpace0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.tempDir, 'writable_temp');
      const path: string = joinPath(dir, 'proof.txt');
      writeTextFile(path, PAYLOAD_ZETA);
      const text: string = readTextFile(path);
      const cleaned: boolean = cleanProbe(context.tempDir, 'writable_temp');
      logCase('testAppCtxWritableSpace0003', `text=${text} cleaned=${cleaned} dir=${dir}`);
      expect(text).assertEqual(PAYLOAD_ZETA);
      expect(cleaned).assertTrue();
      expect(probeExists(dir)).assertFalse();
      expect(probeIsDir(context.tempDir)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_5800
     * @tc.name      testAppCtxWritableSpace0004
     * @tc.desc      Prove the preferences directory is writable and that two consecutive reads return the very same
     *               text of the very same length
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxWritableSpace0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.preferencesDir, 'writable_prefs');
      const path: string = joinPath(dir, 'proof.txt');
      writeTextFile(path, PAYLOAD_ETA);
      const firstRead: string = readTextFile(path);
      const secondRead: string = readTextFile(path);
      logCase('testAppCtxWritableSpace0004', `first=${firstRead} stable=${firstRead === secondRead}`);
      expect(firstRead).assertEqual(PAYLOAD_ETA);
      expect(firstRead === secondRead).assertTrue();
      expect(firstRead.length).assertEqual(secondRead.length);
      expect(dropFile(path)).assertTrue();
      expect(cleanProbe(context.preferencesDir, 'writable_prefs')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_5900
     * @tc.name      testAppCtxWritableSpace0005
     * @tc.desc      Prove the database directory is writable by checking the read back checksum and size of a probe
     *               file before removing it
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxWritableSpace0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.databaseDir, 'writable_db');
      const path: string = joinPath(dir, 'proof.txt');
      writeTextFile(path, PAYLOAD_GAMMA);
      const bytes: Uint8Array = readFileBytes(path);
      const expectedSum: number = byteSum(asciiBytes(PAYLOAD_GAMMA));
      logCase('testAppCtxWritableSpace0005', `sum=${byteSum(bytes)} expected=${expectedSum} ` +
        `size=${probeSize(path)}`);
      expect(byteSum(bytes)).assertEqual(expectedSum);
      expect(probeSize(path)).assertEqual(PAYLOAD_GAMMA.length);
      expect(bytesToText(bytes)).assertEqual(PAYLOAD_GAMMA);
      expect(dropFile(path)).assertTrue();
      expect(cleanProbe(context.databaseDir, 'writable_db')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_6000
     * @tc.name      testAppCtxWritableSpace0006
     * @tc.desc      Store the same payload in the files and cache directories at once and check both copies read back
     *               identically before both are deleted
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxWritableSpace0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const filesDir: string = prepareProbe(context.filesDir, 'mirror_files');
      const cacheDir: string = prepareProbe(context.cacheDir, 'mirror_cache');
      const filesPath: string = joinPath(filesDir, 'mirror.txt');
      const cachePath: string = joinPath(cacheDir, 'mirror.txt');
      writeTextFile(filesPath, PAYLOAD_IOTA);
      writeTextFile(cachePath, PAYLOAD_IOTA);
      const filesBytes: Uint8Array = readFileBytes(filesPath);
      const cacheBytes: Uint8Array = readFileBytes(cachePath);
      logCase('testAppCtxWritableSpace0006', `files=${filesBytes.length} cache=${cacheBytes.length} ` +
        `equal=${bytesEqual(filesBytes, cacheBytes)}`);
      expect(bytesEqual(filesBytes, cacheBytes)).assertTrue();
      expect(filesBytes.length).assertEqual(PAYLOAD_IOTA.length);
      expect(probeSize(cachePath)).assertEqual(PAYLOAD_IOTA.length);
      expect(dropFile(filesPath)).assertTrue();
      expect(dropFile(cachePath)).assertTrue();
      expect(filesDir === cacheDir).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_6100
     * @tc.name      testAppCtxWritableSpace0007
     * @tc.desc      Track the probe folder listing around one write and one delete and check the count returns to the
     *               baseline it started from
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxWritableSpace0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const dir: string = prepareProbe(context.filesDir, 'listing_files');
      const baseline: number = entriesOf(dir).length;
      const path: string = joinPath(dir, 'tracked.txt');
      writeTextFile(path, PAYLOAD_DELTA);
      const afterWrite: number = entriesOf(dir).length;
      const deleted: boolean = dropFile(path);
      const afterDelete: number = entriesOf(dir).length;
      logCase('testAppCtxWritableSpace0007', `baseline=${baseline} afterWrite=${afterWrite} ` +
        `afterDelete=${afterDelete}`);
      expect(afterWrite).assertEqual(baseline + ONE);
      expect(deleted).assertTrue();
      expect(afterDelete).assertEqual(baseline);
      expect(probeExists(path)).assertFalse();
      expect(cleanProbe(context.filesDir, 'listing_files')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_6200
     * @tc.name      testAppCtxUnknownModule0001
     * @tc.desc      Check asking for a context of an uninstalled module is answered without an exception and keeps the
     *               bundle identity of the caller
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxUnknownModule0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const guarded: GuardedContext = captureModule(UNKNOWN_MODULE);
      logCase('testAppCtxUnknownModule0001', `threw=${guarded.threw} code=${guarded.code} ` +
        `appName=${guarded.appName} filesDir=${guarded.filesDir}`);
      expect(guarded.threw).assertFalse();
      expect(guarded.code).assertEqual(ZERO);
      expect(guarded.appName).assertEqual(BUNDLE_NAME);
      expect(guarded.uid).assertEqual(process.uid);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_6300
     * @tc.name      testAppCtxUnknownModule0002
     * @tc.desc      Check an unknown module name built from the entry name with a leading capital is matched case
     *               sensitively, so its directories never coincide with the entry ones
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxUnknownModule0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const entry: common.Context = entryContext();
      const guarded: GuardedContext = captureModule(UNKNOWN_CASED);
      const dirShape: boolean = guarded.filesDir.length === EMPTY_LENGTH || isAbsolutePath(guarded.filesDir);
      logCase('testAppCtxUnknownModule0002', `threw=${guarded.threw} filesDir=${guarded.filesDir} ` +
        `entryFiles=${entry.filesDir}`);
      expect(guarded.threw).assertFalse();
      expect(guarded.filesDir === entry.filesDir).assertFalse();
      expect(dirShape).assertTrue();
      expect(guarded.appName).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_6400
     * @tc.name      testAppCtxUnknownModule0003
     * @tc.desc      Check a module name padded with a trailing blank is refused as a directory owner, so the returned
     *               files directory stays away from the entry directory
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxUnknownModule0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const entry: common.Context = entryContext();
      const guarded: GuardedContext = captureModule(UNKNOWN_SPACED);
      logCase('testAppCtxUnknownModule0003', `threw=${guarded.threw} filesDir=${guarded.filesDir} ` +
        `entryFiles=${entry.filesDir}`);
      expect(guarded.threw).assertFalse();
      expect(guarded.appName).assertEqual(BUNDLE_NAME);
      expect(guarded.filesDir === entry.filesDir).assertFalse();
      expect(guarded.cacheDir === entry.cacheDir).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_6500
     * @tc.name      testAppCtxUnknownModule0004
     * @tc.desc      Check two independent contexts for the same uninstalled module report the same uid and the same
     *               files directory
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxUnknownModule0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const first: GuardedContext = captureModule(UNKNOWN_MODULE);
      const second: GuardedContext = captureModule(UNKNOWN_MODULE);
      logCase('testAppCtxUnknownModule0004', `first=${first.filesDir} second=${second.filesDir} ` +
        `uid=${first.uid}`);
      expect(first.threw).assertFalse();
      expect(second.threw).assertFalse();
      expect(first.uid).assertEqual(second.uid);
      expect(first.filesDir).assertEqual(second.filesDir);
      expect(first.appName).assertEqual(second.appName);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_6600
     * @tc.name      testAppCtxUnknownModule0005
     * @tc.desc      Check the resource manager of a context created for an uninstalled module still resolves the
     *               application label string
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxUnknownModule0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const guarded: GuardedContext = captureModule(UNKNOWN_MODULE);
      const context: common.Context | undefined = guarded.context;
      let label: string = '';
      if (context !== undefined) {
        label = stringByName(context.resourceManager, 'app_name');
      }
      logCase('testAppCtxUnknownModule0005', `threw=${guarded.threw} label=${label} ` +
        `processName=${guarded.processName}`);
      expect(guarded.threw).assertFalse();
      expect(context !== undefined).assertTrue();
      expect(label).assertEqual(APP_NAME_TEXT);
      expect(guarded.processName).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_6700
     * @tc.name      testAppCtxAreaIdentity0001
     * @tc.desc      Check the area mode of the module context is one of the two documented data partitions, matches
     *               the application context and survives a repeated read
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxAreaIdentity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const context: common.Context = entryContext();
      const first: number = Number(context.area);
      const second: number = Number(context.area);
      logCase('testAppCtxAreaIdentity0001', `area=${context.area} first=${first} second=${second} ` +
        `applicationArea=${appContext().area}`);
      expect(areaKnown(context)).assertTrue();
      expect(first).assertEqual(second);
      expect(context.area).assertEqual(appContext().area);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_6800
     * @tc.name      testAppCtxAreaIdentity0002
     * @tc.desc      Check the ordinary module context lives in the EL1 partition, whose numeric value is the smaller
     *               of the two documented area values
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxAreaIdentity0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: contextConstant.AreaMode = entryContext().area;
      const el1: number = Number(contextConstant.AreaMode.EL1);
      const el2: number = Number(contextConstant.AreaMode.EL2);
      logCase('testAppCtxAreaIdentity0002', `area=${area} el1=${el1} el2=${el2}`);
      expect(area).assertEqual(contextConstant.AreaMode.EL1);
      expect(el1 < el2).assertTrue();
      expect(Number(area)).assertEqual(ZERO);
      expect(Number(appContext().area)).assertEqual(el1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_6900
     * @tc.name      testAppCtxAreaIdentity0003
     * @tc.desc      Check a context created for an uninstalled module inherits the area mode of the caller instead of
     *               inventing a new partition
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxAreaIdentity0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const guarded: GuardedContext = captureModule(UNKNOWN_MODULE);
      const entryArea: number = Number(entryContext().area);
      logCase('testAppCtxAreaIdentity0003', `threw=${guarded.threw} unknownArea=${guarded.area} ` +
        `entryArea=${entryArea}`);
      expect(guarded.threw).assertFalse();
      expect(guarded.area).assertEqual(entryArea);
      expect(guarded.area).assertEqual(Number(contextConstant.AreaMode.EL1));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_7000
     * @tc.name      testAppCtxAreaIdentity0004
     * @tc.desc      Check the resource manager and the event hub of one module context are the same objects on every
     *               property access, so identity comparisons are meaningful
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxAreaIdentity0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const managerFirst: resourceManager.ResourceManager = context.resourceManager;
      const managerSecond: resourceManager.ResourceManager = context.resourceManager;
      logCase('testAppCtxAreaIdentity0004', `managerSame=${managerFirst === managerSecond} ` +
        `hubSame=${context.eventHub === context.eventHub}`);
      expect(managerFirst !== undefined).assertTrue();
      expect(managerFirst === managerSecond).assertTrue();
      expect(context.eventHub === context.eventHub).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_7100
     * @tc.name      testAppCtxAreaIdentity0005
     * @tc.desc      Check the resource managers of two separately created module contexts resolve the same module
     *               scoped strings without any failure
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxAreaIdentity0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: resourceManager.ResourceManager = moduleContext(ENTRY_MODULE).resourceManager;
      const second: resourceManager.ResourceManager = moduleContext(ENTRY_MODULE).resourceManager;
      const descFirst: string = stringByName(first, 'module_desc');
      const descSecond: string = stringByName(second, 'module_desc');
      const labelFirst: string = stringByName(first, 'EntryAbility_label');
      const labelSecond: string = stringByName(second, 'EntryAbility_label');
      logCase('testAppCtxAreaIdentity0005', `desc=${descFirst} labelFirst=${labelFirst} ` +
        `labelSecond=${labelSecond}`);
      expect(descFirst).assertEqual(descSecond);
      expect(labelFirst).assertEqual(labelSecond);
      expect(descFirst).assertEqual(MODULE_DESC_TEXT);
      expect(labelFirst).assertEqual(APP_NAME_TEXT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_7200
     * @tc.name      testAppCtxAreaIdentity0006
     * @tc.desc      Check the label and description identifiers published by the bundle manager resolve through the
     *               module resource manager to the declared texts
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxAreaIdentity0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const app: bundleManager.ApplicationInfo = info.appInfo;
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const manager: resourceManager.ResourceManager = entryContext().resourceManager;
      const label: string = stringById(manager, app.labelId);
      const moduleDescription: string = stringById(manager, entry.descriptionId);
      logCase('testAppCtxAreaIdentity0006', `labelId=${app.labelId} label=${label} ` +
        `descriptionId=${entry.descriptionId} description=${moduleDescription}`);
      expect(label).assertEqual(APP_NAME_TEXT);
      expect(moduleDescription).assertEqual(MODULE_DESC_TEXT);
      expect(moduleDescription.length).assertEqual(MODULE_DESC_UNITS);
      expect(app.labelId > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_7300
     * @tc.name      testAppCtxAreaIdentity0007
     * @tc.desc      Check the module resource manager still answers a resource name that the module does not declare
     *               with the documented invalid name code
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxAreaIdentity0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const manager: resourceManager.ResourceManager = entryContext().resourceManager;
      const missing: number = resourceError(manager, MISSING_RESOURCE);
      const known: number = resourceError(manager, 'module_desc');
      logCase('testAppCtxAreaIdentity0007', `missing=${missing} known=${known} ` +
        `expected=${ERR_RES_NAME_INVALID}`);
      expect(missing).assertEqual(ERR_RES_NAME_INVALID);
      expect(known).assertEqual(ZERO);
      expect(missing > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_7400
     * @tc.name      testAppCtxAppInfoFields0001
     * @tc.desc      Check four identity fields of the context application info match the application info published by
     *               the bundle manager
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxAppInfoFields0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const contextInfo: bundleManager.ApplicationInfo = entryContext().applicationInfo;
      const bundleInfo: bundleManager.ApplicationInfo = (await selfBundle()).appInfo;
      logCase('testAppCtxAppInfoFields0001', `name=${contextInfo.name} uid=${contextInfo.uid} ` +
        `token=${contextInfo.accessTokenId} process=${contextInfo.process}`);
      expect(contextInfo.name).assertEqual(bundleInfo.name);
      expect(contextInfo.uid).assertEqual(bundleInfo.uid);
      expect(contextInfo.process).assertEqual(bundleInfo.process);
      expect(contextInfo.accessTokenId).assertEqual(bundleInfo.accessTokenId);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_7500
     * @tc.name      testAppCtxAppInfoFields0002
     * @tc.desc      Check the context application info describes a removable third party application running as the
     *               primary app instance
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxAppInfoFields0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.ApplicationInfo = entryContext().applicationInfo;
      logCase('testAppCtxAppInfoFields0002', `bundleType=${info.bundleType} systemApp=${info.systemApp} ` +
        `removable=${info.removable} appIndex=${info.appIndex}`);
      expect(info.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.systemApp).assertFalse();
      expect(info.removable).assertTrue();
      expect(info.appIndex).assertEqual(PRIMARY_APP_INDEX);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_7600
     * @tc.name      testAppCtxAppInfoFields0003
     * @tc.desc      Check the context application info is enabled, holds a positive token identifier and a process name
     *               without surrounding blanks
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxAppInfoFields0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.ApplicationInfo = entryContext().applicationInfo;
      const processName: string = textOrEmpty(info.process);
      logCase('testAppCtxAppInfoFields0003', `enabled=${info.enabled} token=${info.accessTokenId} ` +
        `process=${processName}`);
      expect(info.enabled).assertTrue();
      expect(info.accessTokenId > ZERO).assertTrue();
      expect(processName.length > EMPTY_LENGTH).assertTrue();
      expect(processName === processName.trim()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_7700
     * @tc.name      testAppCtxAppInfoFields0004
     * @tc.desc      Check the resource references of the context application info are the declared label and icon and
     *               that both carry positive identifiers
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxAppInfoFields0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.ApplicationInfo = entryContext().applicationInfo;
      logCase('testAppCtxAppInfoFields0004', `label=${info.label} icon=${info.icon} labelId=${info.labelId} ` +
        `iconId=${info.iconId}`);
      expect(info.label).assertEqual(APP_LABEL_RES);
      expect(info.icon).assertEqual(APP_ICON_RES);
      expect(info.labelId > ZERO).assertTrue();
      expect(info.iconId > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_7800
     * @tc.name      testAppCtxAppInfoFields0005
     * @tc.desc      Check the label resource of the context application info identifies the own bundle and the same
     *               resource id the label text is resolved from
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxAppInfoFields0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.ApplicationInfo = entryContext().applicationInfo;
      const label: string = stringById(entryContext().resourceManager, info.labelResource.id);
      logCase('testAppCtxAppInfoFields0005', `bundle=${info.labelResource.bundleName} ` +
        `resourceId=${info.labelResource.id} label=${label}`);
      expect(info.labelResource.bundleName).assertEqual(BUNDLE_NAME);
      expect(info.labelResource.id).assertEqual(info.labelId);
      expect(label).assertEqual(APP_NAME_TEXT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_7900
     * @tc.name      testAppCtxAppInfoFields0006
     * @tc.desc      Check the installation code path of the context application info is absolute, matches the bundle
     *               manager and is shallower than the module files directory
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxAppInfoFields0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const codePath: string = textOrEmpty(context.applicationInfo.codePath);
      const bundleCodePath: string = textOrEmpty((await selfBundle()).appInfo.codePath);
      logCase('testAppCtxAppInfoFields0006', `codePath=${codePath} bundleCodePath=${bundleCodePath} ` +
        `depth=${depthOf(codePath)}`);
      expect(codePath.length > EMPTY_LENGTH).assertTrue();
      expect(isAbsolutePath(codePath)).assertTrue();
      expect(codePath).assertEqual(bundleCodePath);
      expect(depthOf(codePath) < depthOf(context.filesDir)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_8000
     * @tc.name      testAppCtxAppInfoFields0007
     * @tc.desc      Check the module context and the application context publish the same four identity fields of the
     *               application info block
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxAppInfoFields0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const moduleInfo: bundleManager.ApplicationInfo = entryContext().applicationInfo;
      const applicationInfo: bundleManager.ApplicationInfo = appContext().applicationInfo;
      const sameName: boolean = moduleInfo.name === applicationInfo.name;
      const sameProcess: boolean = moduleInfo.process === applicationInfo.process;
      logCase('testAppCtxAppInfoFields0007', `sameName=${sameName} sameProcess=${sameProcess} ` +
        `moduleUid=${moduleInfo.uid} applicationUid=${applicationInfo.uid}`);
      expect(sameName).assertTrue();
      expect(sameProcess).assertTrue();
      expect(moduleInfo.uid).assertEqual(applicationInfo.uid);
      expect(moduleInfo.accessTokenId).assertEqual(applicationInfo.accessTokenId);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_8100
     * @tc.name      testAppCtxAppInfoFields0008
     * @tc.desc      Check the entry and the test module contexts describe the same application although they serve
     *               different HAP modules
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxAppInfoFields0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const entryInfo: bundleManager.ApplicationInfo = moduleContext(ENTRY_MODULE).applicationInfo;
      const testInfo: bundleManager.ApplicationInfo = moduleContext(TEST_MODULE).applicationInfo;
      logCase('testAppCtxAppInfoFields0008', `entryName=${entryInfo.name} testName=${testInfo.name} ` +
        `entryType=${entryInfo.bundleType} testType=${testInfo.bundleType}`);
      expect(entryInfo.name).assertEqual(testInfo.name);
      expect(entryInfo.bundleType).assertEqual(testInfo.bundleType);
      expect(entryInfo.uid).assertEqual(testInfo.uid);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_8200
     * @tc.name      testAppCtxAppInfoFields0009
     * @tc.desc      Check a scalar projection of the context application info is identical for two independently built
     *               module contexts
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxAppInfoFields0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const first: bundleManager.ApplicationInfo = entryContext().applicationInfo;
      const second: bundleManager.ApplicationInfo = moduleContext(ENTRY_MODULE).applicationInfo;
      const firstKey: string = first.name + PIPE + first.uid + PIPE + first.process + PIPE + first.accessTokenId +
        PIPE + first.appIndex;
      const secondKey: string = second.name + PIPE + second.uid + PIPE + second.process + PIPE +
        second.accessTokenId + PIPE + second.appIndex;
      logCase('testAppCtxAppInfoFields0009', `first=${firstKey} second=${secondKey}`);
      expect(firstKey).assertEqual(secondKey);
      expect(firstKey.length > EMPTY_LENGTH).assertTrue();
      expect(firstKey.indexOf(BUNDLE_NAME) >= ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_8300
     * @tc.name      testAppCtxProcessName0001
     * @tc.desc      Check the module process name equals the bundle name and is a plain ASCII identifier of the same
     *               length
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxProcessName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const processName: string = entryContext().processName;
      logCase('testAppCtxProcessName0001', `processName=${processName} length=${processName.length}`);
      expect(processName.length > EMPTY_LENGTH).assertTrue();
      expect(processName).assertEqual(BUNDLE_NAME);
      expect(asciiOnly(processName)).assertTrue();
      expect(processName.length).assertEqual(BUNDLE_NAME.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_8400
     * @tc.name      testAppCtxProcessName0002
     * @tc.desc      Check the module process name agrees with the application info process and with the process the
     *               bundle manager publishes, without embedded blanks
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxProcessName0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const bundleProcess: string = textOrEmpty((await selfBundle()).appInfo.process);
      logCase('testAppCtxProcessName0002', `context=${context.processName} info=${context.applicationInfo.process} ` +
        `bundle=${bundleProcess}`);
      expect(context.processName).assertEqual(context.applicationInfo.process);
      expect(context.processName).assertEqual(bundleProcess);
      expect(hasBlank(context.processName)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_8500
     * @tc.name      testAppCtxProcessName0003
     * @tc.desc      Check the process name is one single value when read from the entry module, the test module and the
     *               application context
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxProcessName0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const readings: string[] = [
        moduleContext(ENTRY_MODULE).processName,
        moduleContext(TEST_MODULE).processName,
        appContext().processName
      ];
      logCase('testAppCtxProcessName0003', `readings=${readings.join(PIPE)} distinct=${distinctCount(readings)}`);
      expect(readings.length).assertEqual(THREE);
      expect(distinctCount(readings)).assertEqual(ONE);
      expect(readings[ZERO]).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_8600
     * @tc.name      testAppCtxProcessName0004
     * @tc.desc      Check the test module context runs in the same process as the entry module context and reports it
     *               through both the context and its application info
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxProcessName0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const entryProcess: string = moduleContext(ENTRY_MODULE).processName;
      const test: common.Context = moduleContext(TEST_MODULE);
      logCase('testAppCtxProcessName0004', `entry=${entryProcess} test=${test.processName} ` +
        `testInfo=${test.applicationInfo.process}`);
      expect(test.processName).assertEqual(entryProcess);
      expect(test.processName).assertEqual(test.applicationInfo.process);
      expect(test.processName === test.processName.trim()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_8700
     * @tc.name      testAppCtxBundleCodePath0001
     * @tc.desc      Check the installation code directory of the module context is a populated absolute path without a
     *               trailing separator
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxBundleCodePath0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const path: string = entryContext().bundleCodeDir;
      logCase('testAppCtxBundleCodePath0001', `path=${path} depth=${depthOf(path)}`);
      expect(path.length > EMPTY_LENGTH).assertTrue();
      expect(isAbsolutePath(path)).assertTrue();
      expect(hasTrailingSlash(path)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_8800
     * @tc.name      testAppCtxBundleCodePath0002
     * @tc.desc      Check the installation code directory exists as a folder and its path has no doubled separators or
     *               blanks
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxBundleCodePath0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const path: string = entryContext().bundleCodeDir;
      logCase('testAppCtxBundleCodePath0002', `exists=${probeExists(path)} isDir=${probeIsDir(path)}`);
      expect(probeExists(path)).assertTrue();
      expect(probeIsDir(path)).assertTrue();
      expect(hasDoubleSlash(path)).assertFalse();
      expect(hasBlank(path)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_8900
     * @tc.name      testAppCtxBundleCodePath0003
     * @tc.desc      Check the installation code directory is separate from and shallower than the module files
     *               directory, so code and data never share a root
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxBundleCodePath0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      logCase('testAppCtxBundleCodePath0003', `code=${context.bundleCodeDir} files=${context.filesDir} ` +
        `codeDepth=${depthOf(context.bundleCodeDir)}`);
      expect(prefixFree(context.bundleCodeDir, context.filesDir)).assertTrue();
      expect(depthOf(context.bundleCodeDir) < depthOf(context.filesDir)).assertTrue();
      expect(context.bundleCodeDir === context.filesDir).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_9000
     * @tc.name      testAppCtxBundleCodePath0004
     * @tc.desc      Check the installation code directory ends on the bundle segment and that the segment is plain
     *               lower case ASCII
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxBundleCodePath0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const path: string = entryContext().bundleCodeDir;
      const tail: string = tailSegment(path);
      logCase('testAppCtxBundleCodePath0004', `tail=${tail} endsWithSuffix=${path.endsWith(BUNDLE_CODE_SUFFIX)}`);
      expect(path.endsWith(BUNDLE_CODE_SUFFIX)).assertTrue();
      expect(tail).assertEqual(BUNDLE_CODE_TAIL);
      expect(asciiOnly(tail)).assertTrue();
      expect(tail).assertEqual(tail.toLowerCase());
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_9100
     * @tc.name      testAppCtxBundleCodePath0005
     * @tc.desc      Check the installation code directory is identical for two module contexts and stable in depth
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxBundleCodePath0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = moduleContext(ENTRY_MODULE).bundleCodeDir;
      const second: string = moduleContext(ENTRY_MODULE).bundleCodeDir;
      logCase('testAppCtxBundleCodePath0005', `first=${first} second=${second} ` +
        `sameDepth=${depthOf(first) === depthOf(second)}`);
      expect(first).assertEqual(second);
      expect(first.length > EMPTY_LENGTH).assertTrue();
      expect(depthOf(first)).assertEqual(depthOf(second));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_9200
     * @tc.name      testAppCtxBundleCodePath0006
     * @tc.desc      Check the installed HAP module list holds exactly the entry and the test feature module with their
     *               declared module types
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxBundleCodePath0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const names: string = info.hapModulesInfo.map((item: bundleManager.HapModuleInfo) => item.name).sort().join(',');
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const test: bundleManager.HapModuleInfo = findModule(info, TEST_MODULE);
      logCase('testAppCtxBundleCodePath0006', `names=${names} entryType=${entry.type} testType=${test.type}`);
      expect(info.hapModulesInfo.length).assertEqual(MODULE_TOTAL);
      expect(names).assertEqual(ENTRY_MODULE + ',' + TEST_MODULE);
      expect(entry.type).assertEqual(bundleManager.ModuleType.ENTRY);
      expect(test.type).assertEqual(bundleManager.ModuleType.FEATURE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_9300
     * @tc.name      testAppCtxBundleCodePath0007
     * @tc.desc      Check the HAP module names behind the two module contexts are the declared ones and differ from the
     *               bundle name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxBundleCodePath0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entryName: string = findModule(info, ENTRY_MODULE).name;
      const testName: string = findModule(info, TEST_MODULE).name;
      logCase('testAppCtxBundleCodePath0007', `entryName=${entryName} testName=${testName} ` +
        `bundle=${BUNDLE_NAME}`);
      expect(entryName).assertEqual(ENTRY_MODULE);
      expect(testName).assertEqual(TEST_MODULE);
      expect(entryName === testName).assertFalse();
      expect(entryName === BUNDLE_NAME).assertFalse();
      expect(asciiOnly(entryName)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_9400
     * @tc.name      testAppCtxResourceText0001
     * @tc.desc      Check the module resource manager resolves the application label by name to the declared text with
     *               its declared length and without blanks
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxResourceText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const manager: resourceManager.ResourceManager = entryContext().resourceManager;
      const label: string = stringByName(manager, 'app_name');
      const abilityLabel: string = stringByName(manager, 'EntryAbility_label');
      logCase('testAppCtxResourceText0001', `label=${label} abilityLabel=${abilityLabel} ` +
        `units=${label.length}`);
      expect(label).assertEqual(APP_NAME_TEXT);
      expect(label.length).assertEqual(APP_NAME_UNITS);
      expect(abilityLabel).assertEqual(label);
      expect(hasBlank(label)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_9500
     * @tc.name      testAppCtxResourceText0002
     * @tc.desc      Check the module description resource resolves to the declared sentence with one blank and its
     *               declared length, and is not equal to the application label
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxResourceText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const description: string = stringByName(entryContext().resourceManager, 'module_desc');
      logCase('testAppCtxResourceText0002', `description=${description} units=${description.length}`);
      expect(description).assertEqual(MODULE_DESC_TEXT);
      expect(description.length).assertEqual(MODULE_DESC_UNITS);
      expect(hasBlank(description)).assertTrue();
      expect(description === APP_NAME_TEXT).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_9600
     * @tc.name      testAppCtxResourceText0003
     * @tc.desc      Check the ability description resource resolves to its declared single word with the declared
     *               length and differs from both other strings of the module
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxResourceText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const description: string = stringByName(entryContext().resourceManager, 'EntryAbility_desc');
      logCase('testAppCtxResourceText0003', `description=${description} units=${description.length}`);
      expect(description).assertEqual(ABILITY_DESC_TEXT);
      expect(description.length).assertEqual(ABILITY_DESC_UNITS);
      expect(description === APP_NAME_TEXT).assertFalse();
      expect(description === MODULE_DESC_TEXT).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_9700
     * @tc.name      testAppCtxResourceText0004
     * @tc.desc      Check the module and the application resource managers resolve the published label and description
     *               identifiers to the same texts
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxResourceText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const app: bundleManager.ApplicationInfo = info.appInfo;
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const moduleText: string = stringById(entryContext().resourceManager, app.labelId);
      const applicationText: string = stringById(appContext().resourceManager, app.labelId);
      const moduleDescription: string = stringById(entryContext().resourceManager, entry.descriptionId);
      logCase('testAppCtxResourceText0004', `module=${moduleText} application=${applicationText} ` +
        `description=${moduleDescription}`);
      expect(moduleText).assertEqual(applicationText);
      expect(moduleText).assertEqual(APP_NAME_TEXT);
      expect(moduleDescription).assertEqual(MODULE_DESC_TEXT);
      expect(applicationText.length).assertEqual(APP_NAME_UNITS);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_9800
     * @tc.name      testAppCtxResourceText0005
     * @tc.desc      Check two different module scoped resource names come back identical from the module and the
     *               application resource managers
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxResourceText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const moduleManager: resourceManager.ResourceManager = entryContext().resourceManager;
      const applicationManager: resourceManager.ResourceManager = appContext().resourceManager;
      const moduleDesc: string = stringByName(moduleManager, 'module_desc');
      const applicationDesc: string = stringByName(applicationManager, 'module_desc');
      const moduleAbilityDesc: string = stringByName(moduleManager, 'EntryAbility_desc');
      const applicationAbilityDesc: string = stringByName(applicationManager, 'EntryAbility_desc');
      logCase('testAppCtxResourceText0005', `desc=${moduleDesc} abilityDesc=${moduleAbilityDesc}`);
      expect(moduleDesc).assertEqual(applicationDesc);
      expect(moduleAbilityDesc).assertEqual(applicationAbilityDesc);
      expect(moduleDesc.length > EMPTY_LENGTH).assertTrue();
      expect(moduleAbilityDesc.length > EMPTY_LENGTH).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_9900
     * @tc.name      testAppCtxResourceText0006
     * @tc.desc      Check the invalid name code reported by the module resource manager differs from the success code
     *               and is reproduced by the application resource manager
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxResourceText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const moduleManager: resourceManager.ResourceManager = entryContext().resourceManager;
      const applicationManager: resourceManager.ResourceManager = appContext().resourceManager;
      const moduleMissing: number = resourceError(moduleManager, MISSING_RESOURCE);
      const applicationMissing: number = resourceError(applicationManager, MISSING_RESOURCE);
      logCase('testAppCtxResourceText0006', `moduleMissing=${moduleMissing} ` +
        `applicationMissing=${applicationMissing} success=${ZERO}`);
      expect(moduleMissing).assertEqual(applicationMissing);
      expect(moduleMissing).assertEqual(ERR_RES_NAME_INVALID);
      expect(moduleMissing === ZERO).assertFalse();
      expect(ERR_RES_NAME_INVALID > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_10000
     * @tc.name      testAppCtxStability0001
     * @tc.desc      Check the files and cache directories and the full directory key repeat exactly between two
     *               independent module contexts
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAppCtxStability0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const first: common.Context = moduleContext(ENTRY_MODULE);
      const second: common.Context = moduleContext(ENTRY_MODULE);
      logCase('testAppCtxStability0001', `files=${first.filesDir} cache=${first.cacheDir} ` +
        `sameKey=${dirKey(first) === dirKey(second)}`);
      expect(first.filesDir).assertEqual(second.filesDir);
      expect(first.cacheDir).assertEqual(second.cacheDir);
      expect(dirKey(first)).assertEqual(dirKey(second));
      expect(dirKey(first).length > EMPTY_LENGTH).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_10100
     * @tc.name      testAppCtxStability0002
     * @tc.desc      Check five back to back module contexts all produce the same directory key, leaving one single
     *               distinct value across the rounds
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxStability0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = [];
      for (let round: number = ZERO; round < ROUND_TOTAL; round += ONE) {
        keys.push(dirKey(moduleContext(ENTRY_MODULE)));
      }
      logCase('testAppCtxStability0002', `rounds=${keys.length} distinct=${distinctCount(keys)} ` +
        `first=${keys[ZERO]}`);
      expect(keys.length).assertEqual(ROUND_TOTAL);
      expect(distinctCount(keys)).assertEqual(ONE);
      expect(keys[ROUND_TOTAL - ONE]).assertEqual(keys[ZERO]);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_10200
     * @tc.name      testAppCtxStability0003
     * @tc.desc      Check the area mode, process name and application uid are identical in two module contexts created
     *               one after the other
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxStability0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: common.Context = moduleContext(ENTRY_MODULE);
      const second: common.Context = moduleContext(ENTRY_MODULE);
      const firstKey: string = identityKey(first);
      const secondKey: string = identityKey(second);
      logCase('testAppCtxStability0003', `first=${firstKey} second=${secondKey}`);
      expect(Number(first.area)).assertEqual(Number(second.area));
      expect(first.processName).assertEqual(second.processName);
      expect(first.applicationInfo.uid).assertEqual(second.applicationInfo.uid);
      expect(identityKey(second)).assertEqual(firstKey);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_10300
     * @tc.name      testAppCtxStability0004
     * @tc.desc      Check two consecutive reads of the application context agree on the bundle name, the uid and the
     *               whole directory key
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxStability0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: common.Context = appContext();
      const second: common.Context = appContext();
      logCase('testAppCtxStability0004', `firstKey=${dirKey(first)} secondKey=${dirKey(second)}`);
      expect(first.applicationInfo.name).assertEqual(second.applicationInfo.name);
      expect(first.applicationInfo.uid).assertEqual(second.applicationInfo.uid);
      expect(dirKey(first)).assertEqual(dirKey(second));
      expect(second.filesDir).assertEqual(first.filesDir);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_10400
     * @tc.name      testAppCtxStability0005
     * @tc.desc      Check a write and a delete inside the files directory never move the directory profile of the
     *               module context
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxStability0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const context: common.Context = entryContext();
      const before: string = dirKey(context);
      const dir: string = prepareProbe(context.filesDir, 'stable_profile');
      const path: string = joinPath(dir, 'touch.txt');
      writeTextFile(path, PAYLOAD_ALPHA);
      const written: boolean = probeExists(path);
      const removed: boolean = dropFile(path);
      const after: string = dirKey(moduleContext(ENTRY_MODULE));
      logCase('testAppCtxStability0005', `written=${written} removed=${removed} same=${before === after}`);
      expect(written).assertTrue();
      expect(removed).assertTrue();
      expect(after).assertEqual(before);
      expect(probeIsDir(context.filesDir)).assertTrue();
      expect(cleanProbe(context.filesDir, 'stable_profile')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_10500
     * @tc.name      testAppCtxStability0006
     * @tc.desc      Check creating a test module context in between does not change the directory profile of the entry
     *               module context
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxStability0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const before: string = dirKey(moduleContext(ENTRY_MODULE));
      const testKey: string = dirKey(moduleContext(TEST_MODULE));
      const after: string = dirKey(moduleContext(ENTRY_MODULE));
      logCase('testAppCtxStability0006', `before=${before} after=${after} test=${testKey}`);
      expect(after).assertEqual(before);
      expect(before === testKey).assertFalse();
      expect(after === testKey).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_10600
     * @tc.name      testAppCtxStability0007
     * @tc.desc      Check three successive resource lookups and three successive uid reads return one single value each
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxStability0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const texts: string[] = [];
      const uids: string[] = [];
      for (let round: number = ZERO; round < THREE; round += ONE) {
        const context: common.Context = moduleContext(ENTRY_MODULE);
        texts.push(stringByName(context.resourceManager, 'app_name'));
        uids.push(context.applicationInfo.uid.toString());
      }
      logCase('testAppCtxStability0007', `texts=${texts.join(PIPE)} uids=${uids.join(PIPE)}`);
      expect(distinctCount(texts)).assertEqual(ONE);
      expect(distinctCount(uids)).assertEqual(ONE);
      expect(texts[ZERO]).assertEqual(APP_NAME_TEXT);
      expect(Number(uids[ZERO])).assertEqual(process.uid);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_10700
     * @tc.name      testAppCtxStability0008
     * @tc.desc      Check two module contexts built from the own bundle name report the same files directory and the
     *               same bundle identity
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxStability0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const first: GuardedContext = captureBundle(BUNDLE_NAME);
      const second: GuardedContext = captureBundle(BUNDLE_NAME);
      logCase('testAppCtxStability0008', `first=${first.filesDir} second=${second.filesDir} ` +
        `appName=${first.appName}`);
      expect(first.threw).assertFalse();
      expect(second.threw).assertFalse();
      expect(first.filesDir).assertEqual(second.filesDir);
      expect(first.appName).assertEqual(second.appName);
      expect(isAbsolutePath(second.filesDir)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_10800
     * @tc.name      testAppCtxAreaModeContext0001
     * @tc.desc      Check an EL2 area mode context built from the module context reports the EL2 partition and a data
     *               directory different from the EL1 one
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxAreaModeContext0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const guarded: GuardedContext = captureArea(contextConstant.AreaMode.EL2);
      const el1Files: string = entryContext().filesDir;
      logCase('testAppCtxAreaModeContext0001', `threw=${guarded.threw} code=${guarded.code} ` +
        `area=${guarded.area} filesDir=${guarded.filesDir}`);
      expect(guarded.threw).assertFalse();
      expect(guarded.area).assertEqual(Number(contextConstant.AreaMode.EL2));
      expect(isAbsolutePath(guarded.filesDir)).assertTrue();
      expect(guarded.filesDir === el1Files).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_10900
     * @tc.name      testAppCtxAreaModeContext0002
     * @tc.desc      Check an EL1 area mode context resolves to the very files directory of the module context and that
     *               the directory is present
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAppCtxAreaModeContext0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const guarded: GuardedContext = captureArea(contextConstant.AreaMode.EL1);
      const plain: common.Context = entryContext();
      logCase('testAppCtxAreaModeContext0002', `area=${guarded.area} filesDir=${guarded.filesDir} ` +
        `plainFiles=${plain.filesDir}`);
      expect(guarded.threw).assertFalse();
      expect(guarded.area).assertEqual(Number(contextConstant.AreaMode.EL1));
      expect(guarded.filesDir).assertEqual(plain.filesDir);
      expect(probeIsDir(guarded.filesDir)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_11000
     * @tc.name      testAppCtxAreaModeContext0003
     * @tc.desc      Check the EL2 and EL1 area mode contexts still describe the same application identity while living
     *               in different partitions
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxAreaModeContext0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const second: GuardedContext = captureArea(contextConstant.AreaMode.EL2);
      const first: GuardedContext = captureArea(contextConstant.AreaMode.EL1);
      logCase('testAppCtxAreaModeContext0003', `firstUid=${first.uid} secondUid=${second.uid} ` +
        `firstArea=${first.area} secondArea=${second.area}`);
      expect(first.threw).assertFalse();
      expect(second.threw).assertFalse();
      expect(second.uid).assertEqual(first.uid);
      expect(second.processName).assertEqual(first.processName);
      expect(second.appName).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_APPCONTEXT_11100
     * @tc.name      testAppCtxAreaModeContext0004
     * @tc.desc      Check an undocumented area value is refused with a positive business code while the documented EL1
     *               value keeps working
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAppCtxAreaModeContext0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const invalid: GuardedContext = captureArea(INVALID_AREA as contextConstant.AreaMode);
      const valid: GuardedContext = captureArea(contextConstant.AreaMode.EL1);
      const plain: common.Context = entryContext();
      logCase('testAppCtxAreaModeContext0004', `invalidThrew=${invalid.threw} invalidCode=${invalid.code} ` +
        `invalidArea=${invalid.area} validArea=${valid.area}`);
      expect(invalid.threw || invalid.appName === BUNDLE_NAME).assertTrue();
      expect(invalid.threw ? invalid.code > ZERO : invalid.filesDir.length > ZERO).assertTrue();
      expect(valid.threw).assertFalse();
      expect(valid.code).assertEqual(ZERO);
      expect(valid.area).assertEqual(contextConstant.AreaMode.EL1);
      expect(valid.filesDir).assertEqual(plain.filesDir);
    });

  });
}
