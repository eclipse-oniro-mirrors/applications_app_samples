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
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Asset]';

export default function loggerVolume02() {
  describe('LoggerVolume02Test', () => {

    /**
     * @tc.name   testLogger020151
     * @tc.number SUB_ASSET_LOGGER_0151
     * @tc.desc   构造后调用各日志方法不抛异常且实例保持可用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020151 begin');
      const logger: Logger = new Logger('[Anchor]');
      logger.info('anchor info message');
      logger.warn('anchor warn message');
      logger.isLoggable(3);
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.debug === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020151 end');
    })

    /**
     * @tc.name   testLogger020152
     * @tc.number SUB_ASSET_LOGGER_0152
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020152 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 1');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020152 end');
    })

    /**
     * @tc.name   testLogger020153
     * @tc.number SUB_ASSET_LOGGER_0153
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020153 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 2');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020153 end');
    })

    /**
     * @tc.name   testLogger020154
     * @tc.number SUB_ASSET_LOGGER_0154
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020154 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 3');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020154 end');
    })

    /**
     * @tc.name   testLogger020155
     * @tc.number SUB_ASSET_LOGGER_0155
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020155 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 4');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020155 end');
    })

    /**
     * @tc.name   testLogger020156
     * @tc.number SUB_ASSET_LOGGER_0156
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020156 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 5');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020156 end');
    })

    /**
     * @tc.name   testLogger020157
     * @tc.number SUB_ASSET_LOGGER_0157
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020157 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 6');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020157 end');
    })

    /**
     * @tc.name   testLogger020158
     * @tc.number SUB_ASSET_LOGGER_0158
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020158 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 7');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020158 end');
    })

    /**
     * @tc.name   testLogger020159
     * @tc.number SUB_ASSET_LOGGER_0159
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020159 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 8');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020159 end');
    })

    /**
     * @tc.name   testLogger020160
     * @tc.number SUB_ASSET_LOGGER_0160
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020160 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 9');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020160 end');
    })

    /**
     * @tc.name   testLogger020161
     * @tc.number SUB_ASSET_LOGGER_0161
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020161 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 10');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020161 end');
    })

    /**
     * @tc.name   testLogger020162
     * @tc.number SUB_ASSET_LOGGER_0162
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020162 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 11');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020162 end');
    })

    /**
     * @tc.name   testLogger020163
     * @tc.number SUB_ASSET_LOGGER_0163
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020163 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 12');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020163 end');
    })

    /**
     * @tc.name   testLogger020164
     * @tc.number SUB_ASSET_LOGGER_0164
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020164 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 13');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020164 end');
    })

    /**
     * @tc.name   testLogger020165
     * @tc.number SUB_ASSET_LOGGER_0165
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020165 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 14');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020165 end');
    })

    /**
     * @tc.name   testLogger020166
     * @tc.number SUB_ASSET_LOGGER_0166
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020166 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 15');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020166 end');
    })

    /**
     * @tc.name   testLogger020167
     * @tc.number SUB_ASSET_LOGGER_0167
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020167 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 16');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020167 end');
    })

    /**
     * @tc.name   testLogger020168
     * @tc.number SUB_ASSET_LOGGER_0168
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020168 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 17');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020168 end');
    })

    /**
     * @tc.name   testLogger020169
     * @tc.number SUB_ASSET_LOGGER_0169
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020169 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 18');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020169 end');
    })

    /**
     * @tc.name   testLogger020170
     * @tc.number SUB_ASSET_LOGGER_0170
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020170 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 19');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020170 end');
    })

    /**
     * @tc.name   testLogger020171
     * @tc.number SUB_ASSET_LOGGER_0171
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020171 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 20');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020171 end');
    })

    /**
     * @tc.name   testLogger020172
     * @tc.number SUB_ASSET_LOGGER_0172
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020172 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 21');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020172 end');
    })

    /**
     * @tc.name   testLogger020173
     * @tc.number SUB_ASSET_LOGGER_0173
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020173 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 22');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020173 end');
    })

    /**
     * @tc.name   testLogger020174
     * @tc.number SUB_ASSET_LOGGER_0174
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020174 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 23');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020174 end');
    })

    /**
     * @tc.name   testLogger020175
     * @tc.number SUB_ASSET_LOGGER_0175
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020175 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 24');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020175 end');
    })

    /**
     * @tc.name   testLogger020176
     * @tc.number SUB_ASSET_LOGGER_0176
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020176 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 25');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020176 end');
    })

    /**
     * @tc.name   testLogger020177
     * @tc.number SUB_ASSET_LOGGER_0177
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020177 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 26');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020177 end');
    })

    /**
     * @tc.name   testLogger020178
     * @tc.number SUB_ASSET_LOGGER_0178
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020178 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 27');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020178 end');
    })

    /**
     * @tc.name   testLogger020179
     * @tc.number SUB_ASSET_LOGGER_0179
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020179 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 28');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020179 end');
    })

    /**
     * @tc.name   testLogger020180
     * @tc.number SUB_ASSET_LOGGER_0180
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020180 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 29');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020180 end');
    })

    /**
     * @tc.name   testLogger020181
     * @tc.number SUB_ASSET_LOGGER_0181
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020181 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 30');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020181 end');
    })

    /**
     * @tc.name   testLogger020182
     * @tc.number SUB_ASSET_LOGGER_0182
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020182 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 31');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020182 end');
    })

    /**
     * @tc.name   testLogger020183
     * @tc.number SUB_ASSET_LOGGER_0183
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020183 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 32');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020183 end');
    })

    /**
     * @tc.name   testLogger020184
     * @tc.number SUB_ASSET_LOGGER_0184
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020184 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 33');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020184 end');
    })

    /**
     * @tc.name   testLogger020185
     * @tc.number SUB_ASSET_LOGGER_0185
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020185 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 34');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020185 end');
    })

    /**
     * @tc.name   testLogger020186
     * @tc.number SUB_ASSET_LOGGER_0186
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020186 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 35');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020186 end');
    })

    /**
     * @tc.name   testLogger020187
     * @tc.number SUB_ASSET_LOGGER_0187
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020187 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 36');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020187 end');
    })

    /**
     * @tc.name   testLogger020188
     * @tc.number SUB_ASSET_LOGGER_0188
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020188 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 37');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020188 end');
    })

    /**
     * @tc.name   testLogger020189
     * @tc.number SUB_ASSET_LOGGER_0189
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020189 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 38');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020189 end');
    })

    /**
     * @tc.name   testLogger020190
     * @tc.number SUB_ASSET_LOGGER_0190
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020190 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.info('info message 39');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020190 end');
    })

    /**
     * @tc.name   testLogger020191
     * @tc.number SUB_ASSET_LOGGER_0191
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020191 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 0');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020191 end');
    })

    /**
     * @tc.name   testLogger020192
     * @tc.number SUB_ASSET_LOGGER_0192
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020192 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 1');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020192 end');
    })

    /**
     * @tc.name   testLogger020193
     * @tc.number SUB_ASSET_LOGGER_0193
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020193 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 2');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020193 end');
    })

    /**
     * @tc.name   testLogger020194
     * @tc.number SUB_ASSET_LOGGER_0194
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020194 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 3');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020194 end');
    })

    /**
     * @tc.name   testLogger020195
     * @tc.number SUB_ASSET_LOGGER_0195
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020195 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 4');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020195 end');
    })

    /**
     * @tc.name   testLogger020196
     * @tc.number SUB_ASSET_LOGGER_0196
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020196 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 5');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020196 end');
    })

    /**
     * @tc.name   testLogger020197
     * @tc.number SUB_ASSET_LOGGER_0197
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020197 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 6');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020197 end');
    })

    /**
     * @tc.name   testLogger020198
     * @tc.number SUB_ASSET_LOGGER_0198
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020198 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 7');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020198 end');
    })

    /**
     * @tc.name   testLogger020199
     * @tc.number SUB_ASSET_LOGGER_0199
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020199 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 8');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020199 end');
    })

    /**
     * @tc.name   testLogger020200
     * @tc.number SUB_ASSET_LOGGER_0200
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020200 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 9');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020200 end');
    })

    /**
     * @tc.name   testLogger020201
     * @tc.number SUB_ASSET_LOGGER_0201
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020201 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 10');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020201 end');
    })

    /**
     * @tc.name   testLogger020202
     * @tc.number SUB_ASSET_LOGGER_0202
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020202 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 11');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020202 end');
    })

    /**
     * @tc.name   testLogger020203
     * @tc.number SUB_ASSET_LOGGER_0203
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020203 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 12');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020203 end');
    })

    /**
     * @tc.name   testLogger020204
     * @tc.number SUB_ASSET_LOGGER_0204
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020204 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 13');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020204 end');
    })

    /**
     * @tc.name   testLogger020205
     * @tc.number SUB_ASSET_LOGGER_0205
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020205 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 14');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020205 end');
    })

    /**
     * @tc.name   testLogger020206
     * @tc.number SUB_ASSET_LOGGER_0206
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020206 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 15');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020206 end');
    })

    /**
     * @tc.name   testLogger020207
     * @tc.number SUB_ASSET_LOGGER_0207
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020207 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 16');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020207 end');
    })

    /**
     * @tc.name   testLogger020208
     * @tc.number SUB_ASSET_LOGGER_0208
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020208 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 17');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020208 end');
    })

    /**
     * @tc.name   testLogger020209
     * @tc.number SUB_ASSET_LOGGER_0209
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020209 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 18');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020209 end');
    })

    /**
     * @tc.name   testLogger020210
     * @tc.number SUB_ASSET_LOGGER_0210
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020210 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 19');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020210 end');
    })

    /**
     * @tc.name   testLogger020211
     * @tc.number SUB_ASSET_LOGGER_0211
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020211 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 20');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020211 end');
    })

    /**
     * @tc.name   testLogger020212
     * @tc.number SUB_ASSET_LOGGER_0212
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020212 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 21');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020212 end');
    })

    /**
     * @tc.name   testLogger020213
     * @tc.number SUB_ASSET_LOGGER_0213
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020213 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 22');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020213 end');
    })

    /**
     * @tc.name   testLogger020214
     * @tc.number SUB_ASSET_LOGGER_0214
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020214 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 23');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020214 end');
    })

    /**
     * @tc.name   testLogger020215
     * @tc.number SUB_ASSET_LOGGER_0215
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020215 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 24');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020215 end');
    })

    /**
     * @tc.name   testLogger020216
     * @tc.number SUB_ASSET_LOGGER_0216
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020216 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 25');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020216 end');
    })

    /**
     * @tc.name   testLogger020217
     * @tc.number SUB_ASSET_LOGGER_0217
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020217 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 26');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020217 end');
    })

    /**
     * @tc.name   testLogger020218
     * @tc.number SUB_ASSET_LOGGER_0218
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020218 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 27');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020218 end');
    })

    /**
     * @tc.name   testLogger020219
     * @tc.number SUB_ASSET_LOGGER_0219
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020219 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 28');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020219 end');
    })

    /**
     * @tc.name   testLogger020220
     * @tc.number SUB_ASSET_LOGGER_0220
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020220 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.debug('debug message 29');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020220 end');
    })

    /**
     * @tc.name   testLogger020221
     * @tc.number SUB_ASSET_LOGGER_0221
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020221 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 0');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020221 end');
    })

    /**
     * @tc.name   testLogger020222
     * @tc.number SUB_ASSET_LOGGER_0222
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020222 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 1');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020222 end');
    })

    /**
     * @tc.name   testLogger020223
     * @tc.number SUB_ASSET_LOGGER_0223
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020223 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 2');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020223 end');
    })

    /**
     * @tc.name   testLogger020224
     * @tc.number SUB_ASSET_LOGGER_0224
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020224 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 3');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020224 end');
    })

    /**
     * @tc.name   testLogger020225
     * @tc.number SUB_ASSET_LOGGER_0225
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020225 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 4');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020225 end');
    })

    /**
     * @tc.name   testLogger020226
     * @tc.number SUB_ASSET_LOGGER_0226
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020226 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 5');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020226 end');
    })

    /**
     * @tc.name   testLogger020227
     * @tc.number SUB_ASSET_LOGGER_0227
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020227 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 6');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020227 end');
    })

    /**
     * @tc.name   testLogger020228
     * @tc.number SUB_ASSET_LOGGER_0228
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020228 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 7');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020228 end');
    })

    /**
     * @tc.name   testLogger020229
     * @tc.number SUB_ASSET_LOGGER_0229
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020229 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 8');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020229 end');
    })

    /**
     * @tc.name   testLogger020230
     * @tc.number SUB_ASSET_LOGGER_0230
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020230 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 9');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020230 end');
    })

    /**
     * @tc.name   testLogger020231
     * @tc.number SUB_ASSET_LOGGER_0231
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020231 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 10');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020231 end');
    })

    /**
     * @tc.name   testLogger020232
     * @tc.number SUB_ASSET_LOGGER_0232
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020232 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 11');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020232 end');
    })

    /**
     * @tc.name   testLogger020233
     * @tc.number SUB_ASSET_LOGGER_0233
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020233 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 12');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020233 end');
    })

    /**
     * @tc.name   testLogger020234
     * @tc.number SUB_ASSET_LOGGER_0234
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020234 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 13');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020234 end');
    })

    /**
     * @tc.name   testLogger020235
     * @tc.number SUB_ASSET_LOGGER_0235
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020235 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 14');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020235 end');
    })

    /**
     * @tc.name   testLogger020236
     * @tc.number SUB_ASSET_LOGGER_0236
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020236 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 15');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020236 end');
    })

    /**
     * @tc.name   testLogger020237
     * @tc.number SUB_ASSET_LOGGER_0237
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020237 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 16');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020237 end');
    })

    /**
     * @tc.name   testLogger020238
     * @tc.number SUB_ASSET_LOGGER_0238
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020238 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 17');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020238 end');
    })

    /**
     * @tc.name   testLogger020239
     * @tc.number SUB_ASSET_LOGGER_0239
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020239 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 18');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020239 end');
    })

    /**
     * @tc.name   testLogger020240
     * @tc.number SUB_ASSET_LOGGER_0240
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020240 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 19');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020240 end');
    })

    /**
     * @tc.name   testLogger020241
     * @tc.number SUB_ASSET_LOGGER_0241
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020241 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 20');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020241 end');
    })

    /**
     * @tc.name   testLogger020242
     * @tc.number SUB_ASSET_LOGGER_0242
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020242 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 21');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020242 end');
    })

    /**
     * @tc.name   testLogger020243
     * @tc.number SUB_ASSET_LOGGER_0243
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020243 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 22');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020243 end');
    })

    /**
     * @tc.name   testLogger020244
     * @tc.number SUB_ASSET_LOGGER_0244
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020244 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 23');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020244 end');
    })

    /**
     * @tc.name   testLogger020245
     * @tc.number SUB_ASSET_LOGGER_0245
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020245 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 24');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020245 end');
    })

    /**
     * @tc.name   testLogger020246
     * @tc.number SUB_ASSET_LOGGER_0246
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020246 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 25');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020246 end');
    })

    /**
     * @tc.name   testLogger020247
     * @tc.number SUB_ASSET_LOGGER_0247
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020247 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 26');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020247 end');
    })

    /**
     * @tc.name   testLogger020248
     * @tc.number SUB_ASSET_LOGGER_0248
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020248 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 27');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020248 end');
    })

    /**
     * @tc.name   testLogger020249
     * @tc.number SUB_ASSET_LOGGER_0249
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020249 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 28');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020249 end');
    })

    /**
     * @tc.name   testLogger020250
     * @tc.number SUB_ASSET_LOGGER_0250
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020250 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.warn('warn message 29');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020250 end');
    })

    /**
     * @tc.name   testLogger020251
     * @tc.number SUB_ASSET_LOGGER_0251
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020251 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 0');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020251 end');
    })

    /**
     * @tc.name   testLogger020252
     * @tc.number SUB_ASSET_LOGGER_0252
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020252 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 1');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020252 end');
    })

    /**
     * @tc.name   testLogger020253
     * @tc.number SUB_ASSET_LOGGER_0253
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020253 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 2');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020253 end');
    })

    /**
     * @tc.name   testLogger020254
     * @tc.number SUB_ASSET_LOGGER_0254
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020254 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 3');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020254 end');
    })

    /**
     * @tc.name   testLogger020255
     * @tc.number SUB_ASSET_LOGGER_0255
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020255 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 4');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020255 end');
    })

    /**
     * @tc.name   testLogger020256
     * @tc.number SUB_ASSET_LOGGER_0256
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020256 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 5');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020256 end');
    })

    /**
     * @tc.name   testLogger020257
     * @tc.number SUB_ASSET_LOGGER_0257
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020257 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 6');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020257 end');
    })

    /**
     * @tc.name   testLogger020258
     * @tc.number SUB_ASSET_LOGGER_0258
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020258 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 7');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020258 end');
    })

    /**
     * @tc.name   testLogger020259
     * @tc.number SUB_ASSET_LOGGER_0259
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020259 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 8');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020259 end');
    })

    /**
     * @tc.name   testLogger020260
     * @tc.number SUB_ASSET_LOGGER_0260
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020260 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 9');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020260 end');
    })

    /**
     * @tc.name   testLogger020261
     * @tc.number SUB_ASSET_LOGGER_0261
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020261 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 10');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020261 end');
    })

    /**
     * @tc.name   testLogger020262
     * @tc.number SUB_ASSET_LOGGER_0262
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020262 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 11');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020262 end');
    })

    /**
     * @tc.name   testLogger020263
     * @tc.number SUB_ASSET_LOGGER_0263
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020263 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 12');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020263 end');
    })

    /**
     * @tc.name   testLogger020264
     * @tc.number SUB_ASSET_LOGGER_0264
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020264 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 13');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020264 end');
    })

    /**
     * @tc.name   testLogger020265
     * @tc.number SUB_ASSET_LOGGER_0265
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020265 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 14');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020265 end');
    })

    /**
     * @tc.name   testLogger020266
     * @tc.number SUB_ASSET_LOGGER_0266
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020266 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 15');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020266 end');
    })

    /**
     * @tc.name   testLogger020267
     * @tc.number SUB_ASSET_LOGGER_0267
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020267 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 16');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020267 end');
    })

    /**
     * @tc.name   testLogger020268
     * @tc.number SUB_ASSET_LOGGER_0268
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020268 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 17');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020268 end');
    })

    /**
     * @tc.name   testLogger020269
     * @tc.number SUB_ASSET_LOGGER_0269
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020269 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 18');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020269 end');
    })

    /**
     * @tc.name   testLogger020270
     * @tc.number SUB_ASSET_LOGGER_0270
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020270 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 19');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020270 end');
    })

    /**
     * @tc.name   testLogger020271
     * @tc.number SUB_ASSET_LOGGER_0271
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020271 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 20');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020271 end');
    })

    /**
     * @tc.name   testLogger020272
     * @tc.number SUB_ASSET_LOGGER_0272
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020272 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 21');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020272 end');
    })

    /**
     * @tc.name   testLogger020273
     * @tc.number SUB_ASSET_LOGGER_0273
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020273 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 22');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020273 end');
    })

    /**
     * @tc.name   testLogger020274
     * @tc.number SUB_ASSET_LOGGER_0274
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020274 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 23');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020274 end');
    })

    /**
     * @tc.name   testLogger020275
     * @tc.number SUB_ASSET_LOGGER_0275
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020275 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 24');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020275 end');
    })

    /**
     * @tc.name   testLogger020276
     * @tc.number SUB_ASSET_LOGGER_0276
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020276 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 25');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020276 end');
    })

    /**
     * @tc.name   testLogger020277
     * @tc.number SUB_ASSET_LOGGER_0277
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020277 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 26');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020277 end');
    })

    /**
     * @tc.name   testLogger020278
     * @tc.number SUB_ASSET_LOGGER_0278
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020278 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 27');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020278 end');
    })

    /**
     * @tc.name   testLogger020279
     * @tc.number SUB_ASSET_LOGGER_0279
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020279 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 28');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020279 end');
    })

    /**
     * @tc.name   testLogger020280
     * @tc.number SUB_ASSET_LOGGER_0280
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020280 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.error('error message 29');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020280 end');
    })

    /**
     * @tc.name   testLogger020281
     * @tc.number SUB_ASSET_LOGGER_0281
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020281 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.fatal('fatal message 0');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020281 end');
    })

    /**
     * @tc.name   testLogger020282
     * @tc.number SUB_ASSET_LOGGER_0282
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020282 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.fatal('fatal message 1');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020282 end');
    })

    /**
     * @tc.name   testLogger020283
     * @tc.number SUB_ASSET_LOGGER_0283
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020283 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.fatal('fatal message 2');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020283 end');
    })

    /**
     * @tc.name   testLogger020284
     * @tc.number SUB_ASSET_LOGGER_0284
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020284 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.fatal('fatal message 3');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020284 end');
    })

    /**
     * @tc.name   testLogger020285
     * @tc.number SUB_ASSET_LOGGER_0285
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020285 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.fatal('fatal message 4');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020285 end');
    })

    /**
     * @tc.name   testLogger020286
     * @tc.number SUB_ASSET_LOGGER_0286
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020286 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.fatal('fatal message 5');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020286 end');
    })

    /**
     * @tc.name   testLogger020287
     * @tc.number SUB_ASSET_LOGGER_0287
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020287 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.fatal('fatal message 6');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020287 end');
    })

    /**
     * @tc.name   testLogger020288
     * @tc.number SUB_ASSET_LOGGER_0288
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020288 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.fatal('fatal message 7');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020288 end');
    })

    /**
     * @tc.name   testLogger020289
     * @tc.number SUB_ASSET_LOGGER_0289
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020289 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.fatal('fatal message 8');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020289 end');
    })

    /**
     * @tc.name   testLogger020290
     * @tc.number SUB_ASSET_LOGGER_0290
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020290 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.fatal('fatal message 9');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020290 end');
    })

    /**
     * @tc.name   testLogger020291
     * @tc.number SUB_ASSET_LOGGER_0291
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020291 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.isLoggable(0);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020291 end');
    })

    /**
     * @tc.name   testLogger020292
     * @tc.number SUB_ASSET_LOGGER_0292
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020292 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.isLoggable(1);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020292 end');
    })

    /**
     * @tc.name   testLogger020293
     * @tc.number SUB_ASSET_LOGGER_0293
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020293 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.isLoggable(2);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020293 end');
    })

    /**
     * @tc.name   testLogger020294
     * @tc.number SUB_ASSET_LOGGER_0294
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020294 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.isLoggable(3);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020294 end');
    })

    /**
     * @tc.name   testLogger020295
     * @tc.number SUB_ASSET_LOGGER_0295
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020295 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.isLoggable(4);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020295 end');
    })

    /**
     * @tc.name   testLogger020296
     * @tc.number SUB_ASSET_LOGGER_0296
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020296 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.isLoggable(5);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020296 end');
    })

    /**
     * @tc.name   testLogger020297
     * @tc.number SUB_ASSET_LOGGER_0297
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020297 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.isLoggable(6);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020297 end');
    })

    /**
     * @tc.name   testLogger020298
     * @tc.number SUB_ASSET_LOGGER_0298
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020298 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.isLoggable(7);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020298 end');
    })

    /**
     * @tc.name   testLogger020299
     * @tc.number SUB_ASSET_LOGGER_0299
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020299 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.isLoggable(8);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020299 end');
    })

    /**
     * @tc.name   testLogger020300
     * @tc.number SUB_ASSET_LOGGER_0300
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger020300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020300 begin');
      const logger: Logger = new Logger('Prefix02');
      logger.isLoggable(9);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger020300 end');
    })

  })
}
