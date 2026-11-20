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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Logger } from '../../../main/ets/common/Logger';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Asset]';

export default function loggerReal() {
  describe('LoggerRealTest', () => {
    /**
     * @tc.number SUB_ASSET_LOGGER_0301
     * @tc.name testLogger0301
     * @tc.desc 合法值：info 方法调用不抛异常且实例可用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testLogger0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0301 begin');
      const logger: Logger = new Logger('[Real0301]');
      logger.info('info message');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.info === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0301 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0302
     * @tc.name testLogger0302
     * @tc.desc 合法值：debug 方法调用不抛异常且实例可用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testLogger0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0302 begin');
      const logger: Logger = new Logger('[Real0302]');
      logger.debug('debug message');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.debug === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0302 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0303
     * @tc.name testLogger0303
     * @tc.desc 合法值：warn 方法调用不抛异常且实例可用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testLogger0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0303 begin');
      const logger: Logger = new Logger('[Real0303]');
      logger.warn('warn message');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.warn === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0303 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0304
     * @tc.name testLogger0304
     * @tc.desc 合法值：error 方法调用不抛异常且实例可用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testLogger0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0304 begin');
      const logger: Logger = new Logger('[Real0304]');
      logger.error('error message');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.error === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0304 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0305
     * @tc.name testLogger0305
     * @tc.desc 合法值：fatal 方法调用不抛异常且实例可用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testLogger0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0305 begin');
      const logger: Logger = new Logger('[Real0305]');
      logger.fatal('fatal message');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.fatal === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0305 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0306
     * @tc.name testLogger0306
     * @tc.desc 合法值：isLoggable 方法调用不抛异常且实例可用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testLogger0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0306 begin');
      const logger: Logger = new Logger('[Real0306]');
      logger.isLoggable(3);
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.isLoggable === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0306 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0307
     * @tc.name testLogger0307
     * @tc.desc 边界值：无参调用 info 不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0307 begin');
      const logger: Logger = new Logger('[Real0307]');
      logger.info();
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.warn === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0307 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0308
     * @tc.name testLogger0308
     * @tc.desc 边界值：多参数调用 info 不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0308 begin');
      const logger: Logger = new Logger('[Real0308]');
      logger.info('first', 'second', 'third');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.info === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0308 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0309
     * @tc.name testLogger0309
     * @tc.desc 组合值：多方法连用后实例仍可用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0309 begin');
      const logger: Logger = new Logger('[Real0309]');
      logger.debug('d');
      logger.info('i');
      logger.warn('w');
      logger.error('e');
      logger.fatal('f');
      logger.isLoggable(4);
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.info === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0309 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0310
     * @tc.name testLogger0310
     * @tc.desc 状态值：构造后实例类型正确
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0310 begin');
      const logger: Logger = new Logger('[Real0310]');
      hilog.info(DOMAIN, TAG, 'instanceOf=%{public}s', String(logger instanceof Logger));
      expect(logger instanceof Logger).assertTrue();
      expect(logger instanceof Object).assertTrue();
      expect(typeof logger === 'object').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0310 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0311
     * @tc.name testLogger0311
     * @tc.desc 状态值：同一实例连续调用 info 保持可用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0311 begin');
      const logger: Logger = new Logger('[Real0311]');
      logger.info('round one');
      logger.info('round two');
      logger.info('round three');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.info === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0311 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0312
     * @tc.name testLogger0312
     * @tc.desc 边界值：isLoggable 最低级别 0 调用不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0312 begin');
      const logger: Logger = new Logger('[Real0312]');
      logger.isLoggable(0);
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.isLoggable === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0312 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0313
     * @tc.name testLogger0313
     * @tc.desc 边界值：isLoggable 最高级别 7 调用不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0313 begin');
      const logger: Logger = new Logger('[Real0313]');
      logger.isLoggable(7);
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.isLoggable === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0313 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0314
     * @tc.name testLogger0314
     * @tc.desc 组合值：中文日志消息调用不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0314 begin');
      const logger: Logger = new Logger('[Real0314]');
      logger.info('中文日志消息');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.info === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0314 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0315
     * @tc.name testLogger0315
     * @tc.desc 状态值：中文前缀构造后实例可用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0315 begin');
      const logger: Logger = new Logger('[中文前缀]');
      logger.info('with chinese prefix');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.debug === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0315 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0316
     * @tc.name testLogger0316
     * @tc.desc 状态值：fatal 后继续 info 调用不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0316 begin');
      const logger: Logger = new Logger('[Real0316]');
      logger.fatal('fatal first');
      logger.info('info after fatal');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.info === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0316 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0317
     * @tc.name testLogger0317
     * @tc.desc 组合值：error 与 warn 交替调用不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0317 begin');
      const logger: Logger = new Logger('[Real0317]');
      logger.error('err one');
      logger.warn('warn one');
      logger.error('err two');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.error === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0317 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0318
     * @tc.name testLogger0318
     * @tc.desc 状态值：两个独立实例互不影响
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0318 begin');
      const first: Logger = new Logger('[Real0318a]');
      const second: Logger = new Logger('[Real0318b]');
      first.info('first instance');
      second.warn('second instance');
      expect(first instanceof Logger).assertTrue();
      expect(second instanceof Logger).assertTrue();
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0318 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0319
     * @tc.name testLogger0319
     * @tc.desc 边界值：空串前缀构造后实例可用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0319 begin');
      const logger: Logger = new Logger('');
      logger.info('empty prefix');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.info === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0319 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0320
     * @tc.name testLogger0320
     * @tc.desc 组合值：特殊字符日志消息调用不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0320 begin');
      const logger: Logger = new Logger('[Real0320]');
      logger.info('@#$%^&*()_+{}[]|;:,.<>?/~`');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.info === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0320 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0321
     * @tc.name testLogger0321
     * @tc.desc 状态值：日志方法返回值为 undefined
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0321 begin');
      const logger: Logger = new Logger('[Real0321]');
      const ret: void = logger.info('check void return');
      expect(ret === undefined).assertTrue();
      expect(logger instanceof Logger).assertTrue();
      expect(typeof logger.info === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0321 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0322
     * @tc.name testLogger0322
     * @tc.desc 组合值：isLoggable 与 debug 连用不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0322 begin');
      const logger: Logger = new Logger('[Real0322]');
      logger.isLoggable(1);
      logger.debug('debug after isLoggable');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.isLoggable === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0322 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0323
     * @tc.name testLogger0323
     * @tc.desc 边界值：isLoggable 负级别调用不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0323 begin');
      const logger: Logger = new Logger('[Real0323]');
      logger.isLoggable(-1);
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.isLoggable === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0323 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0324
     * @tc.name testLogger0324
     * @tc.desc 状态值：全部日志方法均为函数类型
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0324 begin');
      const logger: Logger = new Logger('[Real0324]');
      hilog.info(DOMAIN, TAG, 'fnCheck=%{public}s', String(typeof logger.fatal === 'function'));
      expect(typeof logger.debug === 'function').assertTrue();
      expect(typeof logger.warn === 'function').assertTrue();
      expect(typeof logger.fatal === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0324 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0325
     * @tc.name testLogger0325
     * @tc.desc 组合值：长日志消息调用不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0325 begin');
      let longMsg: string = '';
      for (let i: number = 0; i < 500; i++) {
        longMsg += 'M';
      }
      const logger: Logger = new Logger('[Real0325]');
      logger.info(longMsg);
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.info === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0325 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0326
     * @tc.name testLogger0326
     * @tc.desc 状态值：error 后实例仍可用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0326 begin');
      const logger: Logger = new Logger('[Real0326]');
      logger.error('error before');
      logger.info('still alive');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.info === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0326 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0327
     * @tc.name testLogger0327
     * @tc.desc 边界值：单参数 warn 调用不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0327 begin');
      const logger: Logger = new Logger('[Real0327]');
      logger.warn('single arg');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.warn === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0327 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0328
     * @tc.name testLogger0328
     * @tc.desc 组合值：info 与 fatal 交替调用不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0328 begin');
      const logger: Logger = new Logger('[Real0328]');
      logger.info('one');
      logger.fatal('two');
      logger.info('three');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.fatal === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0328 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0329
     * @tc.name testLogger0329
     * @tc.desc 状态值：多个实例各自类型正确
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0329 begin');
      const a: Logger = new Logger('[Real0329a]');
      const b: Logger = new Logger('[Real0329b]');
      const c: Logger = new Logger('[Real0329c]');
      a.info('a');
      b.warn('b');
      c.error('c');
      expect(a instanceof Logger).assertTrue();
      expect(b instanceof Logger).assertTrue();
      expect(c instanceof Logger).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0329 end');
    });

    /**
     * @tc.number SUB_ASSET_LOGGER_0330
     * @tc.name testLogger0330
     * @tc.desc 边界值：空串消息调用不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testLogger0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0330 begin');
      const logger: Logger = new Logger('[Real0330]');
      logger.info('');
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.info === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogger0330 end');
    });
  });
}


