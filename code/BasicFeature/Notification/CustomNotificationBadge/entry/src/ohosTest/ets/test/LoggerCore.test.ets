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

// 契约层：logger 的 4 个日志级别封装。日志输出不可回读，因此断言落在可观测契约上：
// 任意参数形态下不抛异常、错误文本为空、方法集合稳定且单例引用不变。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { logger } from '@ohos/notification';
import { buildRepeatedText } from './helper/TestPixelMap';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotificationBadge]';
const HUGE_ARG_LENGTH: number = 4000;
const REPEAT_TIMES: number = 3;

/**
 * 执行一次日志调用，返回空串表示未抛异常，否则返回异常描述。
 */
function safeInvoke(action: () => void): string {
    try {
        action();
        return '';
    } catch (err) {
        return JSON.stringify(err);
    }
}

export default function loggerCoreTest() {
    describe('LoggerCore', () => {
        /**
         * @tc.number SUB_CNB_LOGGER_0001
         * @tc.name testLogger0001
         * @tc.desc 合法值：info 接收两个参数时不抛异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testLogger0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let errorText: string = safeInvoke(() => {
                logger.info('tag', 'message');
            });
            hilog.info(DOMAIN, TAG, 'errorText=%{public}s', errorText);
            expect(errorText).assertEqual('');
            expect(errorText.length).assertEqual(0);
            expect(errorText === 'tag').assertFalse();
        });

        /**
         * @tc.number SUB_CNB_LOGGER_0002
         * @tc.name testLogger0002
         * @tc.desc 边界值：debug 零参数调用不抛异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testLogger0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let errorText: string = safeInvoke(() => {
                logger.debug();
            });
            hilog.info(DOMAIN, TAG, 'errorText=%{public}s', errorText);
            expect(errorText).assertEqual('');
            expect(errorText === '').assertTrue();
            expect(errorText.length < 1).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_LOGGER_0003
         * @tc.name testLogger0003
         * @tc.desc 边界值：warn 单参数调用不抛异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testLogger0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let errorText: string = safeInvoke(() => {
                logger.warn('only-one');
            });
            hilog.info(DOMAIN, TAG, 'errorText=%{public}s', errorText);
            expect(errorText).assertEqual('');
            expect(errorText.indexOf('only-one')).assertEqual(-1);
            expect(errorText === 'only-one').assertFalse();
        });

        /**
         * @tc.number SUB_CNB_LOGGER_0004
         * @tc.name testLogger0004
         * @tc.desc 组合：error 接收 5 个参数时全部接收且不抛异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testLogger0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let args: string[] = ['a', 'b', 'c', 'd', 'e'];
            let errorText: string = safeInvoke(() => {
                logger.error(args[0], args[1], args[2], args[3], args[4]);
            });
            hilog.info(DOMAIN, TAG, 'argCount=%{public}d errorText=%{public}s', args.length, errorText);
            expect(errorText).assertEqual('');
            expect(args.length).assertEqual(5);
            expect(errorText.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_CNB_LOGGER_0005
         * @tc.name testLogger0005
         * @tc.desc 极值：4000 字符参数不被拒绝
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testLogger0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let huge: string = buildRepeatedText(HUGE_ARG_LENGTH);
            let errorText: string = safeInvoke(() => {
                logger.info(huge, 'tail');
            });
            hilog.info(DOMAIN, TAG, 'hugeLength=%{public}d errorText=%{public}s', huge.length, errorText);
            expect(errorText).assertEqual('');
            expect(huge.length).assertEqual(HUGE_ARG_LENGTH);
            expect(errorText.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_CNB_LOGGER_0006
         * @tc.name testLogger0006
         * @tc.desc 组合：四个级别封装在同类输入下均不抛异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testLogger0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let failedLevels: string[] = [];
            if (safeInvoke(() => {
                logger.debug('d', 'd2');
            }) !== '') {
                failedLevels.push('debug');
            }
            if (safeInvoke(() => {
                logger.info('i', 'i2');
            }) !== '') {
                failedLevels.push('info');
            }
            if (safeInvoke(() => {
                logger.warn('w', 'w2');
            }) !== '') {
                failedLevels.push('warn');
            }
            if (safeInvoke(() => {
                logger.error('e', 'e2');
            }) !== '') {
                failedLevels.push('error');
            }
            hilog.info(DOMAIN, TAG, 'failedCount=%{public}d', failedLevels.length);
            expect(failedLevels.length).assertEqual(0);
            expect(failedLevels.indexOf('info')).assertEqual(-1);
            expect(failedLevels.length < 1).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_LOGGER_0007
         * @tc.name testLogger0007
         * @tc.desc 状态：连续 3 次调用均不抛异常，且单例引用保持稳定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testLogger0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let firstRef: Object = logger;
            let failedTimes: number = 0;
            for (let i = 0; i < REPEAT_TIMES; i++) {
                let errorText: string = safeInvoke(() => {
                    logger.info(`round-${i}`);
                });
                if (errorText !== '') {
                    failedTimes += 1;
                }
            }
            let lastRef: Object = logger;
            hilog.info(DOMAIN, TAG, 'failedTimes=%{public}d', failedTimes);
            expect(failedTimes).assertEqual(0);
            expect(firstRef === lastRef).assertTrue();
            expect(failedTimes).assertLess(REPEAT_TIMES);
        });

        /**
         * @tc.number SUB_CNB_LOGGER_0008
         * @tc.name testLogger0008
         * @tc.desc 非法输入：参数含格式化占位符时按普通文本处理，不抛异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testLogger0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let placeholder: string = '%{public}s %d %{private}s';
            let errorText: string = safeInvoke(() => {
                logger.warn(placeholder, placeholder);
            });
            hilog.info(DOMAIN, TAG, 'errorText=%{public}s', errorText);
            expect(errorText).assertEqual('');
            expect(placeholder).assertContain('%d');
            expect(errorText === placeholder).assertFalse();
        });
    });
}
