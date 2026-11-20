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

export default function loggerVolume01() {
  describe('LoggerVolume01Test', () => {

    /**
     * @tc.name   testLogger010001
     * @tc.number SUB_ASSET_LOGGER_0001
     * @tc.desc   构造后调用各日志方法不抛异常且实例保持可用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010001 begin');
      const logger: Logger = new Logger('[Anchor]');
      logger.info('anchor info message');
      logger.warn('anchor warn message');
      logger.isLoggable(3);
      expect(logger instanceof Logger).assertTrue();
      expect(logger === undefined).assertFalse();
      expect(typeof logger.debug === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010001 end');
    })

    /**
     * @tc.name   testLogger010002
     * @tc.number SUB_ASSET_LOGGER_0002
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010002 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 1');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010002 end');
    })

    /**
     * @tc.name   testLogger010003
     * @tc.number SUB_ASSET_LOGGER_0003
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010003 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 2');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010003 end');
    })

    /**
     * @tc.name   testLogger010004
     * @tc.number SUB_ASSET_LOGGER_0004
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010004 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 3');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010004 end');
    })

    /**
     * @tc.name   testLogger010005
     * @tc.number SUB_ASSET_LOGGER_0005
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010005 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 4');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010005 end');
    })

    /**
     * @tc.name   testLogger010006
     * @tc.number SUB_ASSET_LOGGER_0006
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010006 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 5');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010006 end');
    })

    /**
     * @tc.name   testLogger010007
     * @tc.number SUB_ASSET_LOGGER_0007
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010007 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 6');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010007 end');
    })

    /**
     * @tc.name   testLogger010008
     * @tc.number SUB_ASSET_LOGGER_0008
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010008 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 7');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010008 end');
    })

    /**
     * @tc.name   testLogger010009
     * @tc.number SUB_ASSET_LOGGER_0009
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010009 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 8');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010009 end');
    })

    /**
     * @tc.name   testLogger010010
     * @tc.number SUB_ASSET_LOGGER_0010
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010010 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 9');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010010 end');
    })

    /**
     * @tc.name   testLogger010011
     * @tc.number SUB_ASSET_LOGGER_0011
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010011 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 10');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010011 end');
    })

    /**
     * @tc.name   testLogger010012
     * @tc.number SUB_ASSET_LOGGER_0012
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010012 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 11');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010012 end');
    })

    /**
     * @tc.name   testLogger010013
     * @tc.number SUB_ASSET_LOGGER_0013
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010013 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 12');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010013 end');
    })

    /**
     * @tc.name   testLogger010014
     * @tc.number SUB_ASSET_LOGGER_0014
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010014 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 13');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010014 end');
    })

    /**
     * @tc.name   testLogger010015
     * @tc.number SUB_ASSET_LOGGER_0015
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010015 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 14');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010015 end');
    })

    /**
     * @tc.name   testLogger010016
     * @tc.number SUB_ASSET_LOGGER_0016
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010016 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 15');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010016 end');
    })

    /**
     * @tc.name   testLogger010017
     * @tc.number SUB_ASSET_LOGGER_0017
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010017 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 16');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010017 end');
    })

    /**
     * @tc.name   testLogger010018
     * @tc.number SUB_ASSET_LOGGER_0018
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010018 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 17');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010018 end');
    })

    /**
     * @tc.name   testLogger010019
     * @tc.number SUB_ASSET_LOGGER_0019
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010019 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 18');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010019 end');
    })

    /**
     * @tc.name   testLogger010020
     * @tc.number SUB_ASSET_LOGGER_0020
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010020 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 19');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010020 end');
    })

    /**
     * @tc.name   testLogger010021
     * @tc.number SUB_ASSET_LOGGER_0021
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010021 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 20');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010021 end');
    })

    /**
     * @tc.name   testLogger010022
     * @tc.number SUB_ASSET_LOGGER_0022
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010022 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 21');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010022 end');
    })

    /**
     * @tc.name   testLogger010023
     * @tc.number SUB_ASSET_LOGGER_0023
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010023 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 22');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010023 end');
    })

    /**
     * @tc.name   testLogger010024
     * @tc.number SUB_ASSET_LOGGER_0024
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010024 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 23');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010024 end');
    })

    /**
     * @tc.name   testLogger010025
     * @tc.number SUB_ASSET_LOGGER_0025
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010025 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 24');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010025 end');
    })

    /**
     * @tc.name   testLogger010026
     * @tc.number SUB_ASSET_LOGGER_0026
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010026 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 25');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010026 end');
    })

    /**
     * @tc.name   testLogger010027
     * @tc.number SUB_ASSET_LOGGER_0027
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010027 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 26');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010027 end');
    })

    /**
     * @tc.name   testLogger010028
     * @tc.number SUB_ASSET_LOGGER_0028
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010028 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 27');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010028 end');
    })

    /**
     * @tc.name   testLogger010029
     * @tc.number SUB_ASSET_LOGGER_0029
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010029 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 28');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010029 end');
    })

    /**
     * @tc.name   testLogger010030
     * @tc.number SUB_ASSET_LOGGER_0030
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010030 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 29');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010030 end');
    })

    /**
     * @tc.name   testLogger010031
     * @tc.number SUB_ASSET_LOGGER_0031
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010031 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 30');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010031 end');
    })

    /**
     * @tc.name   testLogger010032
     * @tc.number SUB_ASSET_LOGGER_0032
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010032 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 31');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010032 end');
    })

    /**
     * @tc.name   testLogger010033
     * @tc.number SUB_ASSET_LOGGER_0033
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010033 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 32');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010033 end');
    })

    /**
     * @tc.name   testLogger010034
     * @tc.number SUB_ASSET_LOGGER_0034
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010034 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 33');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010034 end');
    })

    /**
     * @tc.name   testLogger010035
     * @tc.number SUB_ASSET_LOGGER_0035
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010035 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 34');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010035 end');
    })

    /**
     * @tc.name   testLogger010036
     * @tc.number SUB_ASSET_LOGGER_0036
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010036 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 35');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010036 end');
    })

    /**
     * @tc.name   testLogger010037
     * @tc.number SUB_ASSET_LOGGER_0037
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010037 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 36');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010037 end');
    })

    /**
     * @tc.name   testLogger010038
     * @tc.number SUB_ASSET_LOGGER_0038
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010038 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 37');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010038 end');
    })

    /**
     * @tc.name   testLogger010039
     * @tc.number SUB_ASSET_LOGGER_0039
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010039 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 38');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010039 end');
    })

    /**
     * @tc.name   testLogger010040
     * @tc.number SUB_ASSET_LOGGER_0040
     * @tc.desc   合法值：info 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010040 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.info('info message 39');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010040 end');
    })

    /**
     * @tc.name   testLogger010041
     * @tc.number SUB_ASSET_LOGGER_0041
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010041 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 0');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010041 end');
    })

    /**
     * @tc.name   testLogger010042
     * @tc.number SUB_ASSET_LOGGER_0042
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010042 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 1');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010042 end');
    })

    /**
     * @tc.name   testLogger010043
     * @tc.number SUB_ASSET_LOGGER_0043
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010043 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 2');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010043 end');
    })

    /**
     * @tc.name   testLogger010044
     * @tc.number SUB_ASSET_LOGGER_0044
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010044 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 3');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010044 end');
    })

    /**
     * @tc.name   testLogger010045
     * @tc.number SUB_ASSET_LOGGER_0045
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010045 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 4');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010045 end');
    })

    /**
     * @tc.name   testLogger010046
     * @tc.number SUB_ASSET_LOGGER_0046
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010046 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 5');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010046 end');
    })

    /**
     * @tc.name   testLogger010047
     * @tc.number SUB_ASSET_LOGGER_0047
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010047 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 6');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010047 end');
    })

    /**
     * @tc.name   testLogger010048
     * @tc.number SUB_ASSET_LOGGER_0048
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010048 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 7');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010048 end');
    })

    /**
     * @tc.name   testLogger010049
     * @tc.number SUB_ASSET_LOGGER_0049
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010049 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 8');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010049 end');
    })

    /**
     * @tc.name   testLogger010050
     * @tc.number SUB_ASSET_LOGGER_0050
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010050 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 9');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010050 end');
    })

    /**
     * @tc.name   testLogger010051
     * @tc.number SUB_ASSET_LOGGER_0051
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010051 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 10');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010051 end');
    })

    /**
     * @tc.name   testLogger010052
     * @tc.number SUB_ASSET_LOGGER_0052
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010052 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 11');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010052 end');
    })

    /**
     * @tc.name   testLogger010053
     * @tc.number SUB_ASSET_LOGGER_0053
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010053 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 12');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010053 end');
    })

    /**
     * @tc.name   testLogger010054
     * @tc.number SUB_ASSET_LOGGER_0054
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010054 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 13');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010054 end');
    })

    /**
     * @tc.name   testLogger010055
     * @tc.number SUB_ASSET_LOGGER_0055
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010055 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 14');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010055 end');
    })

    /**
     * @tc.name   testLogger010056
     * @tc.number SUB_ASSET_LOGGER_0056
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010056 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 15');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010056 end');
    })

    /**
     * @tc.name   testLogger010057
     * @tc.number SUB_ASSET_LOGGER_0057
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010057 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 16');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010057 end');
    })

    /**
     * @tc.name   testLogger010058
     * @tc.number SUB_ASSET_LOGGER_0058
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010058 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 17');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010058 end');
    })

    /**
     * @tc.name   testLogger010059
     * @tc.number SUB_ASSET_LOGGER_0059
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010059 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 18');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010059 end');
    })

    /**
     * @tc.name   testLogger010060
     * @tc.number SUB_ASSET_LOGGER_0060
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010060 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 19');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010060 end');
    })

    /**
     * @tc.name   testLogger010061
     * @tc.number SUB_ASSET_LOGGER_0061
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010061 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 20');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010061 end');
    })

    /**
     * @tc.name   testLogger010062
     * @tc.number SUB_ASSET_LOGGER_0062
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010062 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 21');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010062 end');
    })

    /**
     * @tc.name   testLogger010063
     * @tc.number SUB_ASSET_LOGGER_0063
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010063 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 22');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010063 end');
    })

    /**
     * @tc.name   testLogger010064
     * @tc.number SUB_ASSET_LOGGER_0064
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010064 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 23');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010064 end');
    })

    /**
     * @tc.name   testLogger010065
     * @tc.number SUB_ASSET_LOGGER_0065
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010065 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 24');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010065 end');
    })

    /**
     * @tc.name   testLogger010066
     * @tc.number SUB_ASSET_LOGGER_0066
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010066 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 25');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010066 end');
    })

    /**
     * @tc.name   testLogger010067
     * @tc.number SUB_ASSET_LOGGER_0067
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010067 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 26');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010067 end');
    })

    /**
     * @tc.name   testLogger010068
     * @tc.number SUB_ASSET_LOGGER_0068
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010068 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 27');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010068 end');
    })

    /**
     * @tc.name   testLogger010069
     * @tc.number SUB_ASSET_LOGGER_0069
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010069 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 28');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010069 end');
    })

    /**
     * @tc.name   testLogger010070
     * @tc.number SUB_ASSET_LOGGER_0070
     * @tc.desc   合法值：debug 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010070 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.debug('debug message 29');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010070 end');
    })

    /**
     * @tc.name   testLogger010071
     * @tc.number SUB_ASSET_LOGGER_0071
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010071 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 0');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010071 end');
    })

    /**
     * @tc.name   testLogger010072
     * @tc.number SUB_ASSET_LOGGER_0072
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010072 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 1');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010072 end');
    })

    /**
     * @tc.name   testLogger010073
     * @tc.number SUB_ASSET_LOGGER_0073
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010073 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 2');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010073 end');
    })

    /**
     * @tc.name   testLogger010074
     * @tc.number SUB_ASSET_LOGGER_0074
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010074 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 3');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010074 end');
    })

    /**
     * @tc.name   testLogger010075
     * @tc.number SUB_ASSET_LOGGER_0075
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010075 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 4');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010075 end');
    })

    /**
     * @tc.name   testLogger010076
     * @tc.number SUB_ASSET_LOGGER_0076
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010076 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 5');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010076 end');
    })

    /**
     * @tc.name   testLogger010077
     * @tc.number SUB_ASSET_LOGGER_0077
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010077 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 6');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010077 end');
    })

    /**
     * @tc.name   testLogger010078
     * @tc.number SUB_ASSET_LOGGER_0078
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010078 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 7');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010078 end');
    })

    /**
     * @tc.name   testLogger010079
     * @tc.number SUB_ASSET_LOGGER_0079
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010079 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 8');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010079 end');
    })

    /**
     * @tc.name   testLogger010080
     * @tc.number SUB_ASSET_LOGGER_0080
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010080 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 9');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010080 end');
    })

    /**
     * @tc.name   testLogger010081
     * @tc.number SUB_ASSET_LOGGER_0081
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010081 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 10');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010081 end');
    })

    /**
     * @tc.name   testLogger010082
     * @tc.number SUB_ASSET_LOGGER_0082
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010082 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 11');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010082 end');
    })

    /**
     * @tc.name   testLogger010083
     * @tc.number SUB_ASSET_LOGGER_0083
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010083 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 12');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010083 end');
    })

    /**
     * @tc.name   testLogger010084
     * @tc.number SUB_ASSET_LOGGER_0084
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010084 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 13');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010084 end');
    })

    /**
     * @tc.name   testLogger010085
     * @tc.number SUB_ASSET_LOGGER_0085
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010085 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 14');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010085 end');
    })

    /**
     * @tc.name   testLogger010086
     * @tc.number SUB_ASSET_LOGGER_0086
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010086 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 15');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010086 end');
    })

    /**
     * @tc.name   testLogger010087
     * @tc.number SUB_ASSET_LOGGER_0087
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010087 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 16');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010087 end');
    })

    /**
     * @tc.name   testLogger010088
     * @tc.number SUB_ASSET_LOGGER_0088
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010088 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 17');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010088 end');
    })

    /**
     * @tc.name   testLogger010089
     * @tc.number SUB_ASSET_LOGGER_0089
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010089 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 18');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010089 end');
    })

    /**
     * @tc.name   testLogger010090
     * @tc.number SUB_ASSET_LOGGER_0090
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010090 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 19');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010090 end');
    })

    /**
     * @tc.name   testLogger010091
     * @tc.number SUB_ASSET_LOGGER_0091
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010091 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 20');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010091 end');
    })

    /**
     * @tc.name   testLogger010092
     * @tc.number SUB_ASSET_LOGGER_0092
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010092 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 21');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010092 end');
    })

    /**
     * @tc.name   testLogger010093
     * @tc.number SUB_ASSET_LOGGER_0093
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010093 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 22');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010093 end');
    })

    /**
     * @tc.name   testLogger010094
     * @tc.number SUB_ASSET_LOGGER_0094
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010094 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 23');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010094 end');
    })

    /**
     * @tc.name   testLogger010095
     * @tc.number SUB_ASSET_LOGGER_0095
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010095 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 24');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010095 end');
    })

    /**
     * @tc.name   testLogger010096
     * @tc.number SUB_ASSET_LOGGER_0096
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010096 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 25');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010096 end');
    })

    /**
     * @tc.name   testLogger010097
     * @tc.number SUB_ASSET_LOGGER_0097
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010097 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 26');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010097 end');
    })

    /**
     * @tc.name   testLogger010098
     * @tc.number SUB_ASSET_LOGGER_0098
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010098 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 27');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010098 end');
    })

    /**
     * @tc.name   testLogger010099
     * @tc.number SUB_ASSET_LOGGER_0099
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010099 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 28');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010099 end');
    })

    /**
     * @tc.name   testLogger010100
     * @tc.number SUB_ASSET_LOGGER_0100
     * @tc.desc   合法值：warn 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010100 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.warn('warn message 29');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010100 end');
    })

    /**
     * @tc.name   testLogger010101
     * @tc.number SUB_ASSET_LOGGER_0101
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010101 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 0');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010101 end');
    })

    /**
     * @tc.name   testLogger010102
     * @tc.number SUB_ASSET_LOGGER_0102
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010102 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 1');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010102 end');
    })

    /**
     * @tc.name   testLogger010103
     * @tc.number SUB_ASSET_LOGGER_0103
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010103 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 2');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010103 end');
    })

    /**
     * @tc.name   testLogger010104
     * @tc.number SUB_ASSET_LOGGER_0104
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010104 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 3');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010104 end');
    })

    /**
     * @tc.name   testLogger010105
     * @tc.number SUB_ASSET_LOGGER_0105
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010105 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 4');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010105 end');
    })

    /**
     * @tc.name   testLogger010106
     * @tc.number SUB_ASSET_LOGGER_0106
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010106 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 5');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010106 end');
    })

    /**
     * @tc.name   testLogger010107
     * @tc.number SUB_ASSET_LOGGER_0107
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010107 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 6');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010107 end');
    })

    /**
     * @tc.name   testLogger010108
     * @tc.number SUB_ASSET_LOGGER_0108
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010108 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 7');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010108 end');
    })

    /**
     * @tc.name   testLogger010109
     * @tc.number SUB_ASSET_LOGGER_0109
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010109 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 8');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010109 end');
    })

    /**
     * @tc.name   testLogger010110
     * @tc.number SUB_ASSET_LOGGER_0110
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010110 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 9');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010110 end');
    })

    /**
     * @tc.name   testLogger010111
     * @tc.number SUB_ASSET_LOGGER_0111
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010111 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 10');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010111 end');
    })

    /**
     * @tc.name   testLogger010112
     * @tc.number SUB_ASSET_LOGGER_0112
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010112 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 11');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010112 end');
    })

    /**
     * @tc.name   testLogger010113
     * @tc.number SUB_ASSET_LOGGER_0113
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010113 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 12');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010113 end');
    })

    /**
     * @tc.name   testLogger010114
     * @tc.number SUB_ASSET_LOGGER_0114
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010114 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 13');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010114 end');
    })

    /**
     * @tc.name   testLogger010115
     * @tc.number SUB_ASSET_LOGGER_0115
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010115 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 14');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010115 end');
    })

    /**
     * @tc.name   testLogger010116
     * @tc.number SUB_ASSET_LOGGER_0116
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010116 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 15');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010116 end');
    })

    /**
     * @tc.name   testLogger010117
     * @tc.number SUB_ASSET_LOGGER_0117
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010117 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 16');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010117 end');
    })

    /**
     * @tc.name   testLogger010118
     * @tc.number SUB_ASSET_LOGGER_0118
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010118 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 17');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010118 end');
    })

    /**
     * @tc.name   testLogger010119
     * @tc.number SUB_ASSET_LOGGER_0119
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010119 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 18');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010119 end');
    })

    /**
     * @tc.name   testLogger010120
     * @tc.number SUB_ASSET_LOGGER_0120
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010120 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 19');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010120 end');
    })

    /**
     * @tc.name   testLogger010121
     * @tc.number SUB_ASSET_LOGGER_0121
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010121 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 20');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010121 end');
    })

    /**
     * @tc.name   testLogger010122
     * @tc.number SUB_ASSET_LOGGER_0122
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010122 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 21');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010122 end');
    })

    /**
     * @tc.name   testLogger010123
     * @tc.number SUB_ASSET_LOGGER_0123
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010123 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 22');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010123 end');
    })

    /**
     * @tc.name   testLogger010124
     * @tc.number SUB_ASSET_LOGGER_0124
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010124 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 23');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010124 end');
    })

    /**
     * @tc.name   testLogger010125
     * @tc.number SUB_ASSET_LOGGER_0125
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010125 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 24');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010125 end');
    })

    /**
     * @tc.name   testLogger010126
     * @tc.number SUB_ASSET_LOGGER_0126
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010126 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 25');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010126 end');
    })

    /**
     * @tc.name   testLogger010127
     * @tc.number SUB_ASSET_LOGGER_0127
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010127 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 26');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010127 end');
    })

    /**
     * @tc.name   testLogger010128
     * @tc.number SUB_ASSET_LOGGER_0128
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010128 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 27');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010128 end');
    })

    /**
     * @tc.name   testLogger010129
     * @tc.number SUB_ASSET_LOGGER_0129
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010129 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 28');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010129 end');
    })

    /**
     * @tc.name   testLogger010130
     * @tc.number SUB_ASSET_LOGGER_0130
     * @tc.desc   合法值：error 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010130 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.error('error message 29');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010130 end');
    })

    /**
     * @tc.name   testLogger010131
     * @tc.number SUB_ASSET_LOGGER_0131
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010131 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.fatal('fatal message 0');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010131 end');
    })

    /**
     * @tc.name   testLogger010132
     * @tc.number SUB_ASSET_LOGGER_0132
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010132 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.fatal('fatal message 1');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010132 end');
    })

    /**
     * @tc.name   testLogger010133
     * @tc.number SUB_ASSET_LOGGER_0133
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010133 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.fatal('fatal message 2');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010133 end');
    })

    /**
     * @tc.name   testLogger010134
     * @tc.number SUB_ASSET_LOGGER_0134
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010134 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.fatal('fatal message 3');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010134 end');
    })

    /**
     * @tc.name   testLogger010135
     * @tc.number SUB_ASSET_LOGGER_0135
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010135 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.fatal('fatal message 4');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010135 end');
    })

    /**
     * @tc.name   testLogger010136
     * @tc.number SUB_ASSET_LOGGER_0136
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010136 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.fatal('fatal message 5');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010136 end');
    })

    /**
     * @tc.name   testLogger010137
     * @tc.number SUB_ASSET_LOGGER_0137
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010137 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.fatal('fatal message 6');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010137 end');
    })

    /**
     * @tc.name   testLogger010138
     * @tc.number SUB_ASSET_LOGGER_0138
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010138 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.fatal('fatal message 7');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010138 end');
    })

    /**
     * @tc.name   testLogger010139
     * @tc.number SUB_ASSET_LOGGER_0139
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010139 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.fatal('fatal message 8');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010139 end');
    })

    /**
     * @tc.name   testLogger010140
     * @tc.number SUB_ASSET_LOGGER_0140
     * @tc.desc   边界值：fatal 日志方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010140 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.fatal('fatal message 9');
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010140 end');
    })

    /**
     * @tc.name   testLogger010141
     * @tc.number SUB_ASSET_LOGGER_0141
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010141 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.isLoggable(0);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010141 end');
    })

    /**
     * @tc.name   testLogger010142
     * @tc.number SUB_ASSET_LOGGER_0142
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010142 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.isLoggable(1);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010142 end');
    })

    /**
     * @tc.name   testLogger010143
     * @tc.number SUB_ASSET_LOGGER_0143
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010143 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.isLoggable(2);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010143 end');
    })

    /**
     * @tc.name   testLogger010144
     * @tc.number SUB_ASSET_LOGGER_0144
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010144 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.isLoggable(3);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010144 end');
    })

    /**
     * @tc.name   testLogger010145
     * @tc.number SUB_ASSET_LOGGER_0145
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010145 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.isLoggable(4);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010145 end');
    })

    /**
     * @tc.name   testLogger010146
     * @tc.number SUB_ASSET_LOGGER_0146
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010146 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.isLoggable(5);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010146 end');
    })

    /**
     * @tc.name   testLogger010147
     * @tc.number SUB_ASSET_LOGGER_0147
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010147 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.isLoggable(6);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010147 end');
    })

    /**
     * @tc.name   testLogger010148
     * @tc.number SUB_ASSET_LOGGER_0148
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010148 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.isLoggable(7);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010148 end');
    })

    /**
     * @tc.name   testLogger010149
     * @tc.number SUB_ASSET_LOGGER_0149
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010149 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.isLoggable(8);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010149 end');
    })

    /**
     * @tc.name   testLogger010150
     * @tc.number SUB_ASSET_LOGGER_0150
     * @tc.desc   边界值：isLoggable 方法调用不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLogger010150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010150 begin');
      const logger: Logger = new Logger('Prefix01');
      logger.isLoggable(9);
      const result: Logger = logger;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Logger));
      expect(result instanceof Logger).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Object));
      expect(result instanceof Object).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger010150 end');
    })

  })
}
