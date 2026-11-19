/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { errorManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { sleep } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityRuntime]';

function newErrorObserver(record: string[]): errorManager.ErrorObserver {
  return {
    onUnhandledException(message: string) {
      record.push(message);
    }
  };
}

/** 与 ErrorManager 页的 LoopObserver 写法一致。 */
function newLoopObserver(record: number[]): errorManager.LoopObserver {
  return {
    onLoopTimeOut(timeout: number) {
      record.push(timeout);
    }
  };
}

/** 与 ErrorManager 页的 UnhandledRejectionObserver 写法一致。 */
function newRejectionObserver(record: string[]): errorManager.UnhandledRejectionObserver {
  return (reason: Error, promise: Promise<void>) => {
    record.push(reason.message);
  };
}

function newFreezeObserver(record: string[]): errorManager.FreezeObserver {
  return () => {
    record.push('freeze');
  };
}

/** 与 ErrorManager 页“模拟UnhandledRejection”按钮一样，产生一个没人处理的 reject。 */
function rejectWithoutHandler(message: string): void {
  Promise.reject(new Error(message));
}

function blockMainThread(timeMs: number): void {
  const end: number = Date.now() + timeMs;
  while (Date.now() < end) {
  }
}

export default function errorManagerMatrixTest(): void {
  describe('AbilityRuntimeErrorManagerMatrixTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0001
     * @tc.name      testErrorManagerMatrix0001
     * @tc.desc      on('error') 返回非负整数 id，off(promise) 注销成功
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testErrorManagerMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0001 begin');
      const id: number = errorManager.on('error', newErrorObserver([]));
      const actual1: boolean = Number.isInteger(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = id >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      let code: number = 0;
      try {
        await errorManager.off('error', id);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 code=${code}`);
      expect(code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0002
     * @tc.name      testErrorManagerMatrix0002
     * @tc.desc      连续两次 on('error') 得到不同 id，分别注销都成功
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testErrorManagerMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0002 begin');
      const first: number = errorManager.on('error', newErrorObserver([]));
      const second: number = errorManager.on('error', newErrorObserver([]));
      await errorManager.off('error', first);
      await errorManager.off('error', second);
      const actual1: boolean = first === second;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: boolean = first >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = second >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0003
     * @tc.name      testErrorManagerMatrix0003
     * @tc.desc      off('error', id, callback) 注销成功，回调里没有错误
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testErrorManagerMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0003 begin');
      const id: number = errorManager.on('error', newErrorObserver([]));
      const code: number = await new Promise<number>((resolve: (value: number) => void) => {
        errorManager.off('error', id, (err: BusinessError) => resolve(err ? err.code : 0));
      });
      const actual1: boolean = id >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(0);
      const actual3: boolean = Number.isInteger(id);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0004
     * @tc.name      testErrorManagerMatrix0004
     * @tc.desc      同一个 id 注销两次：第二次以 401 拒绝
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testErrorManagerMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0004 begin');
      const id: number = errorManager.on('error', newErrorObserver([]));
      await errorManager.off('error', id);
      const actual1: boolean = id >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      let code: number = 0;
      try {
        await errorManager.off('error', id);
      } catch (error) {
        code = (error as BusinessError).code;
        expect(code).assertEqual(401);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0005
     * @tc.name      testErrorManagerMatrix0005
     * @tc.desc      注销从未注册过的 id 以 401 拒绝
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testErrorManagerMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0005 begin');
      const id: number = 987654;
      const actual1: boolean = id > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      let code: number = 0;
      try {
        await errorManager.off('error', id);
      } catch (error) {
        code = (error as BusinessError).code;
        expect(code).assertEqual(401);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0006
     * @tc.name      testErrorManagerMatrix0006
     * @tc.desc      注销从未注册过的 id（callback 形式）回调收到 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testErrorManagerMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0006 begin');
      const code: number = await new Promise<number>((resolve: (value: number) => void) => {
        errorManager.off('error', 987655, (err: BusinessError) => resolve(err ? err.code : 0));
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(401);
      const actual2: boolean = code === 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0007
     * @tc.name      testErrorManagerMatrix0007
     * @tc.desc      页面同款：on('loopObserver', 20, observer) 注册与 off('loopObserver') 注销都不抛异常，注销后阻塞也不回调
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testErrorManagerMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0007 begin');
      let thrown: boolean = false;
      const record: number[] = [];
      try {
        errorManager.on('loopObserver', 20, newLoopObserver(record));
        errorManager.off('loopObserver');
      } catch (error) {
        thrown = true;
      }
      blockMainThread(200);
      await sleep(500);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 thrown=${thrown}`);
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 record.length=${record.length}`);
      expect(record.length).assertEqual(0);
      const actual3: string = record.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0008
     * @tc.name      testErrorManagerMatrix0008
     * @tc.desc      off('loopObserver', observer) 指定 observer 注销，之后阻塞主线程不再回调
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testErrorManagerMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0008 begin');
      const record: number[] = [];
      const observer: errorManager.LoopObserver = newLoopObserver(record);
      let thrown: boolean = false;
      try {
        errorManager.on('loopObserver', 30, observer);
        errorManager.off('loopObserver', observer);
      } catch (error) {
        thrown = true;
      }
      blockMainThread(200);
      await sleep(500);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 thrown=${thrown}`);
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 record.length=${record.length}`);
      expect(record.length).assertEqual(0);
      const actual3: boolean = record.includes(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0009
     * @tc.name      testErrorManagerMatrix0009
     * @tc.desc      loopObserver 可以重复注册（后一次覆盖前一次），注销一次即可
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testErrorManagerMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0009 begin');
      let thrown: boolean = false;
      const record: number[] = [];
      try {
        errorManager.on('loopObserver', 20, newLoopObserver(record));
        errorManager.on('loopObserver', 500, newLoopObserver(record));
        errorManager.off('loopObserver');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 thrown=${thrown}`);
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 record.length=${record.length}`);
      expect(record.length).assertEqual(0);
      const actual3: string = record.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0010
     * @tc.name      testErrorManagerMatrix0010
     * @tc.desc      主线程阻塞超过阈值时 loopObserver 回调收到超时时长
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testErrorManagerMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0010 begin');
      const record: number[] = [];
      errorManager.on('loopObserver', 50, newLoopObserver(record));
      blockMainThread(300);
      await sleep(1000);
      errorManager.off('loopObserver');
      const actual1: boolean = record.length >= 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = record[0] >= 50;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = Number.isInteger(record[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0011
     * @tc.name      testErrorManagerMatrix0011
     * @tc.desc      页面同款：on('unhandledRejection') 后未处理的 reject 会回调 observer，reason 原样带回
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testErrorManagerMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0011 begin');
      const record: string[] = [];
      const observer: errorManager.UnhandledRejectionObserver = newRejectionObserver(record);
      errorManager.on('unhandledRejection', observer);
      rejectWithoutHandler('simulateUnhandledRejection');
      await sleep(1000);
      errorManager.off('unhandledRejection', observer);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 record.length=${record.length}`);
      expect(record.length).assertEqual(1);
      const actual2: string = record[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('simulateUnhandledRejection');
      const actual3: boolean = record.includes('handled');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0012
     * @tc.name      testErrorManagerMatrix0012
     * @tc.desc      已经 catch 的 reject 不会回调 unhandledRejection observer
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testErrorManagerMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0012 begin');
      const record: string[] = [];
      const observer: errorManager.UnhandledRejectionObserver = newRejectionObserver(record);
      errorManager.on('unhandledRejection', observer);
      Promise.reject(new Error('handled')).catch((e: Error) => record.push('caught:' + e.message));
      await sleep(1000);
      errorManager.off('unhandledRejection', observer);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 record.length=${record.length}`);
      expect(record.length).assertEqual(1);
      const actual2: string = record[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('caught:handled');
      const actual3: boolean = record.includes('handled');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0013
     * @tc.name      testErrorManagerMatrix0013
     * @tc.desc      off 之后再产生未处理的 reject，observer 不再收到
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testErrorManagerMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0013 begin');
      const record: string[] = [];
      const observer: errorManager.UnhandledRejectionObserver = newRejectionObserver(record);
      errorManager.on('unhandledRejection', observer);
      rejectWithoutHandler('first');
      await sleep(1000);
      errorManager.off('unhandledRejection', observer);
      rejectWithoutHandler('second');
      await sleep(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 record.length=${record.length}`);
      expect(record.length).assertEqual(1);
      const actual2: string = record[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('first');
      const actual3: boolean = record.includes('second');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0014
     * @tc.name      testErrorManagerMatrix0014
     * @tc.desc      两个未处理的 reject 各回调一次，真机上回调先后不固定，按内容核对
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testErrorManagerMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0014 begin');
      const record: string[] = [];
      const observer: errorManager.UnhandledRejectionObserver = newRejectionObserver(record);
      errorManager.on('unhandledRejection', observer);
      rejectWithoutHandler('r1');
      rejectWithoutHandler('r2');
      await sleep(1000);
      errorManager.off('unhandledRejection', observer);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 record.length=${record.length}`);
      expect(record.length).assertEqual(2);
      const actual2: boolean = record.includes('r1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = record.includes('r2');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: string = record.slice().sort().join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('r1,r2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0015
     * @tc.name      testErrorManagerMatrix0015
     * @tc.desc      页面同款：off('unhandledRejection') 不带 observer 时注销全部 observer
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testErrorManagerMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0015 begin');
      const first: string[] = [];
      const second: string[] = [];
      errorManager.on('unhandledRejection', newRejectionObserver(first));
      errorManager.on('unhandledRejection', newRejectionObserver(second));
      errorManager.off('unhandledRejection');
      rejectWithoutHandler('after-off');
      await sleep(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 first.length=${first.length}`);
      expect(first.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 second.length=${second.length}`);
      expect(second.length).assertEqual(0);
      const actual3: boolean = first.concat(second).includes('after-off');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0016
     * @tc.name      testErrorManagerMatrix0016
     * @tc.desc      已注册 A 时注销从未注册过的 observer B 抛 16300004，A 不受影响
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testErrorManagerMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0016 begin');
      const kept: string[] = [];
      const registered: errorManager.UnhandledRejectionObserver = newRejectionObserver(kept);
      const stranger: errorManager.UnhandledRejectionObserver = newRejectionObserver([]);
      errorManager.on('unhandledRejection', registered);
      let code: number = 0;
      let thrown: boolean = false;
      try {
        errorManager.off('unhandledRejection', stranger);
      } catch (error) {
        thrown = true;
        code = (error as BusinessError).code;
        expect(code).assertEqual(16300004);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 thrown=${thrown}`);
      expect(thrown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(16300004);
      rejectWithoutHandler('still-registered');
      await sleep(1000);
      errorManager.off('unhandledRejection', registered);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 kept.length=${kept.length}`);
      expect(kept.length).assertEqual(1);
      const actual4: string = kept[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('still-registered');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0017
     * @tc.name      testErrorManagerMatrix0017
     * @tc.desc      同一个 observer 重复注册 unhandledRejection 不抛异常，未处理的 reject 仍会回调
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testErrorManagerMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0017 begin');
      const record: string[] = [];
      const observer: errorManager.UnhandledRejectionObserver = newRejectionObserver(record);
      errorManager.on('unhandledRejection', observer);
      let code: number = 0;
      try {
        errorManager.on('unhandledRejection', observer);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      rejectWithoutHandler('registered-twice');
      await sleep(1000);
      errorManager.off('unhandledRejection', observer);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 record.length=${record.length}`);
      expect(record.length).assertEqual(1);
      const actual3: string = record[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('registered-twice');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0018
     * @tc.name      testErrorManagerMatrix0018
     * @tc.desc      on('freeze') 注册与 off('freeze', observer) 注销都不抛异常，正常运行时不回调
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testErrorManagerMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0018 begin');
      const record: string[] = [];
      const observer: errorManager.FreezeObserver = newFreezeObserver(record);
      let thrown: boolean = false;
      try {
        errorManager.on('freeze', observer);
        blockMainThread(200);
        errorManager.off('freeze', observer);
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 thrown=${thrown}`);
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 record.length=${record.length}`);
      expect(record.length).assertEqual(0);
      const actual3: boolean = record.includes('freeze');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0019
     * @tc.name      testErrorManagerMatrix0019
     * @tc.desc      off('freeze') 不带 observer 时注销全部，之后再注销指定 observer 不抛异常
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testErrorManagerMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0019 begin');
      const record: string[] = [];
      const observer: errorManager.FreezeObserver = newFreezeObserver(record);
      errorManager.on('freeze', observer);
      errorManager.on('freeze', newFreezeObserver(record));
      errorManager.off('freeze');
      let code: number = 0;
      try {
        errorManager.off('freeze', observer);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 record.length=${record.length}`);
      expect(record.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(0);
      const actual3: boolean = record.includes('freeze');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_0020
     * @tc.name      testErrorManagerMatrix0020
     * @tc.desc      已注册 A 时注销从未注册过的 freeze observer B 抛 16300004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testErrorManagerMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0020 begin');
      const record: string[] = [];
      const registered: errorManager.FreezeObserver = newFreezeObserver(record);
      errorManager.on('freeze', registered);
      let code: number = 0;
      let thrown: boolean = false;
      try {
        errorManager.off('freeze', newFreezeObserver([]));
      } catch (error) {
        thrown = true;
        code = (error as BusinessError).code;
        expect(code).assertEqual(16300004);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 thrown=${thrown}`);
      expect(thrown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 code=${code}`);
      expect(code).assertEqual(16300004);
      errorManager.off('freeze', registered);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 record.length=${record.length}`);
      expect(record.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerMatrix0020 end');
    })
  })
}
