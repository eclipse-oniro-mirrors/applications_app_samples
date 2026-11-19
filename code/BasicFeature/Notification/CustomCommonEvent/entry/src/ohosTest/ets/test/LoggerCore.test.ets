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
import Logger from '../../../main/ets/module/Logger';

const DOMAIN: number = 0xF811;
const TAG_PREFIX: string = 'LoggerCore_';
const EXPECTED_DOMAIN: number = 0xF811;
const EXPECTED_PREFIX: string = '[Sample_CustomCommonEvent]';
const EXPECTED_FORMAT: string = '%{public}s, %{public}s';

function logBegin(tag: string): void {
    hilog.info(DOMAIN, TAG_PREFIX + tag, '%{public}s', 'case begin');
}

function logEnd(tag: string): void {
    hilog.info(DOMAIN, TAG_PREFIX + tag, '%{public}s', 'case end');
}

function logPair(tag: string, label: string, actual: string, expected: string): void {
    hilog.info(DOMAIN, TAG_PREFIX + tag, 'label=%{public}s actual=%{public}s expected=%{public}s',
        label, actual, expected);
}

export default function loggerCoreTest(): void {
    describe('LoggerCoreTest', () => {
        /**
         * @tc.number    SUB_CCE_LOG_0001
         * @tc.name      testLoggerDomainValue0001
         * @tc.desc      日志 domain 固定为 0xF811（63497），与样例日志域约定一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLoggerDomainValue0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLoggerDomainValue0001';
            logBegin(tag);
            logPair(tag, 'domain', Logger.logDomain.toString(), '63497');
            expect(Logger.logDomain).assertEqual(63497);
            logPair(tag, 'hexDomain', Logger.logDomain.toString(16).toUpperCase(), 'F811');
            expect(Logger.logDomain.toString(16).toUpperCase()).assertEqual('F811');
            logPair(tag, 'positive', (Logger.logDomain > 0).toString(), 'true');
            expect(Logger.logDomain > 0).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LOG_0002
         * @tc.name      testLoggerPrefixValue0002
         * @tc.desc      日志前缀为样例标识 [Sample_CustomCommonEvent]，全等冻结
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLoggerPrefixValue0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLoggerPrefixValue0002';
            logBegin(tag);
            logPair(tag, 'prefix', Logger.logPrefix, EXPECTED_PREFIX);
            expect(Logger.logPrefix).assertEqual(EXPECTED_PREFIX);
            logPair(tag, 'bracketed', (Logger.logPrefix.charAt(0) === '[').toString(), 'true');
            expect(Logger.logPrefix.charAt(0) === '[').assertTrue();
            logPair(tag, 'length', Logger.logPrefix.length.toString(), '26');
            expect(Logger.logPrefix.length).assertEqual(EXPECTED_PREFIX.length);
            expect(EXPECTED_PREFIX.length).assertEqual(26);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LOG_0003
         * @tc.name      testLoggerFormatValue0003
         * @tc.desc      日志格式串含两个 public 占位，逗号分隔
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLoggerFormatValue0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLoggerFormatValue0003';
            logBegin(tag);
            logPair(tag, 'format', Logger.logFormat, EXPECTED_FORMAT);
            expect(Logger.logFormat).assertEqual(EXPECTED_FORMAT);
            logPair(tag, 'placeholders', Logger.logFormat.split('%{public}s').length.toString(), '3');
            expect(Logger.logFormat.split('%{public}s').length).assertEqual(3);
            logPair(tag, 'comma', (Logger.logFormat.indexOf(',') > 0).toString(), 'true');
            expect(Logger.logFormat.indexOf(',') > 0).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LOG_0004
         * @tc.name      testLoggerDomainInRange0004
         * @tc.desc      domain 落在 hilog 合法区间（0x0~0xFFFF）内且为整数
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLoggerDomainInRange0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLoggerDomainInRange0004';
            logBegin(tag);
            logPair(tag, 'upperBound', (Logger.logDomain <= 0xFFFF).toString(), 'true');
            expect(Logger.logDomain <= 0xFFFF).assertTrue();
            logPair(tag, 'lowerBound', (Logger.logDomain >= 0).toString(), 'true');
            expect(Logger.logDomain >= 0).assertTrue();
            logPair(tag, 'integer', (Math.floor(Logger.logDomain) === Logger.logDomain).toString(), 'true');
            expect(Math.floor(Logger.logDomain) === Logger.logDomain).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LOG_0005
         * @tc.name      testLoggerPrefixShape0005
         * @tc.desc      前缀以成对方括号包裹且不含空白字符
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLoggerPrefixShape0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLoggerPrefixShape0005';
            logBegin(tag);
            const prefix: string = Logger.logPrefix;
            logPair(tag, 'endsWithBracket', (prefix.charAt(prefix.length - 1) === ']').toString(), 'true');
            expect(prefix.charAt(prefix.length - 1) === ']').assertTrue();
            logPair(tag, 'noWhitespace', (prefix.indexOf(' ') < 0).toString(), 'true');
            expect(prefix.indexOf(' ') < 0).assertTrue();
            logPair(tag, 'nonEmpty', (prefix.length > 2).toString(), 'true');
            expect(prefix.length > 2).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LOG_0006
         * @tc.name      testLoggerFormatShape0006
         * @tc.desc      格式串以占位符开头与结尾，中缀为逗号加空格
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLoggerFormatShape0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLoggerFormatShape0006';
            logBegin(tag);
            const format: string = Logger.logFormat;
            logPair(tag, 'startsWithPlaceholder',
                (format.indexOf('%{public}s') === 0).toString(), 'true');
            expect(format.indexOf('%{public}s') === 0).assertTrue();
            logPair(tag, 'endsWithPlaceholder',
                (format.substring(format.length - 10) === '%{public}s').toString(), 'true');
            expect(format.substring(format.length - 10)).assertEqual('%{public}s');
            logPair(tag, 'separator', format.substring(10, 12), ', ');
            expect(format.substring(10, 12)).assertEqual(', ');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LOG_0007
         * @tc.name      testLoggerInfoNoThrow0007
         * @tc.desc      info 级日志调用不抛异常且无返回值
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLoggerInfoNoThrow0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLoggerInfoNoThrow0007';
            logBegin(tag);
            let noThrow: boolean = true;
            try {
                Logger.info('case log message');
            } catch (e) {
                noThrow = false;
            }
            logPair(tag, 'noThrow', noThrow.toString(), 'true');
            expect(noThrow).assertTrue();
            logPair(tag, 'domainStill', Logger.logDomain.toString(), '63497');
            expect(Logger.logDomain).assertEqual(EXPECTED_DOMAIN);
            logPair(tag, 'prefixStill', Logger.logPrefix, EXPECTED_PREFIX);
            expect(Logger.logPrefix).assertEqual(EXPECTED_PREFIX);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LOG_0008
         * @tc.name      testLoggerDebugNoThrow0008
         * @tc.desc      debug 级日志调用不抛异常
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLoggerDebugNoThrow0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLoggerDebugNoThrow0008';
            logBegin(tag);
            let noThrow: boolean = true;
            try {
                Logger.debug('debug message');
            } catch (e) {
                noThrow = false;
            }
            logPair(tag, 'noThrow', noThrow.toString(), 'true');
            expect(noThrow).assertTrue();
            logPair(tag, 'formatStill', Logger.logFormat, EXPECTED_FORMAT);
            expect(Logger.logFormat).assertEqual(EXPECTED_FORMAT);
            logPair(tag, 'domainStill', Logger.logDomain.toString(), '63497');
            expect(Logger.logDomain).assertEqual(EXPECTED_DOMAIN);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LOG_0009
         * @tc.name      testLoggerWarnNoThrow0009
         * @tc.desc      warn 级日志调用不抛异常
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLoggerWarnNoThrow0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLoggerWarnNoThrow0009';
            logBegin(tag);
            let noThrow: boolean = true;
            try {
                Logger.warn('warn message');
            } catch (e) {
                noThrow = false;
            }
            logPair(tag, 'noThrow', noThrow.toString(), 'true');
            expect(noThrow).assertTrue();
            logPair(tag, 'prefixStill', Logger.logPrefix, EXPECTED_PREFIX);
            expect(Logger.logPrefix).assertEqual(EXPECTED_PREFIX);
            logPair(tag, 'formatStill', Logger.logFormat, EXPECTED_FORMAT);
            expect(Logger.logFormat).assertEqual(EXPECTED_FORMAT);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LOG_0010
         * @tc.name      testLoggerErrorNoThrow0010
         * @tc.desc      error 级日志调用不抛异常
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLoggerErrorNoThrow0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLoggerErrorNoThrow0010';
            logBegin(tag);
            let noThrow: boolean = true;
            try {
                Logger.error('error message');
            } catch (e) {
                noThrow = false;
            }
            logPair(tag, 'noThrow', noThrow.toString(), 'true');
            expect(noThrow).assertTrue();
            logPair(tag, 'domainStill', Logger.logDomain.toString(), '63497');
            expect(Logger.logDomain).assertEqual(EXPECTED_DOMAIN);
            logPair(tag, 'prefixStill', Logger.logPrefix, EXPECTED_PREFIX);
            expect(Logger.logPrefix).assertEqual(EXPECTED_PREFIX);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LOG_0011
         * @tc.name      testLoggerAllLevelsNoThrow0011
         * @tc.desc      四级日志连调不抛异常，配置保持不变
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLoggerAllLevelsNoThrow0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLoggerAllLevelsNoThrow0011';
            logBegin(tag);
            let noThrow: boolean = true;
            try {
                Logger.debug('all');
                Logger.info('all');
                Logger.warn('all');
                Logger.error('all');
            } catch (e) {
                noThrow = false;
            }
            logPair(tag, 'noThrow', noThrow.toString(), 'true');
            expect(noThrow).assertTrue();
            logPair(tag, 'domain', Logger.logDomain.toString(), '63497');
            expect(Logger.logDomain).assertEqual(EXPECTED_DOMAIN);
            logPair(tag, 'format', Logger.logFormat, EXPECTED_FORMAT);
            expect(Logger.logFormat).assertEqual(EXPECTED_FORMAT);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LOG_0012
         * @tc.name      testLoggerMultiArgsNoThrow0012
         * @tc.desc      多参数与零参数调用均不抛异常
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLoggerMultiArgsNoThrow0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLoggerMultiArgsNoThrow0012';
            logBegin(tag);
            let noThrow: boolean = true;
            try {
                Logger.info('first', 'second', 'third');
                Logger.info();
            } catch (e) {
                noThrow = false;
            }
            logPair(tag, 'noThrow', noThrow.toString(), 'true');
            expect(noThrow).assertTrue();
            logPair(tag, 'prefix', Logger.logPrefix, EXPECTED_PREFIX);
            expect(Logger.logPrefix).assertEqual(EXPECTED_PREFIX);
            logPair(tag, 'domain', Logger.logDomain.toString(), '63497');
            expect(Logger.logDomain).assertEqual(EXPECTED_DOMAIN);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LOG_0013
         * @tc.name      testLoggerGettersStable0013
         * @tc.desc      同一实例多次读取配置完全一致（无隐式变更）
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLoggerGettersStable0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLoggerGettersStable0013';
            logBegin(tag);
            const first: number = Logger.logDomain;
            const second: number = Logger.logDomain;
            const third: number = Logger.logDomain;
            logPair(tag, 'stable', (first === second && second === third).toString(), 'true');
            expect(first === second && second === third).assertTrue();
            logPair(tag, 'value', first.toString(), '63497');
            expect(first).assertEqual(EXPECTED_DOMAIN);
            logPair(tag, 'prefixStable', (Logger.logPrefix === Logger.logPrefix).toString(), 'true');
            expect(Logger.logPrefix).assertEqual(Logger.logPrefix);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LOG_0014
         * @tc.name      testLoggerConfigUsableAsArgs0014
         * @tc.desc      前缀与格式串均为非空字符串，可直接作为 hilog 参数
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLoggerConfigUsableAsArgs0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLoggerConfigUsableAsArgs0014';
            logBegin(tag);
            let noThrow: boolean = true;
            try {
                hilog.info(Logger.logDomain, Logger.logPrefix, Logger.logFormat, 'arg1', 'arg2');
            } catch (e) {
                noThrow = false;
            }
            logPair(tag, 'noThrow', noThrow.toString(), 'true');
            expect(noThrow).assertTrue();
            logPair(tag, 'prefixLength', (Logger.logPrefix.length > 0).toString(), 'true');
            expect(Logger.logPrefix.length > 0).assertTrue();
            logPair(tag, 'formatLength', (Logger.logFormat.length > 0).toString(), 'true');
            expect(Logger.logFormat.length > 0).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LOG_0015
         * @tc.name      testLoggerDomainNumericProperty0015
         * @tc.desc      domain 数值性质：非负、不超过 16 位上界、与 0xF811 高低位掩码一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLoggerDomainNumericProperty0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLoggerDomainNumericProperty0015';
            logBegin(tag);
            logPair(tag, 'bitAnd', (Logger.logDomain & 0xFF00).toString(), '63488');
            expect(Logger.logDomain & 0xFF00).assertEqual(0xF800);
            logPair(tag, 'lowByte', (Logger.logDomain & 0xFF).toString(), '17');
            expect(Logger.logDomain & 0xFF).assertEqual(0x11);
            logPair(tag, 'equalsHex', (Logger.logDomain === 0xF811).toString(), 'true');
            expect(Logger.logDomain === 0xF811).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LOG_0016
         * @tc.name      testLoggerFormatPlaceholderCount0016
         * @tc.desc      格式串占位符计数恒为 2，分隔符位置固定在第 11 字符
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLoggerFormatPlaceholderCount0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLoggerFormatPlaceholderCount0016';
            logBegin(tag);
            const format: string = Logger.logFormat;
            let count: number = 0;
            let from: number = 0;
            while (true) {
                const at: number = format.indexOf('%{public}s', from);
                if (at < 0) {
                    break;
                }
                count++;
                from = at + 10;
            }
            logPair(tag, 'count', count.toString(), '2');
            expect(count).assertEqual(2);
            logPair(tag, 'totalLength', format.length.toString(), '22');
            expect(format.length).assertEqual(22);
            logPair(tag, 'commaIndex', format.indexOf(',').toString(), '10');
            expect(format.indexOf(',')).assertEqual(10);
            logEnd(tag);
        })
    })
}
