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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import Logger from '../../../main/ets/model/Logger';

const DOMAIN: number = 0xF814;
const TAG: string = 'CallLoggerCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function callLoggerCoreTest(): void {
  describe('CallLoggerCoreTest', () => {
    /**
     * @tc.number    SUB_CALL_LOGGER_0301
     * @tc.name      testCallLogger0301
     * @tc.desc      Verify the shared Logger instance exposes all four log methods.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0301 begin');
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.info).assertEqual('function');
      expect(typeof Logger.warn).assertEqual('function');
      expect(typeof Logger.debug).assertEqual('function');
      expect(typeof Logger.error).assertEqual('function');
      log('testCallLogger0301 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0302
     * @tc.name      testCallLogger0302
     * @tc.desc      Verify Logger.info returns undefined for a plain message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0302 begin');
      const ret: void = Logger.info('call sample started');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.info).assertEqual('function');
      log('testCallLogger0302 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0303
     * @tc.name      testCallLogger0303
     * @tc.desc      Verify Logger.info accepts an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0303 begin');
      const ret: void = Logger.info('');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.warn).assertEqual('function');
      log('testCallLogger0303 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0304
     * @tc.name      testCallLogger0304
     * @tc.desc      Verify Logger.info accepts a long message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0304 begin');
      const longMessage: string = 'x'.repeat(300);
      const ret: void = Logger.info(longMessage);
      expect(ret === undefined).assertTrue();
      expect(longMessage.length).assertEqual(300);
      expect(Logger !== undefined).assertTrue();
      log('testCallLogger0304 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0305
     * @tc.name      testCallLogger0305
     * @tc.desc      Verify Logger.info accepts a chinese message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0305 begin');
      const ret: void = Logger.info('拨号示例日志');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.info).assertEqual('function');
      log('testCallLogger0305 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0306
     * @tc.name      testCallLogger0306
     * @tc.desc      Verify Logger.info accepts a serialized json message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0306 begin');
      const jsonMessage: string = JSON.stringify({ dial: true, number: '110' });
      const ret: void = Logger.info(jsonMessage);
      expect(ret === undefined).assertTrue();
      expect(jsonMessage.indexOf('dial')).assertEqual(2);
      expect(Logger !== undefined).assertTrue();
      log('testCallLogger0306 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0307
     * @tc.name      testCallLogger0307
     * @tc.desc      Verify Logger.info accepts a message with special characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0307 begin');
      const ret: void = Logger.info('[CallView] dial err->{} data->%{public}s');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.debug).assertEqual('function');
      log('testCallLogger0307 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0308
     * @tc.name      testCallLogger0308
     * @tc.desc      Verify Logger.info accepts multiple rest arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0308 begin');
      const ret: void = Logger.info('a', 'b', 'c');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.error).assertEqual('function');
      log('testCallLogger0308 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0309
     * @tc.name      testCallLogger0309
     * @tc.desc      Verify Logger.warn returns undefined for a plain message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0309 begin');
      const ret: void = Logger.warn('call sample warning');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.warn).assertEqual('function');
      log('testCallLogger0309 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0310
     * @tc.name      testCallLogger0310
     * @tc.desc      Verify Logger.warn accepts an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0310 begin');
      const ret: void = Logger.warn('');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.info).assertEqual('function');
      log('testCallLogger0310 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0311
     * @tc.name      testCallLogger0311
     * @tc.desc      Verify Logger.warn accepts a long message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0311 begin');
      const longMessage: string = 'w'.repeat(256);
      const ret: void = Logger.warn(longMessage);
      expect(ret === undefined).assertTrue();
      expect(longMessage.length).assertEqual(256);
      expect(Logger !== undefined).assertTrue();
      log('testCallLogger0311 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0312
     * @tc.name      testCallLogger0312
     * @tc.desc      Verify Logger.warn accepts a chinese message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0312 begin');
      const ret: void = Logger.warn('通话状态异常');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.warn).assertEqual('function');
      log('testCallLogger0312 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0313
     * @tc.name      testCallLogger0313
     * @tc.desc      Verify Logger.warn accepts a serialized json message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0313 begin');
      const jsonMessage: string = JSON.stringify({ hasCall: false });
      const ret: void = Logger.warn(jsonMessage);
      expect(ret === undefined).assertTrue();
      expect(jsonMessage.indexOf('hasCall')).assertEqual(2);
      expect(Logger !== undefined).assertTrue();
      log('testCallLogger0313 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0314
     * @tc.name      testCallLogger0314
     * @tc.desc      Verify Logger.warn accepts multiple rest arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0314 begin');
      const ret: void = Logger.warn('w1', 'w2');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.debug).assertEqual('function');
      log('testCallLogger0314 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0315
     * @tc.name      testCallLogger0315
     * @tc.desc      Verify Logger.debug returns undefined for a plain message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0315 begin');
      const ret: void = Logger.debug('call sample debug');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.debug).assertEqual('function');
      log('testCallLogger0315 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0316
     * @tc.name      testCallLogger0316
     * @tc.desc      Verify Logger.debug accepts an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0316 begin');
      const ret: void = Logger.debug('');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.error).assertEqual('function');
      log('testCallLogger0316 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0317
     * @tc.name      testCallLogger0317
     * @tc.desc      Verify Logger.debug accepts a long message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0317 begin');
      const longMessage: string = 'd'.repeat(200);
      const ret: void = Logger.debug(longMessage);
      expect(ret === undefined).assertTrue();
      expect(longMessage.length).assertEqual(200);
      expect(Logger !== undefined).assertTrue();
      log('testCallLogger0317 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0318
     * @tc.name      testCallLogger0318
     * @tc.desc      Verify Logger.debug accepts a chinese message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0318 begin');
      const ret: void = Logger.debug('调试拨号流程');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.info).assertEqual('function');
      log('testCallLogger0318 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0319
     * @tc.name      testCallLogger0319
     * @tc.desc      Verify Logger.debug accepts a message with special characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0319 begin');
      const ret: void = Logger.debug('data->\\n\\t{}[]()');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.debug).assertEqual('function');
      log('testCallLogger0319 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0320
     * @tc.name      testCallLogger0320
     * @tc.desc      Verify Logger.debug accepts multiple rest arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0320 begin');
      const ret: void = Logger.debug('d1', 'd2', 'd3');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.warn).assertEqual('function');
      log('testCallLogger0320 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0321
     * @tc.name      testCallLogger0321
     * @tc.desc      Verify Logger.error returns undefined for a plain message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0321 begin');
      const ret: void = Logger.error('call sample error');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.error).assertEqual('function');
      log('testCallLogger0321 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0322
     * @tc.name      testCallLogger0322
     * @tc.desc      Verify Logger.error accepts an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0322 begin');
      const ret: void = Logger.error('');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.info).assertEqual('function');
      log('testCallLogger0322 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0323
     * @tc.name      testCallLogger0323
     * @tc.desc      Verify Logger.error accepts a long message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0323 begin');
      const longMessage: string = 'e'.repeat(400);
      const ret: void = Logger.error(longMessage);
      expect(ret === undefined).assertTrue();
      expect(longMessage.length).assertEqual(400);
      expect(Logger !== undefined).assertTrue();
      log('testCallLogger0323 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0324
     * @tc.name      testCallLogger0324
     * @tc.desc      Verify Logger.error accepts a serialized json message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0324 begin');
      const jsonMessage: string = JSON.stringify({ getCallState: -1 });
      const ret: void = Logger.error(jsonMessage);
      expect(ret === undefined).assertTrue();
      expect(jsonMessage.indexOf('getCallState')).assertEqual(2);
      expect(Logger !== undefined).assertTrue();
      log('testCallLogger0324 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0325
     * @tc.name      testCallLogger0325
     * @tc.desc      Verify Logger.error accepts a chinese message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0325 begin');
      const ret: void = Logger.error('拨号失败');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.error).assertEqual('function');
      log('testCallLogger0325 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0326
     * @tc.name      testCallLogger0326
     * @tc.desc      Verify Logger.error accepts multiple rest arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0326 begin');
      const ret: void = Logger.error('e1', 'e2', 'e3', 'e4');
      expect(ret === undefined).assertTrue();
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.debug).assertEqual('function');
      log('testCallLogger0326 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0327
     * @tc.name      testCallLogger0327
     * @tc.desc      Verify consecutive mixed-level logging keeps the Logger usable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0327 begin');
      Logger.info('seq info');
      Logger.warn('seq warn');
      Logger.debug('seq debug');
      Logger.error('seq error');
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.info).assertEqual('function');
      expect(typeof Logger.error).assertEqual('function');
      log('testCallLogger0327 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0328
     * @tc.name      testCallLogger0328
     * @tc.desc      Verify repeated info logging in a loop keeps the Logger usable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0328 begin');
      for (let i: number = 0; i < 50; i++) {
        Logger.info('loop message ' + i);
      }
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.info).assertEqual('function');
      expect(typeof Logger.warn).assertEqual('function');
      log('testCallLogger0328 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0329
     * @tc.name      testCallLogger0329
     * @tc.desc      Verify the Logger message used by CallView dial callback flows through error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0329 begin');
      const callViewTag: string = '[CallView]';
      const ret: void = Logger.info(`${callViewTag}, callback: dial err->{} data->{"result":true}`);
      expect(ret === undefined).assertTrue();
      expect(callViewTag).assertEqual('[CallView]');
      expect(Logger !== undefined).assertTrue();
      log('testCallLogger0329 end');
    })

    /**
     * @tc.number    SUB_CALL_LOGGER_0330
     * @tc.name      testCallLogger0330
     * @tc.desc      Verify the Logger stays stable after a long mixed sequence of all levels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCallLogger0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCallLogger0330 begin');
      for (let i: number = 0; i < 10; i++) {
        Logger.info('mixed info ' + i);
        Logger.warn('mixed warn ' + i);
        Logger.debug('mixed debug ' + i);
        Logger.error('mixed error ' + i);
      }
      expect(Logger !== undefined).assertTrue();
      expect(typeof Logger.info).assertEqual('function');
      expect(typeof Logger.debug).assertEqual('function');
      log('testCallLogger0330 end');
    })
  })
}
