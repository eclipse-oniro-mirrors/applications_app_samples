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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { resourceManager } from '@kit.LocalizationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TestContextHolder } from '../utils/TestContextHolder';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';
/** Module that owns the resources exercised here. */
const APP_MODULE: string = 'entry';
const KEY_TEST_STRING: string = 'test_string';
const KEY_TITLE: string = 'title';
const KEY_WORLD: string = 'world';
const KEY_FORMAT: string = 'formatStr';
const KEY_ARRAY: string = 'str_array';
const KEY_PLURAL: string = 'eat_apple';
const KEY_MISSING: string = '__missing__';
/** Key declared by the ohosTest module only, used to prove the module boundary. */
const TEST_ONLY_DESC: string = 'module_test_desc';
/**
 * Every value test_string may take. The three resource files of the sample are
 * base/base_test, zh_CN/测试 and en_US/en_US_test, so the resolved value must be
 * one of them whatever the display language is.
 */
const SPEC_TEST_STRINGS: string[] = ['base_test', '测试', 'en_US_test'];
/** Longest plausible single word resource. */
const MAX_WORD_LENGTH: number = 32;

function appManager(): resourceManager.ResourceManager {
  return TestContextHolder.resourceManagerOf(APP_MODULE);
}

/** BusinessError code of a failing read, 0 when the read succeeded. */
async function failureCodeOf(read: () => Promise<string>): Promise<number> {
  try {
    await read();
    return 0;
  } catch (error) {
    return (error as BusinessError).code;
  }
}

/**
 * Reads the string, plural and string array resources of the module under test
 * through a stage-mode module context, so the assertions run against the real
 * resource pipeline instead of the fail-soft sentinels.
 */
