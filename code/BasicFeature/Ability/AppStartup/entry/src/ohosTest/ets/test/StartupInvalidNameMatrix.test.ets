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

import { afterAll, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { startupManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ensureEntryStarted, errorOf, resetBaseline, runResult, taskStates } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppStartup]';
const NOT_FOUND: string = '28800001:startup task or its dependency not found.';

export default function startupInvalidNameMatrixTest(): void {
  describe('AppStartupStartupInvalidNameMatrixTest', () => {
    beforeAll(async (done: Function) => {
      await ensureEntryStarted();
      await resetBaseline();
      done();
    })

    afterAll(async (done: Function) => {
      await resetBaseline();
      done();
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0001
     * @tc.name      testStartupInvalidNameMatrix0001
     * @tc.desc      非法任务名 中间空格 "Image Knife"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupInvalidNameMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0001 begin');
      await resetBaseline();
      const name: string = 'Image Knife';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0001 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0002
     * @tc.name      testStartupInvalidNameMatrix0002
     * @tc.desc      非法任务名 去掉 Task "ImageKnife"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupInvalidNameMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0002 begin');
      await resetBaseline();
      const name: string = 'ImageKnife';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0002 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0003
     * @tc.name      testStartupInvalidNameMatrix0003
     * @tc.desc      非法任务名 只有 Task "Task"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupInvalidNameMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0003 begin');
      await resetBaseline();
      const name: string = 'Task';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0003 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0004
     * @tc.name      testStartupInvalidNameMatrix0004
     * @tc.desc      非法任务名 去掉 Task 的 FileTask "File"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupInvalidNameMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0004 begin');
      await resetBaseline();
      const name: string = 'File';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0004 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0005
     * @tc.name      testStartupInvalidNameMatrix0005
     * @tc.desc      非法任务名 全大写 "IMAGEKNIFETASK"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupInvalidNameMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0005 begin');
      await resetBaseline();
      const name: string = 'IMAGEKNIFETASK';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0005 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0006
     * @tc.name      testStartupInvalidNameMatrix0006
     * @tc.desc      非法任务名 全小写 "imageknifetask"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupInvalidNameMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0006 begin');
      await resetBaseline();
      const name: string = 'imageknifetask';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0006 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0007
     * @tc.name      testStartupInvalidNameMatrix0007
     * @tc.desc      非法任务名 前导制表符 "	ImageKnifeTask"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupInvalidNameMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0007 begin');
      await resetBaseline();
      const name: string = '\tImageKnifeTask';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0007 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0008
     * @tc.name      testStartupInvalidNameMatrix0008
     * @tc.desc      非法任务名 前导换行 "
ImageKnifeTask"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupInvalidNameMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0008 begin');
      await resetBaseline();
      const name: string = '\nImageKnifeTask';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0008 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0009
     * @tc.name      testStartupInvalidNameMatrix0009
     * @tc.desc      非法任务名 尾随换行 "ImageKnifeTask
"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupInvalidNameMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0009 begin');
      await resetBaseline();
      const name: string = 'ImageKnifeTask\n';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0009 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0010
     * @tc.name      testStartupInvalidNameMatrix0010
     * @tc.desc      非法任务名 尾随制表符 "ImageKnifeTask	"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupInvalidNameMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0010 begin');
      await resetBaseline();
      const name: string = 'ImageKnifeTask\t';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0010 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0011
     * @tc.name      testStartupInvalidNameMatrix0011
     * @tc.desc      非法任务名 尾随全角空格 "ImageKnifeTask　"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0011 begin');
      await resetBaseline();
      const name: string = 'ImageKnifeTask　';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0011 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0012
     * @tc.name      testStartupInvalidNameMatrix0012
     * @tc.desc      非法任务名 尾随不间断空格 "ImageKnifeTask "：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0012 begin');
      await resetBaseline();
      const name: string = 'ImageKnifeTask ';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0012 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0013
     * @tc.name      testStartupInvalidNameMatrix0013
     * @tc.desc      非法任务名 单字母 "a"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0013 begin');
      await resetBaseline();
      const name: string = 'a';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0013 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0014
     * @tc.name      testStartupInvalidNameMatrix0014
     * @tc.desc      非法任务名 超长名字 "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0014 begin');
      await resetBaseline();
      const name: string = 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0014 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0015
     * @tc.name      testStartupInvalidNameMatrix0015
     * @tc.desc      非法任务名 含尖括号 "<script>"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0015 begin');
      await resetBaseline();
      const name: string = '<script>';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0015 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0016
     * @tc.name      testStartupInvalidNameMatrix0016
     * @tc.desc      非法任务名 含双引号 "ImageKnifeTask""：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0016 begin');
      await resetBaseline();
      const name: string = 'ImageKnifeTask"';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0016 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0017
     * @tc.name      testStartupInvalidNameMatrix0017
     * @tc.desc      非法任务名 含反斜杠 "ImageKnifeTask\"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0017 begin');
      await resetBaseline();
      const name: string = 'ImageKnifeTask\\';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0017 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0018
     * @tc.name      testStartupInvalidNameMatrix0018
     * @tc.desc      非法任务名 含正斜杠 "ImageKnifeTask/"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0018 begin');
      await resetBaseline();
      const name: string = 'ImageKnifeTask/';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0018 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0019
     * @tc.name      testStartupInvalidNameMatrix0019
     * @tc.desc      非法任务名 带扩展名 "ImageKnifeTask.ets"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0019 begin');
      await resetBaseline();
      const name: string = 'ImageKnifeTask.ets';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0019 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0020
     * @tc.name      testStartupInvalidNameMatrix0020
     * @tc.desc      非法任务名 带目录前缀 "entry/ImageKnifeTask"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0020 begin');
      await resetBaseline();
      const name: string = 'entry/ImageKnifeTask';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0020 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0021
     * @tc.name      testStartupInvalidNameMatrix0021
     * @tc.desc      非法任务名 启动配置入口 "StartupConfig"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0021 begin');
      await resetBaseline();
      const name: string = 'StartupConfig';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0021 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0022
     * @tc.name      testStartupInvalidNameMatrix0022
     * @tc.desc      非法任务名 启动配置带扩展名 "StartupConfig.ets"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0022 begin');
      await resetBaseline();
      const name: string = 'StartupConfig.ets';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0022 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0023
     * @tc.name      testStartupInvalidNameMatrix0023
     * @tc.desc      非法任务名 UIAbility 名 "EntryAbility"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0023 begin');
      await resetBaseline();
      const name: string = 'EntryAbility';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0023 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0024
     * @tc.name      testStartupInvalidNameMatrix0024
     * @tc.desc      非法任务名 测试 Ability 名 "TestAbility"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0024 begin');
      await resetBaseline();
      const name: string = 'TestAbility';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0024 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0025
     * @tc.name      testStartupInvalidNameMatrix0025
     * @tc.desc      非法任务名 字面量 undefined "undefined"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0025 begin');
      await resetBaseline();
      const name: string = 'undefined';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0025 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0026
     * @tc.name      testStartupInvalidNameMatrix0026
     * @tc.desc      非法任务名 字面量 null "null"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0026 begin');
      await resetBaseline();
      const name: string = 'null';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0026 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0027
     * @tc.name      testStartupInvalidNameMatrix0027
     * @tc.desc      非法任务名 字面量 true "true"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0027 begin');
      await resetBaseline();
      const name: string = 'true';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0027 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0028
     * @tc.name      testStartupInvalidNameMatrix0028
     * @tc.desc      非法任务名 数字 0 "0"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0028 begin');
      await resetBaseline();
      const name: string = '0';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0028 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0029
     * @tc.name      testStartupInvalidNameMatrix0029
     * @tc.desc      非法任务名 负数 "-1"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0029 begin');
      await resetBaseline();
      const name: string = '-1';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0029 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0030
     * @tc.name      testStartupInvalidNameMatrix0030
     * @tc.desc      非法任务名 逗号分隔两个任务 "ImageKnifeTask,Res"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0030 begin');
      await resetBaseline();
      const name: string = 'ImageKnifeTask,Res';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0030 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0031
     * @tc.name      testStartupInvalidNameMatrix0031
     * @tc.desc      非法任务名 方括号包裹 "[ImageKnifeTask]"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0031 begin');
      await resetBaseline();
      const name: string = '[ImageKnifeTask]';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0031 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0032
     * @tc.name      testStartupInvalidNameMatrix0032
     * @tc.desc      非法任务名 通配符包裹 "*ImageKnifeTask*"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0032 begin');
      await resetBaseline();
      const name: string = '*ImageKnifeTask*';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0032 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0033
     * @tc.name      testStartupInvalidNameMatrix0033
     * @tc.desc      非法任务名 中文后缀 "ImageKnifeTask中文"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0033 begin');
      await resetBaseline();
      const name: string = 'ImageKnifeTask中文';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0033 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0034
     * @tc.name      testStartupInvalidNameMatrix0034
     * @tc.desc      非法任务名 纯中文 "任务"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0034 begin');
      await resetBaseline();
      const name: string = '任务';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0034 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_INVALID_NAME_0035
     * @tc.name      testStartupInvalidNameMatrix0035
     * @tc.desc      非法任务名 emoji "😀"：查询/移除/运行都失败
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupInvalidNameMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0035 begin');
      await resetBaseline();
      const name: string = '😀';
      const actual1: string = errorOf(() => startupManager.isStartupTaskInitialized(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401');
      const actual2: string = errorOf(() => startupManager.removeStartupTaskResult(name));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401');
      const actual3: string | number | boolean = await runResult([name]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(NOT_FOUND);
      const actual4: string = taskStates();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('false,true,true,true,true,true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupInvalidNameMatrix0035 end');
    })
  })
}
