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

import { describe, beforeAll, beforeEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Logger from '../../../../main/ets/model/Logger';
import { BoardKit } from '../common/Game2048TestKit';

/** Suite name written to every log line produced by this file. */
const SUITE: string = 'loggerTest';
/** Tag the production logger instance prefixes on each record. */
const PROD_TAG: string = '[Sample_Game2048]';
/** Every member the default export must expose to its consumers. */
const MEMBERS: string[] = ['debug', 'info', 'warn', 'error', 'fatal', 'isLoggable'];
/** Level value used by the production caller when probing loggability. */
const PROBE_LEVEL: number = 0;
/** Repetition count used by the stability cases. */
const REPEATS: number = 10;

/**
 * Logger 测试套件。
 *
 * 生产实现把五个日志级别直接转发给 hilog，isLoggable 同理，所有方法都声明为
 * void。hilog 的真实输出在设备上不可观测，因此本套件只固化可观测契约：
 *   - 每个方法都能被调用且不抛异常；
 *   - void 方法返回 undefined，而不是 null 或其它值；
 *   - 任意参数个数（1/3/5）与重复调用都不破坏实例；
 *   - 默认导出是单个稳定实例，可被多个测试文件共享。
 * 本套件不断言 hilog 的输出内容。
 */
export default function loggerTest() {
  describe('loggerTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log(SUITE, 'suite begin');
    });

    afterAll(() => {
      BoardKit.log(SUITE, 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_0100
     * @tc.name loggerDebugAcceptsSingleMessage0100
     * @tc.desc Verify debug consumes one message and returns void without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_debugAcceptsSingleMessage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Logger.debug('debug message accepted')).assertUndefined();
      expect(typeof Logger.debug).assertEqual('function');
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_0200
     * @tc.name loggerInfoAcceptsSingleMessage0200
     * @tc.desc Verify info consumes one message and returns void without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_infoAcceptsSingleMessage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = 'info message accepted';
      expect(Logger.info(result)).assertUndefined();
      expect(typeof Logger.info).assertEqual('function');
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_0300
     * @tc.name loggerWarnAcceptsSingleMessage0300
     * @tc.desc Verify warn consumes one message and returns void without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_warnAcceptsSingleMessage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Logger.warn('warn message accepted')).assertUndefined();
      expect(typeof Logger.warn).assertEqual('function');
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_0400
     * @tc.name loggerErrorAcceptsSingleMessage0400
     * @tc.desc Verify error consumes one message and returns void without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_errorAcceptsSingleMessage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Logger.error('error message accepted')).assertUndefined();
      expect(typeof Logger.error).assertEqual('function');
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_0500
     * @tc.name loggerFatalAcceptsSingleMessage0500
     * @tc.desc Verify fatal consumes one message and returns void without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_fatalAcceptsSingleMessage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Logger.fatal('fatal message accepted')).assertUndefined();
      expect(typeof Logger.fatal).assertEqual('function');
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_0600
     * @tc.name loggerAllFiveLevelsRunInSequence0600
     * @tc.desc Verify the five level methods can run back to back on one instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_allFiveLevelsRunInSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let completed: number = 0;
      Logger.debug('sequence debug');
      completed = completed + 1;
      Logger.info('sequence info');
      completed = completed + 1;
      Logger.warn('sequence warn');
      completed = completed + 1;
      Logger.error('sequence error');
      completed = completed + 1;
      Logger.fatal('sequence fatal');
      completed = completed + 1;
      expect(completed).assertEqual(MEMBERS.length - 1);
      expect(Logger.isLoggable(PROBE_LEVEL)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_0700
     * @tc.name loggerDebugAcceptsThreeArguments0700
     * @tc.desc Verify debug tolerates three message parts instead of exactly one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_debugAcceptsThreeArguments', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Logger.debug(PROD_TAG, 'board', 'ready')).assertUndefined();
      expect(typeof Logger.debug).assertEqual('function');
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_0800
     * @tc.name loggerInfoAcceptsFiveArguments0800
     * @tc.desc Verify info tolerates five message parts instead of exactly one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_infoAcceptsFiveArguments', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Logger.info(PROD_TAG, 'tile', 'value', '2048', 'spawned')).assertUndefined();
      expect(typeof Logger.info).assertEqual('function');
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_0900
     * @tc.name loggerWarnAcceptsThreeArguments0900
     * @tc.desc Verify warn tolerates three message parts built from tile text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_warnAcceptsThreeArguments', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tile: string = '1024';
      expect(Logger.warn(PROD_TAG, 'merge', tile)).assertUndefined();
      expect(typeof Logger.warn).assertEqual('function');
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_1000
     * @tc.name loggerErrorAcceptsFiveArguments1000
     * @tc.desc Verify error tolerates five message parts and still returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_errorAcceptsFiveArguments', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Logger.error(PROD_TAG, 'move', 'rejected', 'direction', 'left')).assertUndefined();
      expect(typeof Logger.error).assertEqual('function');
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_1100
     * @tc.name loggerFatalAcceptsThreeArguments1100
     * @tc.desc Verify fatal tolerates three message parts and still returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_fatalAcceptsThreeArguments', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Logger.fatal(PROD_TAG, 'fatal', 'stop')).assertUndefined();
      expect(typeof Logger.fatal).assertEqual('function');
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_1200
     * @tc.name loggerRepeatsDebugTenTimes1200
     * @tc.desc Verify ten consecutive debug calls complete without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_repeatsDebugTenTimes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let completed: number = 0;
      for (let round: number = 0; round < REPEATS; round++) {
        Logger.debug('repeat round ' + round);
        completed = completed + 1;
      }
      expect(completed).assertEqual(REPEATS);
      expect(completed === REPEATS).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_1300
     * @tc.name loggerRepeatsAllLevelsTenTimes1300
     * @tc.desc Verify ten rounds of all five levels complete fifty calls without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_repeatsAllLevelsTenTimes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let calls: number = 0;
      for (let round: number = 0; round < REPEATS; round++) {
        Logger.debug('round debug');
        Logger.info('round info');
        Logger.warn('round warn');
        Logger.error('round error');
        Logger.fatal('round fatal');
        calls = calls + 5;
      }
      expect(calls).assertEqual(REPEATS * 5);
      expect(calls % 5).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_1400
     * @tc.name loggerIsLoggableAcceptsZero1400
     * @tc.desc Verify isLoggable accepts level zero and returns void without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_isLoggableAcceptsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Logger.isLoggable(PROBE_LEVEL)).assertUndefined();
      expect(typeof Logger.isLoggable).assertEqual('function');
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_1500
     * @tc.name loggerIsLoggableCoversSixLevels1500
     * @tc.desc Verify isLoggable can probe levels zero through five without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_isLoggableCoversSixLevels', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let probes: number = 0;
      for (let level: number = 0; level < 6; level++) {
        expect(Logger.isLoggable(level)).assertUndefined();
        probes = probes + 1;
      }
      expect(probes).assertEqual(6);
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_1600
     * @tc.name loggerAcceptsEnglishMessageTable1600
     * @tc.desc Verify a table of English messages is consumed one by one without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_acceptsEnglishMessageTable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let messages: string[] = [
        'application started',
        'board rendered',
        'tile spawned',
        'move accepted',
        'game over'
      ];
      let nonAscii: RegExp = /[^\x00-\x7F]/;
      let sent: number = 0;
      for (let index: number = 0; index < messages.length; index++) {
        let message: string = messages[index];
        expect(message.length > 0).assertTrue();
        expect(message.match(nonAscii)).assertNull();
        Logger.info(message);
        sent = sent + 1;
      }
      expect(sent).assertEqual(messages.length);
      expect(sent).assertEqual(5);
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_1700
     * @tc.name loggerMessageKeepsEnglishWordsAndDigits1700
     * @tc.desc Verify a composed log message keeps its English words and tile digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_messageKeepsEnglishWordsAndDigits', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = PROD_TAG + ' tile value 2048';
      expect(text).assertContain(['tile']);
      expect(text).assertContain(['2048']);
      expect(Logger.info(text)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_1800
     * @tc.name loggerEmptyMessageIsAccepted1800
     * @tc.desc Verify an empty message part does not make the logger throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_emptyMessageIsAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let empty: string = '';
      expect(Logger.warn(empty)).assertUndefined();
      expect(empty.length).assertEqual(0);
      expect(Logger.fatal(empty)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_1900
     * @tc.name loggerLongMessageIsAccepted1900
     * @tc.desc Verify a message built from twenty segments is accepted without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_longMessageIsAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = 'segment';
      for (let index: number = 0; index < 20; index++) {
        text = text + '-' + index;
      }
      expect(text.length > 40).assertTrue();
      expect(Logger.debug(text)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_2000
     * @tc.name loggerDefaultExportIsSharedInstance2000
     * @tc.desc Verify the default export is one stable instance instead of a new logger per import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_defaultExportIsSharedInstance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let first: object = Logger;
      let second: object = Logger;
      expect(first === second).assertTrue();
      expect(Logger.debug === Logger.info).assertFalse();
      expect(Logger.debug('shared instance')).assertUndefined();
      expect(typeof Logger.isLoggable).assertEqual('function');
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_2100
     * @tc.name loggerInstanceStaysUsableAfterBurst2100
     * @tc.desc Verify a burst of mixed calls leaves the shared instance fully callable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_instanceStaysUsableAfterBurst', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let bursts: number = 0;
      for (let round: number = 0; round < REPEATS; round++) {
        Logger.debug('burst debug');
        Logger.info('burst info');
        bursts = bursts + 2;
      }
      expect(bursts).assertEqual(REPEATS * 2);
      expect(Logger.isLoggable(PROBE_LEVEL)).assertUndefined();
      expect(typeof Logger.error).assertEqual('function');
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_2200
     * @tc.name loggerIsLoggableAcceptsNegativeLevel2200
     * @tc.desc Verify a negative probe level is forwarded without validation or throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_isLoggableAcceptsNegativeLevel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Logger.isLoggable(-1)).assertUndefined();
      expect(Logger.isLoggable(-100)).assertUndefined();
      expect(typeof Logger.isLoggable).assertEqual('function');
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_2300
     * @tc.name loggerLevelsRunInReverseOrder2300
     * @tc.desc Verify the level methods are independent of their call order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_levelsRunInReverseOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let completed: number = 0;
      Logger.fatal('reverse fatal');
      completed = completed + 1;
      Logger.error('reverse error');
      completed = completed + 1;
      Logger.warn('reverse warn');
      completed = completed + 1;
      Logger.info('reverse info');
      completed = completed + 1;
      Logger.debug('reverse debug');
      completed = completed + 1;
      expect(completed).assertEqual(MEMBERS.length - 1);
      expect(Logger.debug('reverse tail')).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_LOGGER_2400
     * @tc.name loggerFiveArgumentsWithEmptyParts2400
     * @tc.desc Verify empty middle parts among five arguments are forwarded without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_fiveArgumentsWithEmptyParts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let blank: string = '';
      expect(Logger.error(PROD_TAG, blank, 'segment', blank, 'end')).assertUndefined();
      expect(blank.length).assertEqual(0);
      expect(typeof Logger.error).assertEqual('function');
    });
  });
}