export default function appResAccessReal01Test() {
  describe('AppResAccessReal01Test', () => {
    beforeAll(async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'AppResAccessReal01Test begin');
    });

    /**
     * @tc.name   testAppRes0001
     * @tc.number SUB_RESMGR_APP_RES_0001
     * @tc.desc   持有 stageMode 上下文，可创建 entry 模块上下文并取到 ResourceManager
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0001 begin');
      const context: common.UIAbilityContext | null = TestContextHolder.get();
      expect(context !== null).assertTrue();
      if (context !== null) {
        const moduleContext: common.Context = context.createModuleContext(APP_MODULE);
        expect(moduleContext.resourceManager !== undefined).assertTrue();
        expect(moduleContext.filesDir.length > 0).assertTrue();
      }
    });

    /**
     * @tc.name   testAppRes0002
     * @tc.number SUB_RESMGR_APP_RES_0002
     * @tc.desc   test_string 取值非空、无首尾空白且长度在单词范围内
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0002 begin');
      const value: string = await appManager().getStringByName(KEY_TEST_STRING);
      expect(value.length > 0).assertTrue();
      expect(value).assertEqual(value.trim());
      expect(value.length <= MAX_WORD_LENGTH).assertTrue();
    });

    /**
     * @tc.name   testAppRes0003
     * @tc.number SUB_RESMGR_APP_RES_0003
     * @tc.desc   test_string 取值命中 base/zh_CN/en_US 三份资源文件之一
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0003 begin');
      const value: string = await appManager().getStringByName(KEY_TEST_STRING);
      let matched: number = 0;
      for (let index: number = 0; index < SPEC_TEST_STRINGS.length; index++) {
        if (SPEC_TEST_STRINGS[index] === value) {
          matched++;
        }
      }
      expect(matched).assertEqual(1);
      expect(SPEC_TEST_STRINGS.indexOf(value) >= 0).assertTrue();
      expect(value.length > 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes0004
     * @tc.number SUB_RESMGR_APP_RES_0004
     * @tc.desc   title 取值非空、无首尾空白，且与 test_string 是两个不同资源
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0004 begin');
      const title: string = await appManager().getStringByName(KEY_TITLE);
      const testString: string = await appManager().getStringByName(KEY_TEST_STRING);
      expect(title.length > 0).assertTrue();
      expect(title).assertEqual(title.trim());
      expect(title === testString).assertFalse();
    });

    /**
     * @tc.name   testAppRes0005
     * @tc.number SUB_RESMGR_APP_RES_0005
     * @tc.desc   world 取值非空、无首尾空白，且与 title 不同
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0005 begin');
      const world: string = await appManager().getStringByName(KEY_WORLD);
      const title: string = await appManager().getStringByName(KEY_TITLE);
      expect(world.length > 0).assertTrue();
      expect(world).assertEqual(world.trim());
      expect(world === title).assertFalse();
    });

    /**
     * @tc.name   testAppRes0006
     * @tc.number SUB_RESMGR_APP_RES_0006
     * @tc.desc   title、world、test_string 三个字符串资源两两不相等
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0006 begin');
      const title: string = await appManager().getStringByName(KEY_TITLE);
      const world: string = await appManager().getStringByName(KEY_WORLD);
      const testString: string = await appManager().getStringByName(KEY_TEST_STRING);
      expect(title === world).assertFalse();
      expect(title === testString).assertFalse();
      expect(world === testString).assertFalse();
    });

    /**
     * @tc.name   testAppRes0007
     * @tc.number SUB_RESMGR_APP_RES_0007
     * @tc.desc   test_string 的异步接口与同步接口返回同一取值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0007 begin');
      const manager: resourceManager.ResourceManager = appManager();
      const asyncValue: string = await manager.getStringByName(KEY_TEST_STRING);
      const syncValue: string = manager.getStringByNameSync(KEY_TEST_STRING);
      expect(syncValue).assertEqual(asyncValue);
      expect(syncValue.length).assertEqual(asyncValue.length);
      expect(syncValue.length > 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes0008
     * @tc.number SUB_RESMGR_APP_RES_0008
     * @tc.desc   test_string 连续两次异步读取结果稳定
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0008 begin');
      const first: string = await appManager().getStringByName(KEY_TEST_STRING);
      const second: string = await appManager().getStringByName(KEY_TEST_STRING);
      expect(second).assertEqual(first);
      expect(second.length).assertEqual(first.length);
      expect(first.length > 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes0009
     * @tc.number SUB_RESMGR_APP_RES_0009
     * @tc.desc   formatStr 原始取值保留 %s 占位符，说明资源未被提前格式化
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0009 begin');
      const raw: string = await appManager().getStringByName(KEY_FORMAT);
      expect(raw.indexOf('%s') >= 0).assertTrue();
      expect(raw.length > 2).assertTrue();
      expect(raw).assertEqual(raw.trim());
    });

    /**
     * @tc.name   testAppRes0010
     * @tc.number SUB_RESMGR_APP_RES_0010
     * @tc.desc   formatStr 带实参格式化后占位符被替换，实参出现在结果中
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0010 begin');
      const formatted: string = appManager().getStringByNameSync(KEY_FORMAT, 'alpha');
      expect(formatted.indexOf('%s') === -1).assertTrue();
      expect(formatted.indexOf('alpha') >= 0).assertTrue();
      expect(formatted.length > 'alpha'.length).assertTrue();
    });

    /**
     * @tc.name   testAppRes0011
     * @tc.number SUB_RESMGR_APP_RES_0011
     * @tc.desc   格式化结果与原始资源不同，且原始资源仍含占位符
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0011 begin');
      const manager: resourceManager.ResourceManager = appManager();
      const raw: string = manager.getStringByNameSync(KEY_FORMAT);
      const formatted: string = manager.getStringByNameSync(KEY_FORMAT, 'beta');
      expect(formatted === raw).assertFalse();
      expect(formatted.indexOf('beta') >= 0).assertTrue();
      expect(raw.indexOf('%s') >= 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes0012
     * @tc.number SUB_RESMGR_APP_RES_0012
     * @tc.desc   同一模板换实参后结果不同，两个实参各自出现在对应结果里
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0012 begin');
      const manager: resourceManager.ResourceManager = appManager();
      const first: string = manager.getStringByNameSync(KEY_FORMAT, 'one');
      const second: string = manager.getStringByNameSync(KEY_FORMAT, 'two');
      expect(first === second).assertFalse();
      expect(first.indexOf('one') >= 0).assertTrue();
      expect(second.indexOf('two') >= 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes0013
     * @tc.number SUB_RESMGR_APP_RES_0013
     * @tc.desc   空实参格式化后仍无占位符、结果非空且无首尾空白
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0013 begin');
      const formatted: string = appManager().getStringByNameSync(KEY_FORMAT, '');
      expect(formatted.indexOf('%s') === -1).assertTrue();
      expect(formatted.length > 0).assertTrue();
      expect(formatted).assertEqual(formatted.trim());
    });

    /**
     * @tc.name   testAppRes0014
     * @tc.number SUB_RESMGR_APP_RES_0014
     * @tc.desc   str_array 是三个元素的字符串数组，首元素可读
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0014 begin');
      const values: string[] = await appManager().getStringArrayByName(KEY_ARRAY);
      expect(values.length).assertEqual(3);
      expect(values[0] !== undefined).assertTrue();
      expect(values[values.length - 1] !== undefined).assertTrue();
    });

    /**
     * @tc.name   testAppRes0015
     * @tc.number SUB_RESMGR_APP_RES_0015
     * @tc.desc   str_array 三个元素两两不相等
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0015 begin');
      const values: string[] = await appManager().getStringArrayByName(KEY_ARRAY);
      expect(values[0] === values[1]).assertFalse();
      expect(values[1] === values[2]).assertFalse();
      expect(values[0] === values[2]).assertFalse();
    });

    /**
     * @tc.name   testAppRes0016
     * @tc.number SUB_RESMGR_APP_RES_0016
     * @tc.desc   str_array 三个元素都非空且无首尾空白
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0016 begin');
      const values: string[] = await appManager().getStringArrayByName(KEY_ARRAY);
      let trimmedCount: number = 0;
      for (let index: number = 0; index < values.length; index++) {
        if (values[index].length > 0 && values[index] === values[index].trim()) {
          trimmedCount++;
        }
      }
      expect(trimmedCount).assertEqual(values.length);
      expect(trimmedCount).assertEqual(3);
      expect(trimmedCount > 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes0017
     * @tc.number SUB_RESMGR_APP_RES_0017
     * @tc.desc   str_array 连续两次读取元素一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0017 begin');
      const first: string[] = await appManager().getStringArrayByName(KEY_ARRAY);
      const second: string[] = await appManager().getStringArrayByName(KEY_ARRAY);
      expect(second.length).assertEqual(first.length);
      expect(second[0]).assertEqual(first[0]);
      expect(second[2]).assertEqual(first[2]);
    });

    /**
     * @tc.name   testAppRes0018
     * @tc.number SUB_RESMGR_APP_RES_0018
     * @tc.desc   str_array 元素长度都在 1..32 之间且最长不短于最短
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0018 begin');
      const values: string[] = await appManager().getStringArrayByName(KEY_ARRAY);
      let shortest: number = MAX_WORD_LENGTH + 1;
      let longest: number = 0;
      for (let index: number = 0; index < values.length; index++) {
        const length: number = values[index].length;
        if (length < shortest) {
          shortest = length;
        }
        if (length > longest) {
          longest = length;
        }
      }
      expect(shortest > 0).assertTrue();
      expect(longest <= MAX_WORD_LENGTH).assertTrue();
      expect(longest >= shortest).assertTrue();
    });

    /**
     * @tc.name   testAppRes0019
     * @tc.number SUB_RESMGR_APP_RES_0019
     * @tc.desc   eat_apple 在数量 1 时结果以数字 1 开头
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0019 begin');
      const one: string = await appManager().getPluralStringByName(KEY_PLURAL, 1);
      const head: number = one.charCodeAt(0);
      expect(head >= 48 && head <= 57).assertTrue();
      expect(one.indexOf('1')).assertEqual(0);
      expect(one.length > 1).assertTrue();
    });

    /**
     * @tc.name   testAppRes0020
     * @tc.number SUB_RESMGR_APP_RES_0020
     * @tc.desc   eat_apple 在数量 2 时结果以数字 2 开头且无首尾空白
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0020 begin');
      const two: string = await appManager().getPluralStringByName(KEY_PLURAL, 2);
      expect(two.indexOf('2')).assertEqual(0);
      expect(two).assertEqual(two.trim());
      expect(two.length > 1).assertTrue();
    });

    /**
     * @tc.name   testAppRes0021
     * @tc.number SUB_RESMGR_APP_RES_0021
     * @tc.desc   数量 1 与 2 的复数结果不同，两者都非空
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0021 begin');
      const one: string = await appManager().getPluralStringByName(KEY_PLURAL, 1);
      const two: string = await appManager().getPluralStringByName(KEY_PLURAL, 2);
      expect(one === two).assertFalse();
      expect(one.length > 0).assertTrue();
      expect(two.length > 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes0022
     * @tc.number SUB_RESMGR_APP_RES_0022
     * @tc.desc   eat_apple 在数量 0 时结果含 '0' 且占位符已被替换
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0022 begin');
      const zero: string = await appManager().getPluralStringByName(KEY_PLURAL, 0);
      expect(zero.indexOf('0') >= 0).assertTrue();
      expect(zero.indexOf('%d') === -1).assertTrue();
      expect(zero.length > 1).assertTrue();
    });

    /**
     * @tc.name   testAppRes0023
     * @tc.number SUB_RESMGR_APP_RES_0023
     * @tc.desc   数量 1 的结果不含 %d 占位符，且与数量 0 的结果不同
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0023 begin');
      const one: string = await appManager().getPluralStringByName(KEY_PLURAL, 1);
      const zero: string = await appManager().getPluralStringByName(KEY_PLURAL, 0);
      expect(one.indexOf('%d') === -1).assertTrue();
      expect(one === zero).assertFalse();
      expect(one.length > 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes0024
     * @tc.number SUB_RESMGR_APP_RES_0024
     * @tc.desc   数量 1000 的结果以 '1000' 开头，且与数量 1 不同
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0024 begin');
      const many: string = await appManager().getPluralStringByName(KEY_PLURAL, 1000);
      const one: string = await appManager().getPluralStringByName(KEY_PLURAL, 1);
      expect(many.indexOf('1000')).assertEqual(0);
      expect(many.length > 4).assertTrue();
      expect(many === one).assertFalse();
    });

    /**
     * @tc.name   testAppRes0025
     * @tc.number SUB_RESMGR_APP_RES_0025
     * @tc.desc   数量 0..3 的复数结果全部以数字开头
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0025 begin');
      let numericHeads: number = 0;
      for (let quantity: number = 0; quantity < 4; quantity++) {
        const value: string = await appManager().getPluralStringByName(KEY_PLURAL, quantity);
        if (value.length > 0) {
          const head: number = value.charCodeAt(0);
          if (head >= 48 && head <= 57) {
            numericHeads++;
          }
        }
      }
      expect(numericHeads).assertEqual(4);
      expect(numericHeads > 0).assertTrue();
      expect(numericHeads <= 4).assertTrue();
    });

    /**
     * @tc.name   testAppRes0026
     * @tc.number SUB_RESMGR_APP_RES_0026
     * @tc.desc   同一数量连续三次读取复数结果一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0026 begin');
      const first: string = await appManager().getPluralStringByName(KEY_PLURAL, 2);
      const second: string = await appManager().getPluralStringByName(KEY_PLURAL, 2);
      const third: string = await appManager().getPluralStringByName(KEY_PLURAL, 2);
      expect(second).assertEqual(first);
      expect(third).assertEqual(first);
      expect(first.length > 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes0027
     * @tc.number SUB_RESMGR_APP_RES_0027
     * @tc.desc   读取不存在的字符串资源失败并返回正的 BusinessError 码
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0027 begin');
      const code: number = await failureCodeOf(async () => {
        return await appManager().getStringByName(KEY_MISSING);
      });
      expect(code !== 0).assertTrue();
      expect(code > 0).assertTrue();
      expect(Number.isInteger(code)).assertTrue();
    });

    /**
     * @tc.name   testAppRes0028
     * @tc.number SUB_RESMGR_APP_RES_0028
     * @tc.desc   读取不存在的字符串数组资源失败并返回整数错误码
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0028 begin');
      let code: number = 0;
      try {
        await appManager().getStringArrayByName(KEY_MISSING);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      expect(code > 0).assertTrue();
      expect(code !== 0).assertTrue();
      expect(Number.isInteger(code)).assertTrue();
    });

    /**
     * @tc.name   testAppRes0029
     * @tc.number SUB_RESMGR_APP_RES_0029
     * @tc.desc   用空资源名读取字符串失败，正常资源名仍可读
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0029 begin');
      const emptyCode: number = await failureCodeOf(async () => {
        return await appManager().getStringByName('');
      });
      const normal: string = await appManager().getStringByName(KEY_TEST_STRING);
      expect(emptyCode > 0).assertTrue();
      expect(normal.length > 0).assertTrue();
      expect(emptyCode !== 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes0030
     * @tc.number SUB_RESMGR_APP_RES_0030
     * @tc.desc   test_string 首末字符都不是控制字符或空白
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0030 begin');
      const value: string = await appManager().getStringByName(KEY_TEST_STRING);
      const head: number = value.charCodeAt(0);
      const tail: number = value.charCodeAt(value.length - 1);
      expect(head > 32).assertTrue();
      expect(tail > 32).assertTrue();
      expect(value.length > 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes0031
     * @tc.number SUB_RESMGR_APP_RES_0031
     * @tc.desc   entry 模块读不到只在测试模块声明的键，但能读到自身 title，说明模块上下文只暴露被测模块资源
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0031 begin');
      const testOnlyCode: number = await failureCodeOf(async () => {
        return await appManager().getStringByName(TEST_ONLY_DESC);
      });
      const appTitle: string = await appManager().getStringByName(KEY_TITLE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'test-only key code=%{public}d title=[%{public}s]', testOnlyCode, appTitle);
      expect(testOnlyCode > 0).assertTrue();
      expect(Number.isInteger(testOnlyCode)).assertTrue();
      expect(appTitle.length > 0).assertTrue();
      expect(appTitle).assertEqual(appTitle.trim());
    });

    /**
     * @tc.name   testAppRes0032
     * @tc.number SUB_RESMGR_APP_RES_0032
     * @tc.desc   测试能力自带的上下文与显式 entry 模块上下文读取同名资源得到同一取值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0032 begin');
      const context: common.UIAbilityContext | null = TestContextHolder.get();
      let contextValue: string = '';
      if (context !== null) {
        try {
          contextValue = await context.resourceManager.getStringByName(KEY_TEST_STRING);
        } catch (error) {
          contextValue = '';
        }
      }
      const appValue: string = await appManager().getStringByName(KEY_TEST_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'context=[%{public}s] module=[%{public}s]', contextValue, appValue);
      expect(contextValue).assertEqual(appValue);
      expect(SPEC_TEST_STRINGS.indexOf(appValue) >= 0).assertTrue();
      expect(appValue.length > 0).assertTrue();
      expect(contextValue.length > 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes0033
     * @tc.number SUB_RESMGR_APP_RES_0033
     * @tc.desc   title 与 testResources 是不同资源，且后者非空无首尾空白
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0033 begin');
      const title: string = await appManager().getStringByName(KEY_TITLE);
      const resources: string = await appManager().getStringByName('testResources');
      expect(title === resources).assertFalse();
      expect(resources.length > 0).assertTrue();
      expect(resources).assertEqual(resources.trim());
    });

    /**
     * @tc.name   testAppRes0034
     * @tc.number SUB_RESMGR_APP_RES_0034
     * @tc.desc   world 在两个模块中都有定义，被测模块取值非空
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes0034 begin');
      const context: common.UIAbilityContext | null = TestContextHolder.get();
      let testModuleWorld: string = '';
      if (context !== null) {
        try {
          testModuleWorld = await context.resourceManager.getStringByName(KEY_WORLD);
        } catch (error) {
          testModuleWorld = '';
        }
      }
      const appWorld: string = await appManager().getStringByName(KEY_WORLD);
      expect(appWorld.length > 0).assertTrue();
      expect(testModuleWorld.length > 0).assertTrue();
      expect(appWorld).assertEqual(appWorld.trim());
    });
  });
}
